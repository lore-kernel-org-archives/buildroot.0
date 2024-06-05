Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E647EC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 15:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC258482C;
	Wed,  5 Jun 2024 15:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tL4ukskpfS59; Wed,  5 Jun 2024 15:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A68A8482E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A68A8482E;
	Wed,  5 Jun 2024 15:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 603581BF5D7
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D5DE8482E
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67hXnPkq-41r for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 15:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43E3F8482C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E3F8482C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43E3F8482C
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 15:41:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2232213F8D7;
 Wed,  5 Jun 2024 17:41:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jun 2024 17:41:53 +0200
Date: Wed, 5 Jun 2024 17:41:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Maier,
 Brandon L                            Collins" <Brandon.Maier@collins.com>
Message-ID: <ZmCHQQkgZ_jLqV2H@landeda>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
 <e0b686dc7ac91465e02ba7d6e18635404a93ca24.1717597094.git.yann.morin.1998@free.fr>
 <BN0P110MB1673E9E877CBA8E08D780D53EBF9A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
 <ZmCE8TZi-mvZoj9o@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZmCE8TZi-mvZoj9o@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717602116;
 bh=l2k/EIQ1//Ceu3+3sfAOsnM5KBOj6BkLByQ2WjfG1rQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r2Rt+egdbib46rircEHciUfGNqTVtBFXRoPylIKn/m+LqDy4KodBzHb1f/peDQvdt
 kslMMiPK9O9sMubnSMOI6dNRBh6K77cRG2YfBvbeFSvF+/p06zYc0oIlnNCy3G5LYC
 vRT6HF5Y2doxLo6kwAFpwtYS43QawMP3oTD5F3jvJTiM4n0fUb05Bi3ZhU6bSli/3P
 NyiJsVX3vVi+tWTmM7Nt8y/d9XPR4EahJP7GxhLxJp5gWXhEGnpLYKgTPeLz4A1bzb
 LVcPd8OiCospvOCvTAsAgnqFYrX/6aqXp/bmYz4+eTsQNopeIx95PteCVR6JyhrXdB
 fcQpk1Y4htUqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r2Rt+egd
Subject: Re: [Buildroot] [External] [PATCH 8/9]
 support/scripts/apply-patches: use appropriate TAR
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brandon, All,

On 2024-06-05 17:32 +0200, Yann E. MORIN spake thusly:
> On 2024-06-05 15:22 +0000, Maier, Brandon L                            Collins spake thusly:
> [--SNIP--]
> > > diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-
> > > patches.sh
> > > index 6da83f6826..39a0c050d6 100755
> > > --- a/support/scripts/apply-patches.sh
> > > +++ b/support/scripts/apply-patches.sh
> > > @@ -146,7 +146,7 @@ function scan_patchdir {
> > >                  unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
> > >                  rm -rf "$unpackedarchivedir" 2> /dev/null
> > >                  mkdir "$unpackedarchivedir"
> > > -                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
> > > +                $(TAR) -C "$unpackedarchivedir" -xaf "${path}/$i"
> > Shouldn't this be `${TAR}` since it's a shell script?
> Damned, one I missed... Thanks!
> I tried to find a case where I could exercise that code path, but I
> could not find a package with uses a tarball as a patch...

Obviously I did not look too far. I now can see;
  - heirloom-mailx
  - libid3tag
  - liblockfile
  - netcat-openbsd
  - unzip

I'll re-run a test.

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
