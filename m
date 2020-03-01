From: Carlos Santos <unixmania@gmail.com>
Date: Sun, 1 Mar 2020 09:18:55 -0300
Subject: [Buildroot] [PATCH/next 1/3] package/openrc: bump to version
 0.42.1
In-Reply-To: <20200229232829.4177324-1-aduskett@gmail.com>
References: <20200229232829.4177324-1-aduskett@gmail.com>
Message-ID: <CAJ4jsadHSGXq3T3gUUy7_nosa1RCX8YT9oVrMSoZ-1bHaK93RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 29, 2020 at 8:28 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/openrc/openrc.hash | 2 +-
>  package/openrc/openrc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
> index 7d58e254c4..bb5880806d 100644
> --- a/package/openrc/openrc.hash
> +++ b/package/openrc/openrc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 c99488ca54f2b795328d07bbd456ade49b571136bba7501f7eaaeb1ca9f9ecc4        openrc-0.41.2.tar.gz
> +sha256 91a01ca6d930a0688fb91338209985de57cac7aa2d37feddacb78fd3d95308e2        openrc-0.42.1.tar.gz
>  sha256 96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624        LICENSE
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 3f6453cef5..b1b3ed2c56 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -OPENRC_VERSION = 0.41.2
> +OPENRC_VERSION = 0.42.1
>  OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
>  OPENRC_LICENSE = BSD-2-Clause
>  OPENRC_LICENSE_FILES = LICENSE
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I'm working on this upgrade too and found that It's necessary to patch
 runlevels/Makefile to avoid creating agetty.tty[1-6] if
MKSYSVINIT=yes.

-- 
Carlos Santos <unixmania@gmail.com>
