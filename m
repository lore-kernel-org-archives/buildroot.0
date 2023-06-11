Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C525FC77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 14:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D724611DB;
	Sun, 11 Jun 2023 14:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D724611DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmzXEyrEUMXo; Sun, 11 Jun 2023 14:58:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841C36119B;
	Sun, 11 Jun 2023 14:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 841C36119B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77D881BF3E8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A51EF82BE5
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 14:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A51EF82BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EVkn-xqXWQa for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FCA582BBA
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FCA582BBA
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 14:56:23 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout10.t-online.de (Postfix) with SMTP id 73BEE4D3EA
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 16:56:21 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8MUP-1x7DYw0; Sun, 11 Jun 2023 16:56:21 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34716)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8MUP-0001vD-0K
 for buildroot@buildroot.org; Sun, 11 Jun 2023 16:56:21 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 16:56:14 +0200
Message-Id: <20230611145617.758070-10-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611145617.758070-1-bernd.kuhls@t-online.de>
References: <20230611145617.758070-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686495381-42FF7266-BDE7752B/0/0 CLEAN NORMAL
X-TOI-MSGID: b137f48e-c420-45a0-aefc-c4b61a1a3d92
Subject: [Buildroot] [PATCH 09/12] package/x11r7/xorgproto: bump version to
 2023.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2023-June/003404.html

Updated license hash due to upstream commit which removed "All rights
reserved" from Oracle copyright notices:
https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/commit/423098656f145afeb72cbf21aaa0b3a3f9bc36bb

Added license file COPYING-xwaylandproto:
https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/commit/ad6412624ef6dc4d7548fe16c254c4166ffa7198

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xorgproto/xorgproto.hash | 17 +++++++++--------
 package/x11r7/xorgproto/xorgproto.mk   |  5 +++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index cc52013e11..10655f9dd1 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,17 +1,17 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003197.html
-sha256  5d13dbf2be08f95323985de53352c4f352713860457b95ccaf894a647ac06b9e  xorgproto-2022.2.tar.xz
-sha512  8e6108110600d076a94cc6d0e465b2e9adfbbe8d7e6b75fae9c5262d99dc6074ab1ed561a74d6d451f00f5b7af9f507a6317be9c0770efeed9e60b64beb7a1c9  xorgproto-2022.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-June/003404.html
+sha256  6545e41aceba43c13497ac8084dad5db6deef580a5ea7d0bd7872cfd1be72a13  xorgproto-2023.1.tar.xz
+sha512  342128ca2e9a6806a7ff33f426434bee29626a13a592b9544654a010cb7be208b0862e3cd063773a0003ca0ec7d48361cfcc384fe207efe9ecb6ec3f2b8e7d56  xorgproto-2023.1.tar.xz
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
 sha256  dabc025f93129a0eb2d17f37c719dbe5ecbcb5bc8f7bc7f4ce89fe04576cc0c2  COPYING-bigreqsproto
-sha256  ab587ca94282c1e60797ffe4a77aea195418387db20ec7e0c24cedf2c844f8c1  COPYING-compositeproto
+sha256  3e980a770506b448897638632974bbcbdf2da3b99191dd0a03d3770097a46738  COPYING-compositeproto
 sha256  f67a18cb46c4c203c5122b4a901cfcc3178b2a62f83f31ca5fef5bdca3966094  COPYING-damageproto
 sha256  819e8dcd3dd2a44850c350331aa492230f86bccb0983dd739dec5ba36d7d2b8e  COPYING-dmxproto
 sha256  0c306691492c4d7a8cda1ec3847668b797887dddcd7e986b4c166ae27619af7d  COPYING-dri2proto
 sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING-dri3proto
-sha256  0aa43d03da3cedbd9882c0ded621b0d855353eb9e551f9eed940d75c8a0b03c1  COPYING-evieproto
-sha256  65cb0b867b00fb27f066a37353713b265645b3301146562570d7638ed2ddd548  COPYING-fixesproto
+sha256  9936421f7516f7a17ae560b6989636b493e55c01128b543c7e72441568c3cba4  COPYING-evieproto
+sha256  fb361c7c4322e4919ae193c5a20055d5190c23aa50480fd0a41f4d439cae2bc6  COPYING-fixesproto
 sha256  1ab381e978bff63d68be2e4f235d51935f3f16f3ba3bebf83afa99a70c0484a2  COPYING-fontcacheproto
 sha256  f4af05774b02ae149357cc26f7bf5ef1116c2e09373c2492081a3a1892c58417  COPYING-fontsproto
 sha256  823deb4673d3f26aa8c90e704888299648f00be3262f9363eaeecedcd65b936d  COPYING-glproto
