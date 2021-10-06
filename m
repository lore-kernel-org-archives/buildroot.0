Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF710C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A276611C6
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A276611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7474960F55;
	Wed,  6 Oct 2021 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJQt6LlUkj20; Wed,  6 Oct 2021 21:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23F560F5E;
	Wed,  6 Oct 2021 21:38:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B88CD1BF2A1
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A748840802
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HF1p5rTn821Z for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 21:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB29940801
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633556251;
 bh=ab/kwb15QywIvnA/6u+4gNSEPGMJhD/VB9oIS7+ordg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NHDXEfLTznVL0BEhc2Kl7UJ41P2N+gf96rKIpM5x4hlqwYBK934oQ/fVke95uvGp7
 yKuJHsy9Txd1OIYnVYA4CseQFBrpXjIjE7sMTNjKg4jsTgdxnmx25Lx5g/8HgEaLqF
 sAVH7hKe2liStgbgUtvcziStqS8KOOlDDiRjahNw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mwwdl-1mj9bl3i15-00yQtX; Wed, 06 Oct 2021 23:37:31 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 23:37:28 +0200
Message-Id: <20211006213728.1069-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006213728.1069-1-ps.report@gmx.net>
References: <20211006213728.1069-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:x6GNwT7N9Ueo893kwuoD50IVfMo2MkGXJKp8TSvqGnb15Akbxee
 NipWVz27KwS5vRdiMLiLW/4pdJi7rcmt3dWeJ4w8MICHu6fEk6nAUxtgBeaWskRO2dO2UBa
 fJfam3SpqCaOfslhrgX9kgPNaibZySKcuQkYeUZr7xTAjkU5534M431HE0VpuwTZe2vjade
 jBBjDW0+WZMNae+NIXmMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:odU4BsAPOsk=:dFDD9aTHavwsUkLSrnRlIz
 7AhKhDdfXiAM2bANRdCZ8o09GCAVKLCxE/yVj2fGbjq1+vC9winIjsaHC2nn4jpEEj74J+iRw
 l98knHxJCji2mL0GakzpNj9GVDP5RIBbLrPE+kHvLjBwU/EkZjn0uFxIRryODdJMDAZBf+vZy
 z5ENh20UIVPSnx0p7apsse3uFeksiBrXq0IkCces1OUUiZOfLq3aQtGBlJ+CGi5A5uFfm9zOY
 WkebvmJ+cbPnr5CYlAbOvGHlSl2EiMgIj1p4zE29uNzjkhGQ2wFMdh14H3osQwkYzmgUGhmcv
 /5fpTu40m+4QDEGtEYQSDIPKW+wWnStjQmldGVtzTrSs6vynCUwXdYGx9ZfkEFTqYq6lELJby
 F/TZqPYHINFYPW1LJMh9QgjhR6fttR0/omAIbwgRkhJLQlvJNyXp41w64BHmc3RSMTBqJXUvK
 JuJTWMOVTw03ftYs2uuCCUdsyg55gpKzgq6qA1v5gX5aK87ofbcXhTv9hmXp2NhbqCR3uIcGs
 2NS3fi99orJCICKTB8srvz/dY44w/jgizsavNVS9uoAYkRk8jYWa2thT8783G6RYH0NKvWM/c
 8nJcCLZDBXdOM+aQWAaVnGmpeoj9mBGMY8UP+rCDAGTwxRuCEk7WM1L4WGPwOZNgdveKrEYNJ
 pfxZSkon6Oe0iyMt6Zckx2GtqWaGkiA3O5JDBnQtWlc2lrLDDxHtOkjbXJ09nosBelVB7QnOG
 q4tcx++eWp8Y1mhQzN1dn50FPvhMe5dSqh8SdOcS4LlfgIcxOMCD0ffz3h8VzvkPUnMtLtvWg
 J4NpaRPR6j97fyiA9WirryqaiXQZkPsygO9AsaSHI+I8B80S2dcR9Bs+cGzZ1t6Mrfqqo66+U
 9YFE5aKkLcoUbEgpRsAeM+ejU8DL01QYEtQ3DV3CqZLqI2uDLYi+oEGRuZS/ZrnTVTg0LXPwo
 FsRlyUmJPKBrD8sHKTBIUe9kM+kMh+7N/WmGYEUmUECJbK/ZDojW4TPHepKjd0NkS5XfN2SJ0
 UeEbl+nC1UJ0rK4oH1SRUyb0CwSvLOeNyY9UC/JuRVjVfsftZ7i/9SRE/CCP+BZrZT7kvP+07
 FJBL2wi6/f9LzY=
Subject: [Buildroot] [PATCH v2 5/5] package/rpi-wifi-firmware: bump version
 to 883b726
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
  - Update CYW43455 bluetooth firmware,
    Second Spectra fix for CYW43455 (CVE-2020-10370)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index 4db3e15c80..3bd62306eb 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ae665baa465a09dddf7f4bdec67e108a74b2a3787550cc9ee53c2bea9651f327  rpi-wifi-firmware-4c47758bed7cd547dff3618a1739dcf64b5a52a7.tar.gz
+sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-wifi-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index a643c4df9c..28926ff4f0 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 4c47758bed7cd547dff3618a1739dcf64b5a52a7
+RPI_WIFI_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
