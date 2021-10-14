Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB267C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:00:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3417D60EFF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3417D60EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C2140768;
	Thu, 14 Oct 2021 22:00:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYLKIi-GY_-m; Thu, 14 Oct 2021 22:00:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782314073E;
	Thu, 14 Oct 2021 22:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59A4C1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 472EB4012D
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 351rzGIjRcFI for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:00:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C678840255
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634248812;
 bh=c12wdFHoAgezRd9iIgjKwvRyX7DIDSHaU/hqlNPgiJQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YsWpAOQVoKERqFpr38TwGpcozR7JVBl2EPwFoFoHa+JZM8avO0xbqLAOoGCFW6+G9
 bvneDLqlKfANJWWVSzur+WV2tPEU5gVJxmUy1Y3wrQQQToaS85ABk+OPNA6U9FEk5w
 5iLIoRN87Jq2yzVkGocIsQT3TZ3hdgjb2k0Fz9/8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.156]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M6Ue3-1mdcoP1MiX-006y35; Fri, 15 Oct 2021 00:00:12 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 00:00:10 +0200
Message-Id: <20211014220011.17230-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014220011.17230-1-ps.report@gmx.net>
References: <20211014220011.17230-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:63s+q1incABLtS0RRrhWMUvN1bJsXBibKWVP2XWsYfjROmuw2ST
 y1BRVpfAMnp8EMzz8ImdlRgsJBSIjGGkQP1pV7bt1tsf1WMdlwPIYyMvABrN64W4pt/yu6T
 lBOEmPqKfFFY9jnYfzrm/r5k8/v4ryhqpftoC6cCCPtmrUTmSLCNrbzdVIKJUsIY8tTe7Ze
 1wY7Ne8kW+SL/L8PmCkXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:deJC/jl1WTY=:rGcAilKe3Ce0VjJ10XHRCv
 4dyaRE+KqBJdKRD8ynT2XiURH8LM3kEEb13DR7/JeSXn/Eh1WJTF0VUfb0Ydo+94KIiihR2RX
 tM4JMtlMTsxxmX2YmdA63pim54Dp/DblUw8IgWhJmwn88Aw1g37nKTOerIvWRFb5D3dCyNcaW
 N45NyyHA+Nzn8Vhc9s4ObfT1XW2Q9YoTflLxO0TKMhYziFxhdaJiKurs27HOPy2qfV+pbPTtz
 S065CaL1n+/N1J9z0k5il+Bi56z5cF3IwJkHTeDZbeeEUkplNAT5COzAFC7ppUeKzzM8/OWbf
 7GreQe3+qyGfHJzuYB8VbNKxJXbZjjUSwaF7md+6jd4W3a9m/dkXV9WO5eF6WiXTMJtqsS9j4
 sgtsAnYF+twfAxKG/elWfl+y3w5oJ1OgNphDGeu7tmQsg/rVvAQ/dCCCo2orcx3E8G97R8Ejg
 zII7dLDbS3rEKt8C4HaGjOa+O01fxTXLSld81dLU5+MYqXjAbqvpeOrU9j4tW1bLL7ugrFkYG
 tYhq/OTWwhM6UrDtJN2kzHnbQamo0FO+K5bZuqPNwwqh0GgK4MtlRlfVpClkukpRaZD+EkPBT
 fwYIZTvfhfNOAJ7a3aqnLNDcGc3kVpJmTo5nMtcFghnyrhatJWsRrPdF+rpzr24H/ehbfZSC+
 lZ0Qg0wfYNI7JBMUw+m8px8YqgR688gAsuHPwljzizyfJT0uXpZaaJ4nspC8gscdB/ykn3/D6
 plLjXtelG66Sw7A4ckjX4cWZ6JjR85IPEfLgEBgalaSVmLcgZM//9zlbK//DbqLkXE5uvc+iM
 A1vOv4UJHBoHyqV07Jp10a79lfuIK3pHzDwCctYLYj9L/9kX7o6RZ9XuXmT9Acd5PjknSITZy
 Av/MvMQT/WXO1GbvTTZi7kRsiX3UVwOJP76WeGcP0zrc8LXdLPESiG3qR1hyCzG1eyIt4B5q1
 2TSNvfFOGbHcTR5kkxMl1ws4jDgo5bi2zat6B+/cSVVGF15QAOadpw6pZBc7C6EagTOw4G80y
 XIOHaV66GpgXQbG9uRxQDVHL3Ygha29Yv5ny3PRUCfL/SwOfIAZjLrnUDroEHxk2ibrdfataH
 jCBDH713rPdibw=
Subject: [Buildroot] [PATCH v1 2/3] package/nftables: bump version to 1.0.0
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

For changes (since 0.9.6) see [1], [2], [3] and [4].

[1] https://lists.netfilter.org/pipermail/netfilter-announce/2020/000247.html
[2] https://lists.netfilter.org/pipermail/netfilter-announce/2021/000249.html
[3] https://www.netfilter.org/projects/nftables/files/changes-nftables-0.9.9.txt
[4] https://www.netfilter.org/projects/nftables/files/changes-nftables-1.0.0.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 1112b7a8ad..bbf7e5a2b1 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  68d6fdfe8ab02303e6b1f13968a4022da5b0120110eaee3233d806857937b66e  nftables-0.9.6.tar.bz2
+sha256  58bf547daf967a2b88ecb4f425f126006ebde22711db806b25c1d6cf84fe45f4  nftables-1.0.0.tar.bz2
 sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index f9468c5250..6a27975a53 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.9.6
+NFTABLES_VERSION = 1.0.0
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
