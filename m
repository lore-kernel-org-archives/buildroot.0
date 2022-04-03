Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ED3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 22:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B1784060B;
	Sun,  3 Apr 2022 22:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOBL1Ho9-teq; Sun,  3 Apr 2022 22:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73A84405CD;
	Sun,  3 Apr 2022 22:20:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86D961BF350
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758EE41507
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlJ9s7pOjrqH for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 22:20:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D19641581
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 22:20:29 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id i4so6388524qti.7
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 15:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naZysYkjivRj1RAA1yGJop6RECtfkINvvRFkCsy13HE=;
 b=eUJh6Nhg+JqVNmk1xrm4Pbl+mfI6wg5uoSBUm0kzM3dw7WSg8m5M3bah96kY8GBDoJ
 vPpJOraL8KshuND6cscuPCzWqPfa7Wyxtkrh/CA0v1mlzpiSJ8HFGGs9UhEOBltxxTEg
 B1kkByg3FptG+HCXQpMxGXzsRo2AQaAG30aR51Yfe4S24BNmZMJBbWCSrdvaG7wfSFgF
 PE5u66xj23BmQlpdBduNsh/qDwpuzlByVpcUc2WZtgOCuI7n99OqVKNBhwlCLAFhekcS
 YkNzuUUABPj62agDZw3kDB1KEpqGekiF+FYsgDwC8Hj+PKoxxm41gSh2DJxn5yfj4BB4
 YEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=naZysYkjivRj1RAA1yGJop6RECtfkINvvRFkCsy13HE=;
 b=1TGlPx+fEE8kWNJHAaOQTYR4EE6wulr+w0A7srdMmhZLso73vGy0ABFr+YiooOlNSc
 R7C7xCXYB5iMoMA8QB0Zjs99QCU2iex7UANOprKlBfhNCdxB1fMZLcd3LgVF20qaJ9yp
 8Vqk4L6XIBupoa6tfhlUeKcdQg6FKwIODk4of1sEUOTI5NaYYqGleGLhNG1oNag95M/Y
 xy1qytmbvc8Xa+nR1hzoYDbIYdn8ukBHUaL4p14mT05sN+V3xChGCktkt3BaCEYQsVWm
 PpdNOxp+OmzEIlQXx3XHIvqsZV5ps8F4XOdcp3MorMK3j9ymKHtKeAuLWMYjvYTLR0vN
 XBSw==
X-Gm-Message-State: AOAM532rh+smsnfwZ1EHV2R0ecT2efDicktAJaDGgDCLvehNTjndAZ1H
 5jfJumheYPv2XZvTlJjKVorKKHMtoEI=
X-Google-Smtp-Source: ABdhPJxroGa5tJvS6FpRi0t6aUGZK08x8ClKMZmcPjkDX8EekY1ANQbM4XYtiHx740e2PRcdaNxUfw==
X-Received: by 2002:ac8:5c85:0:b0:2e2:3211:92e9 with SMTP id
 r5-20020ac85c85000000b002e2321192e9mr15617913qta.386.1649024427884; 
 Sun, 03 Apr 2022 15:20:27 -0700 (PDT)
Received: from localhost.localdomain
 (cpef832e4b04a98-cm589630c62f8f.cpe.net.cable.rogers.com. [174.116.183.78])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm7472717qte.17.2022.04.03.15.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 15:20:27 -0700 (PDT)
From: Emile Cormier <emile.cormier.jr@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 19:19:50 -0300
Message-Id: <20220403221953.1158787-3-emile.cormier.jr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] package/python-zlmdb: add new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Emile Cormier <emile.cormier.jr@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: ecorm <ecorm@users.noreply.github.com>

Required by python-crossbar.
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
---
 DEVELOPERS                             |  5 +++++
 package/Config.in                      |  1 +
 package/python-zlmdb/Config.in         | 16 ++++++++++++++++
 package/python-zlmdb/python-zlmdb.hash |  5 +++++
 package/python-zlmdb/python-zlmdb.mk   | 14 ++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/python-zlmdb/Config.in
 create mode 100644 package/python-zlmdb/python-zlmdb.hash
 create mode 100644 package/python-zlmdb/python-zlmdb.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a66b9d7eee..7f04663077 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -746,6 +746,11 @@ N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
 
+N:	Emile Cormier <emile.cormier.jr@gmail.com>
+F:	package/python-autobahn/
+F:	package/python-crossbar/
+F:	package/python-zlmdb/
+
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
 F:	package/adwaita-icon-theme/
diff --git a/package/Config.in b/package/Config.in
index a1964df5f1..4330659431 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1300,6 +1300,7 @@ menu "External python modules"
 	source "package/python-yatl/Config.in"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
+	source "package/python-zlmdb/Config.in"
 	source "package/python-zope-interface/Config.in"
 	source "package/python-zopfli/Config.in"
 endmenu
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
new file mode 100644
index 0000000000..9eaab3a7a7
--- /dev/null
+++ b/package/python-zlmdb/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_PYTHON_ZLMDB
+	bool "python-zlmdb"
+	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
+	select BR2_PACKAGE_PYTHON_LMDB # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	select BR2_PACKAGE_PYTHON_TXAIO # runtime
+	help
+	  Object-relational zero-copy in-memory database layer for
+	  LMDB.
+
+	  https://github.com/crossbario/zlmdb
diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
new file mode 100644
index 0000000000..d98dc7d12a
--- /dev/null
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zlmdb/json
+md5  d730a394b74108933a65c9fbe76aba36  zlmdb-22.3.1.tar.gz
+sha256  0d416a47b1ee627186af8e5c99e5246f6b277df44ba5c6bb67e947eabf948e5a  zlmdb-22.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
new file mode 100644
index 0000000000..a040622d9d
--- /dev/null
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-zlmdb
+#
+################################################################################
+
+PYTHON_ZLMDB_VERSION = 22.3.1
+PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/71/87/bb3cebd5312e670e33551317c7fc5e4b6a4a9af39075a71cd541b32cc0bf
+PYTHON_ZLMDB_SETUP_TYPE = setuptools
+PYTHON_ZLMDB_LICENSE = MIT
+PYTHON_ZLMDB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
