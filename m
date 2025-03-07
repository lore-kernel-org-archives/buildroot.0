Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811ABC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 07:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B452406EF;
	Fri,  7 Mar 2025 07:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atbK1ryo3AlE; Fri,  7 Mar 2025 07:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9606406FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9606406FC;
	Fri,  7 Mar 2025 07:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 040E11C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 07:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC5F3406EF
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 07:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e84FjEctFTbm for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 07:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39A3C406E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A3C406E8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39A3C406E8
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 07:56:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.59]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MCKFu-1tyflP44HK-0056o3 for <buildroot@buildroot.org>; Fri, 07 Mar 2025
 08:56:30 +0100
To: buildroot@buildroot.org
Date: Fri,  7 Mar 2025 08:56:05 +0100
Message-ID: <20250307075605.896903-2-dalang@gmx.at>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:xKvHGFkZofHHMIZsNeCrkDvfzpK3I1XhEA0iRZzmBxwB4sc0O2o
 e2VaQ0ueo0/0x//EhMuhu0p7T+szLFKSrg0Y/1ARi+41V4YlW4UA3jffxylCGZpTgsrbJtY
 nrA4MNmpeJbQ3vC5c5QymaHqNnR9FyUFcqlm2Hp3f2le8f2mQpeQ3gpwyd2uPeBW2iq8p8p
 YGVnokJXjSpbpoLGZBH1w==
UI-OutboundReport: notjunk:1;M01:P0:jiT8NsxuSEc=;Mc8FCqU65DUDeSCxzxoSYfuW5ds
 m0ReTKnDDRhzZlc+Wv71qz8hEYd7b5s0wXetXbLtIanoiKBsWk1CapFn41MvrDAnvUK4+3ghz
 K7xrHsdRrgvdyIMfvt0B3brXIKyQRqQN+3bdpNmkKl39sMoCNnjSyUPP6XrqO6IAWryEzJGUq
 ty74qp9TNde0vqQwB8h8jIKS2TcCPfwC8GWN/7K9pwqEycTsFNxsDkp03BSuiJ8wesXrUqPgT
 W1eD0QvnkQw2PTy/rp6jXkmcNu7rCXVeSVpQDSYsqqjLEWjLTAbs+TrU+8KGzihoItkDd6v7X
 bJRym5qtTGWKzO51olyJDxR8Gep7kewhFOf6yPKRjOSm++ZQC5rdQQmRg2RNUR18Icsf6ZPFf
 y5fTrQVa8CBb9a+LJCiPJShgHAgv1XzGRPDYuF+60Fts+wD2MOeQW2V2blqYZBToBAvpcPDck
 Ly0s7pqCei7masFLgRlM48nDnSlBNlGk9yOF8MUub78TTkIMFFk+ZyPnvt7jNdccTSINeDr1Z
 24AFm4dwCB2pn0+ttxaLa2+nHCxlOyD/isHDN1DqYi0waPiuUigpKYtNvxW7rwjaWrK2Bmz4l
 ehgZsyC/8qHa/YBCK9AX/4ToUoElI6XJ/ypLeBiHuhBG2tduNmrLKqVWGEl/Kg67EKU4VtxSi
 rH3XEQNL2IhmS6y1NRrmn39UEot9BDWHCyfGqC6+V9wZhgwQmzyFuvLJS6anmconhueHOOrB2
 kPQBIC6b/93ZUTxuXk6tkOVMSeI/yu7l4PlY4E9bs1ghuJWOSjFAKEWAvfXWlQL0Hq1NBl5ha
 r6inADajloj646dWdlUEwzwmMLIFeQf8apj3jWylgkUBxki1oWt77mNllE2TN5wXopRX4HMIS
 +bXdVvhtIy9V0qJofVV3qcKLKLUA/Tl4Xz38v7di+HGbNTUI96J77BW443TtXPq6b1yNZ5AjP
 mvXpXTyhjR2zNxqKtqGp+ZkbGkN7T51Sb6d00c15+Rt6iiqRIGHBAfuo1UJe8LpqeR9wNQDpf
 oUMp4fbkdtPoVOd/gGKJYrLL2kAuZPGgd4eidrQxy3M1UsuK7Vyv36m2N01+zQ8QUwabhywDQ
 d7pq0y4UUoV2K749WeQr4LjdyKr4kqOnNrSzU8BF4s8WBt6wVqyOW1B8QVLQT9FQw2Eixty9C
 Esx18Ew2ZdCY/3s/90hwA2lTr34/zaqAi0ILTBI+P3vVX7mxxDGy2eIxvCMg6Laq8hBqLTWZj
 FHy8k6n2Agoul1ApSYpSL3TWVpPRh4QFxbVkSnIXzZjEmL25Z+c0RwKnWgKlkYKHnWzcXIPW7
 ctnYYHA7m3b2xtefSlLxHo3ERO/NrZCAPX9YiaTsM5Ghk70RT2H1qMnobUxxW3R80B3AGZgZY
 cATWmRF+dXysupxfMzMt62m2iRH8R/KGBLuvrVY3qXuEeNPHXSnmk46Wrl0oIA7Gwlw7Jkp+p
 LjabSbCUG83F3T0evOElxDlNdCPA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1741334190; x=1741938990; i=dalang@gmx.at;
 bh=HQrURzor3T9XFXprbzCTyBjpr+eqgu6gzR0R/CoJaVU=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=OGpLaUkaVeMwTecYWQiiSrxU8kKzR1CZdiakneak454GpfoBQspczK60QigpYQwA
 cqYbqBQ/t13KwKM5QGwD2ENlkhOp3XtbrFBEJd0meQWPMKGgUj3nvjGYR/tFBRtoN
 FFenkVhzYnd+Yh2z3I5fknDgP8WduOhwA2BNhmU55I1qHuv5SzcJFi58ZWOWQrlxu
 66Emewl/BWv1Z3IUrtcK961zJusWg1GBZvCHTLr6huNcO2zUvtzy4TFzKL4SAOoZE
 cdlnm1/u/kEFaJrhYrBBD5My14XJ8zcwli56aSGybEc9fCisE1IVkQG0dvnT/AqzH
 5q7UVsZLSPlu9vNX4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=OGpLaUka
