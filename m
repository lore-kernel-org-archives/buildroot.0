Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80129D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A9A40DBA;
	Tue, 13 Jan 2026 21:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXUxIlOLn7Ey; Tue, 13 Jan 2026 21:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72AAF40DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338001;
	bh=F5h6VrrXYiz+c5l2A5v99Fk1AZPQ4K1j6g4fHqwf7q4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aII8zsnSCfn8P1cnaBfUShnH5yNasyaf1lpwGSwPwdP3AGOq1ZG5bgMbTFtVHX63F
	 nf0xq0L4dsIOEMfmk29rT5+4DM7/yfYkICPhvMD77gdyCSutorO4aZnlyKNFiG2xkQ
	 vIIqJjhhswuBM7mns4JMaHbdtRIsADyzX8p/5xXPOqG4R9wOxVD+DUu9DGQCe+Z79C
	 xq0nGRN2QyuTTkp5yGRvrB3WB8nc4W7hZJrfdDHWz2sPrroY5rNo0gRbdxrKG95ber
	 m/p7mmgZDHHScrY7xCZlXTYPxKUtHRoDDWz7DMru3oAW3CRtoLbpL4pN75uQT8uaiO
	 KLRB7V4BddQXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72AAF40DCA;
	Tue, 13 Jan 2026 21:00:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EACEC1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC74740797
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lx1_FrdnQXL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 212054077F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 212054077F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E72C80F55; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ff5dd0106cd9b80f3880217a61b31bddff969a1
X-Git-Newrev: 82c681bcc81589643d022ba64368d25306af29aa
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.1E72C80F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xman: bump version to
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=82c681bcc81589643d022ba64368d25306af29aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003486.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xman/xapp_xman.hash | 8 +++-----
 package/x11r7/xapp_xman/xapp_xman.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.hash b/package/x11r7/xapp_xman/xapp_xman.hash
index 4436ca3111..a2f2caef1c 100644
--- a/package/x11r7/xapp_xman/xapp_xman.hash
+++ b/package/x11r7/xapp_xman/xapp_xman.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003011.html
-md5  629436867b202098967636b17c8d303c  xman-1.1.5.tar.bz2
-sha1  ec76dbd010f68974e05dfe8bc4b91731a3b7285b  xman-1.1.5.tar.bz2
-sha256  4e3c2c7497e9734a6d3c8e1b6a364612892bb31e9f33076c9fdae7177ab60978  xman-1.1.5.tar.bz2
-sha512  f6b2be424a79f298bf1a81edce4172572195c9efc9454e5b7b7046f344ed08154c77ccaa763ccdf3f1a30b64aa4802783bf813ee637437ccb1fba434fc5d4400  xman-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-March/003486.html
+sha256  f18db80bd72a0c27cf38b2a7b75485ee48cd22aab10f2ff58de54d83e268b406  xman-1.2.0.tar.xz
+sha512  072dba172fd30606c1e185c6e50b3b9a9ec5e430eb2ac7f0c476e1c2de998e8c0b5fbf53de20a7339d39a8990255e77fe72d3928b43d055e8463f8069389d192  xman-1.2.0.tar.xz
 # Locally computed
 sha256  4c3d6d6fc5661c64285931a0871728f3745d962d877477235dc66e4043db3d36  COPYING
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index f8abfe577d..d1c88febd8 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XMAN_VERSION = 1.1.5
-XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
+XAPP_XMAN_VERSION = 1.2.0
+XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.xz
 XAPP_XMAN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMAN_LICENSE = MIT
 XAPP_XMAN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
