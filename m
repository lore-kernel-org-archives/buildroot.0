Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB586FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 856B083896;
	Tue, 28 Apr 2026 19:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFsAvexuAzfA; Tue, 28 Apr 2026 19:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A491283BDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777403865;
	bh=D/piqFrWOMkS71g5HFivYUwb3bGxYDr2kHczUwY8o4k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CpMcTRITMYfvmn6KmZKUjq8F6rfpW73PFQcU9g75YvRWwbCIj8xOErSiwibka/FKU
	 BcyqfbgxNQhw48+aCkVhnI5ruNL0ojnC2bTAelMCapbNwfxLn6sqzPPYPv4cXwW0Nx
	 707uDCTtXx3kfw9ISsKOSnUf5ORTJ8W8v/nxooObXvSwHJpPYizWVkW1g2Ya0R5R8y
	 dugOYGxak8DsdkqQyrIIOwec7bBOGPd1h3g+lUTgWLoHQ5RtWx2GyJ8F7HdsSE+UbG
	 tcJc7MydYHDOlKvsu8S9l3JosjEMH67Qgji4DpOxOnI7huFgcmXPx1uw+x7YXPEvUY
	 3cMTD7Y3bKoxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A491283BDE;
	Tue, 28 Apr 2026 19:17:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5889231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C680683BDE
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pk95i-YZhB0C for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3FD683896
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3FD683896
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:17:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A93758399C; Tue, 28 Apr 2026 19:17:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 21:16:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af589980b34b256c19f2b233a01b92642982c841
X-Git-Newrev: d9e981327ce79384fe374aea284a3c64fb90228b
X-Patchwork-Hint: ignore
Message-Id: <20260428191742.A93758399C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nano: bump to version 9.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d9e981327ce79384fe374aea284a3c64fb90228b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://www.nano-editor.org/dist/v9/ChangeLog
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 5d369a514f..62692d81cc 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.7.1.tar.xz.asc
+# https://www.nano-editor.org/dist/v9/nano-9.0.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  76f0dcb248f2e2f1251d4ecd20fd30fb400a360a3a37c6c340e0a52c2d1cdedf  nano-8.7.1.tar.xz
+sha256  9f384374b496110a25b73ad5a5febb384783c6e3188b37063f677ac908013fde  nano-9.0.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 0e2b0af574..a3e019d5e5 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).7.1
+NANO_VERSION_MAJOR = 9
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
