Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6DAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF43440630;
	Sun, 12 Dec 2021 17:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjfWHvuRnLGz; Sun, 12 Dec 2021 17:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBD4A4063F;
	Sun, 12 Dec 2021 17:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743011BF2A1
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E902854D3
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83tYUn_9XLNH for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:56:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA21C854D2
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:56:37 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o13so23423375wrs.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 09:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sztp3EvWye7OemsHesqMPA/aQDRRg+2nC/SsiO8VTw=;
 b=Lbev8xyy4x4rcJuB4+diC0mTHNzi92yH1OVlvFzKuv0Ac7wvWDuBvslCci+cTEgaJl
 dlJOJPSL6sbku/tROmdhy8GRMhKAIlzRkW/XC4qav/8rpqSuVtDlApsgv/UR1k12dTEC
 I5Ni9Q1vpbkIkHhVLGMx0gyFne8Ox8Ytxb36JR67nLoX2qgn+ztpn0zTGvtG4MNpSW2N
 dG3HHI1qNWVE6WgOl0ow+tfoWn9eZDjRLq+uT6SsjEuJPsJ9pEh6qv8BKhmlbnO3Reig
 AY74oGTZZMyWIdVxI//Son38Clw0L3jGOGxGHD4sPOoNkwwsWpLpk+tTdl1cn5hs62v4
 zeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4sztp3EvWye7OemsHesqMPA/aQDRRg+2nC/SsiO8VTw=;
 b=UtsqsLy1lBsmvztkwwDNGu/3EGAfMkL7ZgJlnDuh1CK8KEOwhaloiy44x2u6Lk+XXZ
 JlHnal0uZMSv2r7sVSA1UqdSHOdhgKGiEJbsIFe7ewxLjuDFtv5VPSIi3w/mSkok9Qdi
 rea0o5z9cW6sYqvH2h1bWUFgUHnRUul4yMukWDhO+gqlhJgogTopgdXgD5d+9R/U+tgQ
 8sZSig07fV97uiFuRbjPJ5mjypIIm2mBD3VF+enEA2xcc4omSoncEgpfCZ0+L/QmELN1
 4G0pz6g4pKxpVQIjIcSmcDLlOB4BXArmATwkUv2XFCXadlqCcWjv71E5QpKDwEkd0xDk
 0w2g==
X-Gm-Message-State: AOAM532e4h2Uz0lgUEppz8CONUTwIk+YvAC70SDTnOOhZS6w2TEkbAhv
 ycitTqJrNv6Jh1Dcadq4ba+fWzL2dJcrJA==
X-Google-Smtp-Source: ABdhPJwBS0L1Fw+yutgwdcx+G2ShYyes9wytjxvpCI1CLNe9EjdxKA0DQNB6lyc9cAX4e45QZFNeyQ==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr26454299wrn.218.1639331795578; 
 Sun, 12 Dec 2021 09:56:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id e18sm8337885wrs.48.2021.12.12.09.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 09:56:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:56:24 +0100
Message-Id: <20211212175624.670897-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iperf: update sha256 hash
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ca39eb212e32ca209cb3d6011847f9c94641fa73 forgot to update sha256
hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iperf/iperf.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index bd5643af95..924d10b3e0 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -2,5 +2,5 @@
 sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
 
 # Locally computed:
-sha256  062b392e87b8e227aca74fef0a99b04fe0382d4518957041b508a56885b4d4f9  iperf-2.1.4.tar.gz
+sha256  56ec1312d24bd2c78790e67c96c0a991c82e71bc4c0b0d37171bd89c9fd6ef3e  iperf-2.1.5.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
