Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED35C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 622BB40018;
	Mon, 18 Dec 2023 16:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 622BB40018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFhehM9YOJVf; Mon, 18 Dec 2023 16:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58AEE404A0;
	Mon, 18 Dec 2023 16:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58AEE404A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 938CC1BF2B3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CA3660EDD
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA3660EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ee759KE9x4Aj for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C95C60EC3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C95C60EC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76AAD87BD4; Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 17:43:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74253ffee576ea809f7eeb380647345a2ff910be
X-Git-Newrev: df04f179761614f3bccaf208d688ec4e2f64e38d
X-Patchwork-Hint: ignore
Message-Id: <20231218164451.76AAD87BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=df04f179761614f3bccaf208d688ec4e2f64e38d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ix-several-defects-found-by-Coverity-scan.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
new file mode 100644
index 0000000000..1719769872
--- /dev/null
+++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
@@ -0,0 +1,61 @@
+From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:38:48 -0700
+Subject: [PATCH] Fix several defects found by Coverity scan
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Upstream: Not submitted
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ gif2rgb.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d9a469f..02cea41 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+     /* Open stdout for the output file: */
+     if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ 
+@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	EGifPutImageDesc(GifFile,
+ 			 0, 0, Width, Height, false, NULL) == GIF_ERROR) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ 
+@@ -187,8 +191,11 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	       GifFile->Image.Width, GifFile->Image.Height);
+ 
+     for (i = 0; i < Height; i++) {
+-	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR)
++	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
++	    free(OutputBuffer);
++	    GifFreeMapObject(OutputColorMap);
+ 	    exit(EXIT_FAILURE);
++        }
+ 	GifQprintf("\b\b\b\b%-4d", Height - i - 1);
+ 
+ 	Ptr += Width;
+@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 
+     if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ }
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
