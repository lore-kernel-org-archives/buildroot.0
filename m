Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F66C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C1481EDF;
	Tue, 21 Feb 2023 21:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C1481EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H40Lh8q2HdE2; Tue, 21 Feb 2023 21:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4870A81F0F;
	Tue, 21 Feb 2023 21:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4870A81F0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5071BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04EF681EDF
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04EF681EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tepanr_Dn5J5 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:16:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38CEC81F0F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38CEC81F0F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:16:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 805165FFA2;
 Tue, 21 Feb 2023 22:15:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 Feb 2023 22:15:54 +0100
Date: Tue, 21 Feb 2023 22:15:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230221211554.GI2718518@scaer>
References: <20230221142144.1503123-1-fontaine.fabrice@gmail.com>
 <20230221154827.7e737960@windsurf> <20230221200857.GG2718518@scaer>
 <20230221212634.736f8d70@windsurf> <20230221203403.GH2718518@scaer>
 <20230221214948.0b7ba737@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230221214948.0b7ba737@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677014162;
 bh=tIFY1tUTYi+G61OGmrzRb0laIh5HhcDQiRIfcyXWBpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IaJD3UuEQ/1ql5AFE2ptoAw2yJgBloZCyRr4zNpuIS08f988fGC1U1OSowuF/iSyf
 AqT/6LZtt4VPa1UNY0o8Fj+lBLWTzhFWv++nArz1MVG1G5C1mEAAu3xsIES0i+Yk1f
 3wd11BNG9lM1Qy/ulaIpuGkjOeb4G+RuBqcAX+BPMYo4qBNxATdgscG8U8t5nQ+YNM
 7uwFyw26au6GZRh9isgZ/FP0iYUtK7WFoXVLwaNqQPw3y+mFTxzSsbnaiY/1WypazW
 QsxDvnw0D5dtaS6ZOIrWCr/hdWIGQhyoc40rwWkv0cYnHYUwoOUfI5VuSNnagRP8Sf
 8OGOZKRzJzD5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IaJD3UuE
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: disable with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-02-21 21:49 +0100, Thomas Petazzoni spake thusly:
> On Tue, 21 Feb 2023 21:34:03 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > The upstream code is (split for readability):
> > 
> >      if (('-Ofast' in c_args or
> >           '-ffast-math' in c_args or
> >           '-ffinite-math-only' in c_args
> >          ) and
> >          not '-fno-finite-math-only' in c_args
> >         )
> > 
> > So, if -fno-finite-math-only is in c_args, then the whole condition
> > should evaluate to false, and thus it should not error out, right?
> > 
> > Or did I lose more than my grep-fu? ;-)
> 
> No, tonight your grep-fu is better than mine: you're totally right! :-)

Note however that upstream code is anyway buggy. If CFLAGS contain, in
that order:

    -fno-finite-math-only -ffinite-math-only

then the condition will evaluate to false, and thus the test will not
abort, but still this would be incorrect, as -ffinite-math-only would
win the setting because it comes last...

So presumably, we should even be able to do:

    SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-finite-math-only -ffinite-math-only

which would again break the build....

Even if we do not do that ourselves, nothing prevents a suer from
providing that in their BR2_TARGET_OPTIMIZATION. But then, we can't
protect people from shooting themselves in the foot... ;-)

Regards,
Yann E. MORIN.

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
