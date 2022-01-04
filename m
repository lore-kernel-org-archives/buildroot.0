Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAAFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F9C960EAE;
	Tue,  4 Jan 2022 20:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpS72tDzoPoI; Tue,  4 Jan 2022 20:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E51A860E47;
	Tue,  4 Jan 2022 20:53:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B007B1BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F10E60E47
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2yWI6RZy8kiS for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:53:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA8B660B8A
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:53:02 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s1so78615901wra.6
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prC+GcAaCFMmTUOLmkrz0gFg/4A9Zn+NERPZ8aBqXw0=;
 b=ElUHZfQDIKdx99Xu1pwAwnr/VL5FjYoAtUgYTHJSnSqjau/yTHBhB7fOFIQvh5fowo
 sVjGRlQtDCpnaKgSDBr1yQ5tlRXdTeFILPyNo362U3jHnunWZH+rSR6XbG87LPxo7fBn
 b1SrxgMRNkXcFxgwGLS/JkDNE8iuh3THg3PszEycTkt6O8AI+YYhIEAhHxd63kCsmBNV
 zznS3j+fAQtHfKM0plHxpsidI8bUvgnc0Bj201rbbJlU+msA4KmQe5alktYPJzLodfZ8
 w2Hj6lwzOVzf8DX+sEg3MjBq5d80iHDpLs9BbAM0X/TJM0AggIzF2h7QXrEq+NhdzHqi
 6S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=prC+GcAaCFMmTUOLmkrz0gFg/4A9Zn+NERPZ8aBqXw0=;
 b=z1HyRAyFMGQoqqRptsPXxJSGjyUaLsyD43N6vfjcI1h4sHjmkZ/rY0YlEZBvR81mzP
 +mMz1rvWaxnodUSRbXwqlTcAL5/fYc1pKIQ9lPC4CspHYp6agtkbDc9YJOYVUGc9JSks
 5Hhqjqo7OdaK9G+4AM1uMcQ+9ZRIehuWkz10Us8L/9IOybh4Uhbksoh5Uhbvr2Fa5IRB
 4kzRPSKHYs/Uoi+iTfFnTH+bVxjwk2kTBjs3p2lZ99Y2qb5sWWxKOcXBI65V+ihZ3QcU
 wtVdXxclInvbmPr4F7Ln24s9LOsdyCDEyJpyS+Cy4xqFPr5ixzmOSr8HUEwqhLSeLoYs
 9sYg==
X-Gm-Message-State: AOAM533jhNa1lpGhV+Nt1ckrstCsQhWVFSHylf4VnoIjN38iJMiv9rfc
 jkp3djdO09M3jw1cznNWf9px6Tuqj90=
X-Google-Smtp-Source: ABdhPJyP4kFeA7ao/W6uz0FiFB48XXQxJKrwvEUtLSyfI3uSBCgJHKOX4to/t94n6lFxHQccnEPSfw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr43525392wrr.304.1641329580785; 
 Tue, 04 Jan 2022 12:53:00 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id n15sm38405009wru.66.2022.01.04.12.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:53:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 21:52:04 +0100
Message-Id: <20220104205204.3632035-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/4th: bump to version 3.64.0
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
 package/4th/4th.hash | 2 +-
 package/4th/4th.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.hash b/package/4th/4th.hash
index 36d2941055..ae08a6bf5e 100644
--- a/package/4th/4th.hash
+++ b/package/4th/4th.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f822f7dd8cfb0b1744a62d653c6efe933578ae1789ec60a088509a38bca4b4fc  4th-3.62.5-unix.tar.gz
+sha256  c0905e92316c151224858fcfff21c143c85efa4f9f1b2ade3c64cfd988e0a6a8  4th-3.64.0-unix.tar.gz
 sha256  8c6111b645a02219579ea66e84aa8e78a0ed4f4dd80857ffb91bcda5528717d4  COPYING
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index aee59c463f..d031c0e4b4 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-4TH_VERSION = 3.62.5
+4TH_VERSION = 3.64.0
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
