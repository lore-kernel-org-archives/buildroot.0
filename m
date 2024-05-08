Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CCCC25B4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 14:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4C9C41A86;
	Wed,  8 May 2024 14:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Bath88Jp2ot; Wed,  8 May 2024 14:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE09D40242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE09D40242;
	Wed,  8 May 2024 14:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA5D01BF97C
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 14:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B239D80E9B
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 14:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DajlnjBlHLcQ for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 14:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6555280E99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6555280E99
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6555280E99
 for <buildroot@busybox.net>; Wed,  8 May 2024 14:54:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.127]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MF3HU-1rpLYL3olc-00FQwJ; Wed, 08
 May 2024 16:53:57 +0200
Date: Wed, 8 May 2024 16:53:57 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240508165357.0a3ead1d@gmx.net>
In-Reply-To: <20240506210623.7c3b3065@windsurf>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-8-ps.report@gmx.net>
 <20240506210623.7c3b3065@windsurf>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:aIYS2QZZTXmQjxCQS/YXYetAJ+Szxn8fzrOLqUP8RbXLqAv82q0
 gR/Xn2mLIlnFaKkkRbUE1AsTyo2/ZhUtKANNuYHI5mPftGnOL8zJ1auXeYnkPoDx9qLvJKd
 8xrvD1ifnBX1Y2lczLV1HvMVa0QRHiSqmX05bFTW7UxEPG5as97qzOBjW934aZM7rlbPJm5
 5uGpI9880bntERgasR80Q==
UI-OutboundReport: notjunk:1;M01:P0:XNypz1dmBGw=;iE8HmkVu9Lzj0FSvClt6lpmmvJ+
 5AxRNZ4t6bUuKBPnta4AFICJckpLIHz38Yh+c4hEGjSjdjZBWym64dLT4FSyknZTr8vikSLGt
 MWk6hXF+IkU2NNXBlgU6Whb2UdMdh2XskSnDEGw0PH4lVfdDS9npMAMZv1JOR+M49NkO0iK0u
 rOcFbjzMdjmsk8zNNFK9jHGcQ0TDlLNV91F6rt63UuXAmzW6M1MrHcILKB7n21oaI81+KnHq9
 U5W9OTIO5PmwMDj+fmo8yNoqWQOAnWtRZD+k3fupyuAFZ0A19UrSp1niCpy/b0uHFrl8z+CMe
 01laaXah7ovT3bWH+vG0Opywkit7vFpli1NFcielkb9xRvnJjK8uHhtZTlFbzc2C75QdCAh5s
 Sh9P/CzmvYs5J9QJlwo8LPr+d4EEyynoRmViRuZbPFZ2NRPQEIVllp/qv1EG/FTzNDUm8tpiU
 RwDpKJeNh9exwAcKhd9JjTud4eW1sltMQq/eZIHRZnsIzmEUYRpLAVueckRN3NgM0SLlxnIab
 hNP+jaw1LoqgM50P03g6I7IXUMDFZwV1iBmO+oToDdIP0rkkxI2rqiZaio6I4GgwtSx1So3vl
 MLb8RpSApiQYAg4So0rNMaPZyNaL7Qqs4h0jKNrAZSEV3iByfAc81KZGH0uNyH4ec+E635oXk
 fZzN4zGnLSAHGOxv4+5LYesIDsbpWywvRJNSDuNRddS5+CI0SRxtBvpIBFSAZkTGUuAV8tPub
 nExaChovvDZMjmEDVWkvhPbz0b8isVLWSJ51w2nuHFjiLgq/H5pmPeZmeG7H8RJKMx/kUAbyf
 q8KnezPHjGa/y4ma9blboTly3/y1bW5Hi01P24QQDkaaw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715180038; x=1715784838; i=ps.report@gmx.net;
 bh=KylJ0dGb35obVDvPRTYrz1VZQUm6P1gnaQd04pWuQxA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LH9ac7AA3CIGBfhzM5Th0XtjOwMGzKNr7HGAAql1P7MALm6te8AeH2kBJ3rdnnFN
 LyhMLPmmV9omwUA5jc0R64FoHcitRvRxz+zBeWUIHmJgkk+OR5a6Sdx8SlNhku/xf
 yGG/OuCz0SuXA9qK1QHgzTfwmj0dzWcDxJ72/7y0HutnlRXeBCuRwoaq+lH7XEYXd
 13oQ27dCsEUU3K4eUoqRtUdGcizj8FtrfSRMzVvd7Y7MDa2OOSimmQICSBIQJGrJY
 8lH6EsSBZG8zzq2FX0BaVwghE99eNUcT3xFieI+nz650yHBPSgJ1R7JnAH4PFJbsz
 xdafEn7ATpxbHMnn5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=LH9ac7AA
Subject: Re: [Buildroot] [PATCH v1 7/8] support/kconfig: reference
 environment variables directly (remove 'option env=')
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 6 May 2024 21:06:23 +0200, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> On Mon,  6 May 2024 16:45:50 +0200
> Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:
>
>
> >  config BR2_DEFCONFIG
> >  	string "Location to save buildroot config"
> > -	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
> > +	default "$(BR2_DEFCONFIG)" if "$(BR2_DEFCONFIG)" != ""
> >  	default "$(CONFIG_DIR)/defconfig"
> >  	help
> >  	  When running 'make savedefconfig', the defconfig file will be
> > @@ -197,7 +176,7 @@ config BR2_DEFCONFIG
> >
> >  config BR2_DL_DIR
> >  	string "Download dir"
> > -	default "$(TOPDIR)/dl"
> > +	default "\$(TOPDIR)/dl"
>
> So here the "\$(TOPDIR)" is because we actually don't want the "new"
> feature to kick in, and we want the value of this variable to be
> expanded not by kconfig, but by the makefile machinery?

Yes (sorry, the explaining sentence in the commit log got lost while
rebasing/squashing)..., without the escape the expanded value is
written out to the .config file...

>
> So this also means that when we do $(BR2_EXTERNAL_BLABLA_PATH) in our
> .config, it now also need to be \$(BR2_EXTERNAL_BLABLA_PATH) ? If so
> that's going to break a *lot* of things...

Needs to be tested ;-), but the problem is not in the .config files
but in the Config.in* files...

Regards,
Peter

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
