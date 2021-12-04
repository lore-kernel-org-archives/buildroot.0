Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C04C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D69E6400E9;
	Sat,  4 Dec 2021 21:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljHkfix8S2_E; Sat,  4 Dec 2021 21:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F09B3401AF;
	Sat,  4 Dec 2021 21:53:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF151BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63F4281B35
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOCh_ig5y9B3 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:53:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 603F781B10
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:53:57 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so4864982wms.3
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 13:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3K5dKGnMb//VByCCBhDPR8ORuINaWWEpKXgnS58ns3I=;
 b=HPGw2NvAfagknhVs5291g87vu9h8yo2QzKuj7CP67fJph32WgOv4zpMSb+zhSja1qM
 wrspN8vQvGFz52PHAAj8BJqU3GyS5SJ3/8p6Ar8yst8qiQO9m2BEf09rf4S+DCskBA8X
 CQQ+UEOz/23UOSznp3dnUwLOpqxKjlbQ++/u9qe2dQnPvdzbWFKnvN7grZfox0MlEAMq
 XRqkR2VUBWx3D7M1a8CykxKJd5a6UWs1lmDsZ8I7y/rOMbDiZiHN2xmIOvJS8ZkkFP9j
 Zu/hvXbN0lrzKZKEiUVMbvKXdNcbhdAHqsJxtjF8P3S2ftt2ofiZ4/nohNfI5AaeyhW9
 rqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3K5dKGnMb//VByCCBhDPR8ORuINaWWEpKXgnS58ns3I=;
 b=xT1hqpuI8mE9P+GTSy7URlARVa2zJ1LtyFTuyneTU5NyX+dYNZ8QucXyrD8aZrjvwt
 koGzbGz6p6p1AmD6U/pGhQhqZQf4tBx9PwSzBn2lgh5YzN15XqfHgvyGol5sCxqX36kf
 Kxxyfg5O4fp3RtYgdO5v7MR4aTKJ+v0nC+h6kRFdsL6U9i79j095HgMYshznbLhHAsxC
 xbmVvkkjBP8a1HW8MLJ0Zf+t/Ntjo8Rn8sJo8ZtN1nzpOFoRQFLt0c9EH134OazteIyJ
 dWlVP2g0r/Plb0PHezpfgiJbZPf+B2/lncoWybWXEkkkTibT2uHh6KUJNT9nytoOc1FY
 lfDw==
X-Gm-Message-State: AOAM533BcoPnAX787nPcZC9JSXKqoVe3g7yzSJw+VzOXKx2dx2D+nItw
 h09ERuBiwUpn+4DEAIkxj9GE49zu6tl/5w==
X-Google-Smtp-Source: ABdhPJx8MOV8C1VAFeC4yTjWni2wNFe2yw7SRJtlrrx+8TJHz3Te5TA75wrPNpJagNpUd6UrWb0Ngw==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr26546378wma.85.1638654835402; 
 Sat, 04 Dec 2021 13:53:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id b6sm9823614wmq.45.2021.12.04.13.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 13:53:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 22:53:56 +0100
Message-Id: <20211204215356.2020727-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/speex: add SPEEX_CPE_ID_VENDOR
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

cpe:2.3:a:xiph:speex is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axiph%3Aspeex

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speex/speex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 522f8cc09c..674be78ff8 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -8,6 +8,7 @@ SPEEX_VERSION = 1.2.0
 SPEEX_SITE = https://downloads.xiph.org/releases/speex
 SPEEX_LICENSE = BSD-3-Clause
 SPEEX_LICENSE_FILES = COPYING
+SPEEX_CPE_ID_VENDOR = xiph
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = host-pkgconf libogg
 SPEEX_CONF_OPTS = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
