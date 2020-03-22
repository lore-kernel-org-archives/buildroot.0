From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:02:02 +0100
Subject: [Buildroot] [PATCH v1] package/iwd: bump version to 1.5
In-Reply-To: <20200322093943.20101-1-ps.report@gmx.net>
References: <20200322093943.20101-1-ps.report@gmx.net>
Message-ID: <20200322100202.GU4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-03-22 10:39 +0100, Peter Seiderer spake thusly:
> Fixes incompatibility because of recent version bump to ell-0.28 ([1]):
> 
>   http://autobuild.buildroot.net/results/32899d7e1f7d5abc528e5627f8f66ae5c9733342
>   http://autobuild.buildroot.net/results/a0a4387e5319d792658f6d82a63fb17a06848d10
>   http://autobuild.buildroot.net/results/7d02c966518e44d798b83ac36b9083a8041b09ec
>   http://autobuild.buildroot.net/results/f7b27ab243e6b35445d9cb28e4747514fa7d98d6
>   http://autobuild.buildroot.net/results/f5d71af640812a58374374e178cb7ff225e69c19
> 
>     CC       src/main.o
>   src/main.c: In function 'request_name_callback':
>   src/main.c:167:7: error: too few arguments to function 'l_dbus_object_manager_enable'
>     if (!l_dbus_object_manager_enable(dbus))
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   In file included from /nvmedata/autobuild/instance-4/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/ell/ell.h:55,
>                    from src/main.c:32:
>   /nvmedata/autobuild/instance-4/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/ell/dbus.h:245:6: note: declared here
>    bool l_dbus_object_manager_enable(struct l_dbus *dbus, const char *root);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=faa592179d9fe46b97289bde5a1b0f0da6052b06
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/iwd/iwd.hash | 4 ++--
>  package/iwd/iwd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
> index e7ba107a3b..006916cdff 100644
> --- a/package/iwd/iwd.hash
> +++ b/package/iwd/iwd.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256 f52ed3cc0dae1f9a82c601df638977f0f6d8d4629ba5e333b4743748a907c0e7 iwd-0.22.tar.gz
> +sha256  4d7c92b9fdbf14f46f208f1b053597a7e5225a4ad42369a3c28bcdb595087833  iwd-1.5.tar.gz
>  
>  # License files
> -sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
> +sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index fc8b83d1bb..799e631ba5 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IWD_VERSION = 0.22
> +IWD_VERSION = 1.5
>  IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
>  IWD_SITE_METHOD = git
>  IWD_LICENSE = LGPL-2.1+
> -- 
> 2.25.1
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
