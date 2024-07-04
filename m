Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A77C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 12:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D14BD4050D;
	Thu,  4 Jul 2024 12:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xf3_b2BPXi6Q; Thu,  4 Jul 2024 12:14:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D498405F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D498405F7;
	Thu,  4 Jul 2024 12:14:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADF651BF2C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AFD2404CD
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 12:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0XuT8BCfQrM for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 12:14:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6DD040242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6DD040242
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6DD040242
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 12:14:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.251]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mz9Yv-1sBmba1K6N-00wcnN; Thu, 04
 Jul 2024 14:14:09 +0200
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 14:13:49 +0200
Message-ID: <20240704121352.1915154-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704121352.1915154-1-fiona.klute@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oYpA0fgh1uET00B1WIT+f1cqRN1/L32YxA+bCXMFwyPSD/qa153
 Jl03qAnEMIqmnXff2l1YYq8dmZkq+c/F/tUlMs3S7FANeQe2RbiU9zFLEKt8kdCxmD74apl
 4SSWGQVvXpHNA/xTNtTDFk0SylSsSd6w6zgIonOeagKw5ksZ7fScQ0kGSznoXGkOhIKVf6y
 TheGHlqFb/3v2hByUHPAQ==
UI-OutboundReport: notjunk:1;M01:P0:lruGTwnHxNQ=;qfU/USGj57DaFbxLl8lIGSSp9pm
 eLKbUtyf8pkq/8YQmhI8IxSeZkpJ/1Nj+8ltQtrPbVNi3NHdS5SXb5loBt/+R6j3qVNkCAub+
 2V43YgbckgEUQfyN8uZRM3nibknsRm6g0ljwGnaCU5tc1JRWkbuDcWlSRhKvhw2A+4nsTdJq2
 MvmDqvZ6n3yBGELPCngkt9YGVjrFDv9NXdeTf8lSeK4OQxOKNmPdn+t/zaUeGyL4vRep04oKh
 Lqtq+5/31CEi8bWwfCZdWEWQSJqsiR0FoInv7EE8ncwRxM2/oP+/NU7drL7zvZFZ+rBAhAq0Z
 grANBlNoX+WNZBAwTT3zm3+59DbddRYxXJArTCY79/8lc9/+E0/5qdMO6ezxK+GpVCoXtblwA
 0g7H6Pi7LufONMcvx80pa/HmACF7RwigkT3DzeBWVPZByO4yxR99rr4NDumys8/h5s+7ELxqQ
 7yZ9h93ZXzqZeDUJ4Rn4KA5QDcvfrj1KHiedz3rsajyJ5Z7pRpLwkvS29kFs2gVwWzCIhhgWd
 hfmW4xfjTSlbktnSgmO3EA3VmFoPLcuK+U74gP57uVe0cz+gq446aEavX0fmibKlp/6wlGNBv
 FEFHuWi2mERwZs0mG/iBIB6wVEDXmQQYajH4FZoVQVf57tNrgAFqu8UuNg7ykXC/RlW+Mi3FL
 hdm+UYNAhpKICkjlGV1xcpCQXu4TUTFdMqrLwBfD+Ix2CUbTmP1hC4WJB3A+SjPvFSGHjxUS8
 r4Mr9sLbJ4qEVFtlVeWFN5dh7e64022ysDpQzKJgGWj/sS6ftIBDGuCac1WDJtWDj8cnqpxV2
 z8JFIhzYbdyqDEgobSrJ84ebUhPfEyblWWRXi7vHz58ZA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720095249; x=1720700049; i=fiona.klute@gmx.de;
 bh=qDY5kQeqR+oRatjYod35LWHjI4pdV7QnsXPRT6WWTMs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kPb+1lchhp2aCFJWQQThw9XAKdgQuNipKJTCe+oAT6geKp7ds/t0wtd1Dd0jkp+n
 6+EUJma/xY6jw7HVVHThhDg9xrUvGPOzJH07EfJGDegUKHuhfG0hcZEwDdcJIGl+F
 BYneG8JAPkHwgCBQzXIvjNA38/X8kRj1EyeDLwjHWq3klJzsC8U4mkq3Xbu/em9+X
 cOe2PdGVEeCVqcSVqZqakvSBWRwNR/wisz+dzMwbbyVI1NPsbI2myIge4iYT+ndIn
 HGxNCoe5qim5H8Ic47jbE8gToK1qYJpVnuh+ja/JUZneHJMUZ7DKzU/RMBNRGOXZk
 1Px1LBqdidNRMBJGzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=kPb+1lch
Subject: [Buildroot] [PATCH v2 1/4] package/python-pyasyncore: new package
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
