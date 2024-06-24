Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE16C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 07:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A279F80F92;
	Mon, 24 Jun 2024 07:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pn9ekYXizGaE; Mon, 24 Jun 2024 07:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A15BA81359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A15BA81359;
	Mon, 24 Jun 2024 07:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B87791BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A428081359
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpejlA_RBDsD for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 07:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 352FE80F92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 352FE80F92
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 352FE80F92
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 07:02:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1sAwXZ3xox-004gFF
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 08:57:22 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:57:22 +0200
Message-ID: <20240624065722.11000-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:uUFD6B6X9ccMPWMy6vj2SgQxN11JDR8hOJRRC1C6k2iClwYvo6x
 aWGR+jYh7sKWRPCh6xVfV2W2qCPMcKz7/5DptqpclGJF0clRLD7Pqc4Vj8OUk6Ax0la8t8g
 em7Vmo5QehGiHCKMBZug7+orNBtbEsYRrGIP4JVUxdyvq+Zv2QeVTpJD10XjsCRwuPgP+pM
 +MZ0qmHeZi9zmbBw9CBiA==
UI-OutboundReport: notjunk:1;M01:P0:Zjb2KyxaqVU=;+IovHSKWPy67cgulnNprKgES2Ld
 zW07groOfMr6Zzf6aHu7/hZPlQr3kxCukMWc1d4lrOJHtj2FM8gu92I58wyu3NiYaxXEVKV2J
 6BtL/jgTzFvEG9N4J/hylr7Fc8bOehYhgAjA32uw9UP/Lb/8Dj64YtOo5V0acMTKfdUw2tCI1
 Z9miT5BPJ43eRMjEySXm+emdjgGVZVN1h50ZQOY8q9w1TlIYfZdmLPxUZPX3ejpCuZfgNm3MA
 zmRSnpvttOnf5P85G1CBLsFqtV2VVLwmsHpdkWud8nww48Qe7PHAyllbGCrWzLKhcljjb4013
 6ReeQMFtQQ0ZukUXmgRN65O3jl8CgwwoNfuSvQwdFjITW4qh+AcvD+xeReFkIBjIhVTYUu/v9
 HV2HIvVnYgW45O6h8pTtR+t0BZI3PoJmbQm2CAZsD/51Bpuyl73y1sD+3CpywbFyPWO444Siz
 oRHevXol01Tdzw29swTQW7Ly581+Jxz8UQ34Qr8Zx+F2Us/bg2hHYqu2HXqUaD9Rw4eFxqCrV
 MsfaNLm4QwTwxSe5cOhWmstAUG3gsdkwWWHC8VuaeDOZU7Rhkydn5b54SEcQ2PbCyzWB7YJX4
 /n/Y5QussYl67vfVgX+nrorm1yWUFv5mxfd/IZeZK/3FC0X5NW79MYvqYaZgxhCCSbSBjY5xq
 8utz0GUAmxyPJYpYJ1Rxpf6YY6cJvOTeV0NVv0jV5o60BQzlM3/N1c9WrhsVcLOXnDi+Lp/+O
 1dxAHAEP55yhVlMtoY3S1fSsITYWfa4qn/o/HVgVEF1PVlslQJhEwZPEUNIn7kq1ZWmeWy9sx
 4xMs6cMvq4VoF6RWtQVSdaUpha8pqBdia7JL/hicmrR+A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719212543; x=1719817343; i=ps.report@gmx.net;
 bh=bGRf1eBiRdH/xUWph71FGxt18EwS0T4Qw/K3XwY9poM=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Dvpb8FEEAdKGs+XMnTAnk78M2SVMr+yCpDfhD2fUnUTYB15Zl1akUnT6QdurllM8
 xKSIMZeYQ7C87C9Lopg8mKcAjdGpcv72NWrW6lFMe2z9Rywg3S6o3C+JxT+jNRiDS
 78bOysQ/cx2ok3b6+HWG4rImyQ9EpRjSNPlm7Q/ja0fsKKen97yUNBnw5KK/0cUo5
 uESSOVuQQys0jNPCtcaRpx7b0sPCdYr9R/zjr+Rxk0JPLbY9OVXqZ5NbYKdOdkuJC
 yM6Uf/e13wIsimXWsr48LPNNh3PdHx63jRG7ZUuKziE64ebwoHRtoBiULPjwGGMjm
 cBQbhbR2Z4n/vxaXYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Dvpb8FEE
Subject: [Buildroot] [PATCH v1] package/mpfr: bump version to 4.2.1
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://gitlab.inria.fr/mpfr/mpfr/-/blob/4.2.1/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 4b0d14c9c2..464aea5321 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d  mpfr-4.1.1.tar.xz
+sha256  277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2  mpfr-4.2.1.tar.xz
 
 # Hash for license file
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index c0c8c04646..339383f59a 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 4.1.1
+MPFR_VERSION = 4.2.1
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
