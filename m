Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065EBD0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D58D080BAE;
	Wed,  7 Jan 2026 17:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnsnSop4aSXM; Wed,  7 Jan 2026 17:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFE980CEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808022;
	bh=/Sq0WxVR3VpJwSTlrs+mILSAwelG+9BxglGWaM/qbEU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FQDtwAF7GNgbGEI3jD1fJLFsFc97DpbNyGbk2CwBiEYFoxyBphUewVJrLNo4W661V
	 I5TaDZpuyOCi5dfy7saXdasFgar02P807tO1p/avxsV0OArdF/BePOWmWH9eL3CBw6
	 K9hgWFsoKpKtmNw95gAbaPWym5QAQiKb/suwybf89+OeqekI+x3jlqmsBAypn5wm2V
	 GxybkodoieHQY4coU/QWe1o7CKzDKokC9yivOKPeBiR+otPQ0mbdzML08ThPG57p44
	 3e8oU+QphwkzQRsr+plSFls/UBy10SUkR+BWzpgqROOrzXcCf+biheF8OsPEFIWPdU
	 mpR5rmmkmoKfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFE980CEB;
	Wed,  7 Jan 2026 17:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A8D79ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B44D740869
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6IwlmsNeOFy for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE0C440877
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE0C440877
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED3B8883AA; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:04 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f25febab370fe57d8557530664ff1dc034b3cd2f
X-Git-Newrev: a10fc5bba2d6ecdac9f46ac6cdd8437d33cf6582
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.ED3B8883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sysprof: remove
 'debuginfod' config symbol
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a10fc5bba2d6ecdac9f46ac6cdd8437d33cf6582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit [1] was erroneously picked because it mentioned commit [2], which
is present in the LTS branch.

In fact, the 'debuginfod' option was introduced in the sysprof package in
version 48.0 (see [3] and Buildroot commit [4]), which was not picked in the
LTS branch.

This patch reverts commit [1] and removes the option it introduced, which
does not exist in sysprof 47.2.

[1] 26fd8eb217 package/sysprof: disable debuginfod support
[2] 52c5c6050c package/elfutils: bump to version 0.181
[3] https://gitlab.gnome.org/GNOME/sysprof/-/commit/d2471d4bf571c3a7c8d743a96c9207d748d763e8
[4] e743759a52 package/sysprof: bump to version 48.0

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/152
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/sysprof/sysprof.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 4e67061452..7f1ba4c63d 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -12,7 +12,6 @@ SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
 SYSPROF_DEPENDENCIES = elfutils libglib2 libdex libunwind json-glib polkit
 SYSPROF_CONF_OPTS = \
-	-Ddebuginfod=disabled \
 	-Ddevelopment=false \
 	-Dexamples=false \
 	-Dgtk=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
