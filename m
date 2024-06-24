Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CE7C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E5060B23;
	Mon, 24 Jun 2024 20:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XX94Z7oqsNig; Mon, 24 Jun 2024 20:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F261360EC8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F261360EC8;
	Mon, 24 Jun 2024 20:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9081BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4170B6072F
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iq1UkqahuJCc for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F5AC608FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F5AC608FB
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D8F482B80; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:32:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06b5ce9f04123a985e7543d5aadae60e14399401
X-Git-Newrev: edb5589aebbd63999d0c2595dc31bf18db52fe9a
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.3D8F482B80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/giflib: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=edb5589aebbd63999d0c2595dc31bf18db52fe9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...efile-add-targets-to-manage-static-building.patch | 18 ++++++++++--------
 ...-Fix-several-defects-found-by-Coverity-scan.patch | 20 +++++++++++---------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
index ba8d426bea..31d7542e60 100644
--- a/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
+++ b/package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch
@@ -1,4 +1,4 @@
-From 487407d722714f13e8a06d1a9d89f48a5738191e Mon Sep 17 00:00:00 2001
+From 409af8210f2256eed4d2c73083aa75975f03424b Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 12 Jul 2019 12:20:38 +0200
 Subject: [PATCH] Makefile: add targets to manage static building
@@ -8,16 +8,18 @@ targets to allow the user to build giflib when dynamic library support
 is not available or enable on the toolchain
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Upstream: https://sourceforge.net/p/giflib/code/merge-requests/7
 ---
  Makefile | 18 ++++++++++++++----
  1 file changed, 14 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index b2bf6de..111f52f 100644
+index 87966a96cd4f..4a93aace54b8 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -91,13 +91,20 @@ LIBUTILSO	= libutil.$(SOEXTENSION)
+@@ -87,13 +87,20 @@ LIBUTILSO	= libutil.$(SOEXTENSION)
  LIBUTILSOMAJOR	= libutil.$(LIBMAJOR).$(SOEXTENSION)
  endif
  
@@ -40,7 +42,7 @@ index b2bf6de..111f52f 100644
  
  $(LIBGIFSO): $(OBJECTS) $(HEADERS)
  ifeq ($(UNAME), Darwin)
-@@ -120,7 +127,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
+@@ -116,7 +123,7 @@ libutil.a: $(UOBJECTS) $(UHEADERS)
  	$(AR) rcs libutil.a $(UOBJECTS)
  
  clean:
@@ -48,8 +50,8 @@ index b2bf6de..111f52f 100644
 +	rm -f $(UTILS) $(TARGET) libgetarg.a $(SHARED_LIBS) $(STATIC_LIBS) *.o
  	rm -f $(LIBGIFSOVER)
  	rm -f $(LIBGIFSOMAJOR)
- 	rm -fr doc/*.[17] *.html doc/staging
-@@ -145,12 +152,15 @@ install-bin: $(INSTALLABLE)
+ 	rm -fr doc/*.1 *.html doc/staging
+@@ -141,12 +148,15 @@ install-bin: $(INSTALLABLE)
  install-include:
  	$(INSTALL) -d "$(DESTDIR)$(INCDIR)"
  	$(INSTALL) -m 644 gif_lib.h "$(DESTDIR)$(INCDIR)"
@@ -64,8 +66,8 @@ index b2bf6de..111f52f 100644
  	ln -sf $(LIBGIFSOMAJOR) "$(DESTDIR)$(LIBDIR)/$(LIBGIFSO)"
 +install-lib: install-static-lib install-shared-lib
  install-man:
- 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1" "$(DESTDIR)$(MANDIR)/man7"
- 	$(INSTALL) -m 644 $(MANUAL_PAGES_1:xml=1) "$(DESTDIR)$(MANDIR)/man1"
+ 	$(INSTALL) -d "$(DESTDIR)$(MANDIR)/man1"
+ 	$(INSTALL) -m 644 $(MANUAL_PAGES) "$(DESTDIR)$(MANDIR)/man1"
 -- 
 2.43.0
 
diff --git a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
index f6816d0753..77f21b402e 100644
--- a/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
+++ b/package/giflib/0002-Fix-several-defects-found-by-Coverity-scan.patch
@@ -1,4 +1,4 @@
-From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
+From 7c3bce4add77944e5b479ef5da81ae7fd71a7e95 Mon Sep 17 00:00:00 2001
 From: Sandro Mani <manisandro@gmail.com>
 Date: Tue, 5 Dec 2023 16:38:48 -0700
 Subject: [PATCH] Fix several defects found by Coverity scan
@@ -10,15 +10,17 @@ Signed-off-by: Sandro Mani <manisandro@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [Fabrice: updated for 5.2.2]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- gif2rgb.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
+ gif2rgb.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 diff --git a/gif2rgb.c b/gif2rgb.c
-index d9a469f..02cea41 100644
+index d51226d65d3d..50c43ae44ee2 100644
 --- a/gif2rgb.c
 +++ b/gif2rgb.c
-@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+@@ -165,6 +165,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
  	/* Open stdout for the output file: */
  	if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
  		PrintGifError(Error);
@@ -27,8 +29,8 @@ index d9a469f..02cea41 100644
  		exit(EXIT_FAILURE);
  	}
  
-@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
- 	     EGifPutImageDesc(GifFile, 0, 0, Width, Height, false, NULL) ==
+@@ -173,6 +175,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
+ 	    EGifPutImageDesc(GifFile, 0, 0, Width, Height, false, NULL) ==
  	        GIF_ERROR) {
  		PrintGifError(Error);
 +		free(OutputBuffer);
@@ -36,7 +38,7 @@ index d9a469f..02cea41 100644
  		exit(EXIT_FAILURE);
  	}
  
-@@ -187,6 +191,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+@@ -182,6 +186,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
  
  	for (i = 0; i < Height; i++) {
  		if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
@@ -45,7 +47,7 @@ index d9a469f..02cea41 100644
  			exit(EXIT_FAILURE);
  		}
  		GifQprintf("\b\b\b\b%-4d", Height - i - 1);
-@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+@@ -191,6 +197,8 @@ static void SaveGif(GifByteType *OutputBuffer, int Width, int Height,
  
  	if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
  		PrintGifError(Error);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
