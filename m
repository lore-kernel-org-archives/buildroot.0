Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7903CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 19:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85AE480EDF;
	Thu, 28 May 2026 19:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTV2WTuX3kif; Thu, 28 May 2026 19:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABED580EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779997546;
	bh=SIjnBm7sNpGi14GpwTctkfjESBkWDQ/YeyDMi8Fkz60=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DXpArQFpwkNcmdb7DBSv/oUbJmMU983KXsynqP+GMYZXlQLGdSqH91J/iq4/30K8K
	 6A4q0gVbGp8LAmRQrNsKN8xLbdixaiEshujmCekpBydddBvww5lbV+wE8dVi6DUDOv
	 hUQkUIPIDljS8jbd1aVqTztAUGuY0b1doqOkUdSuYNs1BBsFhwYSecxfw++HiJPOHO
	 fPs3QAEBocL80wLXoMjOaQysahlp5DANF3T/JO7V28mrZf9KnrfUzKfjZrtBfh5Snk
	 QLmBuUHq7Ako2HHdX7matFmyh1FaCeGfQATTatzgxeG9gPZj1kUiF9GAjkvy3jf4GK
	 d++7OcGS2PgdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABED580EE0;
	Thu, 28 May 2026 19:45:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B16A0288
 for <buildroot@buildroot.org>; Thu, 28 May 2026 19:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF0DA606DC
 for <buildroot@buildroot.org>; Thu, 28 May 2026 19:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjZzED-qG8tc for <buildroot@buildroot.org>;
 Thu, 28 May 2026 19:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93AEE606DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93AEE606DB
 for <buildroot@buildroot.org>; Thu, 28 May 2026 19:45:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FC648714A; Thu, 28 May 2026 19:45:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 21:42:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2800531808e0648ffa5bb5340a761a3c32c811f
X-Git-Newrev: f5601740113111269cd0717062fdef039b17763d
X-Patchwork-Hint: ignore
Message-Id: <20260528194531.5FC648714A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/radvd: security bump to version
 2.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5601740113111269cd0717062fdef039b17763d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

CVE-2026-48715: Stack Buffer Overflow in radvdump Route Information Option
Parser

https://github.com/radvd-project/radvd/security/advisories/GHSA-52px-gh9p-m379

Release notes:
https://github.com/radvd-project/radvd/releases/tag/v2.21

The release is now done on github, and a .tar.xz version is available so use
that. Notice that we cannot use the github macro.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/radvd/radvd.hash | 4 ++--
 package/radvd/radvd.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index 8415b8d854..a9937aa232 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,3 +1,3 @@
-# From http://www.litech.org/radvd/dist/radvd-2.20.tar.gz.sha512
-sha512  798d8476ab5ff43083b181d6d6ec43c47d06e4067d30c71e038cfd890bcf1ca23e809f9e184c4363458bfa25a916625dd2d7553290fb3e5459034d477b80ebaa  radvd-2.20.tar.gz
+# From https://github.com/radvd-project/radvd/releases/download/v2.21/radvd-2.21.tar.xz.sha256
+sha256  91df2ed7faca0716bbd726a17d6467ed92fcb2b6e45b57d9e619f9686ab99e1b  radvd-2.21.tar.xz
 sha256  40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80  COPYRIGHT
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 89d8f55d51..32bbcf57ee 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.20
-RADVD_SITE = http://www.litech.org/radvd/dist
+RADVD_VERSION = 2.21
+RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
+RADVD_SITE = https://github.com/radvd-project/radvd/releases/download/v$(RADVD_VERSION)
 RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf libbsd
 # We need to ignore <linux/if_arp.h>, because radvd already includes
 # <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
