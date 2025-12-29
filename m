Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19777D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D68D660B0E;
	Mon, 29 Dec 2025 14:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfYYI9P9XNjG; Mon, 29 Dec 2025 14:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE3260AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017272;
	bh=0jAcmAFrLvqdf6YGEdxvao1JzXe/CgcIhmjwL2qQ6j4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W1jWhrjz2PUO8FgCqjdc5hFymf0La9E3jVwxNuFeXQIsZTCHIXOSjb0COB5LDJ3Yk
	 +NpL30uxOif4r4PNGOCoNJUwQpkk6OY2INi1n9nZUJVm8aBjX5eEWvoCEwvywGV4xK
	 u4WDJxjMJ6djDXE8WtAiY/kJHW4OtCJBEwB4bviekLAkQdcxFck5bzxOgZXbxX+09w
	 dGeXvV5tbroGcy9/GX4Fh163FY63Pv9cxnO6cYbRxwbqwM/wgkQNExhojKTVplS+Uu
	 XxjO5Qw8+ZuzzRJ6FC35pjtV0c5NJNV4qgqyrZ8Yq4W7t4D8pjuCKxeXuXWG17jeHW
	 idDCGtl2sZeoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE3260AF3;
	Mon, 29 Dec 2025 14:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68494177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BFCB80EBC
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xP7bmXfy8bJW for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D38B880F79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D38B880F79
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2BF687B4A; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee647574b7c8cc662937a312c6d20f555db777af
X-Git-Newrev: d372b654a45882f641ff65a4acf7126e66c35487
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.D2BF687B4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl: fix patch reference in
 IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d372b654a45882f641ff65a4acf7126e66c35487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the
`0003-SDL_x11yuv.c-fix-possible-use-after-free.patch` patch reference
was renamed.

This update the reference in IGNORE_CVES accordingly.

[1] 9fab7bb79d package/sdl: drop directfb support

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl/sdl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 439c30b2a5..29697fe3c9 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -13,7 +13,7 @@ SDL_CPE_ID_VENDOR = libsdl
 SDL_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL_INSTALL_STAGING = YES
 
-# 0003-SDL_x11yuv.c-fix-possible-use-after-free.patch
+# 0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
 SDL_IGNORE_CVES += CVE-2022-34568
 
 # we're patching configure.in, but package cannot autoreconf with our version of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
