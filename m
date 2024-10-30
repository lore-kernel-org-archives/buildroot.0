Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540B1D5CCB0
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF39608AC;
	Wed, 30 Oct 2024 13:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_L43lULtsOA; Wed, 30 Oct 2024 13:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C93608AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C93608AB;
	Wed, 30 Oct 2024 13:36:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 541FA494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42002608A6
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhgB1D49IE4e for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 13:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECAEF608A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECAEF608A9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECAEF608A9
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:35:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 163A04000B;
 Wed, 30 Oct 2024 13:35:56 +0000 (UTC)
Date: Wed, 30 Oct 2024 14:35:55 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241030143555.5a69a4bf@windsurf>
In-Reply-To: <CAFkzVZZc=i02CTkxRHSXwrQb=BALPtxD0sSQudCoLtVOj+qfYg@mail.gmail.com>
References: <20241024002847.10348-1-fancp2007@gmail.com>
 <20241029054713.786223-1-fancp2007@gmail.com>
 <20241029195016.27fc140d@windsurf>
 <CAFkzVZZc=i02CTkxRHSXwrQb=BALPtxD0sSQudCoLtVOj+qfYg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730295357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqAbQG3pbJd6RW1xgTbLa617xHHmM+mqc9Bj13Q/Gk8=;
 b=eVDMvn41DbXT/Y9WlZnWZMz1jI7DEB7sLfwJOh7JvMB9Yeajig7SI+CusNIdoYGcM/7eLX
 CrnR5naGeCgKCpiEUNSBln8bTJ46GSto1O591RPdDOQUJC2z4HaBM6Ka0X11rAAK2rnidQ
 ypWs14C5aRhTdHAqI6HClE0xRmITZIKMvgr/UO2fDz8isrsda0b5PAs7RiWNzxOG4Vvxf8
 lA9H7dMFLZVKIpqDU+vcU8aduTkvNAk/mRou00T7j6DDHI+vtJi4vX6JtGV8kJ7zb56ufm
 xbdw/+xb65RxO924EcFLSmbyTRaYTuQTnwcR+IOrtJ3vUjr2SksKw2Wdlg3yuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eVDMvn41
Subject: Re: [Buildroot] [PATCH v3] package/python-pgcopy: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Scott,

James: question for you below.

On Wed, 30 Oct 2024 21:28:24 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> > Are you sure python-psycopg2 and python-pytz are build-time
> > dependencies? I.e are they needed during the build, or only at runtime?  
> 
> In pgcopy's setup.py file, has the next line:
> install_requires=["psycopg2", "pytz"]
> 
> So I understand, those are build-time dependencies.

I'll let James comment on this, but I believe install_requires are
run-time dependencies, not build-time dependencies.

> Meanwhile, the psycopg2 module depends on postgres.
> Do I need to remove postgres dependency from this package?

If you select BR2_PACKAGE_PYTHON_PSYCOPG2, it will automatically select
BR2_PACKAGE_POSTGRESQL.

Now whether you need postgresql as a build-time dependency or not
depends on whether your package is building native code that links
against Postgresql libraries.

> > What is this hook needed? A small comment would be useful.  
> 
> The py2.py file is just for Python 2, it will cause compilation errors
> in Buildroot:
>   File "/usr/lib/python3.12/site-packages/pgcopy/errors/py2.py", line 19
>     raise newexc, None, sys.exc_info()[2]
>                 ^
> SyntaxError: invalid syntax
> 
> I'll add a comment before the hook definition.

Yes, good.

> This hook will be removed, i copied it from package/python-psycopg2,
> It is redundant.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
