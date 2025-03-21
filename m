Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A793C36000
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 13:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D5F42446;
	Fri, 21 Mar 2025 13:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWYSOsRqIMYl; Fri, 21 Mar 2025 13:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E7A42443
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66E7A42443;
	Fri, 21 Mar 2025 13:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DAE8C1A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B05847CF
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fFPAhMhz_u1 for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 13:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69282847CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69282847CE
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69282847CE
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:32:17 +0000 (UTC)
X-CSE-ConnectionGUID: lkKtQwt2SGGbCKTNJylJHw==
X-CSE-MsgGUID: tO49WRk8S7WUWY4sz4ioZA==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 14:32:14 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Mar 2025 14:32:15 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 21 Mar 2025 14:32:13 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 21 Mar 2025 14:32:13 +0100
X-CSE-ConnectionGUID: /YsEZlxZTcK77DQIkknS5g==
X-CSE-MsgGUID: zk0v8tbSQmKjaHr5Z7x0kg==
X-IronPort-AV: E=Sophos;i="6.14,264,1736809200"; d="scan'208";a="266226500"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Fri, 21 Mar 2025 14:32:09 +0100
Message-ID: <4f04943a9577907f282808c70b4a5d62df2ff32b.1742563913.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1742563913.git.yann.morin@orange.com>
References: <cover.1742563913.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1742563937; x=1774099937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yb+sjXQf9M8y/5ywNOnIcbIh9lyjSubYVmr9Vydqe00=;
 b=J5hM8M95h5BJovkPk/0cKDPKweHf/V1tgaNlY5jf71lB2xZBr/fnzfTM
 y4M2h34xDH6law1GO30Gc54d+VHLqz+xrvYBMakvIH5dlZFZ4cfIlhnmY
 zdEcB+O7yPsNaCprZlOr3L5cU17ML7lG2jXh0MO45smNLTIajsGYZ8LxL
 sKzH9QhcbibsW95lC2XSLAVAScSdhVmIeFUMYfkIDxuDQjiQdBPDaN1qT
 44Po5ZmEosBMqKKv6BXPz++htAMf743WrQs3TG/HEU/vOJKEuYlq4HvmD
 b0S0QjBt4/Rj6/Br4jdsXBnniROxi+hYf3VM/lBRLSEoQ3RElSofbVFzX
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=J5hM8M95
Subject: [Buildroot] [PATCH 2/4] package/amazon-ecr-credential-helper: new
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/Config.in                             |  1 +
 .../amazon-ecr-credential-helper/Config.in    |  9 +++++++++
 .../amazon-ecr-credential-helper.hash         |  2 ++
 .../amazon-ecr-credential-helper.mk           | 20 +++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/amazon-ecr-credential-helper/Config.in
 create mode 100644 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
 create mode 100644 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk

diff --git a/package/Config.in b/package/Config.in
index 5c6e334a75..5bc443c1ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2806,6 +2806,7 @@ endmenu
 
 menu "System tools"
 	source "package/acl/Config.in"
+	source "package/amazon-ecr-credential-helper/Config.in"
 	source "package/android-tools/Config.in"
 	source "package/atop/Config.in"
 	source "package/attr/Config.in"
diff --git a/package/amazon-ecr-credential-helper/Config.in b/package/amazon-ecr-credential-helper/Config.in
new file mode 100644
index 0000000000..88e7d644c6
--- /dev/null
+++ b/package/amazon-ecr-credential-helper/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_AMAZON_ECR_CREDENTIAL_HELPER
+	bool "amazon-ecr-credential-helper"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Amazon ECR Docker Credential Helper is a credential helper
+	  for the Docker daemon that makes it easier to use Amazon Elastic
+	  Container Registry.
+
+	  https://github.com/awslabs/amazon-ecr-credential-helper
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
new file mode 100644
index 0000000000..6ebcd4e204
--- /dev/null
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  53765b3e441a0e785131731d0cee4c0e2b2a22b90e523e9e4ec3e461c0ec5b05  amazon-ecr-credential-helper-v0.9.1-git4-go2.tar.gz
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
new file mode 100644
index 0000000000..acfeea16fb
--- /dev/null
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# amazon-ecr-credential-helper
+#
+################################################################################
+
+AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.9.1
+AMAZON_ECR_CREDENTIAL_HELPER_SITE = https://github.com/awslabs/amazon-ecr-credential-helper
+AMAZON_ECR_CREDENTIAL_HELPER_SITE_METHOD = git
+
+AMAZON_ECR_CREDENTIAL_HELPER_LICENSE = Apache-2.0
+AMAZON_ECR_CREDENTIAL_HELPER_LICENSE_FILES = LICENSE
+
+AMAZON_ECR_CREDENTIAL_HELPER_SUBDIR = ecr-login
+
+AMAZON_ECR_CREDENTIAL_HELPER_GOMOD = ./cli
+AMAZON_ECR_CREDENTIAL_HELPER_BUILD_TARGETS = docker-credential-ecr-login
+AMAZON_ECR_CREDENTIAL_HELPER_INSTALL_BINS = docker-credential-ecr-login
+
+$(eval $(golang-package))
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
