From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 15 Sep 2015 20:11:14 +0200
Subject: [Buildroot] How to deactivate UCLIBC_CTOR_DTOR in uclibc-ng?
In-Reply-To: <CAJtjsKYJNhzudtxwfewNr=76PLdzY04Vjaf69_VOL7=W7yAFiA@mail.gmail.com>
References: <CAJtjsKYJNhzudtxwfewNr=76PLdzY04Vjaf69_VOL7=W7yAFiA@mail.gmail.com>
Message-ID: <20150915181113.GC8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Johan Oudinet wrote,

> Hi,
> 
> I try to move a project that uses uclibc-0.9.33 to uclibc-ng but it
> fails at link time due to undefined references to __fini_array_end and
> __fini_array_start.
> In uClibc-0.9.33, the UCLIBC_CTOR_DTOR option default was no. In
> uClibc-ng, it defaults to yes. I would like to set it back to no but I
> failed doing so in Buildroot.
> make uclibc-menuconfig does not show the option.
> I've tried using KCONFIG_DISABLE_OPT and KCONFIG_SET_OPT function in
> the .mk file to disable it and set it to 'N', respectively, but
> without success.
> When I grep for the option in the generated .config, it's still set to yes:
> $ grep CTOR_DTOR build/uclibc-1.0.5/.config
> UCLIBC_CTOR_DTOR=y

It is hidden on by default. Disabling it breaks f.e. toolchain
building on ARM. I have not checked other architectures.
Anyway, disabling this option just is a microoptimization saving few
bytes. Are you really sure, the reason for your compile problem is
this option?

Can you show us some more compile logs with the failing gcc command?

best regards
 Waldemar
