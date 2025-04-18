Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E63C369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 065D581236;
	Fri, 18 Apr 2025 14:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3VGdsqtN9wJ; Fri, 18 Apr 2025 14:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351F681323
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351F681323;
	Fri, 18 Apr 2025 14:39:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D0111F
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0395E42F70
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9Ew_mSNZ4EL for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:39:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97DF84321E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97DF84321E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97DF84321E
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:39:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.208.157.35]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N4hvb-1v6F5n48vP-014oVi for <buildroot@buildroot.org>; Fri, 18 Apr 2025
 16:39:01 +0200
To: buildroot@buildroot.org
Date: Fri, 18 Apr 2025 16:37:28 +0200
Message-ID: <20250418143730.23712-2-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:YfcNZmrVK0SLOfPgcP+XJ1FeCyekIVS1KHEr1MVgOdrY+AKvpUM
 u0i9OYt6ujVjyhLJ7vCU1A3yy+ktabV2T3iiUB9uTuO66LlTw3MunNG/CoiGoX5FJCBhYZq
 NnMTniuQryFHyaWgBETtKa1FjALgYmUf2nTF16pK2k3Pi4X3Dd61tPJuJ+7YAoAe6g3i61m
 pgT06tAb0MhYMf7Ml5vNw==
UI-OutboundReport: notjunk:1;M01:P0:OQRDY2PSAyk=;JbVM1rQ1QgSgw+Td47AgDr/b7EL
 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
 oRig=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1744987141; x=1745591941; i=dalang@gmx.at;
 bh=be60oXB48VlYgKNKOODdJnblPSW2da5OvSbab32y5HA=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=fNZMSN1TB13OeSJbYQdT/EvANeihuXk2Fsna9asqsHNEdjzCMy0q7+DrXJjs0Uwv
 eo6ia+sQfEwnUWVeJe54tS02EhsUZCHWSrneEzHyvxpQI/67PJMSGzvgUrtH64flu
 3AU0qvqICdg3iSd+6dPaxd7a2xosM4zx47tZElv8nAl/bgEGoTFOXa4i4OjIphgl5
 pae6VNher/lnQNqyFKgmM09/AhwrWISmsgIGT73vcgNo0qTx5be9DrilDW3rpmW0u
 aXAUa12YXQ/P0FAsowdtgaNG1AYZdCKPsF8J4Uaugf481JVyE+Fz4Q2zk/Wvd12BA
 d+RMEIVnjnk4gqQkDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=fNZMSN1T
Subject: [Buildroot] [PATCH] package/dbus-cxx: bump to version 2.5.2
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dbus-cxx/dbus-cxx/releases/tag/2.5.2

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/dbus-cxx/dbus-cxx.hash | 2 +-
 package/dbus-cxx/dbus-cxx.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index 4ed9d73bac..56dfcbae82 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c38456ed70023d93e6e689087e4bbe030f1650bbda9de7c035d6f4ebac788379  dbus-cxx-2.4.0.tar.gz
+sha256  a739a29efc9ad42ba6518b38e13bb44c12947d4f7503d211c12823233e277987  dbus-cxx-2.5.2.tar.gz
 sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index 8e2b4f70fa..e6aae036bb 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.4.0
+DBUS_CXX_VERSION = 2.5.2
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
 DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
@@ -25,4 +25,11 @@ else
 DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUV),y)
+DBUS_CXX_CONF_OPTS += -DENABLE_UV_SUPPORT=ON
+DBUS_CXX_DEPENDENCIES += libuv
+else
+DBUS_CXX_CONF_OPTS += -DENABLE_UV_SUPPORT=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
