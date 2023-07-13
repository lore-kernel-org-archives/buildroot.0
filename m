Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E8DC0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D0D661347;
	Thu, 13 Jul 2023 07:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0D661347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6lbSVCcYhQ8; Thu, 13 Jul 2023 07:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B356D61335;
	Thu, 13 Jul 2023 07:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B356D61335
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3901BF97F
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12590612FB
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12590612FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgScRHjeMLBz for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E7B612F0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0E7B612F0
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N6KUT-1pvHp20pHF-016gzF; Thu, 13 Jul 2023 09:38:57 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:50 +0200
Message-ID: <20230713073854.19510-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:AHFqiIpbeq0JUgwujcWEk0fYNwDRanMaQNa2mJvLSC41CwBSeRT
 vvOqTYnFDHjzownRFDYWxZqBR8G3wdP7pqQqb+pRQkBH/JbBcvHeO7uFTiI5Ov0ZKqbL5bD
 L0no5n/3NHumPpiQhtEki/wYMWIqJSZDei3fnJm8+HFxi7yML8y7pxEojWchEm6x918ys06
 Fjykm9Ydk+L8wrD2/YRAw==
UI-OutboundReport: notjunk:1;M01:P0:oltoMPELQkc=;ZLLV/XnFS33JGwQQmevIwnWMNWB
 EsPMNsAtmTfyj5EbeAdVwsHbth39LdBf/k6ReTcoi20fsJ2cvtBjWl/aVFWMBjrNjNjuMF0nJ
 B+6ehUiDxY+51Al2HnJtFxncdw30SBbo+bdcubm6sWxA/8dPPAz+3FQCv3W/0T+IImIEWkHf+
 zVnK9Mrz0hGWLeBzucLZpOQaFH/yWGf48bVBznzIIUTKzb/Ns6FPCbpct7n7AD1T/pW1vVXTm
 qV92HUhnwt3XY3sfCQxF2b/JXcKNvsvu33KUIEGIJV/+a7Tr5Apbdrqn25dtMnCG/GAFeKc6H
 N/hBL8vPBz9QDskBak/Mk1XWR4yHLuw0h8tD8P2QfilXYF1YW4PsTZCxvfA77geajZHTqqlfP
 1sa2d91WW3/0HNBnALPfjnWIJU34ITDq9PCcbaKpjaATthWM+9f/hjDj6IHnbHWkinOHiYM4J
 eMF3lhXM3q2th8V93itUjVoeicRBJ4mTyyrFkQGZp8djc2yTHRBPicGFrzKXzYSQbd2v0vhnP
 DiX3FXb/L7artbcwulNXLfKidCObT6oQ4v1LvSzhCvNqRm7+M44P4XVGoqNz76lwZUzm07EIB
 A170cZGauchF9w0Wl8aefnk+VqVsqjpsLAgHx/g0qIaFFZNXVZvxCKnN4nNNzUOS0xag9srMc
 NKTpFYpJYu3OBbCzqwqdFG6qdPkam1txQg7PJ5lsauFkqwT1rK1xX6z1j4OxQ2/MOCMveBAmX
 TIB4+yB4BwcFUuU5tPmmn10QdNczinabGUs2XbuyFXmnrf2yUQgz6cH0IgcnK3IHclnwM14GB
 E8n81NiDJT+td15Ui2GIqn/7rxHRcfTNzudJKuvOScwYJpr0XZbgQqwqW5vqhra0Xr8waRi7p
 aVpRfI7tpaTURiZOW57n2zpRaE28wlbHwC98sAibo2db1y2ITWKmxu9QDGTfKgE80sdsQqoy6
 av5gIbVH0YKa4PrEHrkjTqpaen8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233937; x=1689838737; i=ps.report@gmx.net;
 bh=1Ny/ZGaQe5zGK5Uy9ylqtLizwgoy1NlsU67L12Ighfk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iCBBys6Ab100/WKZpSgkxKsg3VbubMdWaCLL1crUG97/eQHrEFXzgD0ihBLYHOwOO+5CCAU
 GivdbxA6T6fY1UTrL2bBkNZH3gT/SD7Uvl3MR7QMbdNkqMydUYqP/nU4X6zB8xAfs9iQ9hfR8
 GeBlfOAq5TZbcTfrDIK+f7efy9lsT92kdXcXeGdGqFzr0ssI37kZOGSwMz9wQ6B9NVc4wZ9O6
 KaCkX1FskDuxZqMYugTSMZOfWTY//DDtnw6QVSgSl1s0UxIEfzohlFBQo6pkIP2Y33x7RDvgX
 9TxSHkLUz36ZdpEF255H/S9NACmjLk1fbx9wRZ8t2SSVF8q32dUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=iCBBys6A
Subject: [Buildroot] [PATCH v1 5/9] package/python-blinker: new package
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
Cc: Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in                          |  1 +
 package/python-blinker/Config.in           |  6 ++++++
 package/python-blinker/python-blinker.hash |  5 +++++
 package/python-blinker/python-blinker.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-blinker/Config.in
 create mode 100644 package/python-blinker/python-blinker.hash
 create mode 100644 package/python-blinker/python-blinker.mk

diff --git a/package/Config.in b/package/Config.in
index e6ed56a811..c8ed49d773 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -984,6 +984,7 @@ menu "External python modules"
 	source "package/python-bidict/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bleak/Config.in"
+	source "package/python-blinker/Config.in"
 	source "package/python-bluezero/Config.in"
 	source "package/python-boto3/Config.in"
 	source "package/python-botocore/Config.in"
diff --git a/package/python-blinker/Config.in b/package/python-blinker/Config.in
new file mode 100644
index 0000000000..3540ca7452
--- /dev/null
+++ b/package/python-blinker/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BLINKER
+	bool "python-blinker"
+	help
+	  Fast, simple object-to-object and broadcast signaling.
+
+	  https://blinker.readthedocs.io
diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
new file mode 100644
index 0000000000..28416d9fe2
--- /dev/null
+++ b/package/python-blinker/python-blinker.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/blinker/json
+md5  1c7375d100a67ba368d9cde0ab2d8cfa  blinker-1.6.2.tar.gz
+sha256  4afd3de66ef3a9f8067559fb7a1cbe555c17dcbe15971b05d1b625c3e7abe213  blinker-1.6.2.tar.gz
+# Locally computed sha256 checksums
+sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.rst
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
new file mode 100644
index 0000000000..6af0f811cb
--- /dev/null
+++ b/package/python-blinker/python-blinker.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-blinker
+#
+################################################################################
+
+PYTHON_BLINKER_VERSION = 1.6.2
+PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/e8/f9/a05287f3d5c54d20f51a235ace01f50620984bc7ca5ceee781dc645211c5
+PYTHON_BLINKER_SETUP_TYPE = setuptools
+PYTHON_BLINKER_LICENSE = MIT
+PYTHON_BLINKER_LICENSE_FILES = LICENSE.rst
+
+$(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
