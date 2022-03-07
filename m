Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD2EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 09:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EB4E40472;
	Mon,  7 Mar 2022 09:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dm8TOrrp9S0V; Mon,  7 Mar 2022 09:56:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E347B40396;
	Mon,  7 Mar 2022 09:56:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED28C1BF3D8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 09:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E982F815AC
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 09:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=audified.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IQFV1lJi4cq for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 09:56:36 +0000 (UTC)
X-Greylist: delayed 00:21:15 by SQLgrey-1.8.0
Received: from scanner02.mail.supportedns.com (scanner02.mail.supportedns.com
 [162.244.253.253])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0040E81324
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 09:56:35 +0000 (UTC)
Received: from [162.244.253.208] (helo=s1.supportedns.com)
 by scanner02.mail.supportedns.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <jan.havran@audified.com>)
 id 1nR9ln-0004Dr-VG; Mon, 07 Mar 2022 04:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=audified.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:
 To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTtLtuu/uaB6///X3CSf6Euj6RvuQrWWf/2kmz+v4Hs=; b=CmpaF5ry7yBG2ZmkjM7NEysJiB
 0grB5Oln5yye+rl63XGiOLaxvdPXW+4sJRXVXy/v+MCS+/UPaD9A9WcBaNWv5iCPvrrBq/Rsa7ZOX
 Bnl2S9UfFzeUAe1fKpPydTuSP5h9vhVeVVYi8pddmj3eQTMWp8sDelEfmcSGhYQ33GqaijNqe/rHT
 CK9fQxH4e3qDNTA0quK8MC0UeGEhwfhlQqNFLTFHDVgnO+Lno8kUIBz+dcbLljSN/L7TFGCiHUBT7
 ldK5r+nfPOe2aQMXOuReMoxOGE0QDJ+hFT1FKr//3IyTBm49t2iGs3RR/uBjc25BiO0f+mZvFt/EW
 Ch5SXU0A==;
Received: from s1.supportedns.com
 by s1.supportedns.com with esmtpsa (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.94.2) (envelope-from <jan.havran@audified.com>)
 id 1nR9ln-0007ck-I4 ; Mon, 07 Mar 2022 04:35:10 -0500
Date: Mon, 7 Mar 2022 10:35:00 +0100
From: Jan Havran <jan.havran@audified.com>
To: buildroot@buildroot.org
Message-ID: <YiXRxFsrmOttLX0v@jan-lenovo>
MIME-Version: 1.0
Content-Disposition: inline
X-Get-Message-Sender-Via: s1.supportedns.com: authenticated_id:
 jan.havran@audified.com
X-Authenticated-Sender: s1.supportedns.com: jan.havran@audified.com
X-Originating-IP: 162.244.253.208
X-SpamExperts-Domain: s1.supportedns.com
X-SpamExperts-Username: 162.244.253.208
Authentication-Results: mail.supportedns.com;
 auth=pass smtp.auth=162.244.253.208@s1.supportedns.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00645131855388)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9Chp9m+HIvtXJBqOHTDCarPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gE741
 MorrYTp3Q2sRstCycaO/tSxrFVzsbIOEYxo+kpKoFR7G4CDxv3qkX9mSMRuqPWXx2azEPCntGfKY
 yhVHoImV7BznWA0019tmBCZ0egyK8R7nxCYULOfy7ludBe2Yqk/fot9zk6afHB2YKtuAY6tYkAy7
 PO1lcLquvjHah/AdQKZ/6LmfyRFsGfqBKh4kLpR8CwVlrjZob8/qX7YBgn0MnhyuiI+nAIuKWhYn
 SNHXAdeXjCDBOomVNP9963OKUwZXTaHOP7oKW7n27myvseKRqlQE9b1hXhIRJ1bJW0V1UYfuzJ1m
 8O31zlHQ8Dw4NmzfO6ib3rryOBZGk86Mee0fTjrYxVWetnNJmJU0xg+4Ro+qoaYPDKfQI/iQ02Sw
 RkEqJ2YhaHYKPX4HHcW4fmLwMaxU9kdAsUlmPBVm5ea27cOhWXDfK9TM6YsdwzcbK97RSj4ScLDP
 7kMqPugOu2x6SorezLi5Ns+jiqHUYs4vIK/1NH5THMtlYvyHAYGOGiINloeONSMv6A+sGH/yfiSl
 jMAtJ8Ou1AejrJGC3KslqcVyvgi3CSrlr4MXN1OsIqXL02oiVHXkdX7f8FjevLNKC5XROoL23kHH
 2wGTQk+5wT9Zy3KQJnQJEecdHvi2TiSKfT7CA9xPZsL2NgPZtmghxPoESTct0v5flu4eVCQeLqi5
 qdcpdqU+BhmA5lIzK7Durnj0BmnqE4oDmeBwVyH1rJaoSVT6HPVKGY1p+m4qHL7vn0r+6mmiV6xb
 nbfM91z1pRXWhjh9fdbl44I0Df2LHdMSnToGnh7oyUdL0AoYfdT8cU4JbwpG9wnU6h5/wZljkqi2
 PdylKQ9l32xiDbg7by9QBeC+QdCKB3sSx1B9thRNgs7Ig4l/XErpYn3glWd7BMxKTTLmQIbtKN15
 yV5Ww7t0zMxjdDUrXXKvN8YFtaly/uPaPGs4IuAYIIDnngDDN8ifMVT2aXkkKNtx9gT1LN6ds+4K
 JfXy9tm3nWzZ
X-Report-Abuse-To: spam@scanner01.mail.supportedns.com
Subject: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.20
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix URL for 'JACK DBus packaging' GitHub Wiki page.

https://github.com/jackaudio/jack2/releases/tag/v1.9.18
https://github.com/jackaudio/jack2/releases/tag/v1.9.19
https://github.com/jackaudio/jack2/releases/tag/v1.9.20

Signed-off-by: Jan Havran <jan.havran@audified.com>
---
 package/jack2/Config.in  | 4 ++--
 package/jack2/jack2.hash | 2 +-
 package/jack2/jack2.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index bc883190d5..8abdda6376 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_JACK2_LEGACY
 	help
 	  Build and use jackd.
 
-	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
 config BR2_PACKAGE_JACK2_DBUS
 	bool "dbus jack2"
@@ -42,7 +42,7 @@ config BR2_PACKAGE_JACK2_DBUS
 	help
 	  Build and use jackdbus.
 
-	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
+	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
 endif
 
diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index df708f7ca5..6361473cf7 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  38f674bbc57852a8eb3d9faa1f96a0912d26f7d5df14c11005ad499c8ae352f2  jack2-1.9.17.tar.gz
+sha256  915ad2900992159bdb729b9fc4ea134b962ce32b2df0b384fee40a2c5808835d  jack2-1.9.20.tar.gz
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index e6a036bac9..2e55169984 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = 1.9.17
+JACK2_VERSION = 1.9.20
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
