Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAC5C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71374404F7;
	Tue,  9 Jul 2024 10:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLRSzgw0pBkI; Tue,  9 Jul 2024 10:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B536406BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B536406BE;
	Tue,  9 Jul 2024 10:19:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 844581BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CFB280C19
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xsfQXn3sE1d for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAC3F80BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC3F80BF8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAC3F80BF8
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:18:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.252]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5mGH-1sL3BT2lHn-00rIQi; Tue, 09
 Jul 2024 12:18:56 +0200
To: buildroot@buildroot.org
Date: Tue,  9 Jul 2024 12:18:38 +0200
Message-ID: <20240709101841.1145134-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709101841.1145134-1-fiona.klute@gmx.de>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:l+yy/z1C+HBSUIIdOx8K5vGyEC3ACBTQediOd/5G8ghn/65cOUD
 xQnS4woKuMPHHQideeCdc1CooeVSVlOct0LjxmvH1TG1E4cq3chibv//U96pkjeT7YJ6Fi8
 XORunPfB+wgXS9kjyedjABAuS2A+Xc7G815ODJPCNNCri9fXjwaHhyE372xCD24nPgoxLbT
 yMblpwDjPX/HbkabmASpA==
UI-OutboundReport: notjunk:1;M01:P0:xaHmXu1TuwU=;gZ5vwxICVdFuEqKJPtvZKvzLCd0
 H1pbjieQbyaz5CxgmF0J5KIFgadK3SVRQW8xD6thatk/kiTgadH4yPscjq1UHwVi6RjUIhBCq
 xcoLAgkiazAYJVFOhQkpsh2y8Zk4HtWIqrfAS/rhLDwf/M94RdVZoExuWTuR3BYrECT1MmrYZ
 t9dhfXeuUoNiATPMEL6aY6ooJ8hy/HAJ8PxGjdRKa2Ki3fCLujSDuibFV7TyVto0AUzA2g5f/
 vwJaJA58Ht7eqQa3kmGNl4pdbpEpZ9TMjcr5vCrlhVcKgrhw11QHttkkL+3wbyxkKR0ppzbNa
 j/b//jjax2cd81Q05Z1X2ZOZnjBSgi+fS0z0KdP6ORE/ckA/hkVsASX05kvNVsZtRi/68UYDh
 Ku9DKpzHVeyy8NWnwnhKxeEF3k21FxP1viLsOB8u22f2XgVR/AgIZjkwLMZHAG0gh6IJ/MHlh
 L0nWSFPaa5nt6XGsyAQXFmQfzNPkGdSK+N6jBjQK1Q1qxeBqDsUqPj8hWSkg6Ma7KSaZWhCM3
 fQPMZ9KV6Z3DPU43xwVO5u4RzHXHEarP7eZhG2BLB/uW1oEVjFqsJvhkTlBh9SnngrVWDFbaK
 KYgqOBQ5MbDi4RD7jPLlqF5yxFnUBgfmkG03GgmT5EEOmCrUiw+EhkvdeRRoNwlSLTURs8mzZ
 MDxwQ6s8HUfcGslBEdauDQpFfnLI+hIZw0DHu4q/wcTN1Lh3bdkhWrSLRM3B3BGcPInhYg/ZF
 YC0Xu0jdhWhZVe/b7lTtE+43yLrPGsp5r6AD54NnjdKel3NNVlrIxHHICdJb3oGIrpgv7JwYq
 dhUtTwg9+SsmiZXbAuioDUPIgncV1QFyILGqDtuPA/9jw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720520336; x=1721125136; i=fiona.klute@gmx.de;
 bh=qDY5kQeqR+oRatjYod35LWHjI4pdV7QnsXPRT6WWTMs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=piGXepgWCHtgS7ZwIjWoWskV4+u2Bl7L4w9qmkNOIrkQ9Rz5ldkaQjn9zYZCdMVd
 jKtzaX3I2zuwqpEjyCVVUjF1+lWBzeF48ccOGIc9baAtj5tBMcq7EXinHKlZV2Klc
 b68vU2y1392GzXKP+VbfrfRB9FniWIyWPjMLJK9Wf2KFARPDyOofMhDFiTzZjsFav
 R/Q1F4S6tVTRUCFR176VUMbhgtJHir0RD6maGWgFl8qKVvGvb3OX59EBgaRaKg09v
 FKxi6+6rJbm13esR0Kr+/SnzBI/W6GWXZIHkmnqEzaEgXlavTsBlJIxL7aLrKneMj
 Rt1wsVOR0TgFgPpkpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=piGXepgW
Subject: [Buildroot] [PATCH v3 1/4] package/python-pyasyncore: new package
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

pyasyncore is a compatibility package that provides the asyncore
module removed from the standard library in Python 3.12. It is needed
to support fail2ban without a bundled copy and should be removed as
soon as nothing in Buildroot depends on it.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/Config.in                                |  1 +
 package/python-pyasyncore/Config.in              | 10 ++++++++++
 package/python-pyasyncore/python-pyasyncore.hash |  5 +++++
 package/python-pyasyncore/python-pyasyncore.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-pyasyncore/Config.in
 create mode 100644 package/python-pyasyncore/python-pyasyncore.hash
 create mode 100644 package/python-pyasyncore/python-pyasyncore.mk

diff --git a/package/Config.in b/package/Config.in
index 48ef1a6fdc..38ebf13dbf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1253,6 +1253,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pyasyncore/Config.in"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
diff --git a/package/python-pyasyncore/Config.in b/package/python-pyasyncore/Config.in
new file mode 100644
index 0000000000..ad1376a243
--- /dev/null
+++ b/package/python-pyasyncore/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PYASYNCORE
+	bool "python-pyasyncore"
+	help
+	  Make asyncore available for Python 3.12 onwards.
+
+	  This is a compatibility package using the code removed from
+	  the standard libary, upstream does not intend any
+	  maintenance.
+
+	  https://github.com/simonrob/pyasyncore
diff --git a/package/python-pyasyncore/python-pyasyncore.hash b/package/python-pyasyncore/python-pyasyncore.hash
new file mode 100644
index 0000000000..ee4665fe5e
--- /dev/null
+++ b/package/python-pyasyncore/python-pyasyncore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyasyncore/json
+md5  f97e2b69f1fa11470867b395c2fabf84  pyasyncore-1.0.4.tar.gz
+sha256  2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6  pyasyncore-1.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
new file mode 100644
index 0000000000..9d08d493c4
--- /dev/null
+++ b/package/python-pyasyncore/python-pyasyncore.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyasyncore
+#
+################################################################################
+
+PYTHON_PYASYNCORE_VERSION = 1.0.4
+PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
+PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
+PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
+PYTHON_PYASYNCORE_LICENSE = Python Software Foundation License
+PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
