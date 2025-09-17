Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298D3CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAECC8431D;
	Wed, 17 Sep 2025 15:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XFOSrv53EG5; Wed, 17 Sep 2025 15:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BC6184310
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BC6184310;
	Wed, 17 Sep 2025 15:25:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2EC1AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E03D742648
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihBGTmU8KYHZ for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 15:25:31 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Sep 2025 15:25:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4ECEA4261B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ECEA4261B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ECEA4261B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:25:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1 ([82.135.81.177]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGyxX-1vBqNB1tgp-00DWbh; Wed, 17
 Sep 2025 17:20:22 +0200
Date: Wed, 17 Sep 2025 17:20:21 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>
Message-ID: <20250917172021.36e9bc72@pc-1>
In-Reply-To: <aMpFFo96JmNi24Zq@archie.me>
References: <aMjHPLJ5qHp_TTju@archie.me> <20250916084217.4db9aa85@pc-1>
 <aMpFFo96JmNi24Zq@archie.me>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:dMUBQCpbdwcIJI2Lo/pEMIgLNgS1KsDZHCoCrOmeaBdEV5Ves/h
 ovdFR0ZNHTUOnM54qoReEKS+7UwNOqb3sT+Gx+2G53NQwqO+09oJgas+kM/1BECCwpoYnaS
 2XeCndcLSzsp7g8pHiiZgpFYL4kI6UEi6lPI0lg6yc6pflU/I4kRWp1B8bnKFMKMMy182wE
 e2tOiKPONmG+r571+sreg==
UI-OutboundReport: notjunk:1;M01:P0:l5XTlAGGd+s=;A+IvQqC2zcaBlCP6/KfHB4WoIFF
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1758122728; x=1758727528; i=ps.report@gmx.net;
 bh=Ig08Y1hMjLgJjuLP/Bw3uBWe21a9kme+S6TcR/g3EzE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=uU/6zxt9DoTNxphu/WtVExBnKH+ZnBBecZjuSb6MdnBNyb9U+73txpb9LAGELdOZ
 dP+Xe/nTLcA8yFrD7mvLQ+uYZ1f1btEdNPMQhu1Lz9B4rU0uv0DQKyKy8PG2/Kylg
 D7mRCZxA00thI3zacS2Hp2v3iYcGx6Jr74xN5cWw898WmTvC9UvSUn4VAh6vEl8Mq
 xO+gP4KU7fRhjlECWIX+OVqSiQ4DgSs/cfvMIeB3tKhfVL42E0mQGtfVRBZ12c6ji
 +o2u8qppmZkkSAv7EjJ/27sa/hMvImxJqvvIW74xMjIu1tMo5SJeSPrtvveZM66Gg
 PGS+rjEvjT2yo3+GMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=uU/6zxt9
Subject: Re: [Buildroot] libreadline undefined symbol error when generating
 rootfs tarball
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 17 Sep 2025 12:20:22 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On Tue, Sep 16, 2025 at 08:42:17AM +0200, Peter Seiderer wrote:
> > The following patch fixed the problem for me:
> > 
> > diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> > index f69cbe45e2..078607a0c5 100644
> > --- a/package/readline/readline.mk
> > +++ b/package/readline/readline.mk
> > @@ -15,6 +15,10 @@ READLINE_CONF_OPTS = \
> >  	--disable-install-examples \
> >  	--with-curses \
> >  	--with-shared-termcap-library
> > +HOST_READLINE_CONF_OPTS = \
> > +	--disable-install-examples \
> > +	--with-curses \
> > +	--with-shared-termcap-library
> >  READLINE_LICENSE = GPL-3.0+
> >  READLINE_LICENSE_FILES = COPYING
> >  READLINE_CPE_ID_VENDOR = gnu  
> 
> Applying your patch, I get another build error (this time on gdb):
> 
> ```
>   CXX    init.o
>   CXXLD  gdb
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `UP@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `PC@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `BC@NCURSES6_TINFO_5.0.19991023'
> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
> collect2: error: ld returned 1 exit status
> make[3]: *** [Makefile:2232: gdb] Error 1
> ```
> 
> Thanks.
>  

Sorry, could not reproduce your failure...., did you make a complete

	$ make clean
	$ make

re-build after applying the patch/change?

Regards,
Peter
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
