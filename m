Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41292EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E914C61336;
	Thu, 13 Jul 2023 07:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E914C61336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPyYDvRzIE48; Thu, 13 Jul 2023 07:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC1A6131A;
	Thu, 13 Jul 2023 07:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DC1A6131A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 393E31BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23A8961300
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23A8961300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABVMnlcyCTHN for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD44661293
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD44661293
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M7K3Y-1qKxuH3pgy-007kDI; Thu, 13 Jul 2023 09:38:58 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:52 +0200
Message-ID: <20230713073854.19510-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Pwr4aBxO3r7/DY3jow5VA9HHII6oc4rfWTk8tsp43pXE8GvI/bN
 /DutpeEmQPasinAHZJ4/dODurfrziGiYyi1OuDhb5ZBsyk6wLP3ufXvHV1O0OQWecvijwQp
 GYUFafeRJjjhMnDqiTqCtUxvITIhxp5qXsyughsynzsDg822IZmnat9xu+FkFXcA686ui3K
 VTvoo7a1hLOxyFx91dWgw==
UI-OutboundReport: notjunk:1;M01:P0:CDV4+CWKZL8=;k6ifyMxtWpncbwPD8Stoep91awJ
 8xNsVF34YRRu5bKhJe7p2g5crwnDfWVCKjxqLboKSDmtbZaMETgWW5sOuomh7ChHW9mRe/hjc
 s182DxHirM2CGUdY1xd3eiwz8bSmoloQdnMZXsfm9HohpZiSSE16RQNyO+/R4AlwC/L9Xpwrt
 qXi7mjbxr3xeoqc/jv3awHUFqLRYBYnTPGHnFZwgwS06WKqzc0e+vcJkmzGvjBLd5UEh4S1+m
 Dmsd1OfQZ/ETDjcBAnJKq105RmcG42w1A3ZDSrFb4Ys1Q6TxCZYF/qn5qjcDwR0S7NkjTUIGe
 T7ElfPHihpfQmCT2mztPRg36u5fKQLrwvkfCSq3nY9Ina9oNH7zBYBp+HVjsFgczpfQjmx5rH
 ezkLZWF8SI2H6FdMb8F4RSC9xC68TejjqKNrzyXk0q6xY9WgLkW6IeEItbZpMBYjL31KzF8oI
 vufUyaQSSVbkVe0jPyWsjc/6TkXZaNaXp6e5qsgCQUnqz8qUhq69a06CW8jYLyAmKXrOlqZHT
 vl5B6mkrIJY3z7GVdLEfMitiAsp5g5k2GvjBfCAeoMMUN9BKLd+rCCUIWhjqgQ9nvJg50jGmp
 nd4uInbO7nwXvTMwuXWcJll1xvbsAQnnjC5A0sHpi6qBn4fw4U0e08azWplbCEoSlV3r3g3aK
 0X7d7Oidn3KrQyy2X5zoCgT9LCsTI+o9+7XcfZGOrZk4TeFc8AOV0vTBLawMi4YeCk+P0KKIe
 JqM39fWsDMraKmSX3dxqfAHVdgPB1h/q/P2+OWvYJYqH+UxHPbnyUgeCLveDAWEL55EjO14UC
 PAcSZ8owiUJuZVI0Qmwbl0c6ZeSdRH7M/fD4Xg73/yW8Mbpi3W0vW1ikvHFtfKTwUtrFhpDmp
 fQtMzTKaCKxDmP6LmpanmuXGuunfbW7KzFHDuhM4urFm8mozKc2X3WFiNyMXvDXiA6qq0epEo
 YeAyO3NFSvBqQzcb2QP69rnFlUk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233938; x=1689838738; i=ps.report@gmx.net;
 bh=wGm2QX2BLdQRzEGVwQ2w/wrHuWLeOc60M6d/ltL1BQA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y5DVKo8MQk1iMZV+0xTmpZmijGKPs1LkI91bXyLkxdiN25T+nGOQJs16wPPSoJTR+DxPMZA
 sXwNEyaImANnT6UonhiiZ0GuPkcbk1TrtublzcvuDLiR0nfIEfNMoMoIFtft687M5UbDQx9yC
 qUvxR2IhPSd3jfgxTvGetkdL+DUKeUALEoOibKAcz/UUwDhylNbSucrRcy+ayt4cMgG6UESuO
 79U74wd3DuBjiHJH8D2RXCNyObuH4ylPCL57zZkqju7rMe+uJyJJyfAaUkZ0NhomixmjVzuVD
 Oz/JHVEXFdNN3b7ckOikpQ0a3gVomJWssHwstA0mX9yDdjjUpSXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Y5DVKo8M
Subject: [Buildroot] [PATCH v1 7/9] package/python-flask-babel: bump version
 to 3.1.0
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
 package/python-flask-babel/python-flask-babel.hash | 6 +++---
 package/python-flask-babel/python-flask-babel.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
index 484af86179..eae77ff51d 100644
--- a/package/python-flask-babel/python-flask-babel.hash
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -1,6 +1,6 @@
-# From: https://pypi.org/project/Flask-Babel/#copy-hash-modal-80f92a70-1c66-4cce-bb3d-8d6f98287e3f
-md5  50d5e92d96ef58787bf85b5a1b0a5567  Flask-Babel-2.0.0.tar.gz
-sha256  f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d  Flask-Babel-2.0.0.tar.gz
+# From: https://pypi.org/project/flask-babel/#copy-hash-modal-02f7b566-78ef-46b7-be0e-da35593e2dc2
+md5  ad0a1b69044dde430ad9319d3a2f7b47  flask_babel-3.1.0.tar.gz
+sha256  be015772c5d7f046f3b99c508dcf618636eb93d21b713b356db79f3e79f69f39  flask_babel-3.1.0.tar.gz
 
 # License files
 sha256  a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 35241e78db..34c9559d1c 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_BABEL_VERSION = 2.0.0
-PYTHON_FLASK_BABEL_SOURCE = Flask-Babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
-PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/d7/fe/655e6a5a99ceb815fe839f0698956a9d6c7d5bcc06ca1ee7c6eb6dac154b
+PYTHON_FLASK_BABEL_VERSION = 3.1.0
+PYTHON_FLASK_BABEL_SOURCE = flask_babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
+PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/35/83/f31a4ff688168f9c8a73d80ebfc785dcd7703474a0802b25a78d54edd07c
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
