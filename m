Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5C8F5A8AB
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 18:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0017C82F4A;
	Mon, 20 Apr 2026 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xrm1iNL7CaQI; Mon, 20 Apr 2026 18:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FB2F82F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776710055;
	bh=Shm5EqFOhOHrSJv/54Ij7VuuMJDnSQglkKyryp05Fl4=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NeiwOCcj+ONvSTE6/VK+HPHiTYCz2//YZLma53dv6GPF5LJN6hDRtWjGYob+1yG07
	 kpk4ktyHgNscwOfLt51d9CxWXSSpL9rWQd+hdfkl51c76KC7wttQ8gKlusaW784ZWV
	 7Vr7t3vLPYmrLumw8WpDI8+bwLMUdIqeRuHC3qHErLynw4H1j2UpzX0KOLgfDYNMWA
	 RuXclPUZbriOTO6Q80r1DMp4BWXMtLA9LXVsjK1h3nOLaVE9KTeaccgOFwIb1/A+rY
	 I0dEL5ealBDsliYeG24YSIk628u2INGzQen1zEe5xFqIdoKTYOyPpPbqNSAuVNrObX
	 t5iR/5TyKG9JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FB2F82F31;
	Mon, 20 Apr 2026 18:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D58324D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3352482F31
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 18:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T7SO_sPGIaN for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 18:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2651A8223E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2651A8223E
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2651A8223E
 for <buildroot@uclibc.org>; Mon, 20 Apr 2026 18:34:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wEtRh-0002hm-1z
 for buildroot@uclibc.org; Mon, 20 Apr 2026 20:34:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 20 Apr 2026 20:33:02 +0200
Message-ID: <pan$56a14$e3f2d47d$afededf4$88068441@ID-313208.user.individual.net>
References: <20260420084407.37993-1-chakrabortyshubham66__26170.0735821918$1776674689$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/botan: bump to version 3.11.1
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

Hi Shubham,

Am Mon, 20 Apr 2026 14:14:06 +0530 schrieb Shubham Chakraborty:

> https://botan.randombit.net/news.html#version-3-11-1-2026-03-31

please add "security" to the subject and mention these CVEs:

Fixed in 3.11.1:
CVE-2026-35580: Resolve certificate verification bypass bug introduced in 3.11.0 (GH #5500)
CVE-2026-35582: Resolve TLS 1.3 client authentication bypass (GH #5599)

Fixed in 3.11.0:
CVE-2026-32877: Fix a heap over-read during SM2 decryption (GH #5450)
CVE-2026-32883: Fix an OCSP response forgery vulnerability (GH #5449)
CVE-2026-32884: Fix a name constraints bypass for DNS names (GH #5448)

> +ifeq ($(BR2_arm),y)
>  ifeq ($(BR2_ARM_CPU_HAS_NEON),)

Using

+ifeq ($(BR2_arm)x$(BR2_ARM_CPU_HAS_NEON),yx)

looks more efficient.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
