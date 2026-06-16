Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D828CD98DE
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 02:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCF3E4282F;
	Tue, 16 Jun 2026 02:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTN82PUDt6Ja; Tue, 16 Jun 2026 02:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E205142832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781576524;
	bh=krQ6x6ZODPxBeL6PYc75Abi1i7skPpyvb9mm24eP/HA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQbE4cly2+oVRQyCK4itiRcjbhkGl+qCo8k+Gq5kF6Pwp58eqYma4hJk9xC1uy5rF
	 SB01+d0q+JUrAMWOEvGeUfsJpJsRjwSSZnWMq2mkfGIkKnhCJxbEk3ldjs5PMd1Hmm
	 iutEvkhAf8JOzaSofbORBtSudqTzv5TbH5Diuc+FTXbzjfjpF61lEqA3nDM4eRay7k
	 30nLDpf/TMsxbRhtHN9kiPSkeUGTMosAElMBn3tKlRf43y8UFE1HnpquQQgWgYog8n
	 cupWIFcsuCaCb9A4RsS2VPV+fhIH8GiZMoVhuJxuxnRPl5DftBqPLIPA0NfC0HjxrF
	 tAQDNn5MyG/jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E205142832;
	Tue, 16 Jun 2026 02:22:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 095712B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 02:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE3CE84BCA
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 02:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfzFfz8hnH1x for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 02:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D713B84BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D713B84BC7
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D713B84BC7
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 02:21:59 +0000 (UTC)
Received: from tianyuanhao3$163.com (
 [2409:8915:203e:6b6:3505:c10e:993:cd63] ) by ajax-webmail-wmsvr-40-106
 (Coremail) ; Tue, 16 Jun 2026 10:21:44 +0800 (CST)
X-Originating-IP: [2409:8915:203e:6b6:3505:c10e:993:cd63]
Date: Tue, 16 Jun 2026 10:21:44 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, "Fiona Klute" <fiona.klute@gmx.de>,
 "Marcus Hoffmann" <buildroot@bubu1.eu>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com>
References: <27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com>
X-NTES-SC: AL_Qu2TA/mcuU0r4iaYYukfmksSgOg6X8CxuP8g3IRWO5x+jCDp0RAOfWFTIlTI3uONNhmFmyaWTh1u7P5TQ7R4RZolrvWgk4v5+iDzGyTOR5joKg==
MIME-Version: 1.0
Message-ID: <304ff8bc.226b.19ece3c1526.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aigvCgD3P1c4szBqdWgKAA--.17092W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC-hihL2owsziyAgAA3J
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=h1TcZRbh78+kcn8ZvSYgBDYvQmwCXBSG5FNvfCPzERo=; b=F
 K0+eOgtB/iolAeoSEeJG9l+CmmoR7vSwAnkLbN8Pp3OMhAcVy1+XM7VdXIfpoteI
 yEdk6Pd4IdnuLuq+uaJI3xCF/dw8fhF/dwjuMVVFFp1DNFLtDVpT+qQ4bV0lWcth
 +HXsxmHLNR1IUvcTt/R9+NQ/wy1EZAlZQZpYEkksqo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=FK0+eOgt
Subject: Re: [Buildroot] [PATCH] package/network-manager: drop
 initrd-related services when unneeded
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Acked-by: TIAN Yuanhao <tianyuanhao3@163.com>

At 2026-06-15 19:06:05, yann.morin@orange.com wrote:
>From: "Yann E. MORIN" <yann.morin@orange.com>
>
>Since NetworkManager 1.54, packaged since commit 24827ae398db
>(package/network-manager: bump to 1.56.0), new services related to
>running in an initrd are now installed, which prevents proper startup,
>with systemd reporting that two units declare the same BusName.
>
>When systemd is configured without initrd support, drop the
>NetworkManager initrd-related services.
>
>Fixes: 24827ae398db
>
>Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
>Cc: Fiona Klute <fiona.klute@gmx.de>
>Cc: Marcus Hoffmann <buildroot@bubu1.eu>
>---
> package/network-manager/network-manager.mk | 6 ++++++
> 1 file changed, 6 insertions(+)
>
>diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
>index 301c1ad43e..bf4f29c3cc 100644
>--- a/package/network-manager/network-manager.mk
>+++ b/package/network-manager/network-manager.mk
>@@ -151,6 +151,12 @@ NETWORK_MANAGER_CONF_OPTS += \
> 	-Dconfig_logging_backend_default=journal \
> 	-Dsession_tracking=systemd \
> 	-Dsuspend_resume=systemd
>+ifneq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
>+define NETWORK_MANAGER_CLEAN_INITRD
>+	rm -f $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-*initrd.service
>+endef
>+NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_CLEAN_INITRD
>+endif
> else
> NETWORK_MANAGER_CONF_OPTS += \
> 	-Dsystemd_journal=false \
>-- 
>2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
