Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:34:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63ACF60FDA
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 21:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63ACF60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20F874010D;
	Wed, 15 Sep 2021 21:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMHybSOsihM2; Wed, 15 Sep 2021 21:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37CFC40588;
	Wed, 15 Sep 2021 21:34:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93F841BF2FB
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8036140588
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wccqhlJ7Yosa for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 21:34:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4EA74010D
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631741676;
 bh=kwrnlLiZfXHo589sl1AqpbMzmrZPdqyu1/zytPis3d8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BiQHHLymlPuMs0IEwd4wTws9IMDwaIjzmiq5lMYj6Z1sc3vyCoFTtDxs2e+b21Yfy
 dNXVL0SqwFR3LeO/GAtrDwnTwjgzioQCxWKubilhH1fsMM3eQfksy8QERh7hXqYyKK
 y9HVQawHAFm8+fNwc/4aUWH9UCJjI9ORWmfKhzPY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.112]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MMGRA-1m9Uq53NSw-00JHWY; Wed, 15 Sep 2021 23:34:35 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 23:34:35 +0200
Message-Id: <20210915213435.31580-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:NYkUbIa9DAJCLhHjrNWIZ80VMNSnsVtU+JpssLzh4Ow4e3YYGFS
 bYqmFyCsMrQ9EcBYb6sMA3lCm2k9TiM9clBPtfLHXeKPFZ4d5SHCPZc7UsBmych9LwgsFoq
 hyriAuufpQrdx41w+Cv2AdC7T3yH1dJj5ace8UkgPT4RKVNgyEzL7ygjdCBkzUsXtMsoqiW
 vcDYAm30Jaj2UnpHeMmNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e+PkFo51Htg=:vGAJvCsDYvDTHDLoSwWU+n
 xd0FLqNK5SvF+XUPe+4SjwGgSoeG8mr80D/J6ZHRRMdvWxRulugEXtePAaWuzkeQycq7z3i2H
 r5SrafURxEWfc6Hh/j2wSfXrnzCkh+EDlF3YPXOecA13tO/DQuYGpHcbhkS599G+IftapD8Xg
 RSM16YHIU7IUWoaJ+aUeJ4rDZEoAq43t9AbdJEjqvrHgKMye77dOt9cGlGKBuan6JT/yD35we
 QrlPt6zA8foYewvtp/URci7z7+Y0eQKC5LIgT+QFx+pUnnkOMoypYbyfojd0y0mFBHt73m9U3
 DYzR9+88IQsfvBpkqgAr3U0wDYVe7p9NtNXdvxsnBfYLbBDAJ4VBGgSOtwqh74e+dpCsUdCm+
 ZJmsUThVP8E+/jyt4Og/K+DT2r5gk94bnIPRwKuKkG0hFZOBJoz889Rr0vkIqf7bj4F4KdxQN
 h98TFlgBKLlTjwIB6eQnkA8dAb98x/3hdjWwEB3KyYjankobwTcMEqOnTdR7b8sdOBO0b6WQR
 45XNCOI+JRJ2y0l9s/tY6HyuFCeY+MzJlH4XooFszp2Wfm+y8XBegt3aRZbR5CLGAy4MdD4yd
 BeHlXFdg2VxoF0LYCbmRMf64d/yzKvUKhXCH87eqmWpo95l2n9zNZ2Ln+UcDJwova7fwLOFM5
 q8SH4n3dkGOC3GXFWyw1e83itltKspUQSU+MKhBCK6FzUJEzLnQ+Nb5dnrG92ovu92LuwQObz
 rdcPYYsDkBnU7YtcLwy/XmH+cg62nwIYzXfOULdnn8Yj+PegItUTA1YkEK/gM+nubiQjJW5+v
 yNzR3u2qpedwqr24PpPNVEoV3s8Qr+UteQVwGjVN5UnaTpNxxqgAxtQVLtDFiqylbjKQf+lTm
 7coccffm2em0kWr14A0vmp1xTdkmxcNs4OD/mKeWhraYtkLiSjwo7quhn9qhZcoVHwEQwKUii
 +MrBPEmbGYbvJ3tFGaTuY0ndVWRlR0mpFub31I7OJF4x1hs0kBUNzQ4ywzqxWiP5othIFWUSi
 9BHorvcPVYCpQU5kNkwJUVgUoSCYuyFfIFSVRAKK86QnFqJr5f8L9xpNP7p+llUkWu1Vi89jt
 60PxiOOloIN6jE=
Subject: [Buildroot] [PATCH v1] package/wayland-protocols: bump version to
 1.23
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- convert to meson (as no configure script is provided, alternative
  would be to enable autoreconf)
- disable tests

For details (since 1.21) see [1], [2].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041972.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wayland-protocols/wayland-protocols.hash | 8 ++++----
 package/wayland-protocols/wayland-protocols.mk   | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index fd6b9925eb..b76bafb437 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-April/041815.html
-md5  8196416baac07cd833bcb86b69da41a7  wayland-protocols-1.21.tar.xz
-sha1  6e0e2a05edb43d32e3b2e3f681ef266a287a186e  wayland-protocols-1.21.tar.xz
-sha256  b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5  wayland-protocols-1.21.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
+md5  31a6c469718db37d2688109e548506e4  wayland-protocols-1.23.tar.xz
+sha1  8c4ebdce35953b1e2af458c139a432a308af6f50  wayland-protocols-1.23.tar.xz
+sha256  6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76  wayland-protocols-1.23.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 3d7a0e472d..41ab1e1c99 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.21
+WAYLAND_PROTOCOLS_VERSION = 1.23
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
@@ -12,4 +12,6 @@ WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
 WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
 WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
 
-$(eval $(autotools-package))
+WAYLAND_PROTOCOLS_CONF_OPTS = -Dtests=false
+
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
