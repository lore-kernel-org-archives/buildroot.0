Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0891C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55844840D7;
	Wed, 29 Mar 2023 21:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55844840D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zn2tEBb7u44R; Wed, 29 Mar 2023 21:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BF49840AD;
	Wed, 29 Mar 2023 21:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BF49840AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0E051BF335
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AECE61422
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AECE61422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIXatYC5YUtb for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 21:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49380605DB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49380605DB
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 21:00:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9Fnj-1pllMS2pkt-006MVv; Wed, 29 Mar 2023 23:00:03 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 22:59:59 +0200
Message-Id: <20230329210000.7045-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:xY1AXw3I/dl5npdy19Kd9aNZoh1HKdEN3VVk3moDLe8onFNPwmn
 FDMr8A7jd0guyUas3g/2KUGMoM/8M+mY7hJEC5k/tEEv6Q9xFpa8rYiVfnCNFgKhUnBIHjy
 aUarBFGdg2BwPB+9QN8hdhpFw5LoR5XzJRJXx9wZINKz+69fO78q2Tsrwxtp31AfRnihZDR
 iT0mAq0EQ/bT1PU5MgmHA==
UI-OutboundReport: notjunk:1;M01:P0:rus5Lth1Ol0=;duZ+Mjm0Jy9fhQxJjMn7+k3BFvp
 nULXUg5BpvseLpyzUK2QXZpm+haG52ZOqnNwXheSv3xoStWQR7ImuCGHbUHmn4qH6RtxWgQss
 4gPGPNecqeiYYjan3tPq+Abx/hEIG1r5gxkpQaY45cmvGQxW9jpeZxqgilBVV0/zBo1vGYTAT
 hzQJBi/Rt5lalW8TnQSaFcwwFdpN4bEdi7P3LErlttKTjtITKevQndPqGdUX3FDWajW955DKi
 QaaFysfThnk7VbXN3TyOKyig3+22fzTLOqYDMHhTY+gswO2ab6Ll1AwwYHNTQeG3lVpsbCpmu
 Dy7K51oygkXkejsxbdAOhjsu7YspsqLJ3OseRRXfKp7kWE7+tgNjFeba5jZIXghiY4Bo+RZGj
 vsG6xsT+YTLQEqKBfIC5ivcm5dx7yfoEqZr+AHpGpgAm/vkubg1Smpz6QI8i1k+71+tgNY84Q
 sSfjaGTNSRmIwA0OkwVawYHbuK15Asqg3LTjKcSIDIRnSFWVACterTK+uv4dIZ37+d8yOAT5T
 qkL5drZzjN+FJ8xRmiI2l7LdW6vUnkhuOvmMWCW0xFAYatkl4rlPnPN5hy3GtvM2OPH3Cz2FF
 bMSC8c0kerIVZjEgAv80DZ1Gb5MMdmVhtqrDc8U95ipxle4bwhv+KJVxtPNwpjpb8yy2/gEGY
 vLN9o5dv052SLHEG/wLAtrvUW8euRw6KVurYcJV5KtIhiwxW3zXZIv3ckqPbBqCdGJQaPfI3L
 fKjmLg/W28+pves88Zpj4flaEDTPZs480cHXf/4CBr4zhbPVFUaqZiJDl6v2KFlHPXI836oSW
 7qk9z2DwBSA+S6lqfo/yQ86Ddm4Bp+pPNQV/hGe2kzT4hHEhBBsYWmlM8kbPI7nweJoje3bc4
 hyPYuNon3LlJWtmlmMNYxtpF8Ijk6jUuFQXJcrU2hTa+iy/NLUsWqLTN2rvaBzd1AWumxnRLv
 yRVC+1zD1VYSII77o+klhBx/VB0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1680123603; i=ps.report@gmx.net;
 bh=bLSKRa9mil04GAHJW00qhCXzRP2NXnQ2p7/CDVSU6Pg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gbHzZVmugl9Tc8JshWXZAROTYoG2eJvWn+fcXuoX80MlvhkNrqKP4vsj8XSO8z7jZ
 m6g0E8d7J7gAvNuiH4UiPyc8lu7lS9soxj3sxU7r/szQYoiYstzxCJYmKE4cmm3wql
 S2QnKKqShyViYxR6NSI6rHgVgZqmSEUJBdNjb/zjGBgDnUytoLJ706X6B+oz5DAmNI
 xAXqOq1kauN0XyOf7g7exrbJ/BxgXQXilIhwAxrzyYcsnE+dtdCOqWA7PTLebquncU
 CYAOFceZ975pZMFzqnEPtIHAPI3XMLjReo3/Pg54SDxoN/LR3U988bePwtNt4xLe5L
 oh2TuKfrMJyMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=gbHzZVmu
Subject: [Buildroot] [PATCH v1 1/2] package/libv4l: bump version to 1.24.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- disable new v4l2-tracer option (fails to compile with rpi4_64 configuration)

For details see [1].

[1] https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.24

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libv4l/libv4l.hash | 2 +-
 package/libv4l/libv4l.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index d99d5e0992..4f694de34b 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
 # https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
+sha256  cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6d007eb53b75d805f5b  v4l-utils-1.24.1.tar.bz2
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index fd69b7ac7a..83f9dfe565 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.22.1
+LIBV4L_VERSION = 1.24.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
+LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l-tracer
 # needed to get utils/qv4l link flags right
 LIBV4L_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
