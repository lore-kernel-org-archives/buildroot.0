Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5258C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 12:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5560140BEC;
	Wed, 17 Jan 2024 12:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5560140BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MksLo3vZY-ro; Wed, 17 Jan 2024 12:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05C93435D8;
	Wed, 17 Jan 2024 12:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05C93435D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64CF21BF3FF
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D4AF83CA7
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D4AF83CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 94PyU-i8SCDm for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 12:15:16 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B359D83BE3
 for <buildroot@busybox.net>; Wed, 17 Jan 2024 12:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B359D83BE3
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.11]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt757-1rACnh44O9-00tXTk
 for <buildroot@busybox.net>; Wed, 17 Jan 2024 13:15:13 +0100
To: buildroot@busybox.net
Date: Wed, 17 Jan 2024 13:15:12 +0100
Message-ID: <20240117121512.32640-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:1p5nfcGoPavGSABOOekcM3iyW6YnDBX1Bk3pomDYCQV9aLOGYxx
 XagE7cJv4U3hFX/71237RkSya5Q9EGySUXPtjNYH5XSPWY+JRET9ZJ68V2xleck2s1AurZT
 12usfIxYUDeiqX8/7IH+nLf8E/QCWuVUm9MqCK9ct9stq81ydWZjIsd5MbKCWqkL2uUV/3i
 rqNTIrL8TSeLFPBZ7WAZw==
UI-OutboundReport: notjunk:1;M01:P0:h7x3CufMMTw=;ANT04aZ6yAKVCJCeh4Mkb/ZMSP0
 UbQh83i5FNbXrPiXC7+5huAyLcyw1Fq+rmNKvK/rz5RhTTXtkR69w2EAP+SwFviF0YyvGC3Vn
 NNja/5srzDI/JUC2kAsMaW0hj3Rlo1BN95CR6MVbCj10yBTXxtg2ynl3o3Az5JphQkOsKm4iP
 qAo6baZeTjbu1RiZT81Sa+0EE0RQyfIE6WDWdfE9yjI6g5wavmLaHf6xwQ/24W4S43OrUSqjn
 cLyOGPH0LToj8RFa7Qzv3BUMbFWfhXBfcTyeIqNWV6n5mglnYWUiy21uk9sd3LRK0RGpzY2VS
 Mv7gD8bk5I1Dsr2yhjQJvLTzSzCSk58ZxCusPELdHIgMDDtSQng0LzgHdJh2zXWyxvUm8yK8O
 A3Oxblel0QACiWw/JFpIS9C+jPbVMOarVKauUH2vB3bu/vk2e/kQTz4Iz5EKnjTRjlSJeJ9Ia
 GyywBYVS2lptgcTL8Gm99N6VlERTy72UcvV0FvGQrRmhaJLSDrpExqj/JKh/vq8dLCNoHm9mv
 Uqm4yWtOrwU5tOsV5TDcTmWRO6Bs1W3/Xan2HbY3nhaHb4Jp02diIvDoF6A8NNJLBrGQeSoyy
 5itD42iCoBlZTK8lJBjeg3YoTqczIaztk10A/sYSeXn5OkE8heYx1kODUwkkY14hJuS8Yxydv
 3tSLSQDokhs/FYDSuxaAzXTH8VhcqIH2Djj/1vCgbo5osJqd/6NZU/cwgrbgihE1FuAUidL8q
 izQOke5i+ovMvZhRNuj/tN4wbj5FLTlv/NhoBhlMwa/v8JsHwYUJjR33h1H6tDoM0CAr8jjc2
 KrSQ0CQ1HmYcN7elBJ5PBeOkU3gkl+Wgnna8bMq6UXPOwIazfKkkdnNZdNsr6heA2qGiWrM0j
 LKv7NTBuTh3YLyOiCdR0lhRpaM/kfecRqGegjK7yFS5PBve1538e6JcRoyRFkKU82JqJ2U+Yd
 EnsFHcrs07uS34GCr5BiMqtcfXs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1705493713; x=1706098513; i=ps.report@gmx.net;
 bh=mqsBai8kWQN9dMv7LJyIJmvQef9DS0S5S69X/h7IYkQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=SBnNo1z2wpVMxHQPN7Y92zc64IEpd4vo4DeV6GZDR3AbS32nqkxnweaOmlNepv28
 0bnJFicBCfgb3iTuPlA0V5HcJqLXnWjFNRDyUGyoj3/734x4YvaeYFHUiWLAyg/FG
 5GrFNC9nKQaWIxhaKvNx6GDoEen/rPsjydDS1pT/ifBgbmQGRRCpIQOob4gdZZmEa
 CXSly7PX1vBpHLo/wo3HFlN317aw3Q78nYD7cXPl9yIZvCUT08Qlls2QovdU74KXt
 +3KS0sxuvs8G2D57sc2RfF58FGwCcSxq9KfH/vGzhwtXMUHjCyGzdIzpseT77zYAW
 zUDY0Mr7ne4HAJ+3Aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=SBnNo1z2
