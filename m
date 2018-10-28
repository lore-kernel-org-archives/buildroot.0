From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 29 Oct 2018 00:13:32 +0100
Subject: [Buildroot] merge_config.sh not working on out of tree builds
 since kconfig bump
In-Reply-To: <CAK4VdL0hEzyrMWJVXkokn+MrZpC=5pF-173OHVcGjT+O9W=OjQ@mail.gmail.com>
References: <CAK4VdL0hEzyrMWJVXkokn+MrZpC=5pF-173OHVcGjT+O9W=OjQ@mail.gmail.com>
Message-ID: <20181028231330.GA25011@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico,

...
> $ make -C buildroot O=$PWD/output defconfig
> ...
> $ cd output
> $ echo 'BR2_TARGET_GENERIC_HOSTNAME="test"' > test.frag
> $ ../buildroot/support/kconfig/merge_config.sh .config test.frag
> Using .config as base
> Merging test.frag
> umask 0022 && make -C /home/test/buildroot O=/home/test/output/. alldefconfig
>   GEN     /home/test/output/Makefile
> *** Can't read seed configuration "./.tmp.config.qIcpASpUyh"!
> make[1]: *** [Makefile:925: alldefconfig] Error 1
> make: *** [Makefile:16: _all] Error 2


> I understand that kconfig is mostly ported from the kernel, but I
> don't know if this may be caused by any Buildroot customizations.
> I don't use merge_config.sh with the kernel but a simple attempt based
> on the above with 4.19-rc6 seems to work.
> The workaround seems to be to run merge_config.sh from the buildroot tree.
> Any clue?

Thanks for reporting bug. [1] patch from patchset [2] fixes that.
[1] https://patchwork.ozlabs.org/patch/990021/
[2] https://patchwork.ozlabs.org/project/buildroot/list/?series=72926&state=*


Kind regards,
Petr
