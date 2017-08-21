From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Aug 2017 13:26:20 -0300
Subject: [Buildroot] [PATCH v3] imx6q-sabresd: Add a qt5 defconfig
	variant
In-Reply-To: <CAOMZO5Cb2RxwAfm8n8-gXe9_4j2qkEhztX1XYktF3LnZbtC2Kg@mail.gmail.com>
References: <1498078187-32377-1-git-send-email-festevam@gmail.com>
 <47e21512-545b-5183-7397-844035c9818f@mind.be>
 <CAOMZO5ACVkLqxWmwFY3kBPjhPVOVs0J_Tq__jZJ29_YFXBFjHw@mail.gmail.com>
 <CAOMZO5Cb2RxwAfm8n8-gXe9_4j2qkEhztX1XYktF3LnZbtC2Kg@mail.gmail.com>
Message-ID: <CAOMZO5C13nhZLaxqo-wHRuZGpgoUBT8TDZ69Nv6-u4kPyU9_EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 21, 2017 at 12:40 PM, Fabio Estevam <festevam@gmail.com> wrote:

> I tried the following change:
>
> --- a/configs/imx6q-sabresd_qt5_defconfig
> +++ b/configs/imx6q-sabresd_qt5_defconfig
> @@ -8,9 +8,7 @@ BR2_ARM_FPU_VFPV3=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
>
>  # Additional features needed for packages
> -BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
> -BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>
>  # System
>
> ,but in this case the Qt5 package is not installed anymore.

Ok, this is expected as Qt5 depends on BR2_TOOLCHAIN_BUILDROOT_WCHAR.

So I will only remove BR2_TOOLCHAIN_BUILDROOT_GLIBC=y from the defconfig.

Let me test it and will send a patch if it works.
