Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA19C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 13:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1253D40A02;
	Sat, 25 Dec 2021 13:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bfr4qE18On_0; Sat, 25 Dec 2021 13:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786B8409B1;
	Sat, 25 Dec 2021 13:59:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 113681BF5A9
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 13:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0023660C04
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 13:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmzB4H6q5oMk for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 13:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD02F60BFA
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 13:58:59 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id q8so2276211ljp.9
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4RJ9xsNMCgWdEmbcgIdTckcNNcgn8d1dDjFVjoAMh+Y=;
 b=Lhf3JIDDdTH8R9FwXMCH724ZItT9Ie6DYqmbSH54zVLZQNiwEyB/pXHHSzWldTi9jm
 c//L8BTNSYK7GzPBdElu4n8OXeH2Wma7opcrxfhW1GM4aqjKpWYlEp3xrHDB2B/lR7lC
 nrqpYuL9Vi3BtF/LAgcoZw1k+xitSHcW9RDKg/Nv1EuFCylX5EMd37VwlOSeaYp0fRNk
 1SMXm98m2bqoWTz3fJvpYB4N/oOOm66N43geuV2nwn6hOI3E/pn5vQTF30rZcu7q0e42
 2F3pJFV5LzAroeBGQr9tNOki8qWNSvc/TnNVGwe4Q0AAb7tRkQdxTBX5yCHyYyuTjYSo
 6nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4RJ9xsNMCgWdEmbcgIdTckcNNcgn8d1dDjFVjoAMh+Y=;
 b=LRMyqe/qeMDqq+3D381F/LM/1ueSRxxcg8TOJYgeDb2OFoOY4V5UVEzxH9CJCNpZtu
 +bFXpTdDuAUxwLV0UjOzDbs+zcOfbCx0GxJ7O/4ON1OgY4vjiCTfs0Ze7Pi2L7v76sfg
 w3iQCKnaaXPLEj/pRJxQ/RcAilGwrcQjRNkJzXRrzdsVs8253B767mUMySJq6PlSz4R+
 vu02qd3Ope+bQM0VkagxfEZnAG4e42trIxD8vAbKJ/AEVVKwC9oqrHkuwgpE21eAHykD
 SmuU8GCkWh2jnTcX5l+NfcLo3fIlBfWuymfaUt7MotV17LzrGedSirn+SwuaYTRC+AAD
 wFMg==
X-Gm-Message-State: AOAM53201d4LDie5ABVVBUj2MUK6nlBQ+GwC6F0NQemIjkA2una/MqQs
 6MxJQBlPVXFAJ8W6gM6ngUQ=
X-Google-Smtp-Source: ABdhPJy65EI1GEImM7eKFECdkAKqtE8K/1Z7uXmGJYzOzN7RC5CqUM80afc1X2YNOIznf/+rUAEMvA==
X-Received: by 2002:a2e:a164:: with SMTP id u4mr5480841ljl.30.1640440737607;
 Sat, 25 Dec 2021 05:58:57 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id b37sm1117110lfv.200.2021.12.25.05.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 05:58:57 -0800 (PST)
Date: Sat, 25 Dec 2021 16:58:56 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <YccjoPQzuAN2wGEE@curiosity>
References: <20211219142035.6220-1-peter@korsgaard.com>
 <20211219142035.6220-2-peter@korsgaard.com>
 <YcchfJG1EDtyepcy@curiosity>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcchfJG1EDtyepcy@curiosity>
Subject: Re: [Buildroot] [PATCH 2/2] board/*/genimage.cfg: use
 partition-table-type = "gpt" for genimage-15
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>, Michael Walle <michael@walle.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> > Genimage 15 deprecated the gpt option and now prints a warning when it is
> > used:
> > 
> > INFO: hdimage(sdcard.img): The option 'gpt' is deprecated. Use 'partition-table-type' instead
> > 
> > So change the genimage configuration files to use that instead.
> > 
> > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> ...
> 
> > diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> > index f51ce3f854..aee9719ae4 100644
> > --- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
> > +++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> > @@ -13,7 +13,7 @@ image boot.vfat {
> >  image sdcard.img {
> >  	hdimage {
> >  		# for root=PARTLABEL support
> > -		gpt = true
> > +		partition-table-type = "gpt"
> >  		# default GPT location conflicts with bootloaders, move it after
> >  		gpt-location = 1M
> >  	}
> 
> Build still fails for orangepi-zero-plus2 with this patch. I get the
> following subsequent error messages from genimage:
 
Sorry, I meant orangepi-pc-plus board.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
