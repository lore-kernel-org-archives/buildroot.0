Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F54AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 22:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBD7415C4;
	Mon, 24 Jan 2022 22:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9EN9NqTfh-W; Mon, 24 Jan 2022 22:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E7E415B5;
	Mon, 24 Jan 2022 22:20:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FAC61BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C3D081414
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PSLrNoS-ISxT for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 22:20:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC091813F7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 22:20:21 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c23so601572wrb.5
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 14:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTd++9B+kfJYEeXBDVWCLghTtymHY4rijbjjSmjZd5s=;
 b=e23JSTwenR2r7aTQHI1qhc5NRrKOJ8miKAT0vxpGJL0mitECVqSJEg2NbmAqA23wtQ
 L4JDLAFqk1Qbdi8VWMOpHEF7RCXmgs4Ttl31fuBTS0grElHQx+y8Xi/FzqeUdrPEaMuo
 rsBcVlAx+sX4jAdLRMxf3pTHI542TaFp/Uq8sgYYNQ8pxAhC7MObVwuI2VjJUFVVM7gg
 me2+PGX6TH6K0I/f1l03zGkJRrKQtjjMk8bDB/YL4hZ6lEI/X0VSzTBIW4GT33ngWsBS
 zLrdnfkqqqBUn+3lWO8xDEYncyK1laTXg7fVP8jnXxU4F2z5EB3KDgX9BWkVDnE4cMMi
 uFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTd++9B+kfJYEeXBDVWCLghTtymHY4rijbjjSmjZd5s=;
 b=2YhuuQN9RleoWabQGpjaAqDUZdeuzEIlea2F+xXZIFWwlaJJeXLoNK2BTqhmeTDF67
 d0ucUmVAnH/qzwIldy/7J6dyoLNyn1uhc7BB/RU/ia/szxYIltLNKSETsks6i8yHjElc
 r1cNQeT8CEJrlcFAw2q4JPgEWeQBmGhCmw+ZYG6/L97nAEPPYGbHJtvGGQEca5QrI4ca
 6Q+v0gevqgfTkIjLiJS7WF1ofa4QRDz5wT1PX1X8DqXUZilMaTFpJ8abeq4LpD+/zTC9
 cJHPBU9TN/fTFTFYHDtRBQvVBBJ8/XI5Wq0h3TcZ6rah1fzkomRNZhJynbOIGTsWZYpl
 Y9TQ==
X-Gm-Message-State: AOAM5328sHeYC4xzUk45Owl+awSGqu1gSgAYEE1z0ErWUknZtovCadJp
 18nzpQSqZ/naQrzDD+S3/PPiHnYWRnE=
X-Google-Smtp-Source: ABdhPJxjK8mdAg5k9jC+CfHOPieP3cbUK5S/yg2Sxuj2LCvfFwboY+OpFRE+pCuJYbCmxqMa05yCPQ==
X-Received: by 2002:a5d:4803:: with SMTP id l3mr12235205wrq.339.1643062819929; 
 Mon, 24 Jan 2022 14:20:19 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id a15sm15035099wrm.39.2022.01.24.14.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:20:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 23:18:38 +0100
Message-Id: <20220124221838.2630565-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.5.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/whois.hash | 4 ++--
 package/whois/whois.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 1478d60697..4bdfd74b20 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois/whois_5.5.10.dsc
-sha256  2391037b079695d0e9fd3c85ab021809a539cf093d25b6c51ca65019a54158dd  whois_5.5.10.tar.xz
+# From http://snapshot.debian.org/archive/debian/20220103T215446Z/pool/main/w/whois/whois_5.5.11.dsc
+sha256  966281eb8301c14a1acc17e46c70061f73179d80e370aef43065c22f0947fb87  whois_5.5.11.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index c5d0a6f2ad..544cb9c2f7 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.10
-WHOIS_SITE = http://snapshot.debian.org/archive/debian/20210606T204545Z/pool/main/w/whois
+WHOIS_VERSION = 5.5.11
+WHOIS_SITE = http://snapshot.debian.org/archive/debian/20220103T215446Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
