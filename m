Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C015FCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 14:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A891610EA;
	Fri, 19 Sep 2025 14:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2DJ5mEbCh6R; Fri, 19 Sep 2025 14:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C3E610ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C3E610ED;
	Fri, 19 Sep 2025 14:20:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69F44150
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 14:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 676B940CD2
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 14:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-L8Yes_zDp8 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 14:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1060E40CCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1060E40CCE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1060E40CCE
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 14:20:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1 ([82.135.81.177]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1uxh6Z2n5X-007PTO; Fri, 19
 Sep 2025 16:20:48 +0200
Date: Fri, 19 Sep 2025 16:20:48 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>
Message-ID: <20250919162048.63853d57@pc-1>
In-Reply-To: <0dd0aaf4-2777-4c3f-8e7e-83143c8e8836@gmail.com>
References: <aMjHPLJ5qHp_TTju@archie.me> <20250916084217.4db9aa85@pc-1>
 <aMpFFo96JmNi24Zq@archie.me> <20250917172021.36e9bc72@pc-1>
 <9e835e4d-95bc-4b08-b5c5-65b4876a59bf@gmail.com>
 <20250918085231.0a1a6c88@pc-1>
 <0dd0aaf4-2777-4c3f-8e7e-83143c8e8836@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:l1CNkr7pcAfGcH4/gXSCZOtGPdf2Mt2IFnRcrZHXC7ToQ897FCb
 Qw4J3pvl4eCsJ9gBTSGCnNg1ljIBW7Z8RitQ4475gKQJQuUj5Pn/uHH8Pey9r2VbQ2W67xD
 0dX4uVvMelV4L+oQMecKzYsUEoIrcZNWpT5fE0A7D2baC17CGeyIDpy+R7A2wLOhhlR/kWJ
 vM+blIN/kN5yfHSm6F1gw==
UI-OutboundReport: notjunk:1;M01:P0:8cd43dEr9k0=;226SOIOt6d1zvea/PfBwh28ozik
 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
 hyiKiH0wmoj7oAwIQH4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1758291648; x=1758896448; i=ps.report@gmx.net;
 bh=J4kS0VdAj6rvJmB0Ud5W1O03NJOjEXP/nAc8wt+PFsI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lNNRDvHrM44djBdwizh8oacIrBNGtJ0mG7dNraAzkANMq4gO2KmE3MSYwzOO0FW0
 DuYo7DYpDoYOL2vOlVpN0e7WnEKyjlZV/HBXFMkxd51VMzXI6d8iaSq2nv4Rz/inJ
 Bpt7V86PNcB+v+YhK8eVJv6MLCAmJ6E4SdJQ4b7rHEvlNsDxja3m+HKQ/8Bc6fG/2
 oEdEaIrRud76ERLOaTLlAfSLR3GPdh2ePyIfpcRk0gusPRCoOjvnu2N9nSGj8u/dj
 nZjAEkqUID1tjgECIp+8Y1UvEjUt2rkMQt4j7kAzsoAmQmIJ3UfAsyhvOb1gevJ/m
 8sCWATEJiw6a6j1AEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=lNNRDvHr
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

On Fri, 19 Sep 2025 05:18:13 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 9/18/25 13:52, Peter Seiderer wrote:
> > On Thu, 18 Sep 2025 07:28:05 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >   
> >> On 9/17/25 22:20, Peter Seiderer wrote:  
> >>> On Wed, 17 Sep 2025 12:20:22 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >>>      
> >>>> On Tue, Sep 16, 2025 at 08:42:17AM +0200, Peter Seiderer wrote:  
> >>>>> The following patch fixed the problem for me:
> >>>>>
> >>>>> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> >>>>> index f69cbe45e2..078607a0c5 100644
> >>>>> --- a/package/readline/readline.mk
> >>>>> +++ b/package/readline/readline.mk
> >>>>> @@ -15,6 +15,10 @@ READLINE_CONF_OPTS = \
> >>>>>    	--disable-install-examples \
> >>>>>    	--with-curses \
> >>>>>    	--with-shared-termcap-library
> >>>>> +HOST_READLINE_CONF_OPTS = \
> >>>>> +	--disable-install-examples \
> >>>>> +	--with-curses \
> >>>>> +	--with-shared-termcap-library
> >>>>>    READLINE_LICENSE = GPL-3.0+
> >>>>>    READLINE_LICENSE_FILES = COPYING
> >>>>>    READLINE_CPE_ID_VENDOR = gnu  
> >>>>
> >>>> Applying your patch, I get another build error (this time on gdb):
> >>>>
> >>>> ```
> >>>>     CXX    init.o
> >>>>     CXXLD  gdb
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `UP@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `PC@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `BC@NCURSES6_TINFO_5.0.19991023'
> >>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
> >>>> collect2: error: ld returned 1 exit status
> >>>> make[3]: *** [Makefile:2232: gdb] Error 1
> >>>> ```
> >>>>
> >>>> Thanks.
> >>>>        
> >>>
> >>> Sorry, could not reproduce your failure...., did you make a complete
> >>>
> >>> 	$ make clean
> >>> 	$ make
> >>>
> >>> re-build after applying the patch/change?
> >>>      
> >>
> >> I can still reproduce the issue, unfortunately.
> >>
> >> (FYI: I encountered this on host-gdb.)  
> > 
> > One last try, does your buildroot git souce tree already contain this (recent) commmit?
> > 
> > 	From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > 	Date: Fri, 29 Aug 2025 17:24:39 +0200
> > 	Subject: [PATCH] package/gdb: really fix build with GCC 15.x by using externalreadline
> > 
> > 	https://gitlab.com/buildroot.org/buildroot/-/commit/d98e15a3639d9758ab3223f0a6de3a94d506e6fa.patch
> >   
> 
> It's already in my tree.
> 
> Thanks.
> 

On my system:

        $ nm -A ./host/lib64/*.so | grep tputs@NCURSES6_TINFO_5.0.19991023
./host/lib64/libreadline.so:                 U tputs@NCURSES6_TINFO_5.0.19991023

        $ ldd ./host/lib64/libreadline.so
        linux-vdso.so.1 (0x00007f6e7f520000)
        libtinfo.so.6 => /lib64/libtinfo.so.6 (0x00007f6e7f452000)
        libc.so.6 => /lib64/libc.so.6 (0x00007f6e7f200000)
        /lib64/ld-linux-x86-64.so.2 (0x00007f6e7f522000)

With the following patch:

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 864f62b57c..a837ac96bf 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -162,7 +162,9 @@ HOST_NCURSES_CONF_OPTS = \
 	--without-ada \
 	--with-default-terminfo-dir=/usr/share/terminfo \
 	--disable-db-install \
-	--without-normal
+	--without-normal \
+	--with-termlib \
+	--disable-widec
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))


	$ ldd ./host/lib64/libreadline.so
	linux-vdso.so.1 (0x00007f1b32fd3000)
	libtinfo.so.6 => /home/seiderer/Work/Buildroot/build_aarch64_gdb_libreadline_001/host/lib/libtinfo.so.6 (0x00007f1b32f2a000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f1b32c00000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f1b32fd5000)

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
