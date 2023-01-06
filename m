Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0F9C54EBD
	for <buildroot@archiver.kernel.org>; Fri,  6 Jan 2023 21:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B63341028;
	Fri,  6 Jan 2023 21:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B63341028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GV73wUzaGsph; Fri,  6 Jan 2023 21:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD8A040399;
	Fri,  6 Jan 2023 21:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD8A040399
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC211BF973
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA79940022
 for <buildroot@lists.busybox.net>; Fri,  6 Jan 2023 21:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA79940022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAF3ApCi2SAG for <buildroot@lists.busybox.net>;
 Fri,  6 Jan 2023 21:08:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F85F40253
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F85F40253
 for <buildroot@buildroot.org>; Fri,  6 Jan 2023 21:08:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.160]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N6sn1-1oinaM0DiZ-018H7z; Fri, 06 Jan 2023 22:08:29 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 22:08:27 +0100
Message-Id: <20230106210827.30007-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106210827.30007-1-ps.report@gmx.net>
References: <20230106210827.30007-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:d9NqU3xhTWtQXsHzWLMqcvD4gObKSPT/76dSX/eGWtowBITdDcg
 ZnPGZ3ywxT7e8jz7yfuEw1uZCBPH3hpfYbgqaEFKKvdcycV7jGSlGypNDEKn4bYvOG7a95W
 QohCgWiofdvgMqDUPaVg0TmEaDbJOLqjhzxwaFjojiO97KuSHGXFEJaeNkw71narRc4A1Ws
 0T1AxcnqaHIvZD4bDHueg==
UI-OutboundReport: notjunk:1;M01:P0:IRWeuP63fk0=;MeDycDt0KWDZoz+DaNZrZwiw/xb
 PpqLOP9Z/LF5vltadArpqN6GtvncODzPgAEjFgawAQQbS3mlipV/oI/iXMiNdFp6BUSX5k9fo
 0C1jpQXmNHgPg5IR18xEWe6hZHaU6J8K5dkmE2j1EMG/w7BxhK+VLJl91jk9ohzbtDq97StFl
 /EBhVgNft8Vw0D+2VcZsX66WSGiSluEmAca3D4V5/E2xcL+gXgzujVGtIp0ky+VqG8tP9iVmC
 lPdkiW2Z8JswME8IYFXaJikAlI3Wo55QPaNXTwdTHwQsrpLREJB9gKMqrX+/GXygW+xKubmOV
 4Kwgeor8ppnex2pwbGyx0PAFmj3uVnFYtJ5le4ggsG0//wqxrPx7Jrp8YzY/rnij4wDfiOf9h
 0aHdW+OtSN7CKldDU3m0oWiVTcoLbVTq6hTtRFAVzdEW8lcWMHndSC3fizLxzE3xvk6yfNe80
 rUGg3sKjhNgo1WnNPclBbdHOb33HfFYzWq2wPlE220pOeIVyuHaZ+cmvKifBuJloySo9GsvgA
 pAQhEQzFE0CvDifo6SwWFZwhDBM7zby2eKrXWxssMelus1TeoXViDVfKMm9PY6fN6eZNJ6oup
 6OyBCOagKNEUfHdVDtwqGPyG8H3qPKMaicxBTCOEsB7FMNRCCB6mMfbnTkyMjD7xnlEhaZRDX
 Gl53d4MtzrPrgtj7Phjz9lP1oF7kcddvzi+w6t+CfyWY5zwFQpVRCkTnHDcFl3ZItyczuvYYF
 6Z7FAd5dKGNlWZEfwMFLrZaDACojR6OCWNCWfRk56NP1y2GwDoSI6GQXFAT7Qa7zbFC+G8MRR
 k+gHHw8MDNoxirmXXcgT/+EpcpUHLZNfUhjeQoemfZmXXyV+G83cZNo23fIbn2YefpgElK6Cr
 3IuuXYu+PWImxIjRQwG5Brrc+dcYSvSof0dV+Jvs6czKE7q1HpGYccPnw4mK2a0NOAqvVELUX
 v3csGg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1673039309; bh=OkvndaxyFyWly96xHU7agbQVWUXRsHhzx3CakWsyOCU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dCXZX5NcXZy+DbEcjAQ3/qxaRoUIROss+5IeyekYgNIkvAmjjm3Yl5Az58Bv9EIoM
 WQM/JZAcERe4RWuzVHaWWqvVVaVSSPhHijPokmpK/F/cbc6jnm4Jl/3H1eWFi4mOZf
 YXasHecEO+gHn3S9ONKWdapjD060k85Zc+UTMX3LyvH0hWkaPFyIDtGD+dJTOS1395
 +9arZCYZkNFJqjGaksW3XJy3fB8ESHBcmjvaSad4Vx3f7siOkNPNuWtBxktShZiJpG
 HIDf8G7Wels0O/XbLfvjxDS26U7hbZYwrAZf850KpKusrBKtsBaF8zddvuCChZuaY5
 Vt7JBAccpwNOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=dCXZX5Nc
