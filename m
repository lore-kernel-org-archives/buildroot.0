Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1025CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 17:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F00E84303;
	Wed,  9 Mar 2022 17:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f20X1FXOhUF2; Wed,  9 Mar 2022 17:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B28BF842FE;
	Wed,  9 Mar 2022 17:37:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA6771BF25B
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 17:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94662842FE
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 17:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqoiLgVQwAvm for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 17:37:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E46C842FC
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 17:37:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t11so4214664wrm.5
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 09:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdxJLiftUUuhy18Bmq47e/XMoJ7Z9zoXQ19SyFuOTT8=;
 b=Q6eQPTTFMqfgiZLk0zC5/2ZNBJo7KXo7HCsdaaOc/hRAtBguv7QishJ/3ibZWs4Qjl
 w8xKqOyH07ljnDlGv62EMyNUoZfYGVpjg/Io+21/MURaBvAFAaWsgM0fXzkuJZuk5W4I
 aOfivp1SpM8c8JZ04wYxB5QjakV7vDSz7fY+AHuUJ9eLMUVauCiCl1IMF0X7c177S6wM
 Zs5EN69p97MJdn2n9iPKmVMNen7WUsG3Kakho5OQAvvGEUUtbO/5Gre9EQSnquOjCveq
 tK8zrx6Zt/GMqWN7RTzrvlI0DNaKCv8rZUrDolXf60Dn/bAia7AY6JHcWI6F7bmqLEd0
 CROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XdxJLiftUUuhy18Bmq47e/XMoJ7Z9zoXQ19SyFuOTT8=;
 b=f1jZYR1VmrbQzjsidT4kQzlVW4DNnRg49sy8tkOGagtRpn6QfvdxcMUkn4wEScppVs
 xaoQU52BAOib0yyLLJhX8HUmiS25mJZIXJ5PfKeypLFoloH4HPjraEdZ2++cgcrkiJHy
 pjof01TZJIts0EMdjzhpVoCoo61QCPXXquEN0jktxD0ciQpzndr3AsQB/sNpT/4kXvrJ
 IXWyFOkvqgrGI2ZFIehb5JGlCK59bR3/KS0672dlqe9peAFaXJ1wsE14z/hHwG5HwQyC
 ByJhmldNr9NbF6TdDwtKGpkBy9N+IdN+t9UCMjsBgzqSaVagUz24VG7/1j0aXQ5SWzbw
 vAUA==
X-Gm-Message-State: AOAM530n7AgN1jQpSo7sNO0CLslW1t67JBG5NfoGZaUDSZF47lEqTgty
 aKBudyfCx8neU3fWpZZgBeH6LnoxFYs=
X-Google-Smtp-Source: ABdhPJyIGdlH0sLt68xHzJAv3mIm3LWWB6clIYj8QWLgHnuu8sBnPIQiBjWiX7ZqqC2n+G42n+UxXQ==
X-Received: by 2002:a5d:59a2:0:b0:1f1:f3af:a069 with SMTP id
 p2-20020a5d59a2000000b001f1f3afa069mr548647wrr.581.1646847475375; 
 Wed, 09 Mar 2022 09:37:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b00389d6331f93sm852150wms.3.2022.03.09.09.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 09:37:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 18:37:10 +0100
Message-Id: <20220309173710.527496-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pppd: fix CPE ID
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

samba:ppp, added by commit 63332c33aa0771532807fd2684d4eee4eb952435, has
been deprecated in February 2020:

<cpe-item name="cpe:/a:samba:ppp:2.4.7" deprecated="true" deprecation_date="2020-02-24T15:55:39.787Z">
    <cpe-23:cpe23-item name="cpe:2.3:a:samba:ppp:2.4.7:*:*:*:*:*:*:*">

cpe:2.3:a:point-to-point_protocol_project:point-to-point_protocol is the
correct CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apoint-to-point_protocol_project%3Apoint-to-point_protocol

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pppd/pppd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 19b6f3ccce..d9d6244f10 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -10,8 +10,8 @@ PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
-PPPD_CPE_ID_VENDOR = samba
-PPPD_CPE_ID_PRODUCT = ppp
+PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
+PPPD_CPE_ID_PRODUCT = point-to-point_protocol
 PPPD_SELINUX_MODULES = ppp
 
 PPPD_MAKE_OPTS = HAVE_INET6=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
