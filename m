Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFC8CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780C1606C2;
	Fri,  5 Jun 2026 12:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okLAWKA06VHL; Fri,  5 Jun 2026 12:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC0F4607EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663859;
	bh=Iyg0YMAw+2qCjWg28dXjzZ6KwXIF+1JNb/BVqArXJZk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S6w4lSROrCOrm55UN+5icTgRIAl5PRf0z14uJVID48gqojzD5xJi4/idn9AQOL343
	 A3HsJ2xzcsgjMmauvNXto/5SlHcti9kjzHYSEPNJNbWSGMpU49S8yIIlcRg/T1Sbn9
	 qypzvK3O//mlyiwe7sLxqeTIMbJ3QHkLN9/aQyunrG6g2eCqUhup0Saf0q6FLujNKb
	 Ue3Dr5P2RI5obHFagM0bOJnZfYOv1Ej2qrroS2cQ4QuLNzcpmwG4zF2RFiixw/gVGI
	 0UY98ZckaEKmTKr7lrLWNyYOHy3nlJbvONLrOYl9sca2Re72L7GydOs3zAvBgH413s
	 t3v4m5rtcGkTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC0F4607EA;
	Fri,  5 Jun 2026 12:50:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A15388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 499434037F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTU7ZDaNfExF for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31CC84037E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CC84037E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31CC84037E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso15204805e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663853; x=1781268653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u1/qyFN0eFEzn6qt7dmqb/p7BhGu9xfO0nKf/SRfGZc=;
 b=gtDygNr6QM7CHEnEq8vOPignkbJ0agOQg+lB4fX1F7IR+rUl84pilg6bAGkJIG7L5+
 XozWNmNN3wUL6CbaEYRn5qS61RtGTDSek30zJNLFA8ordu+ctMU5ECH3a5p2sqKa0Zf6
 TXltVMFGpaDLXtNVKZ9f3TuJoDD3pA8eKxiGDmrVG11UEzadSt4qU+fUs3JWbsk/Jbc9
 l4UKhMS/B0OD9WuIPaxYo10dEwxWTnQy5yzHmhv99k4fx5tup0pdfPodgI9uFtlRRrID
 9mTUOwsXTL2loZ7Ah8ukoGPeeo6nctGqamK853pgECt0+pxMU2RQnGbs/DZGmf/dpw1I
 3O9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cv/2HQyy4Btsz8lIPJhMopwJNeHdD7XXG45SEFiDQpv4vJd9mXV9oM9qc9utLRmcHDwvBRZoUsuo=@buildroot.org
X-Gm-Message-State: AOJu0YxBL5JBne57Qv8s4bICfmcs98vwTnjAQIqICDOC/o64f6z40AdB
 kitaKrkuTdC1mzt2kqGUnbqLQG38WL0p6gDEOcnf++QLbQOjE2rIwwwWSVwwTdgp0WA=
X-Gm-Gg: Acq92OERUUHY1EZrhd5Sgbpqr+MILTd+/6X54mBFOKVxYTaNSh16PV/D8odcKT7SDC+
 aYTHRj5lOsXeUMuYQmAzV6qO/ED3V2ak2LSiKHF+wQPdfsOue8VCFf1qbTJN9aJ4l5u7S/P4kfv
 Aag+MgGfZRlRQdpksELrfpDr62SXTwVy84cE//mzo/TI1IHkxcJRZvnXHOSLJbfnc5FM+JyAR02
 vqozQ11/se9L/L9wMoGSdxfdxXAxYoBj1LMAG85TyY+BRpfos3sz0RZHDkyGzDLVNfR1ZMI2qSu
 hni9AhPb46yhNS5lqvKYvDegIf9lh3ceWA/4NGnp3pxqduaABJgVzQPjIdddrxRZ2nbWf6d2imk
 XEZtkYs2PhDlx5Qo4c1RsbV47/XdPKzq9ZKREMNoeH0AkY1zCxmfAztFxOBODQgcqON1GP1QL3R
 6JPI4fr7y1gpoqyOwc7HEFI0cuQg==
X-Received: by 2002:a05:600c:3b09:b0:490:b446:fb8 with SMTP id
 5b1f17b1804b1-490c25c66d2mr53538225e9.11.1780663853317; 
 Fri, 05 Jun 2026 05:50:53 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda363bsm12236171f8f.31.2026.06.05.05.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:53 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:52 +0200
Message-ID: <20260605125052.274630-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528085044.344439-1-peter@korsgaard.com>
References: <20260528085044.344439-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663853; x=1781268653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u1/qyFN0eFEzn6qt7dmqb/p7BhGu9xfO0nKf/SRfGZc=;
 b=YTnrNe+zY6cMd/chXlFt+cudq6NIgULKCrtVn9VKHnpDbZ6s3vkkFAvYeGLBpjiPs3
 tVAze2nX7AxeMVoxj+PCt7aUnUVhwuGJek+PcYErF6q6SVfI89TbAiJOzjBNvIXamk1v
 4xZfVn47etHLROTZsYiCgPcLzyqvkyz/sY3VJYH2VA2fELHzUr2Wle/rvVa2OZCYQgZS
 y8mmgTrIFnWVPHvmMe2MXRs2rdqFR2UD97Qil8pZhI0D85sCKP/BKhb4InvYbsi3s0IP
 qhOrCbezVLEe4L0N234nJUtGRSGPD79q7Jw1xveFfH7cb1nXtRF4FXQc7WmuFKcotAeU
 pomA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YTnrNe+z
Subject: Re: [Buildroot] [PATCH] package/radvd: security bump to version 2.21
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> CVE-2026-48715: Stack Buffer Overflow in radvdump Route Information Option
> Parser
> 
> https://github.com/radvd-project/radvd/security/advisories/GHSA-52px-gh9p-m379
> 
> Release notes:
> https://github.com/radvd-project/radvd/releases/tag/v2.21
> 
> The release is now done on github, and a .tar.xz version is available so use
> that. Notice that we cannot use the github macro.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/radvd/radvd.hash | 4 ++--
>  package/radvd/radvd.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
> index 8415b8d854..a9937aa232 100644
> --- a/package/radvd/radvd.hash
> +++ b/package/radvd/radvd.hash
> @@ -1,3 +1,3 @@
> -# From http://www.litech.org/radvd/dist/radvd-2.20.tar.gz.sha512
> -sha512  798d8476ab5ff43083b181d6d6ec43c47d06e4067d30c71e038cfd890bcf1ca23e809f9e184c4363458bfa25a916625dd2d7553290fb3e5459034d477b80ebaa  radvd-2.20.tar.gz
> +# From https://github.com/radvd-project/radvd/releases/download/v2.21/radvd-2.21.tar.xz.sha256
> +sha256  91df2ed7faca0716bbd726a17d6467ed92fcb2b6e45b57d9e619f9686ab99e1b  radvd-2.21.tar.xz
>  sha256  40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80  COPYRIGHT
> diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
> index 89d8f55d51..32bbcf57ee 100644
> --- a/package/radvd/radvd.mk
> +++ b/package/radvd/radvd.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -RADVD_VERSION = 2.20
> -RADVD_SITE = http://www.litech.org/radvd/dist
> +RADVD_VERSION = 2.21
> +RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
> +RADVD_SITE = https://github.com/radvd-project/radvd/releases/download/v$(RADVD_VERSION)
>  RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf libbsd
>  # We need to ignore <linux/if_arp.h>, because radvd already includes
>  # <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
