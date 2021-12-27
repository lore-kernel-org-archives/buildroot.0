Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3692C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5813760A75;
	Mon, 27 Dec 2021 21:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8ybNkwlkYIB; Mon, 27 Dec 2021 21:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B759D60A6F;
	Mon, 27 Dec 2021 21:55:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1181BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A937813A1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTep9PAgsR0X for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:55:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8137D813A0
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:55:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d9so34710622wrb.0
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 13:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IJjjtx7m6AffTQPNvO95ql6kJvuPPg7ts3KydqkfO3I=;
 b=MReVJC8/gWJYglNKakK4RXyhvtoOoOuQapP6T/GQWFe0hGy0feuVPnkkukXU19M2Ov
 k60Dsapptf9gw1GNOEnCCNFMVUV3oIsBwxedjCWYoE3F7MuDVzNn28uLG3TU8BWxilSx
 q8S9EJtRlcUz/OVnkwypvw633dbTmxWyHm+gOVkJfF8C8t7xnmNDO6ZZ9tudCmz+VS39
 votPVICtoCKRUTPcM/0vu/i3hrOD/Cnz7fvu6d3zfmTNTt5kSoDD+bHLrWHblE2I0vJK
 Vp14SWtjRRM7XG0dIOoCU5TjJ6mS6SLt/qjCgivI/2d3Ktcak6zUtSN/mqSeiBCpEwz9
 hZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IJjjtx7m6AffTQPNvO95ql6kJvuPPg7ts3KydqkfO3I=;
 b=3syUAYDj4AgktDQerKtCQux0cTV85NrbkFd58aNJSk5tk8/406aC1+SEjBKi62x2aW
 o59PBgZpu4JjWcNL40jOh+CcRzxCm7CwLmZ8zp5EKraGbEvP3uolrS6BUS1X5zhuBmAb
 /GlUeGqnFV4XRU6v+PkdIduMUbKhhFZmDJ6cWgzUD+kkGIH7iPXACJz5vAKzZkt6npgT
 jtxyac/b29xbruq2g4oAdK6eAkg+nSd1gKRxjjj2HTcKaZ1qdGkS2GB7pMGHqBYx34t3
 MKUnD3ZAsNDzJR7LTxolDm/Oa9zUm5mcUNzrXnmpojEIZ3ejDmDMVBuuOpQ2MMbG7K9p
 AcoQ==
X-Gm-Message-State: AOAM530GLS/KSQpPlxHYMeSJWjhvv/Osu8JOvMX3x7e/zI7ZoJrUqmQU
 ZIBU6JpNwGO9bBXdK4MRmxoX++gdLsAnXg==
X-Google-Smtp-Source: ABdhPJz5ob9b9TkmwUWpuJGaRSXstuDKJwodN6819tUQGVlztsqeqbbxuFnUElyZZw3J8GVUzJMILw==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr13990522wri.483.1640642148694; 
 Mon, 27 Dec 2021 13:55:48 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id a24sm1439052wmj.8.2021.12.27.13.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 13:55:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:55:08 +0100
Message-Id: <20211227215508.3075685-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: bump to
 version 1.2.15
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
Cc: Philipp Richter <richterphilipp.pops@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/arvidn/libtorrent/blob/v1.2.15/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index 8198a1ff9d..3f59642b72 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3744ac9fa41f6e6ebf79538a2ea678df76a2cbbaf3ac6ae2c05455314e5cce8  libtorrent-rasterbar-1.2.12.tar.gz
+sha256  c8ad8638684c0a903ebabc30490079e31b1a6a638da2adec5a8bef6a0e62214b  libtorrent-rasterbar-1.2.15.tar.gz
 sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 7f60252e9b..914e0cbca3 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.12
+LIBTORRENT_RASTERBAR_VERSION = 1.2.15
 LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
