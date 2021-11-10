Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AEDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE2AE61039
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE2AE61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B774B80EDD;
	Wed, 10 Nov 2021 09:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-cP1lqnjoXa; Wed, 10 Nov 2021 09:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950848100F;
	Wed, 10 Nov 2021 09:42:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1621BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 875A740431
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIm1A8GNe0RI for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:41:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A58A140413
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:41:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DBDB15FFA2;
 Wed, 10 Nov 2021 10:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636537260;
 bh=QHGJLV6IK4OIxjrw/drbXdgboEb0xnYDAH+fawO/y5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fIAZ1TM1CgVH74uhiphaeG2a4GcOs+fZRTlPj3MTw4702CT2A47j3RDnZ5yAkPnGR
 aWvfcPh79vEq5rfKHDnNnh9FEZwtZtwoSAWgR8seMpp08qEKloMS0D1+RUHv67WHAP
 NiJs0vciK925RVcygnh+mskFJRiz+E5X3JMl7UyXGjOXV6d3gGcCfFqPDwIbhTPz32
 KQ88WELLiU7dEBQjW45W4dUfax7Sfc0nSkCdjIe4tWTzVzIWIyPim+m213K5WBL+Kz
 iXg02LDZpqnY/WMYX2ApW2fWDoq1dKWGVFWLdmqH5Jqvqoq0TA4HgkNGsHouON+744
 6cOP+xidetu5A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 10:40:53 +0100
Date: Wed, 10 Nov 2021 10:40:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211110094053.GG2084998@scaer>
References: <20211109171802.456900-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109171802.456900-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/glog: don't override
 dependencies
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 18:18 +0100, Fabrice Fontaine spake thusly:
> Don't override GLOG_DEPENDENCIES in a conditional
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glog/glog.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glog/glog.mk b/package/glog/glog.mk
> index 9d31732a88..2863e78345 100644
> --- a/package/glog/glog.mk
> +++ b/package/glog/glog.mk
> @@ -13,7 +13,7 @@ GLOG_CONF_OPTS = \
>  	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
>  
>  ifeq ($(BR2_PACKAGE_GFLAGS),y)
> -GLOG_DEPENDENCIES = gflags
> +GLOG_DEPENDENCIES += gflags
>  GLOG_CONF_OPTS += -DWITH_GFLAGS=ON
>  else
>  GLOG_CONF_OPTS += -DWITH_GFLAGS=OFF
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
