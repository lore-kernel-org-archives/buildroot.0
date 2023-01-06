Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D2C54EBD
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC60060E0A;
	Fri,  6 Jan 2023 21:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC60060E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_2gdX0v1JCU; Fri,  6 Jan 2023 21:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BBDD605E0;
	Fri,  6 Jan 2023 21:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BBDD605E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78CAB1BF5E9
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52EA340399
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52EA340399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEAPtKvUObPM for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 21:08:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8EE40022
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB8EE40022
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 21:08:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.160]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1McYCb-1odj7J1U8j-00d12f; Fri, 06 Jan 2023 22:08:28 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 22:08:25 +0100
Message-Id: <20230106210827.30007-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:LTzXe204/yLlSprXlHXVHL9/nRO5AUOpw3mMv6xBVkylYPWy53L
 LzKD7bSBnBCi/ZKH/V8tGYaOUlK7yXCGYOqxYZO5AKOwPxXoAwNeDerSV7x5McEOhqoi9iE
 PMpJaVeQvA5ZkobICccipLV/zo00dv9VabsbXduIpDwqu8FBj86F8OcAmkNqwi5znwtq71e
 /KJ0Dkld0LpbAGXhtFX9Q==
UI-OutboundReport: notjunk:1;M01:P0:JRhUdvHlSNI=;03btj1XhYMlwAervFWTIlWyfAsT
 t0hVGmDgb2MuQN91nw/JOEcKOeZ3v9dzwz7g0HulH2NMIJPNpyGE2PD0GdDlvfzxwiikH0qCr
 XGOP+cZ+dCQw5LOf0dTHyVesx7puJ1EoHxV2H9HfDFNq4PhUynsTBTE1u1j930aU7WFNSOca8
 C5Vmo37eb9zGAjPHfADrclVaD4wzPno+1nB3ZGXP39Jgh41YkNa5XRnRFmoyKG1lruamyCLlp
 WLQQam4IVv5UgnCpMy/ogJOM28+Y5nY4T2Y+ZHbpfrq2vXwoxvoAlxyIRbj4reRtv/+ci6lLT
 XLEMCbdx3KAbF5D3UxRgXTmUfQIPU34O82jMqRVlYqukQEyCbFYHSYY1nUOLKs1yMvowenMnJ
 k/Rwend0T4d05FvNPEpVHkoEYfketaY7Bt7iy/WBc0KL3gYwEVL4brcA90PTx81Ergr6eODTE
 86paLY3GUN+s6Xfj0JNMIr8f6VIDuSu7Q7T5Omk0QlmHss83p0xXNNGWu0mrEVVwzB7zip2ZT
 TDqXC2EpVIdjuf+LwcETVOOjx6GxDy6uDTXm/4wCDxgnVUCXpzDvR05WtpZyAmGIfW0DR23nS
 XWuQV/ECAHaWWvGBRiysJDIx7u6FNA7JKGL+CNcs5JKoKEiJOhCwp6x59wghhqGnNr++/VdPT
 bxteiTWMb4Dt0YSccAoqasvwaeMkwXnxI9xaBir3CUu1pPOCxdopQaBnm6BlWJkIMlCr56K0Q
 rl81B741jnaM0tLPj8kc+lV8HUXZSSqlLQtfDmNE/Yz50oPiuI0CqUH8LYu6ypTz/+7GhYA0n
 IiilutcC1Gn68UNnGsS+PUopdgZ8R8WNHvK8FTsvE98Iu6x53ZGKjiGtvOfDYImC2Bit+GGZ/
 JrgY4nv0aHOOkVvoMbxxS66m2/pGtik+5kQM7zMv0x0hjePU8Nc1p0H5cbfE9yh6TyJH8Q3As
 g0t0vweSpe58NSg3DzysehiGv0M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1673039308; bh=gEmHZEqSYq0BwxBIL1mzCX+jVVRLATgF7kT8uRgqIk8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=rlV2b8MpFTsFh6XP2gBMDlQf6KIenieRJQrVWIRxzNOuzficw95AQXAF7RNrOYoH9
 K5Ais11jU+XGyD2uHD6a1Q4XCYMPYL1O4PxWbuq9lFESEg+z/FQ3Arwl3LciQWF7JB
 xhJZPV6g6ydJP7QpHT4YI+FXHFcidyNOxtnOtXK9ioYDfEW5q2UuILfvHtrqpEgpZk
 VTKDbNIGkFwwvx1q+ahB2tDlS1mTtRgYCbqGRg2vMeH7p9kcT5xFzXcAZxKxTv3RtU
 a0fe2ZqR5hyV/BmJ7u0UbeBmc0hwMr9rQLdERoKSASx7shQimQ4/2L5Zs0+pSf3S69
 dKKid3RhYzo9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=rlV2b8Mp
Subject: [Buildroot] [PATCH v1] package/dotconf: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Naumann Andreas <ANaumann@ultratronik.de>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in            |  1 +
 package/dotconf/Config.in    |  6 ++++++
 package/dotconf/dotconf.hash |  3 +++
 package/dotconf/dotconf.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/dotconf/Config.in
 create mode 100644 package/dotconf/dotconf.hash
 create mode 100644 package/dotconf/dotconf.mk

diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..b9f04e9fd1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1997,6 +1997,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/dotconf/Config.in"
 	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
diff --git a/package/dotconf/Config.in b/package/dotconf/Config.in
new file mode 100644
index 0000000000..21a74fa065
--- /dev/null
+++ b/package/dotconf/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DOTCONF
+	bool "dotconf"
+	help
+	  Configuration file parser.
+
+	  https://github.com/williamh/dotconf
diff --git a/package/dotconf/dotconf.hash b/package/dotconf/dotconf.hash
new file mode 100644
index 0000000000..3233ea62c8
--- /dev/null
+++ b/package/dotconf/dotconf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7f1ecf40de1ad002a065a321582ed34f8c14242309c3547ad59710ae3c805653  dotconf-1.3.tar.gz
+sha256  a50cc98d5044a7bbddabe61fc0ec42aa671c73bf414d0c6b50da83ea8ae041c6  COPYING
diff --git a/package/dotconf/dotconf.mk b/package/dotconf/dotconf.mk
new file mode 100644
index 0000000000..26e78b3c7a
--- /dev/null
+++ b/package/dotconf/dotconf.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# dotconf
+#
+################################################################################
+
+DOTCONF_VERSION = 1.3
+DOTCONF_SITE = $(call github,williamh,dotconf,v$(DOTCONF_VERSION))
+DOTCONF_LICENSE = LGPL-2.1
+DOTCONF_LICENSE_FILES = COPYING
+DOTCONF_INSTALL_STAGING = YES
+# dotconf source code is released without configure script
+DOTCONF_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
