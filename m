Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCA1C3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 10:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085AD409F4;
	Tue,  9 Jul 2024 10:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XHw9s09Jhazc; Tue,  9 Jul 2024 10:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A611406D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A611406D5;
	Tue,  9 Jul 2024 10:19:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B486D1BF298
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D8F1404F7
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 10:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id po9zkgkvnYcV for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 10:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA29F40226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA29F40226
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA29F40226
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 10:18:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.252]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72oH-1sSVNW0EG7-00AETE; Tue, 09
 Jul 2024 12:18:57 +0200
To: buildroot@buildroot.org
Date: Tue,  9 Jul 2024 12:18:39 +0200
Message-ID: <20240709101841.1145134-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709101841.1145134-1-fiona.klute@gmx.de>
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:g1/+JzCp5ZvNOLC98jXcgqJxb/D++l5yGnfLHHiPAeTwitfraVR
 VfJQr9nsPRICHf3JsZEgbKYLYduIUgriml9dsFCq4Da2RjaATnv2YbHVD6hnRG3K9egTGcz
 qf+GtzvrHcn9arkf+/SWxblEzuSBUHLGzEQsD/pu+XEJ2fZlj7fU8mq4ITG9U2RhzOgMfTe
 7l+R/lou+Yj334yzzPhcQ==
UI-OutboundReport: notjunk:1;M01:P0:ZX8R7xpTIQM=;zQNglR8DO0iat+V3M4e0an44WvL
 l8AweaMHaq2N7vs6O6z61+3w4bUPcsGS/hRVnX3CZPY2Msg9RekTbbCH+eOWB/WujpyBNamRt
 b98pxq4PzVnUGllOFHo9iL4U29gav8zpQozkmMYFHkcaaP54uQ033QdnwYLNQZD7p/bFzofnk
 MgT1YqnVdlBkeIWqM1VoNJzACnF+q0c5Hj7y6N/r/TlCySQAUEBC3B0FbLePNc7L+zv1cur3J
 HflIQAbKL5zTSuiVV9HAJ5T01WCUcmOyZowOtbEwjCBrQA/ezN13Jr0qg1FXlyh0uKaA8xm9f
 6pXl0w2o268cYSO/8WC5wxeYlny+w1/qcD2vUSNEg6IwIZQftnGXd7ZsoIR7ECb4GdTf1Xuqg
 HLnEuX+kdp0RWZqe7h5M+JPxj/7C5AkMPwUhp0eB2fUOGGVHv4OW4XR3OyKlaICaVDRQWKFrM
 gEewZ2YgmfCbhiu099nTqL76T/UGxSxn0Tx4RpD9tcc+nqqVDVm98A95Spy5fxbS79+dWoehP
 MefNhvpUO6DdG+0VR5+7Ba5p2Rxpkynw88kUWxvy9FflyFL08rslBkZwbGtfo5sPRSvnbO9rU
 TluC6c/mJXRP4Djc05eTBHyFduQz+gctLveAlEXPHWSjaAiHocYBZvlniql1pO5jJnEBzS7qH
 fNpSXKUR9L9S5SbamAADit0NdPtX8KNukKqrHZBMk1sACjg8fXq5v7FkC6cVz2/1kEjC64Xyf
 /SWwpo2mfu0wHO0DU4OYjaeQSCtkxDmYKVeP1y4BtcxkI6o6FsJg1yMSCMqgDoGT23s9sxgnU
 mHhc78MbodQAtFHbSdo5H42CSVka80gqJpVFenyCjRI4Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720520337; x=1721125137; i=fiona.klute@gmx.de;
 bh=lT3+1rVRArJdVWpq+UumujM2isiYZJxZmBNM/fhSmJ0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ljcLQ84kcSR/rGbNKW6gvXckKNdV65AMKVR++tNq/xwyknd0c21eVcudpE+0nusB
 rxAPj8KNIsz5WHgj9BUB+bmD1kvHVlrXakye96xYhvkgw2774RCdpiXCVU8LnQKlP
 5g03Q3DvZZ6iB5Veh02a1uCKxlmjYsgccVh0fSFZTTP2yt1Rtu+6i5UCw1g9cSJKV
 m40BRkuhYn0jWi64ZxAxRWcS5epaoengA7IR8FvFYJ/MIUQLT7EvtjUQcr3AFktOK
 bbAcBuRFfkSyUxrXrL7cf1C3uDwgstBTztdwm/2skCO5LOmMpcnKV6EsrMRbD9XWG
 igDvppqVtIqsauYlTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ljcLQ84k
Subject: [Buildroot] [PATCH v3 2/4] package/python-pyasynchat: new package
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

pyasynchat is a compatibility package that provides the asynchat
module removed from the standard library in Python 3.12. It is needed
to support fail2ban without a bundled copy and should be removed as
soon as nothing in Buildroot depends on it.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
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
index 38ebf13dbf..faf8dd7d7e 100644
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
