Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E98C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 01:18:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E202B61381
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 01:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E202B61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66A024010F;
	Thu, 30 Sep 2021 01:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRl-TX9mbG7f; Thu, 30 Sep 2021 01:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60AC440176;
	Thu, 30 Sep 2021 01:18:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C4371BF2E3
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 01:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65A0D84075
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 01:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yahoo.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60n6pFEikNju for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 01:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic312-25.consmr.mail.gq1.yahoo.com
 (sonic312-25.consmr.mail.gq1.yahoo.com [98.137.69.206])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EF9F84042
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 01:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632964731; bh=7SCtPvG/bDweZb/B/+TkATHU01sZtRouOBCDl1/Flig=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=IiFI6P24/5fcPV7uX1EmJP5Kj1//TRCrgDjK3L9xhk91MqTKXdon+XilorAilOEU1c9m+Mr4NZ1l36ahBwn37KvAgpsf1hIRcHoMyl2mlV1y3NerXUlnHo7Q4yUccPGatrDYzglBFGOiX8XBTMQXRsl1c31jfOp/jhpQ2uqVGlWbmncXiHMaFuzdCfy4ehU3lMJoVast8Il+MWvpQ6PDC03KuGw1K5SBxqBgbj2wUSJ2/Ic8cGkMVsI3vRPlNwC2RmRWTI63ASlD29VGEaZObpNNKG7buQijso/SFzmmBH78wumTrvvfov6rGxo0DbErf97iidSSiyj7MgpQNjQ8cg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632964731; bh=aD44/k1VwxWTrBTf5Koiby8qamugb+vUewSzmAbrRWu=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=BqD3gr1lPae0BfSTzSGhisP8vqxvpfR3dfNqnDwsrHFThZToK8rC/CDvLv24gvbuTKbbV7Qc6iXilr+3f27hpOIayHf8WiQ8qBk4e4TZBMcwOReGD/TBWUWrNwtBpiMD7Y5AEArolWJzH9GM9JjmLGWkU7Ptzl3xpNcB/kEv3CmGAdTORyPJhxsNGzP9bs80Ju5zlbhcVpLWvmLrKhR/MzcEGkVJURaO5l9rs5mDin1QvY1DPWfs/a0kn3hLNVYaHBq2AsvaMPzfuUVEER8CR5Dizr8UvUcYsY+nzppHByY7k3qTmT6K8uhfwM9CW5x4Zho/vTmq3eI2UUnImcdo2g==
X-YMail-OSG: M5E0IFcVM1kcKV3v1BWBlfW6FuNb8t_UB7B9myvE85gvOsM6pWRFbMgmwKVyvN7
 s4zFwooGCh.xc0MlwVlcTn1.7UhISPiNKDba4Gd7lupChVAEY0YZTyjUjZfkT_9wdFjbWMPHph7J
 7TEEvqK_YBg7R02YtBD98S34_Oih9dehf7g2CkbsIb6kU6U20xB2ecmvBxKt2O.xmD2XmzVbhWF3
 1nsrn0TuiPPYPg7w7fV_VyD8Tab3gIefPe3t4bk1_qidxahpUiX.C5sMatHeRbXu3h6qG7GfUJNu
 2LmDpKR_LkU_aDor7TOLzo25RojlW3H55.eyy6cy.H53kWvq2pr5QpMBSCbJIqruyF6i2OpfWZQG
 PRTyIoWwmk63kF0kT3JcepGha2Clo96H74cdRuzzNzAGyPlN13GJr.vc5PDz9k_3j0birDmPfdlu
 9HIeZDF9o6UF8Sn8GysgaKcJGbos.EEhFZeNqXu_UnRURfs9npcoHLlMcWPU8TT.s5caup2K6V64
 VvYSB__tawt7QSy6NKGJJlOpzUSve_qv.yICqckKp8_txyYLJMuWKeDyRXVseR9tWdSeE6KT3EDu
 4WsYafNZy7gkcDe2RhazN5eo7TaRXqPePGFCQrnAzIMzhKtCtRXNNrsMd9bELBQxSUNMxv.UybKc
 zAWFF.AyXupnqNKPeBiJjk2S_ltxzg4JleldQrbcbbHr8lvW7eUVyZ4GpKRQ37ugiRW7_5ZF93hP
 Ruc5G8KP5d0e7lB7xe2T3PXVQYO9FcJlR4UW.pYsJFPPpj_yqACS6WQqsP_7tZjuEq7YLgXzyQI6
 poj5LJNq09SKlKDjraR4FClKG5d0LH2ZXXDMiR5n22ZPbdiEe2xh7OPvo_bBNvqJP5WrEmyNATT2
 rd1quFoBsX4Bvv.DvQ4eBOF4zoRXLMWoL8MAFXf9SpUKPjmzRTsKVfedijRVt3.fumc8Vc_jSt6i
 S0IYR4yb96zsPHiCWCoWJqWURoFgZZfCG7AD8IK3hah_heABx7U4ON5EePA5NAVX0OD3rMI06pUB
 yegccmRKnJ56MvJYgNL1Bf9ke7uRYb8cyi6hJA1PgzaAhZh.PMIqCy6wlcc5tqkdFbyNuo3iz5Us
 HiSa5JrcqpuGZ4tyXuTK8YVYKQckajbhpnoJ.W3YYy8D_DYXzqPkOpyuWC6SrEEVxyG39nFsdAuF
 nFIrVzbNenZKwQ2iOknXwQVwIy1usvTRCJqmUUuLgfkTWtTpQ5LR9zOsdGKuUBdBgmYNqQAKTv4h
 yx8bK6T.WbAXhPgZo6o4TgYc1selHbBDhDLEHD_fhc1WO6ArLV.sF5em8Z7SRNS3LlRNH484CNiB
 qffL9eKvxGgtVWmgfug8Vy1McTCSnLB2zIBdkBQT5QHYVVF3y02wJAQuMJrmW.0VBJW3c.xTpreD
 Go_zHJaw3VWLwoXVuW633NsHn_jpzVvIyht8feMKDxjMoF6PvTWXFWoYMTpy3auQlGJcHP2SnSwz
 SN9WKeH_RB35ecV7g6D4zEELYl1_8FSIKcZcqu6rsYbtrl4J9BUp5H.tJT1zpC_Y8QCMN47izrW.
 UZDzDm5MXYzEakMIAoZvQZjuYmIHpL_d6tIGhkKFlh8qj9hTCrqeMB2TZhQvInAdlhTgF35Z3U9m
 V95NbnjcasAvP_MQmrOf3DcA14tmBa7_T40xy2jC64.XqmMADYlZNaC0W7BlpDGnXvvJmDPcjAdG
 KImR4Wts650Oepk3ZCsAWeBq.wlHGNCp.s0cAReqk2he6ScXdLxLq4j2ADMyQctvMkCEg9ErKIeZ
 pcfMDt_B55L04lcrL2fvy7R_CX8nnsbdcci3dRuEUBrXsrH2r7hao84Srrd3NRfNMpXbxJ7NgPj4
 0nBlNqOEG1S0nHitB52jfHaj.Y6qLYe_Xee7Ylj43iiFXyVLAEOyIcNo8Ewtyrq7NTnqOWJreBbv
 HFn_e8i3YT2ffYL80HfKkJPtSad.wWeouRV_ymzruQDZ1GCOMEFkvVoRXdC6AtxlQiJAJE7AoopU
 _fqWCuMXJbnqqEhjEjRTod.QhejDT58IYsXVDPMuoKTtYNeQC2g1ETpyFElHl4aeXnsil9DsQWYH
 CBqpYyKsmHkt1mMH_J3zFyvJfUR3E7dMyS6mWfv4F51vsjHnsdNnXOcWaot.Rhd_EB948j4lO.Kc
 cuVficzMPqTcQf1MTrGD7AnGeOg.LQxMRocyXfRU9wcPHl1X_g1WjAbtgmKSUJ9ni.hOk_w9jGZb
 k7DWJ2tcSATO8qyEhIrM9QLcQuGinzhlPeSwWWCNZySNnXQs.L.8_UX8AEc_KMtCU3Ss_JVrcKLn
 YBVxEDeL24oDlJGpha9Y-