Subject: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.3
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- removed 0002-wscript-fix-build-without-stack-protector.patch
  (upstream applied, see [1])

- update license info according to upstream commit [2]
  (add Apache-2.0, Beerware, BSD-4-Clause and ISC, rename license
  file to end with '.txt' suffix)

See [3] for details.

[1] https://gitlab.com/NTPsec/ntpsec/-/commit/15862410de61d478a4b9aee5f5107889cfa9d125
[2] https://gitlab.com/NTPsec/ntpsec/-/commit/e29d66214116ae3679692e04982115863caa95b9
[3] https://gitlab.com/NTPsec/ntpsec/-/releases/NTPsec_1_2_3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .checkpackageignore                           |  1 -
 ...pt-fix-build-without-stack-protector.patch | 50 -------------------
 package/ntpsec/ntpsec.hash                    | 16 +++---
 package/ntpsec/ntpsec.mk                      | 26 +++++++---
 4 files changed, 29 insertions(+), 64 deletions(-)
 delete mode 100644 package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 914dd6fb63..55a55752a2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -922,7 +922,6 @@ package/ntp/0001-nano.patch Upstream
 package/ntp/0002-ntp-syscalls-fallback.patch Upstream
 package/ntp/S49ntp.in Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch Upstream
-package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch Upstream
 package/numactl/0001-link-with-latomic-if-needed-again.patch Upstream
 package/nuttcp/0001-susv3-legacy.patch Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch Upstream
