Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B70C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 777848483D;
	Thu,  4 Jul 2024 19:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKmcFXqrgGb9; Thu,  4 Jul 2024 19:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 555AB84811
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 555AB84811;
	Thu,  4 Jul 2024 19:41:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4D01BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5416086D
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kX-3VdOhb5GI for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7A4060742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A4060742
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7A4060742
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:40:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS9C-1s0WYM2uaY-00ejcV; Thu, 04
 Jul 2024 21:40:40 +0200
Date: Thu, 04 Jul 2024 21:40:33 +0200
MIME-Version: 1.0
Message-Id: <20240704-tipidee-v1-7-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=1075;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=y2b/Br4h4MkfGKmKrQEketokwAfKjps1GmZBeNeEIZY=;
 b=7N59YfekFrIOpwo0EzRQP8GJyi3i5a5ErFhr1/KOkAhgiDZZO8Flp9rX+gIPRmSA7vXDO+XbD
 PD43W/JcD4WCRQzklLjfF6YBVTaq1jHP9CL8ejoPIB96qLJDK5I+5G5
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:Yb4k1YmzHb0DUmoQVyD6aZ95EnELvRXqaRSQzAG+lUajmoHW2U3
 KoDpsNcGM3r0u1RVF6+Cn+IhDKMNyhhGR/1MpK8eqf6FKeYPXSzAn83Vf+6aoTYMJyZzmq0
 O2QWBygkLxzwWufQljQhAJr0l4VOcTO8ZthwjuDY1mulQ+kUdmKJlJzMWOpCv50CTmIzfLo
 32tqW85X6qg7nlPOUcVuA==
UI-OutboundReport: notjunk:1;M01:P0:u3yJne1dJxM=;WH1/9sxkdhdaR+RZ8HWYsobV80a
 efYlERy0PhORm2i5M1JQt8xQTL7eVzvdAe1BUXTEnTWAPeCKZaPKJEmJdl3gEagcZsp4QyB8i
 l7WLXBY3umYYjNYVKyT35n1uJTgguDFBQbWs/gJpFLKwW07O8hXgi7a1LSWZTfpR+GpTKGZeZ
 nWXThOMwI5fmFWVKixjYXvulrhO99ws6bFRtvJRYzgCdCJl7thOLwBEfNKSYcUzjCMBQY6LX7
 eowse5HXoMKPl45SqKSAg4Bm7f5k4GT7FWHoVYT0SvxxNJmx8jygxdccB3qYO1eT44NqI5qU3
 A5285vmcVw6ok4xJagT1kHdi3qYjiBeBLfBgORYctdNXfOJdmTVjnZFEQl4BbfVtL16AAat6q
 poTN7gCOAuRsM5bFW6yuLmxPyOS29SpZnOX/ySRAyush2P2SeBLme2A/AqPTtW56ZSaBmn7qB
 Uxpg0aMxEaL+Il+tkCqQnWBttQ+51h/NAt4xSHZv4aJ95htl8bIBWVaHZvL5bvUnIpYPvBVSe
 QwYxGBKE3Oo75ZBpqKJiRMbK4HxQUNSSbcNuko0Sort4/0mqJqMy/XpEZvYSQ0gVHQJoA+CjE
 otNo7SPNYU/P+Dc+euCSDm3H1vETb3OiIAWkcsOtDe/z/lP+JCScz3H6uLDBtOVHCE41TtV6Z
 hZaGDcdkXyj/8pq+8nCQDZHYCcMQ/R6ID1ljMrNyXRpTbD3Bx2KAlxo1pnYhatqDtZUnvPTLg
 4Wx/LViMJLBIbhd8juaA7b5iFgOQv7urjLJyBaVSjiC8w6Ka9kA5+Y1SEwhXnMBSdAlTHjyDO
 AyLU7IOi8xQ+KWeWRTit8Bx7veQzBam84+skIaacu2lik=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122040; x=1720726840; i=j.neuschaefer@gmx.net;
 bh=N2QiugsnCF/b99zpZjQkzbrroglNvJxjx5bi5AG85yc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fB2praYAv63sbcXXnF1393SJhXdI/nlXf8obvACUwHRvRCke/BxqkufAWpF/uIrB
 VKfvcMM0maoBnIpwTBXkbFi9Tx0jjwcqhRsSmY6WdvrvI1LC8Pi9R06GqMkwu0VUB
 KzLA/4tANmypi8gIdAx2bF0ngiSbs0MRKc6JycBIwlI/LJJe/UbH7bmmmLZChaVWB
 gQlOg1CzmvJoXH0vsl2Il17dPQoYYBiO5Cs2gPvFyzUFstsZVuUtTSW+z1UVJ6fnP
 3YHjTTeBKmNbJmnnqby+TPx0K2wjVjU3MXAhB5j9Y+LURK+67kpCDxkSCR0nqsiyt
 pM3iBA3t/p2Ar2/F0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=fB2praYA
Subject: [Buildroot] [PATCH 7/8] s6-dns: bump to version 2.3.7.2
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/s6-dns/s6-dns.hash | 2 +-
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 334ea1667c..2c9023ec28 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  cf0258574ec7d62b654e0c2ad78af4c7d67ac4c9cb37f781480f597e54b30f6d  s6-dns-2.3.7.1.tar.gz
+sha256  6aee32bb68d01f5109f71e31a283213c668cd3c0e79fb9e469e6cabb58079f2b  s6-dns-2.3.7.2.tar.gz
 sha256  aafa4f6a12b5b24ab2ae8ead5174e1ec03aecb5eb0e82012d74fd47ccfc57607  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index a848f2e6c0..8e175431a4 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-S6_DNS_VERSION = 2.3.7.1
+S6_DNS_VERSION = 2.3.7.2
 S6_DNS_SITE = https://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
