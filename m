Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660A3C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1272681372;
	Sat, 15 Oct 2022 15:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1272681372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYnFf5_NrEKr; Sat, 15 Oct 2022 15:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9128131F;
	Sat, 15 Oct 2022 15:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9128131F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8B3F1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4A378131F
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A378131F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJgCrfchUzAh for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:48:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97F16812A5
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97F16812A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 809C786E14; Sat, 15 Oct 2022 15:48:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:46:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7131dee4b6d73c434b328b3b6b0e95d3f21ae956
X-Git-Newrev: c8ed72c15d39cc6c676485bff8955ac5f4258138
X-Patchwork-Hint: ignore
Message-Id: <20221015154840.809C786E14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdnet: bump to version 1.16.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c8ed72c15d39cc6c676485bff8955ac5f4258138
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refresh patch

https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16
https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdnet/0001-python-makefile.patch | 6 ++++--
 package/libdnet/libdnet.hash               | 2 +-
 package/libdnet/libdnet.mk                 | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libdnet/0001-python-makefile.patch b/package/libdnet/0001-python-makefile.patch
index eae22b2f14..e5526482ed 100644
--- a/package/libdnet/0001-python-makefile.patch
+++ b/package/libdnet/0001-python-makefile.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] python makefile
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 [adam: refresh for 1.14; make it git-formatted]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Fabrice: updated for 1.16.1]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  python/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
@@ -15,9 +17,9 @@ index 1a74ef2..59fe0f3 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -11,6 +11,7 @@ $(srcdir)/dnet.c: $(srcdir)/dnet.pyx
- 	pyrexc $(srcdir)/dnet.pyx
  
- python-build: $(srcdir)/dnet.c
+ 
+ python-build: 
 +	CC="$(CC)" LDSHARED="$(CC) -shared" CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build_ext -I$(PYINCDIR) -L$(PYLIBDIR)
  	$(PYTHON) setup.py build
  	touch python-build
diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
index d322a1cc29..c31ec90596 100644
--- a/package/libdnet/libdnet.hash
+++ b/package/libdnet/libdnet.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  592599c54a57102a177270f3a2caabda2c2ac7768b977d7458feba97da923dfe  libdnet-1.14.tar.gz
+sha256  b151c4913758ef80daf4558361b4f2680a37b01d59272625bb78c77183062c63  libdnet-1.16.1.tar.gz
 sha256  6b46ec86e290066c47b6607d322135b3c473566e7225ac23d35a7c0588a82da6  LICENSE
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 4c58ea20a5..1e75dae323 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDNET_VERSION = 1.14
+LIBDNET_VERSION = 1.16.1
 LIBDNET_SITE = $(call github,ofalk,libdnet,libdnet-$(LIBDNET_VERSION))
 LIBDNET_LICENSE = BSD-3-Clause
 LIBDNET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