diff --git a/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch b/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch
deleted file mode 100644
index f494bf479c..0000000000
--- a/package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0a3ce09c14eb9c7e36aa30a4dafe40e56676d678 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 24 Feb 2023 11:33:32 +0100
-Subject: [PATCH] wscript: fix build without stack-protector
-
--fstack-protector-all can depends on ssp library availability (e.g. on musl) so
-move the test from cc_test_flags to ld_hardening_flags, this will avoid the
-following build failure:
-
-Checking for library ssp                 : not found
-Checking for library ssp_nonshared       : not found
-Checking if C compiler supports -fstack-protector-all : yes
-
-[...]
-
-The configuration failed
-(complete log in /home/autobuild/autobuild/instance-2/output-1/build/ntpsec-1_2_2/build/config.log)
-
-Fixes:
- - http://autobuild.buildroot.org/results/f38abc6b7f8464836231192cfe078a5b27319a8a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ntpsec/ntpsec/pull/6]
----
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index be396b33b..f301809fc 100644
---- a/wscript
-+++ b/wscript
-@@ -298,7 +298,6 @@ def configure(ctx):
-         ctx.env.LDFLAGS += ["-lssp_nonshared"]
- 
-     cc_test_flags = [
--        ('f_stack_protector_all', '-fstack-protector-all'),
-         ('PIC', '-fPIC'),
-         ('PIE', '-pie -fPIE'),
-         # this quiets most of macOS warnings on -fpie
-@@ -332,6 +331,7 @@ def configure(ctx):
- 
-     # Check which linker flags are supported
-     ld_hardening_flags = [
-+        ('f_stack_protector_all', '-fstack-protector-all'),
-         ("z_now", "-Wl,-z,now"),     # no deferred symbol resolution
-     ]
- 
--- 
-2.39.1
-
diff --git a/package/ntpsec/ntpsec.hash b/package/ntpsec/ntpsec.hash
index 8d98b5c411..a3802c11ba 100644
--- a/package/ntpsec/ntpsec.hash
+++ b/package/ntpsec/ntpsec.hash
@@ -1,8 +1,12 @@
 # Locally calculated
-sha256  ef901df5a05d486563db22f4d0dad3840a3bf5d0a9aceb8c3ecaeb396c67a805  ntpsec-NTPsec_1_2_2a.tar.bz2
-sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2
-sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3
-sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0
-sha256  074415b57c6ba1780483d89e55f40dec3ded96c28aaf47d63c486683ba553e7c  LICENSES/MIT
-sha256  62fec6cd79721af81b7c12f1a679535235fdd22800ab17653042f024187ff274  LICENSES/NTP
+sha256  a9ec4416688a1c1c88833f3f6acc35518e3d63409af372eec010455002b33050  ntpsec-NTPsec_1_2_3.tar.bz2
+sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
+sha256  991d8a58e0b4be84a174a9bd333a8ca33807a0c1ce6d23a2e25a21f7ece482d0  LICENSES/Beerware.txt
+sha256  899261d6eb6c922cf8f051225411f27b738ba0014be18c2eaf6afbf30d421bb1  LICENSES/BSD-2-Clause.txt
+sha256  5fe38d8724c53ff4e69f0a3492a368b4a6719700ac16f706efeb01a45c62f2b5  LICENSES/BSD-3-Clause.txt
+sha256  c80d927f03db7212ba43a869a383e249c19b40859ff0d9e2e2f968e4fdcf005f  LICENSES/BSD-4-Clause.txt
+sha256  9ba9550ad48438d0836ddab3da480b3b69ffa0aac7b7878b5a0039e7ab429411  LICENSES/CC-BY-4.0.txt
+sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9  LICENSES/ISC.txt
+sha256  074415b57c6ba1780483d89e55f40dec3ded96c28aaf47d63c486683ba553e7c  LICENSES/MIT.txt
+sha256  62fec6cd79721af81b7c12f1a679535235fdd22800ab17653042f024187ff274  LICENSES/NTP.txt
 sha256  d3b21470adadd9abd9c6d675378f8c371ac5a4ea6dbec91859e02fadca3c0856  docs/copyright.adoc
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index f6262cdaca..661af78842 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -4,16 +4,28 @@
 #
 ################################################################################
 
-NTPSEC_VERSION = 1.2.2a
+NTPSEC_VERSION = 1.2.3
 NTPSEC_SOURCE = ntpsec-NTPsec_$(subst .,_,$(NTPSEC_VERSION)).tar.bz2
 NTPSEC_SITE = https://gitlab.com/NTPsec/ntpsec/-/archive/NTPsec_$(subst .,_,$(NTPSEC_VERSION))
-NTPSEC_LICENSE = BSD-2-Clause, NTP, BSD-3-Clause, MIT, CC-BY-4.0 (docs)
+NTPSEC_LICENSE = Apache-2.0, \
+	Beerware, \
+	BSD-2-Clause.txt, \
+	BSD-3-Clause.txt, \
+	BSD-4-Clause.txt, \
+	ISC.txt, \
+	MIT.txt, \
+	NTP.txt, \
+	CC-BY-4.0.txt (docs)
 NTPSEC_LICENSE_FILES = \
-	LICENSES/BSD-2 \
-	LICENSES/BSD-3 \
-	LICENSES/CC-BY-4.0 \
-	LICENSES/MIT \
-	LICENSES/NTP \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/Beerware.txt \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/BSD-4-Clause.txt \
+	LICENSES/ISC.txt \
+	LICENSES/MIT.txt \
+	LICENSES/NTP.txt \
+	LICENSES/CC-BY-4.0.txt \
 	docs/copyright.adoc
 
 NTPSEC_CPE_ID_VENDOR = ntpsec
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