@@ -20,7 +20,7 @@ sha256  d397a67d4b28e897bc5fce79b2b917df9905b54f961fc3ad1f49c7fe3803f92c  COPYIN
 sha256  7a5dd5d4c989c167da50f15879959f42bbda960e06d0a0aea7197f61fe1dc846  COPYING-lg3dproto
 sha256  8442b5f22f2fb13017a4302a906e7dedc899267b41f613558970941120170128  COPYING-pmproto
 sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING-presentproto
-sha256  6b890b118261694865988378dbba876bcd9caa1a421c5c0d626116948bc0ae35  COPYING-printproto
+sha256  46f599055002bbf3e6ce244bde8d9ebe5ec24ae7906836db186773a9791d0b75  COPYING-printproto
 sha256  41c13dcd09147ed2440286f2fb8151df8ebee06deee4ed78ddf094601c216d3d  COPYING-randrproto
 sha256  ee10aee0f1697ffdbe870a39f037361d4f7136f2976bb7919a41b3f66407caee  COPYING-recordproto
 sha256  9e48921a94da36d7a69fe71809223ee0bb46370db9842dccdeeb55b5a9946872  COPYING-renderproto
@@ -29,7 +29,7 @@ sha256  fcbd3c628bf4d28ee3e6032054bf44bbe58f3b1a944dad856a8d3eb6b37ea412  COPYIN
 sha256  d6d3513f5a7099748dc387f54498d799380b45f8a444f13aa98aa45a860ae55b  COPYING-trapproto
 sha256  f8f49bbad61967ebc890fb79fff5bfb7cfc1c341aa8f8dee13eb3fb534040b47  COPYING-videoproto
 sha256  eb183a00c61bb47992f096b6993ed7ec17518bea9c285fe87efff7f622cc6c12  COPYING-windowswmproto
-sha256  3bd8e0c41497bfe6ab8d11c3c90c5e79edd0b2437f2bf81161575f54bae53f21  COPYING-x11proto
+sha256  da835951edc6e3b8d168d6afe7447c65d0b9a99937293cf3f288bba8244a9f86  COPYING-x11proto
 sha256  5531d18cfcc944dab39991f63f182cbbce3fe493ba0c7cf08a25c0d01ee84482  COPYING-xcmiscproto
 sha256  fb42146c6c06a200a9b121220eb692ff9101ba0fbd0b224b9e16a016c59ae86a  COPYING-xextproto
 sha256  3591964e01a9cdfc9cc4149a847a431a3f3d98328cc9e5864c7a7831b29c4058  COPYING-xf86bigfontproto
@@ -39,3 +39,4 @@ sha256  3591964e01a9cdfc9cc4149a847a431a3f3d98328cc9e5864c7a7831b29c4058  COPYIN
 sha256  3591964e01a9cdfc9cc4149a847a431a3f3d98328cc9e5864c7a7831b29c4058  COPYING-xf86rushproto
 sha256  942bb46a3503a708948491699171b00b9e0dfb47818d9268b160bccc5f51a4b9  COPYING-xf86vidmodeproto
 sha256  b2d8cda803e900915ce10f0ba735ff2c033b39c7cc5a8a436667ca583d4066fa  COPYING-xineramaproto
+sha256  309bd89bc2b30c6e3d3eb78f5377fa576475499e0ba936a9c3cba50ba5d6375c  COPYING-xwaylandproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index c707bdafc0..899f505f1c 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2022.2
+XORGPROTO_VERSION = 2023.1
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.xz
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
@@ -44,7 +44,8 @@ XORGPROTO_LICENSE_FILES = \
 	COPYING-xf86miscproto \
 	COPYING-xf86rushproto \
 	COPYING-xf86vidmodeproto \
-	COPYING-xineramaproto
+	COPYING-xineramaproto \
+	COPYING-xwaylandproto
 XORGPROTO_INSTALL_STAGING = YES
 XORGPROTO_INSTALL_TARGET = NO
 # xproxymngproto is needed by xfindproxy
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
