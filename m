Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD194C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E2664023B;
	Sat,  8 Jan 2022 22:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyDzLSnTQ7Yw; Sat,  8 Jan 2022 22:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 688C840232;
	Sat,  8 Jan 2022 22:23:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A65191BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90B7060A4F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0J3-C2P_myPY for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:23:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F41B60767
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:23:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e9so17235176wra.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aKL2wpA3smiviV2lP8m1mNx1x14gZmWXBMsFp0nz1ng=;
 b=ed8Za9HvbHc4es2MUnDBnXcdO2x9JdEUAcYDvVzKItHAak0VXE/Dr/LwAvmtOdh3xG
 19n3NKJSvMbJt2qRdrmgUcHtn8Ky+b5zml7qfF1KSeVd6zo8JFTL+6ckR5O043Z+6PhG
 kmppcq7FoNcAW1ClDSNiGU1Kt8SatYgrplMVevEcyJrBC+9NWWln1IN663vPdpEXCkLj
 cSdz/sjil94dGq4rFfgyxGtq8dRLnUpSdmgqYgfaK95o4MHsmm17wQvjko/sVFQJpcKI
 zPtWftPD55aX6WdrUWgGwhiVXHPUT2zH/4pOC1JSHIDNqoItkwLrF8+hkHZny5Ib/npz
 8mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aKL2wpA3smiviV2lP8m1mNx1x14gZmWXBMsFp0nz1ng=;
 b=S0z4Dvfd3vggRb58LbE2Fmwh6euNN3PX5TADI31oqJKP9QbWW1Uq7hGpqUMJi0qQDo
 rZAd88i1xHpadak6PB/4jKePUARPzdTyX+7hWsIThDSg4IvXtXbzSHrXc8CIVp8slpA2
 sd+v1KmPTQPsDQgCsQ87XPkRHM9P1ZnnyQW+UeKK+GkjeVts0UJNXLpCeuTgCL01k9d+
 bzZa9j17+IpfjteJxHIh3F8ak5vb6Ktwi5b+WxysedLethrCxTXqwWiZ7K85GK2iiW98
 LC+JzZ8bCN8U+xd5l0Z1FgvMFje4eDjae50ziZdnKO2wx3ryAGoVuElA/PJ41bhO5PvZ
 +bag==
X-Gm-Message-State: AOAM530yrqGIRfkzEUz/7ilE8sp9JUm+cyh7insQJUXWZAPNt+RHE767
 RVeUyqWRgpKAoSshVfprSHFUwx7IolM=
X-Google-Smtp-Source: ABdhPJx0ZccK3CW9ktCAhJJFq6M3T28rNUXjE+pq/IqNt03zpW2F51t5pruTmEPdKoEWzKr0va9Vzw==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr60182305wrx.62.1641680580835; 
 Sat, 08 Jan 2022 14:23:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g8sm2409603wmh.17.2022.01.08.14.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 14:23:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:21:53 +0100
Message-Id: <20220108222153.3689389-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/snort: bump to version 2.9.19
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://snort.org/downloads/snort/release_notes_2.9.19.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snort/snort.hash | 4 ++--
 package/snort/snort.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 6df7ae5229..ac098564aa 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  2b4e30300ef6feca1f60c267e727c6c0  snort-2.9.18.1.tar.gz
+md5  b0350425e0c1e9c044c25aa13b47edf8  snort-2.9.19.tar.gz
 
 # Locally computed:
-sha256  da8af0f1b2e4f247d970c6a3c0e83fb6dcd5c84faa21aea49f306f269e8e28aa  snort-2.9.18.1.tar.gz
+sha256  b12fc6db72afb58987a2bf1954b8f45bde02047c235513c7663857b9506369c7  snort-2.9.19.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 54017d3460..41f450541f 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.18.1
+SNORT_VERSION = 2.9.19
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
