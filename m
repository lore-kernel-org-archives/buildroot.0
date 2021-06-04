From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jun 2021 23:48:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: disable parallel build
In-Reply-To: <20210516202828.321469-1-fontaine.fabrice@gmail.com>
References: <20210516202828.321469-1-fontaine.fabrice@gmail.com>
Message-ID: <20210604214834.GL168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-16 22:28 +0200, Fabrice Fontaine spake thusly:
> Parallel build is broken since bump to version 2.03.13 in commit
> 80997acd3587a4528f8877d9e8a502c39ed800c5:
> 
> make[2]: Leaving directory '/srv/storage/autobuild/run/instance-0/output-1/build/lvm2-2.03.12/tools'
>     [CC] dmsetup
> /srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/9.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: dmsetup.o: file not recognized: file truncated
> 
> or
> 
>     [INSTALL] systemd_generators
> /usr/bin/install: cannot stat 'lvm2_activation_generator_systemd_red_hat': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/30359c351a6ce2f9139494a531e036f0b0406ccf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

I extended the commit log with more info from this thread while at it.

Regards,
Yann E. MORIN.

> ---
>  package/lvm2/lvm2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 224dbf5d54..509b979294 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -11,6 +11,8 @@ LVM2_INSTALL_STAGING = YES
>  LVM2_LICENSE = GPL-2.0, LGPL-2.1
>  LVM2_LICENSE_FILES = COPYING COPYING.LIB
>  LVM2_CPE_ID_PRODUCT = redhat
> +# parallel build issues
> +LVM2_MAKE = $(MAKE1)
>  
>  # Make sure that binaries and libraries are installed with write
>  # permissions for the owner. We disable NLS because it's broken, and
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
