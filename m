Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1C3CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 06:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E391484B38;
	Thu, 18 Sep 2025 06:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehDL38oEOuwi; Thu, 18 Sep 2025 06:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF67384B3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF67384B3C;
	Thu, 18 Sep 2025 06:52:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF6A2199
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D12C284B38
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yn_FKYPZiLhQ for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 06:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 890F384B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 890F384B3C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 890F384B3C
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:52:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1 ([82.135.81.177]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8mV-1uV2YE2niv-00aPta; Thu, 18
 Sep 2025 08:52:31 +0200
Date: Thu, 18 Sep 2025 08:52:31 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>
Message-ID: <20250918085231.0a1a6c88@pc-1>
In-Reply-To: <9e835e4d-95bc-4b08-b5c5-65b4876a59bf@gmail.com>
References: <aMjHPLJ5qHp_TTju@archie.me> <20250916084217.4db9aa85@pc-1>
 <aMpFFo96JmNi24Zq@archie.me> <20250917172021.36e9bc72@pc-1>
 <9e835e4d-95bc-4b08-b5c5-65b4876a59bf@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:s5Uq1JBPyWQxSf93PCSFmthhu3bpfMJKJxizobohWcGXJNdxB0m
 kymhQQdSidIJVSNN/NfX/Ht1Hz3Ll87U2eFtGbanW7cNRYrlzAg1EczjRIhaWIEjaes4B3r
 j5cu3D1CXqVhUP9pyHMzX9v3JpM/Bf3whlcKVX2JUg2RDsZPv082yRlB9Rjk0bl/4KQ4EOu
 OfuoIBOIe8bukKGB5gufw==
UI-OutboundReport: notjunk:1;M01:P0:I7xFUxner4k=;B3dgtbSqUOjrELCz9gYwshajpHs
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1758178351; x=1758783151; i=ps.report@gmx.net;
 bh=D3a/6Bx2ZhHipIYaZrsG0U+k5wvxjncBnCDw6tWjmJY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UBDjw2S6pTi8m5CPmxCzMD0MGnjtL8+aEBGNj/Q63gKQjoPzj7QdmuA7WygBJOl/
 LvWRu7n62tVqozO49Oy0NCcvZk2vXSFYJ4icneCaAq4RwKBIj6ER6i2xNtZbITYkz
 eW8cagXpNV/WhtzYlngUfOqvzt/a3L1k8wkqC0T5bqK78Pp5mPFko+PdNTDX7CUcM
 Xz9vp6CiVRZVYSeO8pmvHzSyfIdO90jpdE6dCJesDFvnO+R0vvCqJGLHhU47XxZfa
 NyVxPVYMFQlhib9t23lKuB6reo/uNwR2tKhSLlYKAx4opasj0gD7pRrTkp35fo2xI
 rtGfiE26PL0L4S/giw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=UBDjw2S6
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

On Thu, 18 Sep 2025 07:28:05 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 9/17/25 22:20, Peter Seiderer wrote:
> > On Wed, 17 Sep 2025 12:20:22 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >   
> >> On Tue, Sep 16, 2025 at 08:42:17AM +0200, Peter Seiderer wrote:  
> >>> The following patch fixed the problem for me:
> >>>
> >>> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> >>> index f69cbe45e2..078607a0c5 100644
> >>> --- a/package/readline/readline.mk
> >>> +++ b/package/readline/readline.mk
> >>> @@ -15,6 +15,10 @@ READLINE_CONF_OPTS = \
> >>>   	--disable-install-examples \
> >>>   	--with-curses \
> >>>   	--with-shared-termcap-library
> >>> +HOST_READLINE_CONF_OPTS = \
> >>> +	--disable-install-examples \
> >>> +	--with-curses \
> >>> +	--with-shared-termcap-library
> >>>   READLINE_LICENSE = GPL-3.0+
> >>>   READLINE_LICENSE_FILES = COPYING
> >>>   READLINE_CPE_ID_VENDOR = gnu  
> >>
> >> Applying your patch, I get another build error (this time on gdb):
> >>
> >> ```
> >>    CXX    init.o
> >>    CXXLD  gdb
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `UP@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `PC@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `BC@NCURSES6_TINFO_5.0.19991023'
> >> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
> >> collect2: error: ld returned 1 exit status
> >> make[3]: *** [Makefile:2232: gdb] Error 1
> >> ```
> >>
> >> Thanks.
> >>     
> > 
> > Sorry, could not reproduce your failure...., did you make a complete
> > 
> > 	$ make clean
> > 	$ make
> > 
> > re-build after applying the patch/change?
> >   
> 
> I can still reproduce the issue, unfortunately.
> 
> (FYI: I encountered this on host-gdb.)

One last try, does your buildroot git souce tree already contain this (recent) commmit?

	From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
	Date: Fri, 29 Aug 2025 17:24:39 +0200
	Subject: [PATCH] package/gdb: really fix build with GCC 15.x by using externalreadline

	https://gitlab.com/buildroot.org/buildroot/-/commit/d98e15a3639d9758ab3223f0a6de3a94d506e6fa.patch

Regards,
Peter

> 
> Thanks.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
