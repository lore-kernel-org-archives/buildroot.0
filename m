Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D34CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A36860A7B;
	Fri,  5 Jun 2026 12:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vywyLttbUuwQ; Fri,  5 Jun 2026 12:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F8D860EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663246;
	bh=3/LnP5GESg0A1N2aXyhlN36kw+NEf2yiRoGpj9L2eVE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R88M7Gx/PUqZ5ugrEqXYinIcBAkO2rQ7h0/shQD1lATbmXE8sUkqaqKV5O3MrHt06
	 Tkvj38gMI527aT10r7XFNTDB55RV34BbMBy3lm7d0hsEvtNsaolCloCTmiHQpxD+VH
	 EUSPRkosz58ZHCcISJfbnGLRyhsgl49yob3NQkFLEuUKmXgNbxUfqLvpgppsp+uiFM
	 Xp2w9S8Vt5f5cePPi2p2ennCcSj3MLAyOIdEst7kI7O+SjL2V6PQs1K97mXR5AxoHs
	 3ios6u0RB0n4ezqJjJq+gbOat2RJcVNOfOiGvBCKXQzEG2pq+tU2mavlpn0t7gXLa7
	 WIJieJel27vaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F8D860EAF;
	Fri,  5 Jun 2026 12:40:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05D78388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB1F41062
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6zaIbSfNxbr for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77494107D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B77494107D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E120B87B03; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:11:25 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ead1a5b605b1a46f9ac6229304bc04b7af2f6a47
X-Git-Newrev: f243d6b1514738cf7a198f749684c106eb5fda57
X-Patchwork-Hint: ignore
Message-Id: <20260605123838.E120B87B03@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/cairo: Fix build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f243d6b1514738cf7a198f749684c106eb5fda57
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 29888ab35e047099d239f266b7b565cd4023503e bumped cairo
to version 1.18.2.

This version includes commit
https://gitlab.freedesktop.org/cairo/cairo/-/commit/87f7c60bf7c20079c34cfc54e4db05920d14db56
"Add support for C11 atomics"

which causes build errors:

../src/cairo-image-source.c: In function '_pixman_transparent_image':
../src/cairo-image-source.c:89:40: error: passing argument 1 of '_cairo_atomic_ptr_cmpxchg_impl'
 from incompatible pointer type [-Wincompatible-pointer-types]
   89 |         if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,

Fixes:
1.18.2: https://autobuild.buildroot.net/results/5d4/5d4cd38d71008f385f92577b07f21dcfc3c19b38/
1.18.4: https://autobuild.buildroot.net/results/0e9/0e962c66e1e96b5899e87c13ace824379adc09f9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit b90127ee7174bc867a98a4c0a0eb164ae7b1fe47)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...iro-Silence-some-Wincompatible-pointer-ty.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
new file mode 100644
index 0000000000..95f7924f12
--- /dev/null
+++ b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
@@ -0,0 +1,49 @@
+From 78258169cf0c380754804b5835203a199ba8efab Mon Sep 17 00:00:00 2001
+From: Stephan Bergmann <stephan.bergmann@collabora.com>
+Date: Mon, 22 Sep 2025 17:08:36 +0200
+Subject: [PATCH] external/cairo: Silence some -Wincompatible-pointer-types
+
+Downloaded from
+https://github.com/LibreOffice/core/blob/36e0812a01ae5b94a1bb7549b0db20812d0f821a/external/cairo/cairo/Wincompatible-pointer-types.patch.0
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/921
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/cairo-image-source.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cairo-image-source.c b/src/cairo-image-source.c
+index eaf72e2cc..05ffa5660 100644
+--- a/src/cairo-image-source.c
++++ b/src/cairo-image-source.c
+@@ -86,7 +86,7 @@ _pixman_transparent_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_transparent_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+@@ -118,7 +118,7 @@ _pixman_black_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_black_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_black_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+@@ -150,7 +150,7 @@ _pixman_white_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_white_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_white_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
