From: Jean-Mickael Guerin <jean-mickael.guerin@6wind.com>
Date: Thu, 11 Oct 2012 14:49:34 +0200
Subject: [Buildroot] Error with external mips toolchain
In-Reply-To: <5075F999.7000709@6wind.com>
References: <5075F999.7000709@6wind.com>
Message-ID: <5076C05E.1090701@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is BR2_TARGET_ARCH I need to tune (to pass -march=octeon2). But it 
does not show up when running make menuconfig, not even present in .config.
I'm doing something wrong or I need to patch to enable the choice for 
mips64?

Thanks,
Jean-Mickael

On 11/10/2012 00:41, Jean-Mickael Guerin wrote:
> Hello,
>
> Using Cavium's toolchain I get "Incorrect selection of the C library",
> because the helper.mk can't find ld.linux in $SYSROOT/lib/.
> But in this toolchain ld.linux can be found in $SYSROOT/lib64 or
> $SYSROOT/lib32 only. How to workaround this check?
>
> And maybe related, how to tune cpu cflags like -mabi or -march,
> I have seen BR2_TARGET_LDFLAGS, but no BR2_TARGET_LDFLAGS.
>
> Thanks,
> Jean-Mickael
