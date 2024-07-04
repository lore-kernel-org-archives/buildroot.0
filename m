Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF4AC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A5D40C9B;
	Thu,  4 Jul 2024 12:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rpn9nbu4PFH0; Thu,  4 Jul 2024 12:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0ACF40B38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0ACF40B38;
	Thu,  4 Jul 2024 12:14:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC30F1BF2C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94E7C409FD
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szU9ELk__G_V for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:14:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32B2440510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B2440510
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32B2440510
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:14:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1sLjJ742Gt-016VDF; Thu, 04
 Jul 2024 14:14:11 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 14:13:50 +0200
Message-ID: <20240704121352.1915154-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704121352.1915154-1-fiona.klute@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZPzPi4l9Iw/BWlWpvH9E5G7ghIny9F/K+j7Js/CLNhq/WdtdnHg
 fqiwZk7gSNv06jfFZ81g+Mx9zxwkn6IKpUTB0zWW7l6nRNmuwuZwlFP2DNy6pxbDlHzLZfN
 9vUyOOrgSQKnHV1tFoGSCNH3Vf4g42KvRms2JLXmk/vax1jVlbTm11uaWR3sg0aWrwpd0EW
 TFV+UE6uuLF9YsZju91YA==
UI-OutboundReport: notjunk:1;M01:P0:OCgA2ydyg0k=;wEdsbM/OOFuBe7+eW0qvZucKeAS
 hnHuos9819/fPmjAJ1dbEWA2NyJB9XJgC7wyHs8d5zECXJ3+qxqx8g2FszV6fI659MwzEm73e
 2sLnQO5745QhsMTYA+nXE5DawjkNMCsLeKbtYI064H9zDYr4LBVZfYWGbGcN1z+nuG3I7JS2X
 zRIDlayfYcptJ7JW0jQIbxy1XfjIMGuyDgRYyOf2XWSvHeriWbPXg/dbHEy40hH7MPcvu2lYJ
 DJBcN86aOBVSdzNQzYOnEIkZg/JcReMEYs+h8trqOzFrPL0lY6JSnkDKDKvSyFcJxl3n/vVWf
 Fa7TDnDBHAnccZnl8bEYS9R8Gp7UITMep4Wt1Y8iKqZoxbYYq8V2tNrsko9ErSC5RG0oiw6Fk
 M5ZwZQanFJ7uhPepcCkozVpVPrxgO/intXZS8dVIEiFQLBZlBscUd++6+QYHQXr5Dh4veOm5f
 Ml2jH1POoXM2ZV9h5CKNkp3892pIfX4CugW8r/bvWfto7kjIXNoIziszoT2DNVMFE+JNa4MZu
 XLPFoyV4stV2nQzBFuTTp2EymLnsg0SoTd03sRBvWLuXPyv8J6VSZmpPV26p0rtSMrI8rv750
 J+8dAJ0kchou55PtxBVbzdDPNHJ5JrMqbDcniYiIscnmHTZB0PXCynvI35bBIq1ybktMI7lh2
 plXMjC7G7/pNd+3xmFFLZg2f05qMZHdWa6A/u+B0HRjnU5Dxhna0u9EgfcLPt7zu8iLmqhN9y
 dc2g5kz9n7fXsIeF4EYOk0Y7T4N2KDz7BDDXYFppSaG84xdfQIwn5b8mjzrM/R6qhqHF5vI7q
 k29xWmtfTJMnMTef7p4fsEZ4oGuPfWc9AOo1eupfnPXQU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720095251; x=1720700051; i=fiona.klute@gmx.de;
 bh=lT3+1rVRArJdVWpq+UumujM2isiYZJxZmBNM/fhSmJ0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=L3OqOl2CvV6/4+h+IrJ/lB2NDqk/tVuqsJh92NWAvUvgJJGiGob07xzg1QSmUmZ/
 KdPoeUJGXhq3ofEB9F9KjveE06uL8Zb39uqoecemViv15SsTGL3M7GjfI7wsJiDvk
 tRBbjH7PbyrVGhay6+/EsQNBPtDKbeoRfCBvLcWKqtqVCXNL3IAQPkY0sfcVFXqVo
 Rl5VyK/xu7eD/de05A351DNqWSgNgY45EBop1vI2IhZbi5DV9k6+dPoSqDIELotjf
 MMAwgX+ksm9HefUtpDs61MbG4qeOlnxi8HHH/EiOP31jXPSZe3ZPNhSBxz0lsNJTB
 GEolRsQ1guFcxAhL1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=L3OqOl2C
Subject: [Buildroot] [PATCH v2 2/4] package/python-pyasynchat: new package
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
