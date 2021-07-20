Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD3AC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:38:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76F160FF3
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C76F160FF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29626059F;
	Tue, 20 Jul 2021 20:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGmwII_6BhR1; Tue, 20 Jul 2021 20:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D82966058C;
	Tue, 20 Jul 2021 20:38:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA311BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C4F34047C
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZ5DwIoGaVt4 for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:38:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A93364037E
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7AB09885E3; Tue, 20 Jul 2021 20:04:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:38:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18ac5e46694f136b9e3952150111327060bf24fc
X-Git-Newrev: ee95ae7821119a749a9881404abd744c8d92504a
X-Patchwork-Hint: ignore
Message-ID: <20210720200402.7AB09885E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.107
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720203803.DYzW1HCiepYA31jmRPyBiJbuUdx7Daw59CnFxzJoklg@z>

commit: https://git.buildroot.net/buildroot/commit/?id=ee95ae7821119a749a9881404abd744c8d92504a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update license file hash (xf86drm.c, license unrelated source code
  changes [1], [2], [3], [4], [5])

For details see [6].

[1] https://cgit.freedesktop.org/mesa/drm/commit/?id=67e911977fbe1f444045f59028c149a04ba29566
[2] https://cgit.freedesktop.org/mesa/drm/commit/?id=a04b674887586bf05594abaf7c55fd8d630898db
[3] https://cgit.freedesktop.org/mesa/drm/commit/?id=99a0522aef04e08c6e0be7a7a020f12c51d24c47
[4] https://cgit.freedesktop.org/mesa/drm/commit/?id=9ae8f17d563a81212ca2f61a3427ed559c105644
[5] https://cgit.freedesktop.org/mesa/drm/commit/?id=65d89398081b33b7498bccaee6915e977f589ec2
[6] https://lists.freedesktop.org/archives/dri-devel/2021-July/313594.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdrm/libdrm.hash | 8 ++++----
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 079675824a..d3f35b3de0 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2021-May/307025.html
-sha256  92d8ac54429b171e087e61c2894dc5399fe6a549b1fbba09fa6a3cb9d4e57bd4  libdrm-2.4.106.tar.xz
-sha512  33140e579906ab54b716149056af500c628ce41cd9ae3b0c33496693d2f5903fbcfccee8a942dd1560e1591111ed240da42612d5af5e75558db6f6a85d14617d  libdrm-2.4.106.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2021-July/313594.html
+sha256  c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888  libdrm-2.4.107.tar.xz
+sha512  c7542ba15c4c934519a6a1f3cb1ec21effa820a805a030d0175313bb1cc796cd311f39596ead883f9f251679d701e262894c5a297d5cf45093c80a6cd818def0  libdrm-2.4.107.tar.xz
 
 # Hash for license file
-sha256  a69e38953c20a88845cc739c05dd604da4c977844b872e126c91a0ca2e1385b7  xf86drm.c
+sha256  7e952c6666ed17c99f91ee7af13c688b8769b0feaf6f4558bf6ad3e07512e1e6  xf86drm.c
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f18df27687..c15be3e671 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.106
+LIBDRM_VERSION = 2.4.107
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
