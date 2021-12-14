Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F495C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 11:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6B4404CF;
	Tue, 14 Dec 2021 11:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5s6Xjb7xdiO; Tue, 14 Dec 2021 11:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E88C4046D;
	Tue, 14 Dec 2021 11:04:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1421BF37F
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 11:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3466240286
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 11:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yrhxC-E37AR for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 11:04:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5.ex10.biz (smtp5.ex10.biz [178.170.74.94])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1F9840234
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:04:47 +0000 (UTC)
Received: from [185.183.66.253] (port=2150 helo=UC681.Mediane.local)
 by smtp5.ex10.biz with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <florent.aumaitre@medianesysteme.com>)
 id 1mx5bu-0003nw-2c; Tue, 14 Dec 2021 12:04:43 +0100
X-SASI-Hits: BODYTEXTP_SIZE_3000_LESS 0.000000, BODY_SIZE_1700_1799 0.000000, 
 BODY_SIZE_2000_LESS 0.000000, BODY_SIZE_5000_LESS 0.000000,
 BODY_SIZE_7000_LESS 0.000000, HTML_00_01 0.050000, HTML_00_10 0.050000,
 IN_TLD 0.100000, LEGITIMATE_SIGNS 0.000000, MULTIPLE_RCPTS 0.100000,
 MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_URI_FOUND 0.000000,
 NO_FUR_HEADER 0.000000, NO_URI_HTTPS 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, SENDER_NO_AUTH 0.000000, __ANY_URI 0.000000,
 __BODY_NO_MAILTO 0.000000, __CC_NAME 0.000000,
 __CC_NAME_DIFF_FROM_ACC 0.000000, __CC_REAL_NAMES 0.000000,
 __COURIER_PHRASE 0.000000, __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FILESHARE_PHRASE 0.000000, __FRAUD_MONEY_CURRENCY 0.000000,
 __FRAUD_MONEY_CURRENCY_DOLLAR 0.000000, __FROM_DOMAIN_IN_ANY_CC1 0.000000,
 __FROM_DOMAIN_IN_RCPT 0.000000, __FUR_RDNS_SOPHOS 0.000000,
 __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000, __HAS_MSGID 0.000000,
 __HAS_X_MAILER 0.000000, __LINES_OF_YELLING 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MULTIPLE_RCPTS_CC_X2 0.000000, __NO_HTML_TAG_RAW 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __SANE_MSGID 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_STARTS_S_BRACKETS 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NO_NAME 0.000000, __URI_MAILTO 0.000000,
 __URI_NO_WWW 0.000000, __URI_NS 0.000000
X-SASI-Probability: 8%
X-SASI-RCODE: 200
X-SASI-Version: Antispam-Engine: 4.1.4, AntispamData: 2021.12.14.95716
From: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 12:04:02 +0100
Message-Id: <20211214110402.5646-1-florent.aumaitre@medianesysteme.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 2/2] package/python-pyqt5: Fix parallel build
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
Cc: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?q?Manuel=20V=C3=B6gele?= <develop@manuel-voegele.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fix build of python-pyqt5 package when parallel build is used

Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
---
 package/python-pyqt5/python-pyqt5.mk | 17 +++++++++++++++++
 package/python-pyqt5/qt.conf.in      |  7 +++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/python-pyqt5/qt.conf.in

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 8f28c90d15..e54352f7dd 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -152,6 +152,23 @@ define PYTHON_PYQT5_GENERATE_QTDETAIL
 	)
 endef
 
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable and
+# tweak the per-package install pathes
+define PYTHON_PYQT5_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf
+	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+		$(PYTHON_PYQT5_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
+endef
+
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define PYTHON_PYQT5_QT_CONF_FIXUP
+	$(PYTHON_PYQT5_INSTALL_QT_CONF)
+endef
+endif
+
+PYTHON_PYQT5_PRE_CONFIGURE_HOOKS += PYTHON_PYQT5_QT_CONF_FIXUP
+
 PYTHON_PYQT5_CONF_OPTS = \
 	--bindir $(TARGET_DIR)/usr/bin \
 	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT5_PYTHON_DIR)/site-packages \
diff --git a/package/python-pyqt5/qt.conf.in b/package/python-pyqt5/qt.conf.in
new file mode 100644
index 0000000000..2215cbd4e1
--- /dev/null
+++ b/package/python-pyqt5/qt.conf.in
@@ -0,0 +1,7 @@
+[Paths]
+Prefix=/usr
+HostPrefix=@@HOST_DIR@@
+Sysroot=@@STAGING_DIR@@
+Headers=/usr/include/qt5
+Plugins=/usr/lib/qt/plugins
+Examples=/usr/lib/qt/examples
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
