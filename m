From: Paul <pbor1234@zonnet.nl>
Date: Wed, 16 Jan 2008 21:17:43 +0100
Subject: [Buildroot] How to configure proftpd 1.3.0a package inbuildroot
In-Reply-To: <20080116192701.GD27237@aon.at>
Message-ID: <20080116201747.EBF95C6FB@green.qinip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,
Thanks, i added:

  toolchain/patch-kernel.sh $(PROFTPD_DIR) package/proftpd/ *.patch

To .unpacked: in /buildroot/package/proftpd/proftpd.mk

And it works.
Paul


-----Original Message-----
From: Bernhard Fischer [mailto:rep.dot.nop at gmail.com] 
Sent: woensdag 16 januari 2008 20:27
To: Paul
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] How to configure proftpd 1.3.0a package inbuildroot

On Wed, Jan 16, 2008 at 07:46:41PM +0100, Paul wrote:
>As a newby i'm stuck in the following, help is appreciated.
>
>I have selected the proftpd (1.3.0a) package in 'make menuconfig' and it
>build fine.
>
>Now I want to add the iconv patch (see for example
>http://home.h01.itscom.net/para/software/misc/proftpd-iconv/index-e.html)
>where it is described to run ./configure with some options to add the
>modules in question. If i do this (in the buildroot/build_powerpc/...) it
>fails and i think this is due to the fact that the staging_dir tools should
>be used which is not done the way i run ./configure.
>
> 
>
>My question: how should i do this correctly?

you would apply the patch before configuring, usually in the .unpacked
. See patch-kernel.sh usage in other packages.

HTH,
Bernhard