Subject: [Buildroot] [PATCH v1] package/qt5speech: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Naumann Andreas <ANaumann@ultratronik.de>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in                |  1 +
 package/qt5/qt5speech/Config.in      | 12 ++++++++++++
 package/qt5/qt5speech/qt5speech.hash |  7 +++++++
 package/qt5/qt5speech/qt5speech.mk   | 23 +++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/qt5/qt5speech/Config.in
 create mode 100644 package/qt5/qt5speech/qt5speech.hash
 create mode 100644 package/qt5/qt5speech/qt5speech.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6dc9cfa148..f1b16ff39b 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -59,6 +59,7 @@ source "package/qt5/qt5scxml/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
+source "package/qt5/qt5speech/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5virtualkeyboard/Config.in"
diff --git a/package/qt5/qt5speech/Config.in b/package/qt5/qt5speech/Config.in
new file mode 100644
index 0000000000..cebd06057e
--- /dev/null
+++ b/package/qt5/qt5speech/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT5SPEECH
+	bool "qt5speech"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Speech enables support for accessibility features such as
+	  text-to-speech.
+
+	  For output optional enable flite or speechd.
+
+	  https://doc.qt.io/qt-5/qtspeech-index.html
diff --git a/package/qt5/qt5speech/qt5speech.hash b/package/qt5/qt5speech/qt5speech.hash
new file mode 100644
index 0000000000..595aac9f22
--- /dev/null
+++ b/package/qt5/qt5speech/qt5speech.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  6d0794ab9d5286d04fbac2db44c00ed3306e569c876f84cfd91ac0e79c834b1e  qtspeech-d32f4a479d38a11f547598004b975f4356424a16.tar.bz2
+
+# Hashes for license files:
+sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
+sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5speech/qt5speech.mk b/package/qt5/qt5speech/qt5speech.mk
new file mode 100644
index 0000000000..8cf6fe19c1
--- /dev/null
+++ b/package/qt5/qt5speech/qt5speech.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# qt5speech
+#
+################################################################################
+
+QT5SPEECH_VERSION = d32f4a479d38a11f547598004b975f4356424a16
+QT5SPEECH_SITE = $(QT5_SITE)/qtspeech/-/archive/$(QT5SPEECH_VERSION)
+QT5SPEECH_SOURCE = qtspeech-$(QT5SPEECH_VERSION).tar.bz2
+QT5SPEECH_INSTALL_STAGING = YES
+QT5SPEECH_LICENSE = GPL-2.0+ or LGPL-3.0, GFDL-1.3 (docs)
+QT5SPEECH_LICENSE_FILES = LICENSE.GPLv2 LICENSE.LGPLv3 LICENSE.FDL
+QT5SPEECH_SYNC_QT_HEADERS = YES
+
+ifeq ($(BR2_PACKAGE_FLITE),y)
+QT5SPEECH_DEPENDENCIES += flite
+endif
+
+ifeq ($(BR2_PACKAGE_SPEECHD),y)
+QT5SPEECH_DEPENDENCIES += speechd
+endif
+
+$(eval $(qmake-package))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