Subject: [Buildroot] [PATCH] package/libsigc2: bump to version 2.12.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libsigcplusplus/libsigcplusplus/blob/2.12.1/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libsigc2/libsigc2.hash | 4 ++--
 package/libsigc2/libsigc2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsigc2/libsigc2.hash b/package/libsigc2/libsigc2.hash
index 4811213568..e7bf7d4e7d 100644
--- a/package/libsigc2/libsigc2.hash
+++ b/package/libsigc2/libsigc2.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libsigc++/2.12/libsigc++-2.12.0.sha256sum
-sha256  1c466d2e64b34f9b118976eb21b138c37ed124d0f61497df2a90ce6c3d9fa3b5  libsigc++-2.12.0.tar.xz
+# From https://download.gnome.org/sources/libsigc++/2.12/libsigc++-2.12.1.sha256sum
+sha256  a9dbee323351d109b7aee074a9cb89ca3e7bcf8ad8edef1851f4cf359bd50843  libsigc++-2.12.1.tar.xz
 
 # Locally calculated
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libsigc2/libsigc2.mk b/package/libsigc2/libsigc2.mk
index 845d03ba85..b5685fd50a 100644
--- a/package/libsigc2/libsigc2.mk
+++ b/package/libsigc2/libsigc2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSIGC2_VERSION_MAJOR = 2.12
-LIBSIGC2_VERSION = $(LIBSIGC2_VERSION_MAJOR).0
+LIBSIGC2_VERSION = $(LIBSIGC2_VERSION_MAJOR).1
 LIBSIGC2_SOURCE = libsigc++-$(LIBSIGC2_VERSION).tar.xz
 LIBSIGC2_SITE = https://download.gnome.org/sources/libsigc++/$(LIBSIGC2_VERSION_MAJOR)
 LIBSIGC2_INSTALL_STAGING = YES
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
