From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 26 Oct 2014 22:45:40 +0100
Subject: [Buildroot] [PATCH 1/2] kconfig/lxdialog: get ncurses CFLAGS
	with pkg-config
In-Reply-To: <20141026222449.315ce1ff@free-electrons.com>
References: <1414329446-16587-1-git-send-email-bjorn.forsman@gmail.com>
 <1414329446-16587-2-git-send-email-bjorn.forsman@gmail.com>
 <20141026164155.4c1bc8db@free-electrons.com>
 <CAEYzJUGaae4Uqj_v9fWbi4kfygoSLGAku_P8=AedfDV04gCCxA@mail.gmail.com>
 <CAEYzJUEV=Z5yb6+DS_vZ9NuOjtsTfX0KGU5jYFa8wjMRt=v8dw@mail.gmail.com>
 <20141026222449.315ce1ff@free-electrons.com>
Message-ID: <CAEYzJUHHES_QH2Ozh9DmgpTFiGsj0-9siv3TgPAyPbBZ2_VKgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 October 2014 22:24, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Bj?rn Forsman,
>
> On Sun, 26 Oct 2014 22:16:33 +0100, Bj?rn Forsman wrote:
>
>> I've tried to re-sync with linux 3.18-rc1. Without luck. Quite
>> frustrating. Something is changed upstream and I don't (yet) manage to
>> fill in the missing bits of Make code to have Buildroot's "make
>> menuconfig" work with these changes.
>
> Argh :/
>
> At some point, Yann E. Morin was very active on the kbuild/kconfig code
> in the upstream Linux kernel. Maybe he can help there?

Sure. For someone familiar with this code, it is probably/hopefully trivial :-)

For a bit of background, it's
support/kconfig/patches/06-br-build-system-integration.patch that
doesn't apply, due to upstream (linux) commit
022af62d0190e1e3db63c19aeb5f51ae0612cd71 removing the code that the
patch touches.

I started out by skipping 06-br-build-system-integration.patch, but
I'm unable to glue the stuff back together. This is what happens now:

$ make menuconfig
mkdir -p /home/bfo/buildroot/output/build/buildroot-config/lxdialog
make CC="/run/current-system/sw/bin/gcc"
HOSTCC="/run/current-system/sw/bin/gcc"
obj=/home/bfo/buildroot/output/build/buildroot-config -C
support/kconfig -f Makefile.br mconf
make[1]: Entering directory `/home/bfo/buildroot/support/kconfig'
make[1]: *** No rule to make target
`/home/bfo/buildroot/output/build/buildroot-config/.tmp_gtkcheck',
needed by `/home/bfo/buildroot/output/build/buildroot-config/gconf.o'.
Stop.
make[1]: Leaving directory `/home/bfo/buildroot/support/kconfig'
make: *** [/home/bfo/buildroot/output/build/buildroot-config/mconf] Error 2

>> Would it be acceptable to add the patch posted in this thread directly
>> to support/kconfig/patches/ instead?
>
> Yes, it is acceptable. Especially if the patch description mentions
> that it's already upstream, it will help when we'll bump the kconfig
> code.

Great! But I'll wait and see if Yann has some inputs before going this route.

Best regards,
Bj?rn Forsman