X-Sonic-MF: <tallubko@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Thu, 30 Sep 2021 01:18:51 +0000
Received: by kubenode547.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID a68830fb20b6194998b18b71d81a9658; 
 Thu, 30 Sep 2021 01:18:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 04:18:40 +0300
Message-Id: <20210930011841.15165-1-tallubko@yahoo.com>
X-Mailer: git-send-email 2.17.1
References: <20210930011841.15165-1-tallubko.ref@yahoo.com>
Subject: [Buildroot] [PATCH] package/chipsec: new package
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
From: Tal Lubko via buildroot <buildroot@buildroot.org>
Reply-To: Tal Lubko <tallubko@yahoo.com>
Cc: Tal Lubko <tallubko@yahoo.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/Config.in                             |  1 +
 ...ed-modules-instead-of-source-modules.patch | 27 +++++++++++++++++++
 package/chipsec/Config.in                     | 19 +++++++++++++
 package/chipsec/chipsec.hash                  |  3 +++
 package/chipsec/chipsec.mk                    | 23 ++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
 create mode 100644 package/chipsec/Config.in
 create mode 100644 package/chipsec/chipsec.hash
 create mode 100644 package/chipsec/chipsec.mk

diff --git a/package/Config.in b/package/Config.in
index 2f83c87582..ce73e2db72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2010,6 +2010,7 @@ endif
 endmenu
 
 menu "Security"
