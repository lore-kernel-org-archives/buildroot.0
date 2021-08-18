Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE360C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:04:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B83E610E5
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B83E610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ACD360654;
	Wed, 18 Aug 2021 21:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqXTT82AnfCr; Wed, 18 Aug 2021 21:04:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D0E460B85;
	Wed, 18 Aug 2021 21:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B71941BF2C7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6D4A60B85
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DE6E-T2_HCvq for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:04:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA13560654
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 21:04:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:68d0:53c8:12d4:d4b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 01AC97802CE;
 Wed, 18 Aug 2021 23:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629320676;
 bh=ys2oVgXQEsy23iJsTxiYNiZ1Kc8PUtXkXvyI5KNg1U4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fszcuFPD6jB7eIYA7997oWlVKjjwXfjBD6UruwSUVx0VmyJPHTQuqOvIYDpz2QVy0
 nWG0peV05W3Pa7tVFMPlhZXsYxdqILqF6zbAji3t4uIQVV6tIWMmWqx/uemUvFShff
 c1h+x9yCv1YjORufGOf+HarGBMK0RpY4U6UYE1g03yhtq0qgPI+uHqRHIKz5/9cQsC
 zzmuKYayvRzskpKMPohWcZ63cO4L15xbr1xKHHF175fbM4RFZHsPbRM+MqmQz6eFjy
 tviGbLL6i2vEKFaWV6ZYge1ApSu0DZP2mkA9FheUKORG1udlMGzbtFU8knaCgD0V1L
 Xc7EvVqXq+0CQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Aug 2021 23:04:31 +0200
Date: Wed, 18 Aug 2021 23:04:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210818210431.GZ27036@scaer>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818122511.005d6a5c@windsurf> <20210818110558.GY27036@scaer>
 <20210818221842.5926641d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818221842.5926641d@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-08-18 22:18 +0200, Thomas Petazzoni spake thusly:
> On Wed, 18 Aug 2021 13:05:58 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Not sure the exact reason, but notice that the failures occur at install
> > time, not build time.
> I did try with "make host-libcap", which includes the installation
> step, and I even tried to do a full build of one of the failing
> defconfigs. The build failed, but much much later, on a completely
> unrelated package. And manually checking the RPATH of the host-libcap
> binaries: they are correct.

Here too.

> > And even then, the Makefile is still trying to
> > compile some stuff.
> > 
> > libcap is a generic package, and I noticed that the build and install
> > commands do not use the same environment:
> > 
> >     define HOST_LIBCAP_BUILD_CMDS
> >         $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> >             $(HOST_LIBCAP_MAKE_FLAGS)
> >     endef
> > 
> >     define HOST_LIBCAP_INSTALL_CMDS
> >         $(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
> >     endef
> > 
> > So I wonder if, at least for sanity sake, we should not just add
> > $(HOST_CONFIGURE_OPTS) in the environment for the install commands too.
> 
> I'm not sure how that could cause an issue, as I'm building on the same
> machine, same defconfig.

Well, it has an impact: the file sthat are built at build time and
install time have different compile lines:

For example, cap_magic.o at build time, from:
    http://autobuild.buildroot.org/results/e0d8cb350072ea90c331824a6790c792d60d885d/build-end.log

    gcc -O2
    -I/data/buildroot-autobuilder/instance-0/output-1/host/include -Dlinux
    -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
    -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline
    -Wshadow -g  -Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual
    -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs
    -Winline -Wshadow -g  -Dlinux -Wall -Wwrite-strings -Wpointer-arith
    -Wcast-qual -Wcast-align -Wstrict-prototypes -Wmissing-prototypes
    -Wnested-externs -Winline -Wshadow -g  -fPIC
    -I/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap/../libcap/include/uapi
    -I/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap/../libcap/include
    -DLIBRARY_VERSION=\"libcap-2.52\"
    -DSHARED_LOADER=\"/lib64/ld-linux-x86-64.so.2\" -c execable.c -o
    cap_magic.o

Which get linked with:

    gcc -Wl,-x -shared -O2
    -I/data/buildroot-autobuilder/instance-0/output-1/host/include -Dlinux
    -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
    -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline
    -Wshadow -g  -Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual
    -Wcast-align -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs
    -Winline -Wshadow -g  -Dlinux -Wall -Wwrite-strings -Wpointer-arith
    -Wcast-qual -Wcast-align -Wstrict-prototypes -Wmissing-prototypes
    -Wnested-externs -Winline -Wshadow -g
    -L/data/buildroot-autobuilder/instance-0/output-1/host/lib
    -Wl,-rpath,/data/buildroot-autobuilder/instance-0/output-1/host/lib
    -L/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap
    -L/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap/../libcap
    -L/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap/../libcap
    -Wl,-soname,libpsx.so.2 -o libpsx.so.2.52 ../psx/psx.o psx_magic.o
    --entry=__so_start -lpthread -Wl,-wrap,pthread_create

And now at install time:

    gcc -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Dlinux -Wall
    -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
    -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline
    -Wshadow -g  -fPIC
    -I/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap/../libcap/include/uapi
    -I/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap/../libcap/include
    -DLIBRARY_VERSION=\"libcap-2.52\"
    -DSHARED_LOADER=\"/lib64/ld-linux-x86-64.so.2\" -c execable.c -o
    cap_magic.o

which is now linked with:

    gcc -Wl,-x -shared -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
    -Dlinux -Wall -Wwrite-strings -Wpointer-arith -Wcast-qual -Wcast-align
    -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Winline
    -Wshadow -g
    -L/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap/../libcap
    -Wl,-soname,libcap.so.2 -o libcap.so.2.52 cap_alloc.o cap_proc.o
    cap_extint.o cap_flag.o cap_text.o cap_file.o cap_magic.o
    --entry=__so_start

So, the first properly gets our LDFLAGS, the second, not. Pasing
TARGET_CONFIGURE_OPTS at install time would solve^whide the issue,
though.

But OK, what are the dependencies of cap_magic.o?

    cap_magic.o: execable.h execable.c loader.txt

execable.h and .c are not generated, so they are terminal dependencies.

loader.txt is generated. And it is generated twice (still form the same
build):

    make[3]: Entering directory '/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap'
    gcc -o empty empty.c
    objcopy --dump-section .interp=/dev/stdout empty > loader.txt
    [...]
    make[3]: Leaving directory '/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap'
    /usr/bin/make libpsx.so
    make[3]: Entering directory '/data/buildroot-autobuilder/instance-0/output-1/build/host-libcap-2.52/libcap'
    objcopy --dump-section .interp=/dev/stdout empty > loader.txt
    [...]

Wha?

So, it believes loader.txt is out of date wrt a file named 'empty'
(which is generated from a trivial C file empty.c)

So, becasue loader.txt is re-generated a second time, some files are
re-built at install time. Which explains why we get an issue.

But then, why is it out of date, at all? I really got stuck there...
Could it be that this is a parallel build issue? I doubt it, though...

I'm out of clues now, so I'll let a godd night's sleep try to solve
this....

Regards,
Yann E. MORIN.

> > Also, notice spurious errors from ldconfig:
> > 
> >     /sbin/ldconfig
> >     /sbin/ldconfig.real: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
> >     make[5]: [Makefile:162: install-shared-psx] Error 1 (ignored)
> > 
> > (ldconfig is a wrapper around ldconfig.real, specific to debian and.or
> > ubuntu I guess)
> 
> Right, but the absence/presence of the RPATH should normally not be
> affected by this, I believe.

Nope, nope.

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
