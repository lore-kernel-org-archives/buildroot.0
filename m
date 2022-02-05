Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734E0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F416840018;
	Sat,  5 Feb 2022 14:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ySzQycOyTvkB; Sat,  5 Feb 2022 14:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10F7440354;
	Sat,  5 Feb 2022 14:13:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41B221BF45A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3060560776
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3ATVmbFJa29 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:13:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A24D60608
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:13:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s10so13972390wra.5
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gE8F0RD3zDyIsGPBDfILpN8wRCRFv5dX8p1oNJrdjQQ=;
 b=ezwLBrYk9r6OpVPjf/uHWlZ9ALzRJmPRhPIi7jsGviVNSnsk8JApbo0yxkVHrvBHgM
 Vm+p5sYkB6QeHWSXk9Tw+uFlsU+ERAECQ+dWetVS9z0Mzai6ssOERvVh4IXDu/2D7SB1
 w9U8CdzpUlz9lim+ujeEP79sL2nuqrEwf3eZfTnYPzmZ/Q6OfG3bROzo7A9BXUYY8/KT
 G+r1f/SkVoDknTxiD8cscvcxtouYYWL2oWfPCFF4+iMFSZA8NwmYomYX3xOgOirupZgI
 2PYAaAU/XzrXWtDTe4cLrY3vMejf22Z2xHTZrqr/c51ax5dLRCbGSnQ4lIDxaZGFhWL5
 ilpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gE8F0RD3zDyIsGPBDfILpN8wRCRFv5dX8p1oNJrdjQQ=;
 b=RMRBAMIL4wLmLa4hEaPCeBzgj+8+9w3G98wygK60hFKv6NXnn9X/AwsUoj1ooFrevB
 R22ARfE6AXFHWOR2D+5hr9TgBE12K/Ej6kQBM0iVKFDb8Yr1qLOJmRFOkT7LhHoQ5c6W
 dY4QadgAt12gacGjrsrgplJs4bDpxtIqPXxpEu/w/5iEbrbOP6UgsjPVnNbIEDLQAOUx
 hOJYutRo9B4sks3kzuISR8bkub0mLgn9fJElH3VV90J7VxSf6+CQ4aBi4A5dU23O49DW
 /1l4ooV5kgu68GB0gOZpcy0axAXa+Stj4oyEPF+dRUtKB6MSvWAAChXUIWsICQUBeBmB
 okSQ==
X-Gm-Message-State: AOAM531jGg0c3joK3a69ohyZDtU+oPUZnBQUp1RzdSgO1wgb6s2C2RzP
 zZKBCFxi7ZIONOmHYyq4/3/bdo5MyOw=
X-Google-Smtp-Source: ABdhPJxw+ZMDNFucu+X/cjfWdnLk532aw1ntMuxLZL1yXBwx/vNhaDbCd6gkfA5TvlcXctCBkx20DQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr3131525wrz.391.1644070418174; 
 Sat, 05 Feb 2022 06:13:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 1sm5365412wry.52.2022.02.05.06.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 06:13:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 15:11:32 +0100
Message-Id: <20220205141132.419654-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgeotiff: bump to version 1.7.0
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OSGeo/libgeotiff/releases/tag/1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgeotiff/libgeotiff.hash | 2 +-
 package/libgeotiff/libgeotiff.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 51adcc2843..ec9fccb492 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9311017e5284cffb86f2c7b7a9df1fb5ebcdc61c30468fb2e6bca36e4272ebca  libgeotiff-1.6.0.tar.gz
+sha256  fc304d8839ca5947cfbeb63adb9d1aa47acef38fc6d6689e622926e672a99a7e  libgeotiff-1.7.0.tar.gz
 sha256  6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index c6fb61b4a2..c49528565d 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.6.0
+LIBGEOTIFF_VERSION = 1.7.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = X11-style, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
