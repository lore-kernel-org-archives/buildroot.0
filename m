Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C0DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 10:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B403B40447;
	Thu, 30 Dec 2021 10:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iYVdce_GMB_v; Thu, 30 Dec 2021 10:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C159040169;
	Thu, 30 Dec 2021 10:08:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 985C41BF420
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 10:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 863AA60BC5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 10:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ksg3QA3MIPR2 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 10:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 796F260B63
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 10:08:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k18so12749629wrg.11
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 02:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMutEv71E6LtbHPXTzKpeP1SjNZsR5wxmm1JcfMDuvk=;
 b=RIXw21EwOiMym/9n7o0pmLLK7ODDvNJndaEw6jYlVSQ7o7mWH5UdXBODAfpTSbzZKu
 WY9bSEVMq7hi685aaPolL0v78Q6E+jg+9xkbXyFfaKxaq2KBQhOkh05tNdI2HoJdcXDJ
 muP60LFiha2nS+OcUkxwzhJz3wF/+JMjSan+BVr68axYIXmqbm0bfVr4/lQ4J4vUoNop
 TxI1hJ4OZMNG+ernacjOeCAahRBH4U6Eh3ED/LJRf7atw91YuPXQb1AmYRwqN37m0GDp
 GDWqyCvGEQ20VFLz4Hnjs38VGJlZI9akqUosMRavazNCqxS1Tom74jX0kXgMXylXWa+0
 awiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMutEv71E6LtbHPXTzKpeP1SjNZsR5wxmm1JcfMDuvk=;
 b=RIGpDQyHE86njG8e3JgJFydzLzb7m3+iL1k329Rrkp7HyTbuuU7sAYN7of18sv1OQN
 RxJ1yC/jxT88HBToYXHq+3jowbD9SHoAocu0dhaKMgoVkekY8p33SpKHK8fd50ZGRQsj
 gecrOMF+jMDUEFdyjd/OxehxHXBqsKlTp2jGWyX9L0vM0R4Fy/fGGB40OxT39DZpWC9R
 og/qBKJwwj/jh7JmgqWP1qrJ4+78B+8Wj3+STM0gvA7Q9f/XM1f8bIcG9sb8ejXu5mSa
 62mxXsaYb9wOiNJAo9ageGlVnAwpq/xSSX36LVkn7vTb1/ao8eHcFJ2UPpQY0CFgB/HX
 Ib5w==
X-Gm-Message-State: AOAM532GRwqz3S1eikTFw8iH7uk/DoBHOP5t2pEup+rxj+WrG6hKq2gp
 XS0IxM8VhZI+D3Ctjg3zomU0tlh4YQM=
X-Google-Smtp-Source: ABdhPJyER8bKt4UoiJrLmRdEmenu/5HOvrDS5yJM/qcTpX17wxS+oeSx0h1DrCGbv1SCVt45zI8qbA==
X-Received: by 2002:adf:f150:: with SMTP id y16mr24766537wro.176.1640858926352; 
 Thu, 30 Dec 2021 02:08:46 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id d11sm25567826wri.101.2021.12.30.02.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 02:08:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 11:07:15 +0100
Message-Id: <20211230100715.1846019-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/neard: bump to version 0.18
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Retrieved latest release from git

https://git.kernel.org/pub/scm/network/nfc/neard.git/tree/ChangeLog?h=v0.18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neard/neard.hash |  3 +--
 package/neard/neard.mk   | 10 ++++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/neard/neard.hash b/package/neard/neard.hash
index 948314ddd7..1ea95c938a 100644
--- a/package/neard/neard.hash
+++ b/package/neard/neard.hash
@@ -1,4 +1,3 @@
-# From https://www.kernel.org/pub/linux/network/nfc/sha256sums.asc
-sha256  eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36  neard-0.16.tar.xz
 # Locally computed
+sha256  c013e3115315e2e11d16b5f0f1c8ce9afbcdba26800aad91245fd9b4a5dc938b  neard-0.18.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index a351469102..1ab3aa353e 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.16
-NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
-NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
+NEARD_VERSION = 0.18
+NEARD_SITE = https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot
 NEARD_LICENSE = GPL-2.0
 NEARD_LICENSE_FILES = COPYING
 
-NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
+NEARD_DEPENDENCIES = host-autoconf-archive host-pkgconf dbus libglib2 libnl
+# From git
+NEARD_AUTORECONF = YES
+NEARD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
 NEARD_CONF_OPTS = --disable-traces
 
 ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
