Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1324CDD1D3
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 18:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E34084EBC;
	Fri, 27 Sep 2024 18:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BF73Co1Qo7Se; Fri, 27 Sep 2024 18:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905C484EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905C484EC4;
	Fri, 27 Sep 2024 18:34:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A03F61BF376
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B7B042541
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzFPvHeIUS6R for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 18:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C5C224253B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5C224253B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5C224253B
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 18:34:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.6.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvL5-1sSvtm0UGD-00WwqZ; Fri, 27
 Sep 2024 20:34:11 +0200
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 20:33:59 +0200
Message-ID: <20240927183400.339491-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927183400.339491-1-fiona.klute@gmx.de>
References: <20240927183400.339491-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CCwI+i4qq7v3TUXYL/+XSLv1iwlRgMsTsVe6cWDDnFD8ZImnIfV
 xtPPVQLLIggStB5myWR5HqymNH+Ym32UrgE5hAbsJHDcEHGZd7/PROmSYSlpSBHVoQbGXFO
 SJ4UCF4hBCbvZIglzAhX/5avyVnI+vdU8kD66P+pTl4xbcewfcl1/4ZL+vSmSlfsOTwvfn/
 y26iev3+8O2bsgepEoi3g==
UI-OutboundReport: notjunk:1;M01:P0:YbwvnNK5/JU=;kZolmdeIBVbqDHFE0235liXoi2+
 ScYfFNGPMm8jbAbKmig2ShUj4a4yoCXgUGJJUhgvCnVD1UT3CigW1qx3jIlAaU76SR4s5Ar3t
 2rqAOe0pYepECIVOr6tRD/sXo9/sDBthSw3jUPx6n2fjK1WrdhJG7OQBlsJF0ZVN2XYVhvbe5
 hPv9Vi++0vlv8ipflUKb0uMiUMSujpt//tZrMG5bJavLDzaYMvxvk94CThuM/YZew6MI4CvVm
 Q16XA1hARr4G2kTX9wpf6j5hRymWAiZ+wANF3HfFHzLIBQ9wEUz3O4XLp2LffYdVV/BSRURNT
 puoy2bV/Ti83Dvt0Q7T9u4f52A/ft6K6YCIaSChbrTPgpve/O1PSBTK/jW7BzRoZbw9edWmeM
 KBdHeE2+ydHxI50+QRkXKorrWvO+pOm2DNvdnMzMpO0FL25iMAG33llXSE+GZSAN0oy61t495
 iyl/luOAuvYsM6GLw+m+QtGHC2+scAF7KKsC/Cj8t50Uaw+hqgkVWIMvUnzygKHhyJtRhGDj8
 JZtH+SD4pfPY+iJpv+VCXG01CDHmW93juC5FrdhnKNDIqs2vMnvYX4i32idXoxWg/u/yyerfw
 yNg8aGr81e0hos5PQLD2++pG9GmWsi23JpE786owl7exhvhSur1QWZVk9om4xRUoGtYBDoyoc
 3eMbesZH0V9qWIMu1CxUoau4CITu1LJckxdIbhmVDYKUgr6qhnSH+7njscMOCvrp2jPTOyBhZ
 s0rfcaRpqCdZPSCpwkHwQC08tO3Z9bYdTZr6+wIzGW1j4c/H8lAwgeHU2TQ7So8Cl6HMDADoS
 0evzTxhmzSkTy7j4qZ6tbaiQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727462051; x=1728066851; i=fiona.klute@gmx.de;
 bh=2/3E168Pj3JPAGUQb1uXnTfQju+nwcHJFbdw30XihU0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LaWhCx0oPBrPcN+Odfyd62F19VDu4/tQJoW/LzkyU/Ad70L1ZjS47/gJn5d7mDGf
 t6cx2a3TV9Qbt5OWNid/HROrxjbwqTnd9Cc9qc66MWkgv9kjI5WbGOOJsg+7aZUNA
 EAqzTIJJNCVFLRkL1cZFxMCRFq8N+EvhVjEoM/X/mDwIKmWRZBvlj80XThKHvhsZM
 0JhcfuoTTV95I98zH0tJtRY7jEL40o76k9YR2b+rqjREMblV8NdoyWryptQ3rWyNa
 4tea7RkDM0BVQ+11sp/OhkN0g5R3HuVvzJ2SM0A+1ZgeHcp60Nt//WfdcAP3Tb3pV
 4DP+AZWsLzLRR3rkkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LaWhCx0o
Subject: [Buildroot] [PATCH 3/4] package/python-poetry-dynamic-versioning:
 new host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Build dependency of aiomqtt (Python package).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 DEVELOPERS                                     |  1 +
 .../python-poetry-dynamic-versioning.hash      |  5 +++++
 .../python-poetry-dynamic-versioning.mk        | 18 ++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
 create mode 100644 package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5371a7a59e..248be00cda 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1112,6 +1112,7 @@ F:	package/python-pymodbus/

 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/python-dunamai/
+F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/test_nftables.py
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
new file mode 100644
index 0000000000..abe063096d
--- /dev/null
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-dynamic-versioning/json
+md5  91032d27f9da010d8a9b7e76bfd09d24  poetry_dynamic_versioning-1.4.1.tar.gz
+sha256  21584d21ca405aa7d83d23d38372e3c11da664a8742995bdd517577e8676d0e1  poetry_dynamic_versioning-1.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
new file mode 100644
index 0000000000..c49e4e9e7a
--- /dev/null
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-poetry-dynamic-versioning
+#
+################################################################################
+
+PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.4.1
+PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
+PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://github.com/mtkennerly/poetry-dynamic-versioning/releases/download/v$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION)
+PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = pep517
+PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
+PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
+HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = host-python-poetry-core \
+	host-python-dunamai \
+	host-python-jinja2 \
+	host-python-tomlkit
+
+$(eval $(host-python-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
