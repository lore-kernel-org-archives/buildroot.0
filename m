Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787AFC36001
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 13:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A71423E4;
	Fri, 21 Mar 2025 13:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aHAVpBut6W5; Fri, 21 Mar 2025 13:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10858413E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10858413E0;
	Fri, 21 Mar 2025 13:39:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87BAC1A0
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E54C4049E
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJlonvG48Nrb for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 13:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34F594011C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F594011C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34F594011C
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:39:28 +0000 (UTC)
X-CSE-ConnectionGUID: eOWkbZDgSoqYoSe3BPs53Q==
X-CSE-MsgGUID: mxnZoPAWQYO1x7OGavR5CA==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 14:32:18 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Mar 2025 14:32:18 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 21 Mar 2025 14:32:16 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 21 Mar 2025 14:32:16 +0100
X-CSE-ConnectionGUID: 7EfmlsVWQm6ESK4H71ayOw==
X-CSE-MsgGUID: doXhwvTQQmOL5LD8/qh2NA==
X-IronPort-AV: E=Sophos;i="6.14,264,1736809200"; d="scan'208";a="266333689"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Fri, 21 Mar 2025 14:32:11 +0100
Message-ID: <cff564db203c97fc8800efa120d8e0494696814d.1742563913.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1742563913.git.yann.morin@orange.com>
References: <cover.1742563913.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1742564369; x=1774100369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XnH/s/eh4mBY2YCE0R47GhYtuOjI0rVbexFVxFQd+Hk=;
 b=YwKDSVyDSSx1WPDFCLN9ueNu65lUfojVdAD9Wue80DtJiKFqJuj0c7wQ
 4Hld6M0IY7jt9u3fjItdMvZpFxvEfssYfvMriH3Lt8w+PrkwoqX49GGHP
 Bbd47cAH0bgjZaAHw9CjEmrwGmg4PqNkNpEPjCXes98LMpFcA26DcnoHF
 44WLmdGSqDb6UqOu5s//aDC/2XCOQ7MpDxRNUVUaCJk1wac/Ob5dCE0TY
 MwiyK2hbIddw57RDB7sk8TN6+JMUUxQS+w5KJSv9W3Nh8EB/MDrgjonpM
 X3ucxFVXCq9pf4YjLpQe5QXIgB4Y0uvi5ENGK/2mOyX49A3pEFuQZK09t
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=YwKDSVyD
Subject: [Buildroot] [PATCH 4/4] package/docker-credential-acr-env: new
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
 package/Config.in                                  |  1 +
 package/docker-credential-acr-env/Config.in        | 12 ++++++++++++
 .../docker-credential-acr-env.hash                 |  2 ++
 .../docker-credential-acr-env.mk                   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/docker-credential-acr-env/Config.in
 create mode 100644 package/docker-credential-acr-env/docker-credential-acr-env.hash
 create mode 100644 package/docker-credential-acr-env/docker-credential-acr-env.mk

diff --git a/package/Config.in b/package/Config.in
index 345ce6ff1d..b8ac01d4e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2831,6 +2831,7 @@ menu "System tools"
 	source "package/docker-cli/Config.in"
 	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
+	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/earlyoom/Config.in"
diff --git a/package/docker-credential-acr-env/Config.in b/package/docker-credential-acr-env/Config.in
new file mode 100644
index 0000000000..ddb101d52f
--- /dev/null
+++ b/package/docker-credential-acr-env/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_DOCKER_CREDENTIAL_ACR_ENV
+	bool "docker-credential-acr-env"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The ACR docker credential helper is an alternative to the
+	  existing file store based ACR helper [...] which relies
+	  on az command line and is not optimised for use in CI
+	  environments. Primary use case for this helper is for use
+	  with kaniko and other tools running in CI scenarios wishing
+	  to push to Azure Container Registry.
+
+	  https://github.com/chrismellard/docker-credential-acr-env/
diff --git a/package/docker-credential-acr-env/docker-credential-acr-env.hash b/package/docker-credential-acr-env/docker-credential-acr-env.hash
new file mode 100644
index 0000000000..eb1fdebbf8
--- /dev/null
+++ b/package/docker-credential-acr-env/docker-credential-acr-env.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  deff9d133fdd87b6cbe454e82e72eb7b124d1aea330c17236e804071a446b4ae  docker-credential-acr-env-0.7.0-git4-go2.tar.gz
diff --git a/package/docker-credential-acr-env/docker-credential-acr-env.mk b/package/docker-credential-acr-env/docker-credential-acr-env.mk
new file mode 100644
index 0000000000..31f895e0e3
--- /dev/null
+++ b/package/docker-credential-acr-env/docker-credential-acr-env.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# docker-credential-acr-env
+#
+################################################################################
+
+DOCKER_CREDENTIAL_ACR_ENV_VERSION = 0.7.0
+DOCKER_CREDENTIAL_ACR_ENV_SITE = https://github.com/chrismellard/docker-credential-acr-env
+DOCKER_CREDENTIAL_ACR_ENV_SITE_METHOD = git
+
+DOCKER_CREDENTIAL_ACR_ENV_LICENSE = Apache-2.0
+DOCKER_CREDENTIAL_ACR_ENV_LICENSE_FILES = LICENSE
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
