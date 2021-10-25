Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F9FC433FE
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADEF660F4F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADEF660F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 541DE403DB;
	Mon, 25 Oct 2021 19:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSece59zXAA4; Mon, 25 Oct 2021 19:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75AD7403D6;
	Mon, 25 Oct 2021 19:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 964631BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8624A80E78
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NGjuqD0Mops for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:45:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C8FD80E68
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635191097;
 bh=qAZxXZ4+/r5sztrU4hK78gKvK5PLMVDHWUQjOjdQ1D0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=P8b/aR48IY7zDuzYhp8xfxsHdSAp2XtgCotGj0LDk5MHCTLKpf/Ers2Aqf0eaRIwI
 gR+zWk1Qe/2tyax6p7o5L/XqEgLW8TTo2yF0IJKpYiTK8Klwzncg7I4todxGNDZr3a
 T4QB6ZgMWDShpO4Sf+dmWI1LcDFxRxQ6gBcHfyJE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mqs4f-1n10RM0LQH-00mqvn; Mon, 25 Oct 2021 21:44:57 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 21:44:56 +0200
Message-Id: <20211025194456.29396-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:NFgJBBXiSNOOLgKSoIu8KWbaCs5lsTry7T9fkFjrtrl0uFDO7QF
 2JzjaUWbnl0Fc1D8+llqDTc3iiiVKzgphu57dyM7IejQNHnnW2ZT373bmHvgVTKZdtCtZj3
 yp/AOQ2/ZroGbOUT7JCaFnl4lY2qD5WdoG0kF0lFQqwuABFXrDKScHAsI3CStK4SCq3ggDk
 sonj0QEXyHdKDoJKvBb5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FusViZxG0zE=:/8uDZ6E2g+EOFLWzb0bYaW
 MPXCoCFQFKI2yvXWolegE+O421MqTIgZkRkw4ZjV8Vh3rm7+vzzBEho58fwTN9hEO6Jbp8VLe
 L8dwjWTgGf1SaPzWwdY9dw3dOiq46UtHvozGMhlRrXcNXnOLnOdNas8XwWpAms5+anUwYUwOE
 Yr9o8FWyNhsYl3awhDn9FI1vfv+U8Ab1GN+NezLPn6iFaWPgs6tnllzK/8FuuEHNLBlTi+fDl
 3KMSpM26CDMpY+2IvQ8SrVJc8+1iqocxTU86I7JtVt7E37jq5lfEDU3QLU45kTX0hs0FY6iv1
 8uCwnmxZZdrZDcv5DTL4OAq0PzLEKuov50Shvx8gYIIMDmR6/mKtMd/pWiaaZ+IRmMWW7+H+I
 eqflxCqwUcKTUHPTyvG7DZ/i2FqvNZXK8JQXtoaC46s/s0YSwWHDi4vsHGDu82XltMOrvtDwS
 +bQ8X3wtFuEgMSXXhQ0njXxyJuXRVoz2Db7EKS+JU1RaneW1uRiCyOXx3wKdcz7FwWSyTyTzn
 9T1HhJGnpGosuaSStKub3Eh+blGIbejjfrn2He5JzSeeeX6ohxXxJ4zmkeJ5XpSJiQznjbBAO
 frdKnfCInLlqGm6N9swyXq9lmDjUK18WfQzHqreMfm66CccKC+kEficpmU0Tc0Pb7f0LrwaHl
 z+SkMmGTTFbgw29+ifvkAj0QhGr+X7gHqZr713y0TTJm9SX1meB8EwvpxroLv9js+RO8JTQru
 +ofNAzERl9Xq0jdzLj6VMuz9bbuHJYGmNnakbn8dXSVrjKvNouwydnpQPJlq1lSjzVYzXxagz
 usahOQKd8l8R9Ii/eJwkT3LzcBkLQ+5MU9NRyFjQoRJmZgVDdGxly1R8ifxGi/wB/OCgOEXTM
 7k1pG3hVPsPKeyaSyHRiMiZVq3Pkv1V8E/4DWsPPfgjbe4NOlOuCTzc3IHW31QGaGrteB2svX
 sefa9tgrQYzPXdQM+bXMJrM5NyPNKC6XyBVioPqddpQadU/jsmms9n548QKIetzty5bkq0gOM
 xHwCJ6gGpjhOtghac0caSTHitKSqiNI76EllGC2RSoDv6htblDxe1iJf+XCp1DVGnnkM+l0KP
 lONExLj6X7sokw=
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.19.2
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-October/042003.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 0f0b12bc49..31bf7bcf69 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041989.html
-sha256  0bdcf5b1783b737854b7af1ca22df67bc36a6fe7c9cfa71f01e9149f9220446d  libinput-1.19.1.tar.xz
-sha512  63084f5e081ee4918fee8584d99e6feb84ce9b771015c556c930843e0097abb9b93b6f9731c488b8493eac18fa4086f4822a2ed00f3cb3258346341ad0061c36  libinput-1.19.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-October/042003.html
+sha256  0fc39f0af3ee1a77c60c34bc45391a4d0879169f7c0f7bbbeb5eef590b98b883  libinput-1.19.2.tar.xz
+sha512  fc5244dc90ceb710f7b5bb76a3cafc7dd5a8d5fa05c51122412615bfc3a99435d6a1017b79c3ce73561139fc2f5959acaf16cb9500796ea2f3eb6cb95d1a1acb  libinput-1.19.2.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 0c232994df..682209262e 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.19.1
+LIBINPUT_VERSION = 1.19.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
