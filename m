Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3532FC83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 14:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55DE413E7;
	Wed, 16 Jul 2025 14:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQ5kX09nufcA; Wed, 16 Jul 2025 14:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2BFC413D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BFC413D5;
	Wed, 16 Jul 2025 14:33:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA0B234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BCA60E34
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQVQqHzpjjJE for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 14:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C98060AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C98060AE5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C98060AE5
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 14:32:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.179]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1uI1MO1VWb-00IrR4; Wed, 16
 Jul 2025 16:32:57 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed, 16 Jul 2025 16:32:39 +0200
Message-ID: <20250716143240.1354630-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:n/iuucaRfseaZavgj8OkW8aTicSQtzLn6x6LLO6A+QFy1JerVfD
 iPGm4nY9FuDpGm7ZZCkvnlPqfjOlaPjIYlYimdlRQT99q18gIuj9q+zO4NO05tQUknivDp9
 IyV1xr+C18mhyvhgf8sdCGu5GAK/e7suiIW6mrpzHEKC3gG1FNrir4tJhXXQcoVufuJLa6o
 gtSdCnB0O/2kYcKayHqAw==
UI-OutboundReport: notjunk:1;M01:P0:Do7ccsY0BQU=;RwEqeVoS8lgqYA6knBlSjF8jdxl
 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
 eJWg7FHfcyL6BUKMG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1752676377; x=1753281177; i=fiona.klute@gmx.de;
 bh=R24gatRwoXpUokZnIdNpuP6VUawjVAuxMuga7+dIaTk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rwFT6+CuvaEAZ8PU1IenrdVeQBSqI4XWW4hM3ZqwkH/K5n0nAQYcILMo+Q2dkmU7
 XKC51Y/aotq0NBWc+hk29lqtz54wtDxiHYio9RTkWEquLAnYsucVZB6HrozFcUmLm
 LN7zR/tYTJAbELeWUZKivYZIv2v89m4eXZtoYMuKgcnlm3EGi+mHsBu8xIB9cCV2O
 5i20DBXacfKBDgkyszmr+FpwkmyAzjBs7o94ggbVXXrExpx4f1Ukz+US5F0gYeOmY
 YVugveZtwCQQdypnze29ynvsuwTpaEpp1CvDzZWpN3CUzkqDKpkWV9waW0e6MC2ZV
 aHTKpayCbFC7jmVW0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rwFT6+Cu
Subject: [Buildroot] [PATCH 1/2] package/network-manager: bump version to
 1.52.1
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.1/NEWS?ref_type=tags

Not mentioned in the changelog is a new build option to set the path
of ip6tables [1], add it next to the existing iptables path setting.

[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/57321f78c9aaad23099e80f7945ef996acbaa7cc

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/network-manager/network-manager.hash | 4 ++--
 package/network-manager/network-manager.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index a0963e010f..780d1205cb 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.0/downloads/NetworkManager-1.52.0.tar.xz.sha256sum
-sha256  356f21a15da51e4218fd4d0fd78cea61e067b1116a25cddee4af9df05062e92d  NetworkManager-1.52.0.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.52.1/downloads/NetworkManager-1.52.1.tar.xz.sha256sum
+sha256  8b122c73493a72f2bae527c125cebd87711671b90352dbe2b1788aba9575ac6f  NetworkManager-1.52.1.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index ab3a437838..8c517c49e6 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.52
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).1
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -30,6 +30,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Dtests=no \
 	-Dqt=false \
 	-Diptables=/usr/sbin/iptables \
+	-Dip6tables=/usr/sbin/ip6tables \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
 	-Dsession_tracking_consolekit=false
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
