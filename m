Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B89C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CFEE83FF4;
	Thu, 17 Feb 2022 21:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AI_GNNa2zEg; Thu, 17 Feb 2022 21:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C9182848;
	Thu, 17 Feb 2022 21:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3ED51BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C18DB4163E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqcfd68LCUiF for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:45:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E38D41507
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:45:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i14so11236220wrc.10
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U79CbIKb5z5h9KvSbmI3yHpvvG+uO/mDwTHyKtAZL54=;
 b=DkxO8LB7NhgZT1gKRvSxLOD112qIzlb0XwI/wvNbFZPvP7NmpR0tFMhZ4pZwrSkbQo
 mUJZNukrmkO6pIHpdoDLcZaR+3jE5GE/K/4A2Basug9AcKIyzrdEesWxHNR0HHfom372
 AQ06komu3s3XPdDQpRYZi7y54alxyywND6TDBFQzJtnMJhBX8lFMthgGbpdeFaCx3DE6
 5dgTNzBOP1kpAJ98uP6XAZ3g2UlF+Ax/d3/6jCpSCdwW3rJAjBfdS0dXvfwIZyMHIFfS
 bh+i2Rc7/WLPXacgzQ92H2EIg5OQowt/EKsOASQK4b5dY2O4uNPzSQiUVENG9EnxIa03
 QDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U79CbIKb5z5h9KvSbmI3yHpvvG+uO/mDwTHyKtAZL54=;
 b=KHFZ2JgzOt2LzMnWveyfdr/0gnl+VXO+fxmPUIeJsfTZvobRzt1IkMzqdyyfulI+0S
 +QdhgezUATGIp7U2EP2daQRuz/va1YtJOGDFgEvBPufmLOOW5cm2VZYQRcrBmqr7b+Du
 j21Rp0aeCr/Vg7UMZR+/ZJJyIquGge4ojXLxSUw+m1S8xx5H0J4gY12o9558kLfny1Bs
 El8Z8WrKOrRj1HiNEqDFec96Ce5y7lbRABZoeD79DCkvzTOyu+NzeG0RX5YgoLg4YFju
 SKMV8AAHoZ63gPi+Wm6nL1buk2Ulrm2XOcyYDABfPmBjLCXoxUTMVDUJiFQLVeH6rb/j
 Hjbg==
X-Gm-Message-State: AOAM531uGs+S2IihMp1CIX8Q5ySyRqtgKIXQ5fZFvDx8kxWA0fsSLCKl
 TsW+YYUtEIB869r8M7AFY5n9t41o9Ak=
X-Google-Smtp-Source: ABdhPJwUNdt0/EIDdKd5REKdPzdTuZ/PJW+ztCl7s2REaa/gUEbmNOYcgq1mobQwrgyu5Bq6k0K6gQ==
X-Received: by 2002:adf:a482:0:b0:1e3:3e5f:496c with SMTP id
 g2-20020adfa482000000b001e33e5f496cmr3704824wrb.606.1645134326965; 
 Thu, 17 Feb 2022 13:45:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u11sm39807102wrt.108.2022.02.17.13.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:45:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:45:36 +0100
Message-Id: <20220217214536.555637-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: don't override
 ARP_SCAN_CONF_OPTS
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

ARP_SCAN_CONF_OPTS is wrongly overriden in a conditional since commit
df578c86eddfb5d115195d3650d5ecba5431e8fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/arp-scan/arp-scan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index cc1efe84a7..3fdbd463c2 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -12,7 +12,7 @@ ARP_SCAN_DEPENDENCIES = libpcap
 ARP_SCAN_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-ARP_SCAN_CONF_OPTS = LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+ARP_SCAN_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
 
 ARP_SCAN_CONF_ENV = pgac_cv_snprintf_long_long_int_format='%lld'
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
