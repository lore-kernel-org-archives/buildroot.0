Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3002EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFFB640AC4;
	Wed, 16 Mar 2022 21:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoLmUtXfFDsn; Wed, 16 Mar 2022 21:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D20340ABE;
	Wed, 16 Mar 2022 21:37:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21BEA1BF9C6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C394171A
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7-lXBg4RMUS for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F12F34171C
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466576;
 bh=oIZnnSoop3I4cfJ6NIf52ynrXjTkAX/EgAqpVB8l+Gc=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Vp9BKHzRtNpjb/2NrxqlWStehWPKfrmfDldio8UCE0lp4MxH9DmgmgYg+vjNxZY+d
 3dpj3fgGdBig/TTmzgo6WUP0jonkQYtKFsDihnr2aFW4s4isAlKePoYOO6RPBxdtvK
 vhMwr8lWWgqVYtxI3Jt32SlPDzhjUWWgLZPSnitw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M6lpM-1nSvp344sQ-008JA4 for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:07 +0100
Message-Id: <20220316213614.16878-6-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y2dM8NZPjea/e+dsxacbAksTT+VJO8K0qofcyU351T2LXIpEskC
 hFjrnS0KctJ548Cx4H0RPY542QJ3tprDSYcRFQbGWkTMA10ooKLvc1UkzL5cG5kAGSN3F1n
 7GDCL0y2j+Opl5fJ6+tEfyUeRC4YPaX8hnWefD7etoDAJVYZZ+Buk+q91S08EvBvym5vIxK
 y/tIgQCGZCBJALQqOt/Hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PT5/k6j2OW0=:x3OBZTEwbqlrKB4PD8vcSQ
 +bNL8IQfMTUquJl2Eg64uvv5dywULPRMB4RbpiJC+4tmkZFwJ9jSBcaF8CtrnUkJQ4eJUsxZs
 5afLk1vOk+NXMCQatE89aRaYxHTBSuiM1cje51rHOC8YpuZ03DXTxWgO9v9fhbraJlQwluUjw
 WrMumFFiUfz22Hz13PBQnNLrCS1wZYpqWrkWRdsZePhxvZEZUP5X/Uxa6UjJCnjgmpD3I/SZL
 dUF+XEeWi0CYjGnIXwg1bMFU2KZJiG49IffR/+8P3XzE0gDzYVl6m0XJ3TP+MG0vOP4q0ZVvu
 KmBuK9w2RNLgNd8i3b8CAh3c/gdmsuk86i07LGTBwc1YtWgHNbrPIobQbBbt08809tm+0JfZt
 5JW/qHBljToB2pEr5ayiHpQj+lPa3i82J37hGjVQI5ysKuRDB6eOkdGq9ewkr4ZzSGH3uaT13
 BBum+0Lw/dWzxTXcRdqEBEwBqI4Y3WypGnyhMX8RP8CU+GG5Y9cacV0b1dxl8RqYF1cqNgT1y
 SH1ABR0LQOdUtMWrouKwLfBEugwNgDjKN7yESETiSSdjfy2HDsvP/2QoyuDqtbh1BUTbeTVEK
 UoLF9zLgMRiSSXhZw6wUmsx3ynlMMdjGXn0Z5JJTFQaTrnHYO+IqN0ueu9mu7zHEVe7cL0mMc
 bBik9+NuNa11Ovk/axgM7SNpjh9a/3VOSloVz+iq7K7fc2hc9Tn/D5F0vyxpovsoUu0ODA6Gz
 UWXGI7sDrolWyoi1BH4CemY7IO/oNNgBTSZ8xn6kAuQ5j3rhQh4dHptLJr3GrF93hOFIULAB4
 u3tVsX7Skrt40RfTQZKrF0gMHcUjGzxgtan9whlI7/h3wXy/e0ljxHO/Sy2SMI423V6vglszI
 s8xLxf0FmZyn+dZnAKLI+BcMadd/DZYyhNfn6wDnDRzHHb2sHgIgxeLQF/5DcTWEuG+zPPWcF
 w9s7ADTp1Ts0Tb4jEx7Sz4e+AsonZPdQ+ze4cU2Z1ZXI0eO6YY95OLSSjkAbLuZbwxRiHeJgO
 TnpC/F2bXpcCUIt63Jid6g2AeH+YSLXzkbY8o12aiGRB+taD4ld+zdmff0BJW7ZXOXk5J37Uu
 0yyWyvGeGtHqOk=
Subject: [Buildroot] [PATCH v1 05/12] package/gst1-plugins-ugly: bump
 version to 1.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index d16134f24b..d022ba3180 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.0.tar.xz.sha256sum
-sha256  4e8dcb5d26552f0a4937f6bc6279bd9070f55ca6ae0eaa32d72d264c44001c2e  gst-plugins-ugly-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.1.tar.xz.sha256sum
+sha256  42035145e29983308d2828207bb4ef933ed0407bb587fb3a569738c6a57fdb19  gst-plugins-ugly-1.20.1.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 05b1fab304..be45d183f3 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.20.0
+GST1_PLUGINS_UGLY_VERSION = 1.20.1
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
