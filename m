Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AACBC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC2214049E;
	Wed,  7 Feb 2024 17:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDNQfEmOZteK; Wed,  7 Feb 2024 17:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B727C4171D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B727C4171D;
	Wed,  7 Feb 2024 17:11:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72B2C1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E21941E2A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0OlUXHIQaJ67 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:11:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7089B41E22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7089B41E22
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7089B41E22
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:11:00 +0000 (UTC)
Received: from bubutux.localdomain (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6FA6E2C83776;
 Wed,  7 Feb 2024 18:10:57 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 18:09:56 +0100
Message-ID: <20240207170959.2672846-4-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207170959.2672846-1-buildroot@bubu1.eu>
References: <20240207170959.2672846-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707325858; bh=wGfl5QpzFH0K4oN+CAo9Dr3Rd1jN4wHJwFzDjWuZgJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IsPkfE8fCFfjklI1aQI3CuEq/gwa4Ld4E1zMRlKFaN46c9stkNDzcuwcZCQNM3UxY
 JH1qi7dRx1G85pCecpmRoFAemnjnxSdiwKuISFgvytch4HeH12EXeH5orEfmSgZ9dz
 supPbmnxmWDxemyqBOtWO8BJKD2RrO3gYBEHkdk11Jt6ua3bEsPoDDDODupTDR+uoB
 btsZ6370fhxAoU7WaoyElOAbmbiDozceI9gJDkGYWViECLscm9inn2ta9de+FSMLpw
 3L5J5CYIiT6+jk9wkmpwnDp2zfcUHEnCQz8elTiNtkvOzOUFBnUKPDeY/8hHzs06f6
 3R6AEHv+XTshg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=IsPkfE8f
Subject: [Buildroot] [PATCH 4/4] package/python-ruamel-yaml: bump to version
 0.18.5
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

License hash changed due to year update:
https://sourceforge.net/p/ruamel-yaml/code/ci/56b3e2666fb275deab3eec99193c103e4edf93bb/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 6 +++---
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index ee5016835b..02845d112b 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel.yaml/json
-md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
-sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
+md5  24fac3544a3c7bd7eeaf6e4f704a056e  ruamel.yaml-0.18.5.tar.gz
+sha256  61917e3a35a569c1133a8f772e1226961bf5a1198bea7e23f06a0841dea1ab0e  ruamel.yaml-0.18.5.tar.gz
 # Locally computed sha256 checksums
-sha256  ab837b032c5aae84503fc0c733a116a26fd272e90dc4402fa68d3c9e51aed3b0  LICENSE
+sha256  ba45629abb7022949148ce65de4a59e7ee164d30c94450389a6afdd3ebe4e9e0  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
index a6fed3bc2c..bbdac591ca 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.mk
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_VERSION = 0.17.21
+PYTHON_RUAMEL_YAML_VERSION = 0.18.5
 PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/82/43/fa976e03a4a9ae406904489119cd7dd4509752ca692b2e0a19491ca1782c
 PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_LICENSE = MIT
 PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
