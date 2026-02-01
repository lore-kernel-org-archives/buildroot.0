Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACB9E6529D
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 21:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B902F6066B;
	Sun,  1 Feb 2026 21:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JUilUUch4Iea; Sun,  1 Feb 2026 21:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2469B605ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769980462;
	bh=NXtRhENx11R6H9pPs7TyDCrxweXEDY6hePUr0FoYLZM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hNNtXi/ShxFrPtTR+Uybevs1GYO+HmiHR+ey7yTrtPvPPDCJlV4M7j3HHtJ1n7ysD
	 vu8utENcT0pmq2+eCcR2WOmqvosKOfmnvuieyPM2e6HHCKGlqWlGq8xWBotX4rlnPu
	 8o82d+hRjdpImeDRyydB49qJ1GkNGGKtxdk2VgKKH1WFIcjBqrpmq0Z+dHGMvgROJk
	 JQP+xGzQc921D68fXV1WkK/DX7CDtMRTo+lvARXWXXo1yO7/QOUHDWiYcoXt7KySet
	 SICscfYTrGwnMlRYwbAtfmJW6E57LUoTX7uHcuh/I18piDop45R81s9u63X8WzPf5e
	 B1mL0UXXYjg3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2469B605ED;
	Sun,  1 Feb 2026 21:14:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 996AE23E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AA15605DE
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDJcYP-7IW5o for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 21:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D906605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D906605D1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D906605D1
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:14:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -439432128; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 21:14:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmels-00000005l6T-234m;
 Sun, 01 Feb 2026 22:14:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  Boerge Struempfel
 <boerge.struempfel@gmail.com>
In-Reply-To: <20260130131014.1506555-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Fri, 30 Jan 2026 14:10:13 +0100")
References: <20260130131014.1506555-1-buildroot@bubu1.eu>
Date: Sun, 01 Feb 2026 22:14:16 +0100
Message-ID: <87o6m888uv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XXNECuNTXLpq/WcrDjc2NTLenF2EmwXE/ybpoVb3FiLjh8AbkUk7QYlgjFviY2B4rZR2dfh1kfZDA/x/eAU5V32W+NosDwPyIiChO9koAqa/zFVFSFpgfM/K7RY1wWb6WmBUgCZ+V5JSi4LrHA0HzU4gkHwq37rFx44pZOPZHzeHbTIG76Po8Ldh+42a6XjjapyyxGW8GehWEK//iX6FJKoOdlQJznlFrq1Ef1PBqTFWe8xktI5t6A+tb/Wzq+mwCfnKw+DnxwOLjx2idoAeQaGtE7/o++j6zz2RQzXXRWNJnQFpQ/yVZCh/kM8srPSmNg2dBmxsuxnUKuiuJPH2Tg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Voo2vtHzlak1KabU0Tjdlxw2370F1+NevdArXLwMxVY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=XXNECuNT
Subject: Re: [Buildroot] [PATCH] package/libgpiod2: add option to enable
 gpioset interactive mode
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
 > ---
 >  package/libgpiod2/Config.in    | 11 ++++++++++-
 >  package/libgpiod2/libgpiod2.mk |  7 +++++++
 >  2 files changed, 17 insertions(+), 1 deletion(-)

 > diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
 > index 5a13bfc344..279b1e40e7 100644
 > --- a/package/libgpiod2/Config.in
 > +++ b/package/libgpiod2/Config.in
 > @@ -21,7 +21,16 @@ config BR2_PACKAGE_LIBGPIOD2_TOOLS
 >  	help
 >  	  Include a set of command-line tools for managing GPIOs.
 
 > -endif
 > +if BR2_PACKAGE_LIBGPIOD2_TOOLS
 > +
 > +config BR2_PACKAGE_LIBGPIOD2_GPIOSET_INTERACTIVE
 > +	bool "gpioset interactive"
 > +	select BR2_PACKAGE_LIBEDIT

You need to propagate the dependencies from libedit, but maybe it is
easier to get rid of the option and just automatically enable this if
libedit is enabled, E.G.:

ifeq ($(BR2_PACKAGE_LIBEDIT),y)
LIBGPIOD2_DEPENDENCIES += libedit
LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
else
LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
endif

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
