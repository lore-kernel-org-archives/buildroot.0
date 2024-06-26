Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B4FC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E7468206D;
	Wed, 26 Jun 2024 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTMi5JfB7qeo; Wed, 26 Jun 2024 17:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A2B82096
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A2B82096;
	Wed, 26 Jun 2024 17:19:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 353861BF855
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CD8041A01
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 17:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cefA8xUvFJs for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 17:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8373F4051E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8373F4051E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8373F4051E
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 17:19:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.117.148]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQEx-1siQeY1zNv-00bjb6; Wed, 26
 Jun 2024 19:19:41 +0200
To: buildroot@buildroot.org
Date: Wed, 26 Jun 2024 19:19:21 +0200
Message-ID: <20240626171922.718270-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626171922.718270-1-fiona.klute@gmx.de>
References: <20240626171922.718270-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:h50vP95deH2DGif5UY1ULZvmX161qSPivVk+fywL+fWRk4k7FDb
 vdQpklTG5OFftdWhikclVxMLDI1mclbcZ2G7pYk4HdEWhWRtxdEmwLQCIb6RXMHxWIHGqpx
 d9o+5EGqKGkdHCq7DL3ozzCE6DgOR8bq0YH7RW0amb7accKleXInU1VEX3IURrUIptYBVb0
 9Pge0vL28RJeLJaBG0DSg==
UI-OutboundReport: notjunk:1;M01:P0:Kx8bQt+/hYg=;fRKf8IaskJvgCrF9EGk6PinHJBB
 zjiPXlwr9GXTdHsuHwThcyWZbNHGbFLccJO5VfliF6WawCfPrIjYvITPN1vpU/MDNtLUED7Qs
 O3QDClGOIXVj8yUK+8Sg+Eo+dURB7bwT+qLq9GYoC5R9qWyLCErO/apnZ/iDKs/A12E7iBsGt
 AM1OmiOsJuilMAV1H2uFgdJDMe8bzd4r0eYzg+3cXtDiF9A0QED9zT1KU3FHRXOEwAEsVmcVQ
 DPvb+TOoJs4/ztm3r1m4e4ycpgvnGLwGUWBcwhdmxY6MXRyar9I2x7bxSvyEYAQam0RRdyQMR
 J8VLPI/9TGKkj1SedgjCkB2vD28kGpqTXlf5ts76xQfBgKSeKDz8cE/tfdPJYfFIgDUJhHEAx
 kPLDPzxx4F9LHvALdWb6JyXwuMYEtShmoG2tIN29LpWuaO5456RDUcE+jAXcXxKOPmMdp3WCz
 zJv7mtRvkyKOZRu4SIdOIFHHkDyI90OrCae3Tn/ldx0dRYSpvFtM+KNZEWEdjcRYIM74t/+rY
 p6IAc2oZJusdGYcMgVKjGGdRmo1XUatmXQhfupb2I3tY75xFL848KTtTUelk7oI34i16p8Rx5
 s6sLrVU+cB8R4JDrWbwiEdT+O0EPm3imjhkK05TJVIkknfd1HD3PWanL7FOIW1yiAW9Y2xi4C
 wiyLp7PQVLWXrDphtAA5RUeL3ET5Fp3s5IZr9qgEluyUOZdeFdNrtSjSnhDZ9SoJEwVSaQOcu
 g2srSWh0NDRIxuPnwbzSQPk2aARb0pNTM3JeiMnW4in5zFpzTG59a831utCgERUOMKKyOAmpC
 l062Ex+zNXmPjzMVgeBtm8F9Koeqj4uhalLVbC4uvbdcc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719422381; x=1720027181; i=fiona.klute@gmx.de;
 bh=QQ3cQsB/O1phtFae1w89/JA37PO+RA+kLABo0U3+icg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=G62pG5MGwKgSXd91bH29w6quZSM4QbCRBKC1ydUYwkuPpry8GxFTSwfVeXHDJdDX
 4gZ4iKC/9PqT+Hplmsp4S3QG9DLHZ0JSvvHiBikvRQIrc8IJBI7HbW6X3kzYLT0Gv
 YHjzeWVgp1hbyG5Jj350TRsvzdc6REgJmG4xuwrfugCH5dJ6O7w2vLvqa9JoPuuGM
 GtBZ43eY4hppHMmUvx+kLLbW5BBthg8uDOLFKlvQdba0J+bSKDgRSul2ZqvQnoi29
 vyi2W+N1idYURfSuizOZdEv4gaksoca7RD/h/vMrpNC2cRFDmQnYNN4MzO7a/rR34
 jFnmdPanjiB2MNz45w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=G62pG5MG
Subject: [Buildroot] [PATCH 2/3] package/python-pyasynchat: new package
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pyasynchat is a compatibility package that provides the asynchat
module removed from the standard library in Python 3.12. It is needed
to support fail2ban without a bundled copy and should be removed as
soon as nothing in Buildroot depends on it.

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
---
 package/Config.in                                |  1 +
 package/python-pyasynchat/Config.in              | 11 +++++++++++
 package/python-pyasynchat/python-pyasynchat.hash |  5 +++++
 package/python-pyasynchat/python-pyasynchat.mk   | 15 +++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-pyasynchat/Config.in
 create mode 100644 package/python-pyasynchat/python-pyasynchat.hash
 create mode 100644 package/python-pyasynchat/python-pyasynchat.mk

diff --git a/package/Config.in b/package/Config.in
index 5277394499..a4cd741480 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1253,6 +1253,7 @@ menu "External python modules"
 	source "package/python-pyalsa/Config.in"
 	source "package/python-pyasn1/Config.in"
 	source "package/python-pyasn1-modules/Config.in"
+	source "package/python-pyasynchat/Config.in"
 	source "package/python-pyasyncore/Config.in"
 	source "package/python-pybind/Config.in"
 	source "package/python-pycairo/Config.in"
diff --git a/package/python-pyasynchat/Config.in b/package/python-pyasynchat/Config.in
new file mode 100644
index 0000000000..bf11cc5b39
--- /dev/null
+++ b/package/python-pyasynchat/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYASYNCHAT
+	bool "python-pyasynchat"
+	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime
+	help
+	  Make asynchat available for Python 3.12 onwards.
+
+	  This is a compatibility package using the code removed from
+	  the standard libary, upstream does not intend any
+	  maintenance.
+
+	  https://github.com/simonrob/pyasynchat
diff --git a/package/python-pyasynchat/python-pyasynchat.hash b/package/python-pyasynchat/python-pyasynchat.hash
new file mode 100644
index 0000000000..232f936bcc
--- /dev/null
+++ b/package/python-pyasynchat/python-pyasynchat.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyasynchat/json
+md5  9fa7e3822f689b1236ca59c5f1b71415  pyasynchat-1.0.4.tar.gz
+sha256  3f5333df649e46c56d48c57e6a4b7163fd07f626bfd884e22ef373ab3c3a4670  pyasynchat-1.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
new file mode 100644
index 0000000000..8bd87af5c4
--- /dev/null
+++ b/package/python-pyasynchat/python-pyasynchat.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyasynchat
+#
+################################################################################
+
+PYTHON_PYASYNCHAT_VERSION = 1.0.4
+PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
+PYTHON_PYASYNCHAT_SITE = https://github.com/simonrob/pyasynchat/releases/download/v$(PYTHON_PYASYNCHAT_VERSION)
+PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
+PYTHON_PYASYNCHAT_LICENSE = Python Software Foundation License
+PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
+PYTHON_PYASYNCHAT_DEPENDENCIES = python-pyasyncore
+
+$(eval $(python-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
