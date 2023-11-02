Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FD1C4167B
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 16:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B66981424;
	Thu,  2 Nov 2023 16:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B66981424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVabhEtBdxPt; Thu,  2 Nov 2023 16:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B6D82F4F;
	Thu,  2 Nov 2023 16:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B6D82F4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA7951BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91A3481326
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A3481326
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7pgAYMmNWu-I for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 16:09:53 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 976F081403
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 976F081403
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 17:09:48 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 17:09:48 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 17:09:47 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 17:09:45 +0100
X-IronPort-AV: E=Sophos;i="6.03,272,1694728800"; d="scan'208";a="61804592"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 2 Nov 2023 17:09:27 +0100
Message-ID: <fb85e4dd41a441b26ae93b621f8f2462ab0eeafc.1698941362.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698941392; x=1730477392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5NKiMXE6z2OPGaOgMkLlkposxlLbZwuaRBKrU+qT+2g=;
 b=PvbNO1Bn7k00zlFTBzAGXL+35h1/+lsfyr9I8N8AVHK/T+XDhQ/UksRG
 /EDp3gBM1BjqODOa0qIcQa08bD6n7XPxabT5j1DRE/HHfS6HZBzy7kLN8
 b1aYo1w6kv0WLyzZMHcAiIp/W5C/XgBdpWbl6CpYZXA76ZUG6AV+cjD5W
 Pzeqrn/PwTS9IFvXfPooQb4i8s6nWokHHxnVUA+6hk5Sdwo6Jdr/kF/bV
 lWDV1J5jQaeGSbYeYhz3AxE8Br/Y0tuLXIt8SHQFZI9REtPxd7bQlJlKb
 OTwN7Ps6LOcZPCc1LvnX7lhBl0cXg984Hvr6ArsHdHe4NdpJ4RQYd79gm
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=PvbNO1Bn
Subject: [Buildroot] [PATCH 8/8] package/skopeo: new host package
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

skopeo is a command line utility that performs various operations on
container images and image repositories.

We introduce it as a host-only package, as the expected usage is to
transform an OCI image into a docker image, or to help in uploading an
OCI image to a (local) docker daemon or to a docker registry, for
example, in a post-build script.

As such, it needs a prompt in the host packages section.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/Config.in.host        |  1 +
 package/skopeo/Config.in.host |  7 +++++++
 package/skopeo/skopeo.hash    |  2 ++
 package/skopeo/skopeo.mk      | 22 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/skopeo/Config.in.host
 create mode 100644 package/skopeo/skopeo.hash
 create mode 100644 package/skopeo/skopeo.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a..52ea32d18f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -103,6 +103,7 @@ menu "Host utilities"
 	source "package/sdbus-cpp/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
 	source "package/sentry-cli/Config.in.host"
+	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/skopeo/Config.in.host b/package/skopeo/Config.in.host
new file mode 100644
index 0000000000..4a63a0829c
--- /dev/null
+++ b/package/skopeo/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_SKOPEO
+	bool "host skopeo"
+	help
+	  skopeo is a command line utility that performs various
+	  operations on container images and image repositories.
+
+	  https://github.com/containers/skopeo
diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
new file mode 100644
index 0000000000..25b0d92fd7
--- /dev/null
+++ b/package/skopeo/skopeo.hash
@@ -0,0 +1,2 @@
+sha256  0b788fc5725ac79327f7c29797821a2bafc1c3c87bbfcb2998c2a1be949e314d  skopeo-1.13.3.tar.gz
+sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
new file mode 100644
index 0000000000..98b0e7ed0a
--- /dev/null
+++ b/package/skopeo/skopeo.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# skopeo
+#
+################################################################################
+
+SKOPEO_VERSION = 1.13.3
+SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
+
+SKOPEO_LICENSE = Apache-2.0
+SKOPEO_LICENSE_FILES = LICENSE
+
+HOST_SKOPEO_DEPENDENCIES = \
+	host-btrfs-progs \
+	host-libgpgme \
+	host-lvm2 \
+	host-pkgconf
+
+HOST_SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+HOST_SKOPEO_BUILD_TARGETS = cmd/skopeo
+
+$(eval $(host-golang-package))
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
