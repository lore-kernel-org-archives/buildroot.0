From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 11:12:49 +0200
Subject: [Buildroot] BR2_UCLIBC_PROGRAM_INVOCATION symbol missing in
 external toolchain
In-Reply-To: <159a01660907310134l76b73595q634d30255cf8cf70@mail.gmail.com>
References: <159a01660907310134l76b73595q634d30255cf8cf70@mail.gmail.com>
Message-ID: <20090731111249.03cfdf87@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Jul 2009 10:34:41 +0200,
Daniele Salvatore Albano <d.albano@gmail.com> a ?crit :

> some time ago i started to use buildroot to build a system for
> pc-appliances, but, for performance reason, i preferred to put glibc
> instead of uclibc. So, in these days, after some work, i finally
> managed to build a full toolchain using crosstool-NG. After a fresh
> checkout from buildroot git (i've seen some patches committed for
> external toolchains) i've seen, after that i disabled busybox, that i
> can't select some stuff because of WCHAR and/or PROGRAM_INVOCATION
> missing. Looking toolchain compile options i seen that
> PROGRAM_INVOCATION is missing! I've seen that the symbol called
> BR2_UCLIBC_PROGRAM_INVOCATION is only into toolchain/uClibc/Config.in
> and not in toolchain/external-toolchain/Config.in (and or
> Config.in.2).
> 
> Is that config symbol only for uClibc? It should appears in external
> toolchains too or, however, packages that depends on this flag should
> check if external toolchain is used?

Correct, it should appear in external toolchains configurations, and be
checked like the other configuration options against the real
uClibc/glibc configuration.

I never saw it because I always use Busybox. I will try to make a patch
to fix it.

Thanks a lot for the report,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
