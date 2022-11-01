Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73931C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E19A14021B;
	Tue,  1 Nov 2022 20:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E19A14021B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iovgmZIB5Paa; Tue,  1 Nov 2022 20:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF561401ED;
	Tue,  1 Nov 2022 20:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF561401ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CECA1BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A8B80D74
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A8B80D74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRyDCmRzGHux for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:58:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F39980BC3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F39980BC3
 for <buildroot@busybox.net>; Tue,  1 Nov 2022 20:58:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 67C3BFF805;
 Tue,  1 Nov 2022 20:58:37 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:58:36 +0100
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20221101215836.44ee15cd@windsurf>
In-Reply-To: <87bkpq1jrh.fsf@tarshish>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
 <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
 <20221101213240.031261eb@windsurf> <87bkpq1jrh.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667336317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbTGmG9pER9TTsW0gKJ32oo4MJNjy7sP+1iboOXiqS8=;
 b=UBz/QNe9sUUl/JOBUOfP6U50FludhNAxE5d9+gXBwh7QtfCJLBhz00j2sfETqORwi9niQ3
 q88Z7ec77P81ArIZxLGmzukV3sNWNeddjGMq+rIqg/pPphPb82IVkt9iVVUxtUIvRMn3yy
 9IkIIEvEpqWvFxu2EOYx4iYLgzlbspLHghMbJ2CesvlsYTIJOD++VoHFmic+AzLMV10Jp7
 QH7IijtccZADCGdrzITq+qXnhoyfusGfMTpqeGIchTGzMHp36neHCRTGJtmd5SRefllCnG
 DFut/KZYnWmZUiNBUvBRzFzuCDWZPEKAF9u50TIV6XbKLYhDh0eCiFj+SyxDIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UBz/QNe9
Subject: Re: [Buildroot] [PATCH 2/3] package/socat: disable openssl for
 static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 01 Nov 2022 22:47:10 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> > SOCAT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
> >
> > does not work?  
> 
> It does not work because configure.ac puts $LIBS before -lssl in the
> tested command line.

ACK.

> > Also, do you have an autobuilder failure for this issue? Or you just
> > encountered it locally?  
> 
> We don't pass an explicit --with-openssl because socan configure does
> not support it. So the configure script just behaves as if openssl is
> not there, which is normal.

Hm, OK, but that does not really answer my question :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
