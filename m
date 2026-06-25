Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B111BCDE000
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 17:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3508282CA3;
	Thu, 25 Jun 2026 17:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epxtg25DESAi; Thu, 25 Jun 2026 17:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 586B282FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782408523;
	bh=lr1LuAktxaUz0KWe4Pkk4nGL/5NEQNzR7F11BJ4UeZw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ew9qSHt1vkSwvU+sS2qQobWeOov6WqOpp013iy9qKfwEztXS8BxfTq6ygezKV/hy5
	 P3cXy2sFoLwFAbwrKHw1YPwKTEf+cqVz+ORerVZbaHxau7Hdpr7wo14o6gZQ+KBQC3
	 RdhOSr1uESj8S6xCutEd1/I4VaI0Yj2fxrTfvhD7+GO/2IYMswXl87GlXvDvHQDENR
	 egHgsP7Becvo0uC6hEIUfkO5j0FxQBbffg/yHFJWQqvF2SQ1QRIG3yQQEHd01qBOZT
	 +xplD4V3O3KNWVeZABkT477JvhUKEkqebR9ufCPzxnchksJdqaL00bTt9y5WJa6wnc
	 jmBj5WJco9zdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 586B282FA9;
	Thu, 25 Jun 2026 17:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F9392C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8125841144
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wDr4tt4Zp4F for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 17:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F5241123
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1F5241123
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:28:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 024C285D4D; Thu, 25 Jun 2026 17:28:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 19:28:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 614c32d2dd21eee612830e2608adc7aff3bef64d
X-Git-Newrev: 50cc0d11d4b10d38d7975e9fdcf184eb5ea210d5
X-Patchwork-Hint: ignore
Message-Id: <20260625172815.024C285D4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: add missing
 UTIL_LINUX_IGNORE_CVES entry for CVE-2026-27456
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50cc0d11d4b10d38d7975e9fdcf184eb5ea210d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Patch was added in 9998130badb6101cdf6f6da0bbd1228d79825b63, but no
ignore entry.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/util-linux/util-linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 20bdcc5c3f..cfcd738bb5 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,9 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
+# package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
+
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 UTIL_LINUX_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
