Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 08:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89979404FF;
	Wed, 19 Jan 2022 08:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgydLAsL6NLg; Wed, 19 Jan 2022 08:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74E15403A4;
	Wed, 19 Jan 2022 08:14:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5D461BF35B
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C384D60807
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 08:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrG06xBYqq5K for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 08:13:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18719607C9
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 08:13:57 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 a1-20020a17090a688100b001b3fd52338eso1931866pjd.1
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zr2e5zutvg4d0I7a19UMr/oXwXdYp3SyV8pktD7FJv8=;
 b=p/v4i9mUmCGMnze1gZb9Ys5Z0l7R8FjMEMP+qMnZlUpqD1jIn3yjgiPzprkxcYqxCk
 y9ntPq4PGqTp+M5KbDtT+7h4nWg3a8FY3RgsRW5GRqYOcVveaej0BiwPVA9I4oN5UeLI
 MStuCmppaPpqZTxV82uV9wV9XlM8goNFjB67ye6+G+nAOcdv/sBU4oE4eWInKsN1tvEr
 qg++bRb59kkX/Iu3RSu8GW/+24pTXoExh9/qRaJZhLfvNYqpJ4as5DoGo1xVXyH6lvqy
 5qpg46kzekD7rl8XQ4FrOdbq3CN1tgSIT2zlbiPRcs6D5rFSOY7h4xBKLc8MdNHkK61E
 y6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zr2e5zutvg4d0I7a19UMr/oXwXdYp3SyV8pktD7FJv8=;
 b=jmvNI/XDlGwQEeVbDbU3K1zjIijXUCOFzZn+2zlxBy9FIwyjT4buqa6JFi8+tWwmSu
 75+xWtqsP2EVaTchRDPtLk8Z9/bYjGzhyMQ9BCS84P7l6YBNvhkyp2k0dgcIeRFzqNaP
 ZGktRjPlcui3ZPgDmq77uh5DO4+I7zexw9zTsawGyzZeWurAFUHiMiKOUR1/yC0i84xM
 Rs3hYzgRNw/Mkbsshkiw5pZdcX3WzhOi2kQbr6xGnNiwnEaI5s47+pF5OcnzHwZzo4Da
 K3+Dty/IMkvhul0eY3ubZtNSaFSfbdz5zJJMrD+he5JOMqzvhtrfUx1DVihExM3OvfGT
 o/9A==
X-Gm-Message-State: AOAM5317piUu5/uOSdYH/+FOCqlzrhts4CQw0VEDxO9MQbXtcVUMjfmv
 8Z5dcOXMnNTcr2mCCjSU5jc=
X-Google-Smtp-Source: ABdhPJxGiZIGJJEVeNaRn+NBqWtKogrh9F7DhOYUoJ8AU62JAOWxuwx9h+HQto/jDpgwbINchCiiEg==
X-Received: by 2002:a17:903:191:b0:14a:59cb:3199 with SMTP id
 z17-20020a170903019100b0014a59cb3199mr31149317plg.139.1642580037414; 
 Wed, 19 Jan 2022 00:13:57 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id a19sm5499144pfh.139.2022.01.19.00.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 00:13:56 -0800 (PST)
Date: Wed, 19 Jan 2022 17:13:54 +0900
From: Stafford Horne <shorne@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YefIQplvD1EaBOXX@antec>
References: <20220118222425.164134-1-fontaine.fabrice@gmail.com>
 <20220119085411.22ee6fb6@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119085411.22ee6fb6@windsurf>
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: define _REENTRANT for
 OpenRISC when -pthread is passed
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Will Newton <will.newton@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 19, 2022 at 08:54:11AM +0100, Thomas Petazzoni wrote:
> Hello Fabrice,
> 
> On Tue, 18 Jan 2022 23:24:24 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Patch added by commit eee96b0f0ad224b3e09a9b98c26d056e18f17fd5 on gcc
> > 9.3.0 must also be applied on gcc 10 and 11 to avoid the following build
> > failure on numerous packages (babeltrace2, pcsc-lite, tpm2-pkcs11,
> > etc.):
> > 
> > configure:13774: checking whether pthreads work with -pthread
> > configure:13868: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/or1k-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2  -std=gnu99 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c   >&5
> > conftest.c:27:26: error: #error "_REENTRANT must be defined"
> >    27 | #                        error "_REENTRANT must be defined"
> >       |                          ^~~~~
> > 
> > It should be noted that external bootlins will have to be rebuilt.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/cb58d4fbaeb08d188c2f8bf05ef1604789fa8766
> >  - http://autobuild.buildroot.org/results/7af9d4b68bd46ed260ed66ba2cc3c9c21482e741
> >  - http://autobuild.buildroot.org/results/6f926bec146752873f8032b593f0de1cb222ea46
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Wow, this patch still hasn't been accepted in upstream gcc? It's been
> submitted a looong time ago I believe.

Hello,

I must have missed this one.  It looks good to me I will push it upstream.

-Stafford
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
