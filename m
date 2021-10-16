Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484DCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97495608FE
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97495608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36974605F4;
	Sat, 16 Oct 2021 21:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojWkVxt8xe-a; Sat, 16 Oct 2021 21:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84CEF60087;
	Sat, 16 Oct 2021 21:54:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 682001BF95F
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 585E660087
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58_fAdic1mIW for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 21:54:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF5716001B
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634421242;
 bh=9PfOg+/ZHQfCNaZckSRRDFzGdYxyHUOI0bOscVPlTX4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hnhMTfnAnL6NQpVe+8nockqVa2uw3BfifC2yblNvcgU08lWYMd/O1ngTNPVzxaHFP
 xFQrQYlajSui/Mps2yfZHTMrlglHwsaYD72feFv2kwosfYq36kL7CNzWkB8ODxByyZ
 PbFPDZIORdtij3dblsK8iSdlGllkrYJ1U0WeKohc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MeU4s-1nCIqE0YOi-00aXoS; Sat, 16 Oct 2021 23:54:02 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 23:54:00 +0200
Message-Id: <20211016215400.31415-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016215400.31415-1-ps.report@gmx.net>
References: <20211016215400.31415-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/MyxaUIx7VV8CTcQJ7B+UHvVvKohOYKR0aFD+9cSayr2HrKpuhM
 qzMlrpCc+5V4ThYq83s8kr58V8kU33hY/Aj++co76o26sYpxAzbWbISiLlheBIdTrioVR3c
 Rk+LMS+E1dW+vxgnfiiwZWXqnhsd5oO9p+AprRy0J/FtRLWFqL/6x61ou5HErdbnSGeyzyr
 pKrn7sc/qqdymPB0F3dvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:raY/OrLaz4M=:9MLiaiAfDWY+GliZ+32OUR
 OX4+pSpSpsJW77VIwb9nuV9VNU+DO4OqVDJR2YQq6bZ8aepffctE9w7MSKfajRQW8+yOCBNwW
 Q8tVIQQS7aF9Tp0gec9OMsPOS4NkaC3uQJU2IeCqWjQzavdMaEH6AwAp6np6MV7+5q24oZpVl
 Xw5wI6K1om5CpJcij9MjFHdrbTRdnoesEHyWzrwP20JSZ4m3CJ5dl28A/gnHpE+wakomyibIn
 A1KE8WS+7cnklygBCcSvRhcamedSsD5XrjCdQimAmqAmx9P6S56XZKaD+p3TlaYETCnNaTarI
 Vqjn+g4KCM2hn4dZftJOE0084W9jenNAK7nBrCtOu9ZZ8RLyQNTELYm0vlc0sVlTGMpK1ti0i
 bhwqA8ruX5bnqBV9JwV281EU9Y9Tes9uFl04ozNfpMkHHxVvAVoj9kuFrMOx5JeJZAZD/bGBG
 n3ogSraxQk1+hOw53Nc86JeT5+7U2IzWcaTmuPYilZqgwGuOw2Uv+G4962yxjgqzXD7kxrBUC
 twRxf0SuJDH0TtCwH6zLJUupFxrVNzghifQyMs8l0S86Mh5vsQ/TdBjo0lgQV2PLXLoaL4qp8
 x5pfX7eTHfxDTm8tR4DivbcJ1E6DOJ01QFfk1vfYUyQRJKeree0497hIFuCSCOExhOFhBmMZl
 cwlFpKKKnRR/xy7XyMvh56dehS8Q2NMrq5XAwLk38HG7QFWGeUrr84/n9LwjahzPKrc/h+67d
 X4qBKWmrktQRynvmJZ3tY0TzcaKKCKsMLPXQIcYfMwG4kYcsWOXvaRS2CWSjWmw0ZCJvHUeAK
 Oa3Dnxz5Spq58E2A1qLy8BhT/FvQFcuglTlt6Wm3noROERlTxzQ9pgsZnSF3fCdl5wUF3HbHp
 F97N0uxlO5Dxk9JCXZiIa+Md4t+PSQuvSLCv7NcItlN5aNZ/24x35L5OPAW8DIA10fkibzqfC
 nNcY6xLJmPkqdndg57mgnHvP3TQUuavI0vo0ozi3TUdhqAjdeLSVN517ZaJVRsDqub7VC4AjO
 0wo7HJftA+KFgNf+QubktxZf8xfmAn38VC4JKDycaonG0KkmKxB7oP32tppOQx9bmZF0O4a35
 Hi400oLGd+0ABk=
Subject: [Buildroot] [PATCH v1 5/5] package/uqmi: new package
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/uqmi/Config.in | 14 ++++++++++++++
 package/uqmi/uqmi.hash |  3 +++
 package/uqmi/uqmi.mk   | 15 +++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/uqmi/Config.in
 create mode 100644 package/uqmi/uqmi.hash
 create mode 100644 package/uqmi/uqmi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 19f6d95270..09b7258cb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2176,6 +2176,7 @@ F:	package/racehound/
 F:	package/redir/
 F:	package/rtl8812au-aircrack-ng/
 F:	package/uredir/
+F:	package/uqmi/
 F:	package/wayland-utils/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 48f365d773..92026e85c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2343,6 +2343,7 @@ endif
 	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
 	source "package/unbound/Config.in"
+	source "package/uqmi/Config.in"
 	source "package/uredir/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
diff --git a/package/uqmi/Config.in b/package/uqmi/Config.in
new file mode 100644
index 0000000000..47b19e04d4
--- /dev/null
+++ b/package/uqmi/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_UQMI
+	bool "uqmi"
+	depends on !BR2_STATIC_LIBS # libubox
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBUBOX
+	help
+	  This command line tool originates from the OpenWrt project
+	  to configure LTE modem in QMI mode for WAN connection.
+
+	  https://git.openwrt.org/project/uqmi.git
+
+comment "uqmi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/uqmi/uqmi.hash b/package/uqmi/uqmi.hash
new file mode 100644
index 0000000000..2db5d330e2
--- /dev/null
+++ b/package/uqmi/uqmi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-br1.tar.gz
+sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  main.c
diff --git a/package/uqmi/uqmi.mk b/package/uqmi/uqmi.mk
new file mode 100644
index 0000000000..02544f5637
--- /dev/null
+++ b/package/uqmi/uqmi.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# uqmi
+#
+################################################################################
+
+UQMI_VERSION = 0a19b5b77140465c29e2afa7d611fe93abc9672f
+UQMI_SITE = https://git.openwrt.org/project/uqmi.git
+UQMI_SITE_METHOD = git
+UQMI_LICENSE = LGPL-2.0+
+UQMI_LICENSE_FILES = main.c
+UQMI_INSTALL_STAGING = YES
+UQMI_DEPENDENCIES = json-c libubox
+
+$(eval $(cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
