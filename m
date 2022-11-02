Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89D4760AF8;
	Wed,  2 Nov 2022 21:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89D4760AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfaM8Ezp8Xod; Wed,  2 Nov 2022 21:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84FD060AC0;
	Wed,  2 Nov 2022 21:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84FD060AC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40ECE1BF2FA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27825416E5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27825416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYbd7nzy-tF2 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 21:54:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E87441682
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E87441682
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 21:54:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ac44:26e4:6f4e:920d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 297F22003C8;
 Wed,  2 Nov 2022 22:53:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Nov 2022 22:53:55 +0100
Date: Wed, 2 Nov 2022 22:53:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221102215355.GB3918838@scaer>
References: <20221007235002.79221-1-vfazio@xes-inc.com>
 <20221007235002.79221-2-vfazio@xes-inc.com>
 <20221101234138.66423cf3@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221101234138.66423cf3@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667426039;
 bh=yb6CP48fT7DPDzkcpTCU6kD58aA9onVvxVrrCUvHnaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CGrS24PnsoxhWwgQSn1Ns8QKEL8BNEc0KhFKFoCP8azDZvS+Gq1bu+Z1iBKFYEU2T
 VED+vGfjeFvI1/xlPLW3Sx6zRerMNj80gytZAEsnD6rU29CyWlN7pfm0pwYJh+zw1M
 WORZgBEf3bTwy/1/SK6f2+rD3xP4TCv5uMtDYFHLoYAxSw5dqQWGRv1jU7k8kyrOm0
 bWBQX0XTVEB6jEipnbvyZSR+D8U0Zac1VwEDTBnq+z/ESzgcKnREtlDS7OPu0yhXCN
 A03m5JI8Hk8qN4R3oyBwDaiDv0Pf+yllaEy0gkKq3XikPigQ9MxSv90r6qNt5h+H5J
 mt8VR+nLHBfPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CGrS24Pn
Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: redirect errors to
 /dev/null
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
Cc: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Vincent, All,

On 2022-11-01 23:41 +0100, Thomas Petazzoni via buildroot spake thusly:
> Hello Vincent,
> 
> On Fri,  7 Oct 2022 18:50:02 -0500
> Vincent Fazio <vfazio@xes-inc.com> wrote:
> 
> > When busybox.mk gets read, pkg-conf gets executed to determine the
> > location of relevant libraries.
> > 
> > When Busybox is built with per-package directories enabled, a number of
> > errors related to executing pkg-conf occur because directories have not
> > been synced to provide pkg-confg at the point when it executes.
> 
> I don't get this. If pkg-config is executed before the per-package
> directories are created... then how can pkg-config find libtirpc?

We did look at this together with Vincent back then.

The issue is that pkg-config is called as part of BUSYBOX_CFLAGS and
BUSYBOX_CFLAGS_busybox, which are part of BUSYBOX_MAKE_ENV, which will
eventually be part of the environment when calling one of the kconfig
frontends, like 'config' (when applying the configuration), or
menuconfig et al.

At that time, only parts of the PPD have been gathered, and not the
parts needed to configure and build, so host-pkgconf is not rsynced to
the busybox PPD.

Then later on, when we do build, host-pkgconf is rsynced, so we do get
the libtirpc CFLAGs and LDFLAGS, and the build does succeed.

It is quite difficult to follow all the trails. Idealy, we'd want to
provide a proper rsynced PPD for configurators, maybe, but in this case,
it is superfluous, and finding the right spot was... not trivial.

So, with Vincent, we concluded that:
  - the error messages are benign
  - but hey are confusing
  - the simplest solution to get rid of them is to silence the call to
    pkg-config

[--SNIP--]
> and I couldn't see the errors (but perhaps I missed them). Could you
> provide an example configuration, the details of the error, and a
> rationale as to why not finding libtirpc is not a problem when we in
> fact expect to find it?

    BR2_x86_i686=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE=y
    BR2_PACKAGE_LIBTIRPC=y

    $ make clean
    $ make busybox-menuconfig
    >>> busybox 1.35.0 Patching
    [...]
    Applying 0005-nslookup-sanitize-all-printed-strings-with-printable.patch using patch:
    patching file networking/nslookup.c
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    Using /home/ymorin/dev/buildroot/O/master/build/busybox-1.35.0/.config as base
    #
    # merged configuration written to
    # /home/ymorin/dev/buildroot/O/master/build/busybox-1.35.0/.config
    # (needs make)
    #
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory

    [...]

    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 "`/home/ymorin/dev/buildroot/O/master/host/bin/pkg-config --cflags libtirpc`""
    CFLAGS_busybox=""`/home/ymorin/dev/buildroot/O/master/host/bin/pkg-config --libs libtirpc`"" 
    PKG_CONFIG_PATH="" /usr/bin/make 
        -j9 -C /home/ymorin/dev/buildroot/O/master/build/busybox-1.35.0
        HOSTCC="/usr/bin/gcc"
        AR="/home/ymorin/dev/buildroot/O/master/host/bin/i686-linux-gcc-ar"
        NM="/home/ymorin/dev/buildroot/O/master/host/bin/i686-linux-gcc-nm"
        RANLIB="/home/ymorin/dev/buildroot/O/master/host/bin/i686-linux-gcc-ranlib"
        CC="/home/ymorin/dev/buildroot/O/master/host/bin/i686-linux-gcc"
        ARCH=i386
        PREFIX="/home/ymorin/dev/buildroot/O/master/target"
        EXTRA_LDFLAGS=""
        CROSS_COMPILE="/home/ymorin/dev/buildroot/O/master/host/bin/i686-linux-"
        CONFIG_PREFIX="/home/ymorin/dev/buildroot/O/master/target"
        SKIP_STRIP=y
        menuconfig
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
    /bin/sh: /home/ymorin/dev/buildroot/O/master/host/bin/pkg-config: No such file or directory
      HOSTLD  scripts/kconfig/mconf
      HOSTCC  scripts/kconfig/lxdialog/checklist.o
      HOSTCC  scripts/kconfig/lxdialog/inputbox.o
      HOSTCC  scripts/kconfig/lxdialog/lxdialog.o
      HOSTCC  scripts/kconfig/lxdialog/menubox.o
      HOSTCC  scripts/kconfig/lxdialog/msgbox.o
      HOSTCC  scripts/kconfig/lxdialog/textbox.o
      HOSTCC  scripts/kconfig/lxdialog/util.o
      HOSTCC  scripts/kconfig/lxdialog/yesno.o
      HOSTLD  scripts/kconfig/lxdialog/lxdialog
    scripts/kconfig/mconf Config.in

And then again further one...

BTW, notice how CFLAGS are incorrectly quoted:

    CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 "`/home/ymorin/dev/buildroot/O/master/host/bin/pkg-config --cflags libtirpc`""
                                                                                     ^---------------------------------------------------------------------------^

That's because of:
    20: BUSYBOX_CFLAGS = $(TARGET_CFLAGS)
    82: BUSYBOX_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"

which are then passed as:
    91: CFLAGS="$(BUSYBOX_CFLAGS)"

Vincent, could you come to fix that? ;-)

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
