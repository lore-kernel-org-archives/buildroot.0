Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72F2C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 20:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1AC613F0;
	Sun,  7 May 2023 20:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A1AC613F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IgM_3a1A0tSq; Sun,  7 May 2023 20:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA75260BDC;
	Sun,  7 May 2023 20:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA75260BDC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0BA1BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62104821AB
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62104821AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbJK1gdWheCE for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 20:24:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED17E821A9
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED17E821A9
 for <buildroot@buildroot.org>; Sun,  7 May 2023 20:24:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MvbBu-1qFDUQ40ak-00sfCV; Sun, 07 May 2023 22:24:29 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 22:22:58 +0200
Message-Id: <20230507202257.53475-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:IyOWaipIJ1OzD4dk0HuG6VlZZV3c4kcSaGJHZ+aBDuAFtBiaJae
 xJ4w5X8m9i6S1dDFP+MBLkBaQEFRrdH8cB0AcRJwXnVNTCL78X6ymCK4JBKGIPfBVVJEECQ
 yIJ9u+dBe0R69lbNF5NRuWhU+BytnrEpftUl3UyEev8v7hP0i+C5dQTvgzJ02L8RWr/iLVF
 +VzEEmY/dn3S5ME4rSumw==
UI-OutboundReport: notjunk:1;M01:P0:5Ux9TtWHGeY=;FvN8KbHRknsvsH8epnLwLJBguT0
 bynJrVR+i5od00pAmhXNHV13MTBkdenh7ZiCXpHAXQlqTe1AqwG0ckpOXv5r8i9KZYHfwh6PZ
 fkcJDNyTl9lkYwO6EAKIYgtU+JZHmgpm2IVI/hkUEfU2ve+g3CAqRrddvQJCaV8qyfM1fdjs6
 DoRKmcj1JyYKGVnlonxPTgs6G8B03ETGJQHcsWseHpbZdWk5t1cGra3VMxDumSC66wHyJhBq3
 E81v9IoskNj4NFa2XQ4ZybvRYqRLNUlu5ipdjpbwsQ3E+A0HWyz/VYgNGF2jzpURoxgNsviEW
 wnCDBXR+2pEfyqvQ5d95K6jRPvoVivP/qsxKPXz1lcyOOIvtf5fdv61cH2zru5Kv5qaur57o/
 Yc6EpSf7Y7RSnDyBhNLWeoiOxrVdN6FpMZaD03lJim7QTF8po+i4kPqDedsf9qHK7g8ePw4ZE
 BhqJ//c2GYs3Baeubr85BIlV9i5B0MqSZ/Jrfa/4l/IeYKnBpvqBMyzEf9Fhm3Lk5eGoJyy1n
 qSaaqxxP2eULrknmPl5YTSC9K6pWSnS93+sS6y5AEnuM/5Feo237y4n14ku6GfP5fZw8YU9n5
 abMA8nk/CGMBOgkPncJ3xWmpaxnZlJtrG9BHLMtnuqFhuvrn/hMVGIJYrVpC2ZyRlpUBSwXst
 atzfrlViW3G/KaSk9AJkAOpHof+c3L/P53eetsMBmB8IiD87WL8iXUt7HjMP6pONBaXqqXcgL
 ByLBoy00Y63fDOsrsXHYt0l2W1XTHiGJ29E+5190VKFVknqDNmOIzZn/OczfMHsTAMXZFpnhA
 1pN5LyCI8Z9Mjtsm8HV1yEyfBaRetG77ZugVeNGe/lcABPnJxTDDKbUxw1p6suv9HeS3sysXe
 lFskipO78twzEuDYt+idsk/xiPQZEeMdkEZt5b9Tfqp83Ty2CjLX90Oj2T01O04synz90Vp2K
 20IBnbiSrNa7C3nvJmZVyEKftiQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683491069; i=dalang@gmx.at;
 bh=JYkoSMEtnlupGKp4nUavpjElu4SBkWjTiYY4yRzqkKc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=FixRbucHC/p+1c9yqwBLi4mq48R6w4coxKOIzOIBbatXJfvKCrDvEf6cpkS6oApf+
 ob9hTr9OkZ74BBKscWktCCO3IR/ClwnO4ZtNiyZrg+mQBVSI/36pPEIMkeqpl+ii/S
 GvkKE5CvXqYnLs3WDXrIHtvWU4wklk1HZNnkzzz3Fz87q7Q40wh4Kz05Dl1s0pno8w
 nklBo+V65SG5SeE9NT4rTtcPibBEO42LGGWmDqnonnI6a/NA/0aBpYbvxrzNFzEiYK
 xAl30ryhAldWmk6ujYkJZdjrFXgs75uQjSmDgBY+6K8oU5sypxU0wUjoyy5cVixRLS
 vPh8OVL9Rtbyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=FixRbucH
Subject: [Buildroot] [PATCH v2] package/cairomm: bump to version 1.16.2
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The website [1] states that the released version can be downloaded from
the cairo release area [2], which also features a sha1 hash.

[1]: https://www.cairographics.org/cairomm/
[2]: https://www.cairographics.org/releases/

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
- split patch from unrelated cairomm1_14 patches
- merge version bump and website change into a sigle patch

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/cairomm/Config.in    | 2 +-
 package/cairomm/cairomm.hash | 5 ++++-
 package/cairomm/cairomm.mk   | 5 +++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index 75f6692b8a..174f3967ab 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_CAIROMM
 	help
 	  The cairomm package is a set of C++ bindings for Cairo.
 
-	  http://www.gtkmm.org/
+	  https://www.cairographics.org/cairomm/
 
 comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
index d14a65c2d6..254413af09 100644
--- a/package/cairomm/cairomm.hash
+++ b/package/cairomm/cairomm.hash
@@ -1,3 +1,6 @@
+# From https://www.cairographics.org/releases/cairomm-1.16.2.tar.xz.sha1
+sha1  c24339d5962e2bcbbea85b2fc66347e71fd3db8c  cairomm-1.16.2.tar.xz
+
 # Locally computed
-sha256  bb86d855041bd46d31b03e43ea355d233de44034b39d4200725b1e0947e63e67  cairomm-1.16.1.tar.gz
+sha256  6a63bf98a97dda2b0f55e34d1b5f3fb909ef8b70f9b8d382cb1ff3978e7dc13f  cairomm-1.16.2.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
index 856c9d67fc..571512878e 100644
--- a/package/cairomm/cairomm.mk
+++ b/package/cairomm/cairomm.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-CAIROMM_VERSION = 1.16.1
+CAIROMM_VERSION = 1.16.2
 CAIROMM_LICENSE = LGPL-2.0+
 CAIROMM_LICENSE_FILES = COPYING
-CAIROMM_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM_VERSION)
+CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
+CAIROMM_SITE = https://cairographics.org/releases
 CAIROMM_INSTALL_STAGING = YES
 CAIROMM_DEPENDENCIES = cairo libglib2 libsigc host-pkgconf
 CAIROMM_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
