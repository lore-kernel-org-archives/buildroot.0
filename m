From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 Mar 2016 06:27:31 +0100
Subject: [Buildroot] Autobuilder update
References: <20160310234742.3df6dff2@free-electrons.com>
Message-ID: <XnsA5C841B36A49FID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160310234742.3df6dff2 at free-electrons.com: 

> Let me know if there are other things that should be improved/changed
> in the autobuilder setup (be it adding more toolchain configurations,
> or other changes).

Hi Thomas,

do we have a config for a buildroot x86 toolchain which lacks
BR2_X86_CPU_HAS_MMX? An empty defconfig file would be enough imho, the one
you get when you call "make menuconfig" in a fresh git checkout without
selecting anything and save this config, like: 

bernd at buildroot:~/buildroot/buildroot$ make menuconfig
(select nothing, just save the config)
bernd at buildroot:~/buildroot/buildroot$ make savedefconfig
BR2_DEFCONFIG=test cat test
bernd at buildroot:~/buildroot/buildroot$ cat test
bernd at buildroot:~/buildroot/buildroot$ 

I think such a config would be useful because lots of media packages
contain mmx specific code. 

Regards, Bernd
