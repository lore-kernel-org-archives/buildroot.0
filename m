Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653F5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC29813DD;
	Wed, 29 Dec 2021 08:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcEMew9Bno1h; Wed, 29 Dec 2021 08:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 279478130B;
	Wed, 29 Dec 2021 08:42:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AA641BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59AA58130B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCRKzpRj3SwW for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:42:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E18A812B7
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:42:32 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id s6so16295160ioj.0
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCuc1izoXKQSsoXVj2agytriiaqMqzsTp4Eq50krPUw=;
 b=DIQ9ttOwZ8FNNRCscl1NhPnjroefXi2LtpuGFfPf10BiqjxS9zEgUV6VogW01dt6Gu
 v6y9QG61gQRKZ+0uqNCNxY/sL07ZnF0qyW9iqbMKd7szWW1xqNkvHK2unF8/ls83F64D
 GN4DP5VcLuqnrGHCbajjL348I0JtJcn+ODGOL5Zmp+cksa21WBuMPCZMeUccOMaZA7Qy
 BB/XJKX6Dhx3sCzKQRpvXK62nPKfP6W8AB1G6acpbzPDKLJDm0DauhwQwq5jtGkXmDz/
 FPtJ3emb9xdIvbMuliTSnVlvWzCgrgZeWZLKwnsyUsSk3YsRRucUe7kpmnUPS6yFRfba
 jqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCuc1izoXKQSsoXVj2agytriiaqMqzsTp4Eq50krPUw=;
 b=QiFXG3pyd8QgDI/iTxWQNIIWuJngdv6WshLRC7H5KKIhc+Evl7TZoLHUYnGIz/fZyK
 qgjbc0KoeJy333OQB8IeyoqJySoaKTB7y4JxR7mDxOl24Ivo/PhsNysCHAYL+mx04vw5
 r9q2QQRIZQVSJhdjh8y0HSSDUDPs+NhGwIXJYnekpSR6p4lICng9Zda647tUz5dcC2cW
 3/U5zjknIQh0/HZSlMfSd+mV8nJTH7VxhjBCoDW3Txz5JP+rUWEGovoqcYlMtHsG0BPf
 tpVR9j0suQaa+Ky9GRjw7eNZ9AYjGySrwNkm+qSZvHUekJ7eotfCx2GsOUELY2De6EyI
 WfSA==
X-Gm-Message-State: AOAM531qWdxr5WoYPyAxMhzaCgP++LIq1o0RAxKcCwElqneJEJceXvg3
 vFhg2Yalxitkb1CQmY9ToAR3ygqJC73XXw==
X-Google-Smtp-Source: ABdhPJyMPxFuwDRCzhtVVwNcXQSjkv482RCMKbGudZ2y3HrtyRXYBioIjS85ybtim+W6SUkrd45k5A==
X-Received: by 2002:a05:6602:2d53:: with SMTP id
 d19mr11631977iow.77.1640767351435; 
 Wed, 29 Dec 2021 00:42:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id p15sm12166788ilo.83.2021.12.29.00.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:42:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 01:42:18 -0700
Message-Id: <20211229084223.521362-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229084223.521362-1-james.hilliard1@gmail.com>
References: <20211229084223.521362-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/6] package/python-tomli: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-tomli/Config.in         |  7 +++++++
 package/python-tomli/python-tomli.hash |  5 +++++
 package/python-tomli/python-tomli.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-tomli/Config.in
 create mode 100644 package/python-tomli/python-tomli.hash
 create mode 100644 package/python-tomli/python-tomli.mk

diff --git a/package/Config.in b/package/Config.in
index 59bf5caff7..411ce90cc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1253,6 +1253,7 @@ menu "External python modules"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
+	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tomli/Config.in b/package/python-tomli/Config.in
new file mode 100644
index 0000000000..e1cecaaa36
--- /dev/null
+++ b/package/python-tomli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TOMLI
+	bool "python-tomli"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A lil' TOML parser.
+
+	  https://github.com/hukkin/tomli
diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
new file mode 100644
index 0000000000..1a274c8a40
--- /dev/null
+++ b/package/python-tomli/python-tomli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomli/json
+md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
+sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
new file mode 100644
index 0000000000..4e6b023ef7
--- /dev/null
+++ b/package/python-tomli/python-tomli.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-tomli
+#
+################################################################################
+
+PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
+PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_LICENSE = MIT
+PYTHON_TOMLI_LICENSE_FILES = LICENSE
+HOST_PYTHON_TOMLI_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
