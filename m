Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53431ECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 20:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0AA340AFC;
	Mon,  5 Sep 2022 20:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0AA340AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjEa6Gvdc2Tw; Mon,  5 Sep 2022 20:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3FD440A80;
	Mon,  5 Sep 2022 20:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3FD440A80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CE6F1BF318
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA06A4091E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA06A4091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdehAzhQC_gF for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 20:36:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F610408E4
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F610408E4
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 20:36:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bx38so10230548ljb.10
 for <buildroot@buildroot.org>; Mon, 05 Sep 2022 13:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=0xUVnvG864lfWYrYUNM5HeihdbD0OmT4jVgSBRju8TQ=;
 b=ScvdwLw4g6ElI2uW1KEjIXAMaGjaFc6oQkgmO67h5Y8W1p5vLUxGI1t901A0ThNpPV
 F7vtXQD5+L1e8momvm1XxCSkEpWH/Ff4F8ru3yKQQ2NR4HLghv7EHYMat0hMwBgdcvOP
 muji0+mIQ9PucabAdWioB6f49QjvIr1jIbV2Jon7YAo72y/zUOW5TPY3S5d6Y+QP2+Tr
 myt2Sua36scogFoufyMp8Wxhh4gf7hePGUSOfZxuMQ/fZAdKys1Hs1tFY1NxY+VyeC6H
 TZe21/2H0gQNySNRVxzOq6FUDaNtSTsY4gBhczjDaPUCIiuHSkhDMBtg47vo5N9y/mfc
 Ahmw==
X-Gm-Message-State: ACgBeo1bvjIWG+4gxj2aClu3auQY0T+aUa1Z+f66ADuUY2NqlGgxJxOU
 Cf0cAfNlxdqUfpfOZ8OeAhgsUPc+nqw=
X-Google-Smtp-Source: AA6agR6ja3t76fUO4QVX4CyaQ9jHfpOu+JszOnTcrrLE7m60XawQMZ6AzgEG9EDYxXteOUqq3QBJFA==
X-Received: by 2002:a2e:818d:0:b0:263:6704:b91e with SMTP id
 e13-20020a2e818d000000b002636704b91emr11686298ljg.172.1662410196118; 
 Mon, 05 Sep 2022 13:36:36 -0700 (PDT)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 a9-20020a196609000000b004946274b7d6sm1290840lfc.166.2022.09.05.13.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:36:35 -0700 (PDT)
Date: Mon, 5 Sep 2022 23:36:34 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YxZd0han6H9rPaax@curiosity>
References: <20220904201429.1480971-1-geomatsi@gmail.com>
 <20220904201429.1480971-2-geomatsi@gmail.com>
 <20220905090219.47aaf9ca@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905090219.47aaf9ca@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=0xUVnvG864lfWYrYUNM5HeihdbD0OmT4jVgSBRju8TQ=;
 b=HzlsyX33rgn+s83yXtB/2ntHyzi4LkBoYwBW0Olud0RXGpVcivIQMMT9S4w/yMr9wo
 VGOD/2iObHD9xq1OuhpGJNrOlQHaxV94LsMLw+u71E06EKfefqMX/H/Xvd8T9aIxTw90
 8Xopv9YVrJgtOTigHLOqow1vqO+Pu/PYIdfdl5OBTAnYxQvufYKEhiynKqW3Q8cIveEx
 f/UqzBK6JzL6l2E4tA3bieeGqDE9Q5JLMuJLg9nCXyqHNZRAhr/fbYw1DXnexdLIRoT/
 1Nj8A7x1JWmM//tkE9CRhOetyzqS9abx4GWexCWqkV0XcR8KbC418r0gXAdsOvU4FacD
 HUJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HzlsyX33
Subject: Re: [Buildroot] [PATCH 1/2] package/hostapd: disable build with
 static zlib-ng
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> > Static linking fails because both hostapd and zlib-ng define functions
> > with the same name 'crc32'. For now do not allow to select zlib-ng as
> > zlib provider for hostapd in the case if static libraries are enabled.
> > 
> > Fixes: http://autobuild.buildroot.net/results/9901df820d3afa4cde78e8ad6d62cb8ce7e69fdb/
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >  package/hostapd/Config.in | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> > index f4206ceea5..3a88a9d276 100644
> > --- a/package/hostapd/Config.in
> > +++ b/package/hostapd/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_HOSTAPD
> >  	bool "hostapd"
> >  	depends on BR2_USE_MMU # fork()
> > +	depends on !(BR2_PACKAGE_ZLIB_NG && BR2_STATIC_LIBS)
> 
> Thanks for your patch. However, we generally don't like to add such
> weird dependencies. Instead, we prefer to fix the actual problem:
> hostapd/wpa_supplicant should probably not define a crc32() function,
> but use some other naming for it.

Indeed, suggested dependency is too weird. I sent a patch to hostapd
mailing list fixing too generic name for its IEEE 802.11 CRC-32:
http://lists.infradead.org/pipermail/hostap/2022-September/040752.html
If it is ok with hostapd maintainer, then I will split/adapt this patch
for hostapd/wpa_s v2.10 and send v2 here.

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
