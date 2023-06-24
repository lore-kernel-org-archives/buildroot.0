Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C453EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 22:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C284C40B67;
	Sat, 24 Jun 2023 22:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C284C40B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9bJWLfCsVKQ; Sat, 24 Jun 2023 22:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EACDB40B78;
	Sat, 24 Jun 2023 22:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EACDB40B78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5CD1BF3EE
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32C1060DDF
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32C1060DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDle0DbcLUcq for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 22:27:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36617607CA
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36617607CA
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 22:27:12 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-34574eb05f4so3632235ab.0
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 15:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687645631; x=1690237631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cg0jiOqjAUnUnDGHv/KIYiMRe392x2gD4VhgwJ+Dml8=;
 b=iUZ3ZK2X334A4wpB11PpSus87oEDt1SauI1dtU8WZ0AsdjFncynfnLhipbE9OHeVrY
 BEysvqW++WUmleO9lbpJCB1qJCIBF2HDAhNtTQzDE8gWA8Q17DJPrlbOfI5hMd9bvAsW
 tNdxDJyEUbPW0f2n7k/U4ITNgM6zZQr1RebrJxCUZ4mFycQYAVlObmZqkZleVp7cAQ5E
 FBO8m/5h22fRrZV1wOCQbKVALKIRhomO0hT3a8XWbn4Hz7AIrVf2aJDj1cundtUmFLrS
 uLAJYfn4qbbv5zNMfDBwRWJyOU3rUBL98N1QvqCFpGpBVakOaiP9YKCyO9qGKNBp3bkX
 exUA==
X-Gm-Message-State: AC+VfDzBqm+SBimmUmDN0Zaui3gEuzRcMiqBXiQsuTj07LRC0hhGLkbo
 F9XiPpRaWXQgRsuUbFIquOr350Hjb2g=
X-Google-Smtp-Source: ACHHUZ4G8FFPwYR8IJL1HbfLue04tnmfmDx31GlU7t5hT1sWyJO6J6Pr4dgWkM5NtIwbAR7SVDtT2Q==
X-Received: by 2002:a92:cbcf:0:b0:32c:9c5e:900c with SMTP id
 s15-20020a92cbcf000000b0032c9c5e900cmr4299799ilq.8.1687645631045; 
 Sat, 24 Jun 2023 15:27:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-17.hlrn.qwest.net.
 [71.218.252.17]) by smtp.gmail.com with ESMTPSA id
 b1-20020a92c841000000b003423bfdd0ccsm830023ilq.37.2023.06.24.15.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jun 2023 15:27:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 16:27:04 -0600
Message-Id: <20230624222705.606301-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687645631; x=1690237631;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cg0jiOqjAUnUnDGHv/KIYiMRe392x2gD4VhgwJ+Dml8=;
 b=l/TsC9dg5Rtk+2fCJfgQQj3J0jYF6D8Rhd6S9rUbfXMOX4xYRg4Clk7/scvBTJm5Fk
 9qh2ihHCT8lRyjMBhr8952vXVbDMxHfTG4tYo6J35oU5/ciKjfEBTtfotDAdLeqkzRLE
 rBg5D+/ja36q9rYiMLqEPCAHQF4yuT/zwi8j4QfSGFhPvtZ7c0dUh1mxT1vy7JZubhk2
 qPOvqvKFztRVpEgzfjKwOppWLUh/UIRT7X4jrTMNxbHBPztu+hgskDUtbPj3ztD5DJDR
 U/hGnBWGyM2yntOsebykFCtsHr29NXWRHGDLA6PDmZbBPDg8CSWGF82ETQAOqwnc/H/J
 hO3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=l/TsC9dg
Subject: [Buildroot] [PATCH v2 1/2] package/python-wheel: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required for upcoming setuptools pep517 support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wheel/python-wheel.hash |  5 +++++
 package/python-wheel/python-wheel.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-wheel/python-wheel.hash
 create mode 100644 package/python-wheel/python-wheel.mk

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
new file mode 100644
index 0000000000..377a85c8fd
--- /dev/null
+++ b/package/python-wheel/python-wheel.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/wheel/json
+md5  ec5004c46d1905da98bb5bc1a10ddd21  wheel-0.40.0.tar.gz
+sha256  cd1196f3faee2b31968d626e1731c94f99cbdb67cf5a46e4f5656cbee7738873  wheel-0.40.0.tar.gz
+# Locally computed sha256 checksums
+sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
new file mode 100644
index 0000000000..159598fd1e
--- /dev/null
+++ b/package/python-wheel/python-wheel.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wheel
+#
+################################################################################
+
+PYTHON_WHEEL_VERSION = 0.40.0
+PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/fc/ef/0335f7217dd1e8096a9e8383e1d472aa14717878ffe07c4772e68b6e8735
+PYTHON_WHEEL_SETUP_TYPE = flit
+PYTHON_WHEEL_LICENSE = MIT
+PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
