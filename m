Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D060CD8CAD
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 21:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4B74EE27;
	Tue,  9 Jun 2026 21:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcS83EOCREQp; Tue,  9 Jun 2026 21:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BBF4EE0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781039544;
	bh=f8fEYCXa0cMvCUx1C7U4vdq4cx7yIxq76UzA+EJQOGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nn7BIHhGnFqq4Usic3+I+2NJH0lHam8fPBy5gb379niR17ZwmO9W0gUJnxePrVf4K
	 VB6H0AFgyRFQ3y3NgaveDA6CSur3Yz4HROFNXsSbuUsggdnACsYWTfhc0oGsaMA/rJ
	 WFc8h55b5+JFNXbuNGId5PYTbFF/Y+cFHje6ek1vU4iwwU0xbCWXoxw+9uXQmNb9bp
	 orck7JSx0YsEyqEzr57mcBvehJE8ytCJFYZQTaqTJPEitnUR6ZCPnDDvYFm2pYAaIQ
	 G32tIe48WRckN0Ml15wRg2s/m7NjU+1bMR7JE7pQzeyokPXJMFNkS1yVPRy0Fdnkm7
	 g9vmoVcbdXVwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40BBF4EE0B;
	Tue,  9 Jun 2026 21:12:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A847196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80B284EE0B
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvhcqXPhTTCX for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 21:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C8C4EE08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1C8C4EE08
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 21:12:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C16DA87EB0; Tue,  9 Jun 2026 21:12:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jun 2026 23:06:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07a690f00b1441cb58f31830beed374af1b016b2
X-Git-Newrev: a9f7f918e06c16b8afa27526b0908c08f488aead
X-Patchwork-Hint: ignore
Message-Id: <20260609211204.C16DA87EB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: bump version to 3.4.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9f7f918e06c16b8afa27526b0908c08f488aead
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bugfix release containing a number of fixes for regressions introduced in
the 3.4.3 release.

For details, see:
https://download.samba.org/pub/rsync/NEWS#3.4.4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 666bb5cf99..2deaed0674 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
-sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.4.tar.gz.asc
+sha256  bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96  rsync-3.4.4.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5b4345d036..5dd89a82d2 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.3
+RSYNC_VERSION = 3.4.4
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
