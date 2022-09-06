Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273B9C38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8621641690;
	Tue,  6 Sep 2022 20:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8621641690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cthU787E0xEE; Tue,  6 Sep 2022 20:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A224167E;
	Tue,  6 Sep 2022 20:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A224167E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB8B1BF2A6
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07EF06077D
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EF06077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDJctDabUFwO for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:37:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0855260674
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0855260674
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:37:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7974C13F85A;
 Tue,  6 Sep 2022 22:37:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 22:37:47 +0200
Date: Tue, 6 Sep 2022 22:37:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220906203747.GB1490660@scaer>
References: <20220904205702.1488199-1-geomatsi@gmail.com>
 <20220905201727.GJ1490660@scaer>
 <23566bac-ad05-3bd6-1b0b-ad4f3b3f5c20@mind.be>
 <20220906200718.GA1490660@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906200718.GA1490660@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662496673;
 bh=mrJQRu3ESJDv9FbaCnHfd+JlR/SJXZmJcd8vZL8qCHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KCMFI9pn3ux3cK7pCZ5VT9/HfweWIkYbZK19aF/XMC2xcTdmXns+FUfnX7yns6Lyd
 MwPG2jbr/0WUoIH/oA9ZxoZhS9qSZwftc77PXeCXp6aoKdMv30Sm0dm6roGxqWaSff
 Q36iBKRivcBN04ErFdXZFPW+0FADbn5QvJJ1ibOepvlpuUsOcOxznCq7pRrz72mPUO
 v401HZBqBGz5ULJzZY9iJetYq9jOOm6d6mUhXKb0ruDDSh1h2Xwpog1i3yEz64UeiP
 mNikuDKYUK4FOrGBXg6VsnRTMbJDgco0h222/c03qjIfcmuRLh1GtgUDlnTDZY3fkO
 yRbDlgxwPFnbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KCMFI9pn
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf: add
 host-python3 dependency
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-06 22:07 +0200, Yann E. MORIN spake thusly:
> On 2022-09-06 21:46 +0200, Arnout Vandecappelle spake thusly:
> > On 05/09/2022 22:17, Yann E. MORIN wrote:
> > >On 2022-09-04 23:57 +0300, Sergey Matyukevich spake thusly:
> > >>Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
> > >>jevents.py")
> > >00facc760903 is only parts of 6.0-rc kernels so far, so unless one uses
> > >bleeding edge technology, there is no issue. So, paying the price of a
> > >host-pytohn3 build just for release-candidate kernels is a bit too much
> > >in my opinion.
> > >So, I added a config knob to drive this, like we have for host-openssl
> > >and a few other host programs for building the kernel.
> >  If only python is needed, no modules, then $(BR2_PYTHON3_HOST_DEPENDENCY)
> 
> Dang, that's right, I totally forgot about that one...
[--SNIP--]
> So, indeed, BR2_PYTHON3_HOST_DEPENDENCY seems a much better fit...

Err, hold on, no: we still do not want to pay the price for a
host-python3 build if the local system does not have python-3.4+ and the
kernel does not even need it, in fact.

So, I think we want to keep BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3
but switch the _DEPENDENCY to BR2_PYTHON3_HOST_DEPENDENCY.

Thoughts?

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
