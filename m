Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6018BEEA84B
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E56260737;
	Thu, 12 Feb 2026 19:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDBBUasTWUWw; Thu, 12 Feb 2026 19:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FCB60738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770923096;
	bh=rtFqSoUfQrgyV9rcOj9DdT+fRMWZA9M7rpHd7uOrn8M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=McDstTgTPYzVujV8KLq2VFSZPfTAIz982EJU7f9P2z4u6GHRGo7tLCBr0K6uePlyD
	 nkAwcUPHsbcn41ztELsScNTD2Ze+bjnB0amGx/Vlp9NYw2Y79qmp/yiEsf/2BG4AVd
	 Lxi31jlq1blqsreaWqwm20o33U/CSjLt0EbHZiGnJ6PYlZ9eM7YkFdd2pnXjy7qinb
	 Rg1U/B8tQupfWatLovl8FLY7eLJXppD6ufMTNERvNCZTqsWNqOgKMurLSCfexjEs8i
	 diatGOsmWdzfZ3b7HwVrlbjmOW9YhKuF7shJ/KdCEPB0AmA6kO7/9/dAMR1EzohjvA
	 tBA0h96BDqm8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FCB60738;
	Thu, 12 Feb 2026 19:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 586B4EC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49E9760737
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVrU5Zng6Uoy for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BC586072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC586072A
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BC586072A
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770923067; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R6rES73MrS/uMBr3SVQYP/DoTGXEZbLGZM/9qAut2fGOmnzFnkenY/Jb0r2AAAaR5178Fuc2QKg9v3z2Sx6BpUiyxeIxMN1FmGkO7xqPl3YXdORJX/LhWH7jBLy/n5LCPz8H3kmaWQCsRXFP/yIzSU4qY9TRTLLyVzkZ/VyNk7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770923067;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/xRqZZl3gLgEptiVlMoB5OsKShJ1W5v2LRRjkhzybWM=; 
 b=ZN7NN3EmNqfx9I8z9VQbLO5l7TVMCNJPLiopp0CrLQZK3NNuQl3wuCqY8AISMcD2R7zsEXf+KmJ95UjpO23NE8YHL36SOZ9OObIaWWO4sZHe9qjWJtem77nssqfRqB4ndHx9oI8iNSwhUj40uDeSgMKU6q2OKDyGwEizcTl7aME=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770923062131481.5173100183381;
 Thu, 12 Feb 2026 11:04:22 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 03:03:46 +0800
Message-Id: <20260212190349.537465-4-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212190349.537465-1-kingxukai@zohomail.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227d379f533441c84c5c7e97f960000111297360b81acaf6d877c3eb42f98e9ef6cf28a3b83808eb3:zu080112271a099070c9abc7bb225397370000798ba782330c033036bb72e5e5ad150e87541332645c626f8d:rf0801122d47475f969c951cbaadeb0c620000c7d85c8d5a01f2c8dffee3725d6f8559e93c1d5fca59b280e96eaeca2e9382:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770923067; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=/xRqZZl3gLgEptiVlMoB5OsKShJ1W5v2LRRjkhzybWM=;
 b=O+vCZwJ6mbwsNwWaWphlooRS1k604FrjmLI7W2Y651FzUNviLNNfj6PfY6eKmeCQ
 G1vGFeZ8xxC2pVw5mNvpMoS8rykGdQ78t+4QfoGmcocS5fWoudp0Lxk9lYlxhv3ygh+
 3+OUtm2OmZ0DiIywZEQmaFwbyiA6j9I/RuWqjf7c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=O+vCZwJ6
Subject: [Buildroot] [RESEND: v1 3/6] package/python-gymnasium: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the python-gymnasium package, which provides a
standard API for reinforcement learning and a broad suite of
reference environments. Gymnasium is the maintained successor
to OpenAI Gym, developed by the Farama Foundation.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-gymnasium/Config.in             | 11 +++++++++++
 package/python-gymnasium/python-gymnasium.hash |  5 +++++
 package/python-gymnasium/python-gymnasium.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/python-gymnasium/Config.in
 create mode 100644 package/python-gymnasium/python-gymnasium.hash
 create mode 100644 package/python-gymnasium/python-gymnasium.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fb0a084665..892738362f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3477,6 +3477,7 @@ F:	configs/ti_am64x_sk_defconfig
 N:	Xukai Wang <kingxukai@zohomail.com>
 F:	package/python-cloudpickle/
 F:	package/python-farama-notifications/
+F:	package/python-gymnasium/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/package/Config.in b/package/Config.in
index a1b06227e5..956f87d305 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1145,6 +1145,7 @@ menu "External python modules"
 	source "package/python-grpcio-reflection/Config.in"
 	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-gymnasium/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hid/Config.in"
diff --git a/package/python-gymnasium/Config.in b/package/python-gymnasium/Config.in
new file mode 100644
index 0000000000..19185f267c
--- /dev/null
+++ b/package/python-gymnasium/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_GYMNASIUM
+	bool "python-gymnasium"
+	select BR2_PACKAGE_PYTHON_CLOUDPICKLE # runtime
+	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  A standard API for reinforcement learning and a diverse set
+	  of reference environments (formerly Gym).
+
+	  https://farama.org
diff --git a/package/python-gymnasium/python-gymnasium.hash b/package/python-gymnasium/python-gymnasium.hash
new file mode 100644
index 0000000000..b76e0a5710
--- /dev/null
+++ b/package/python-gymnasium/python-gymnasium.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gymnasium/json
+md5  b67cd4243af164eb11888fe731c91e11  gymnasium-1.2.3.tar.gz
+sha256  2b2cb5b5fbbbdf3afb9f38ca952cc48aa6aa3e26561400d940747fda3ad42509  gymnasium-1.2.3.tar.gz
+# Locally computed sha256 checksums
+sha256  7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18  LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
new file mode 100644
index 0000000000..1cf79a0baf
--- /dev/null
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gymnasium
+#
+################################################################################
+
+PYTHON_GYMNASIUM_VERSION = 1.2.3
+PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
+PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/76/59/653a9417d98ed3e29ef9734ba52c3495f6c6823b8d5c0c75369f25111708
+PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
+PYTHON_GYMNASIUM_LICENSE = MIT
+PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