+	source "package/chipsec/Config.in"
 	source "package/libapparmor/Config.in"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
diff --git a/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch b/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
new file mode 100644
index 0000000000..08a87bf3cc
--- /dev/null
+++ b/package/chipsec/0001-search-for-compiled-modules-instead-of-source-modules.patch
@@ -0,0 +1,27 @@
+From fd67e6878daec7abeef649bb687464c832a04ee6 Mon Sep 17 00:00:00 2001
+From: Tal Lubko <tallubko@yahoo.com>
+Date: Wed, 22 Sep 2021 15:50:46 +0300
+Subject: [PATCH] search for compiled modules instead of source code modules
+
+change chipsec_main to search for compiled modules (PYCs) instead of
+source code modules (PYs).
+---
+ chipsec_main.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/chipsec_main.py b/chipsec_main.py
+index 1aa46ea..11cf9c6 100755
+--- a/chipsec_main.py
++++ b/chipsec_main.py
+@@ -215,7 +215,7 @@ class ChipsecMain:
+                 while len(subdirs) > 0:
+                     subdirs.pop()
+             for modx in mod_fnames:
+-                if fnmatch.fnmatch( modx, '*.py' ) and not fnmatch.fnmatch( modx, '__init__.py' ):
++                if fnmatch.fnmatch( modx, '*.pyc' ) and not fnmatch.fnmatch( modx, '__init__.pyc' ):
+                     self.load_module( os.path.join( dirname, modx ), self._module_argv )
+         self.Loaded_Modules.sort()
+ 
+-- 
+2.17.1
+
diff --git a/package/chipsec/Config.in b/package/chipsec/Config.in
new file mode 100644
index 0000000000..3da41c14a6
--- /dev/null
+++ b/package/chipsec/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CHIPSEC
+	bool "chipsec"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+
+	help
+	  CHIPSEC is a framework for analyzing the security of PC
+	  platforms including hardware, system firmware (BIOS/UEFI),
+	  and platform components. 
+
+	  https://github.com/chipsec/chipsec
+
+comment "chipsec needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "chipsec depends on python3"
+	depends on !BR2_PACKAGE_PYTHON3
diff --git a/package/chipsec/chipsec.hash b/package/chipsec/chipsec.hash
new file mode 100644
index 0000000000..344eb4fab8
--- /dev/null
+++ b/package/chipsec/chipsec.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 0470326e00f66c91d751e9827d9e0050e3e4ac5b2bc7a9943a76381beda58162  chipsec-1.7.1.tar.gz
+sha256 4c2ca80f4d3675a53a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607  COPYING
diff --git a/package/chipsec/chipsec.mk b/package/chipsec/chipsec.mk
new file mode 100644
index 0000000000..96d96176cc
--- /dev/null
+++ b/package/chipsec/chipsec.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# chipsec
+#
+################################################################################
+
+CHIPSEC_VERSION = 1.7.1
+CHIPSEC_SITE = $(call github,chipsec,chipsec,$(CHIPSEC_VERSION))
+CHIPSEC_SETUP_TYPE = setuptools
+CHIPSEC_LICENSE = GPL-2.0
+CHIPSEC_LICENSE_FILES = LICENSE
+CHIPSEC_DEPENDENCIES = linux
+CHIPSEC_ENV = KSRC=$(LINUX_DIR)
+CHIPSEC_BUILD_OPTS = build_ext -i
+
+CHIPSEC_POST_INSTALL_TARGET_HOOKS += CHIPSEC_INSTALL_LKM
+
+define CHIPSEC_INSTALL_LKM
+	$(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux/chipsec.ko \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/chipsec/helper/linux
+endef
+
+$(eval $(python-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
