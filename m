From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Aug 2017 12:40:18 -0300
Subject: [Buildroot] [PATCH v3] imx6q-sabresd: Add a qt5 defconfig
	variant
In-Reply-To: <CAOMZO5ACVkLqxWmwFY3kBPjhPVOVs0J_Tq__jZJ29_YFXBFjHw@mail.gmail.com>
References: <1498078187-32377-1-git-send-email-festevam@gmail.com>
 <47e21512-545b-5183-7397-844035c9818f@mind.be>
 <CAOMZO5ACVkLqxWmwFY3kBPjhPVOVs0J_Tq__jZJ29_YFXBFjHw@mail.gmail.com>
Message-ID: <CAOMZO5Cb2RxwAfm8n8-gXe9_4j2qkEhztX1XYktF3LnZbtC2Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Aug 3, 2017 at 4:49 PM, Fabio Estevam <festevam@gmail.com> wrote:

>>  Could you re-test based on the next branch?
>
> Thanks for reworking the patch and applying it.
>
> I am currently out of the office without hardware access to test it.
>
> Will test it as soon as I am back to the office (week of August 21)

I was able to test it and can confirm that it works as expected.

>>  Also, you set BR2_TOOLCHAIN_BUILDROOT_GLIBC=y but none of the packages selected
>> seem to need it. Is there a reason why it is needed? Could you either remove it
>> (after testing with uClibc-ng) or add a comment why it is needed and remove
>> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y?
>
> Sure, will do it.

I tried the following change:

--- a/configs/imx6q-sabresd_qt5_defconfig
+++ b/configs/imx6q-sabresd_qt5_defconfig
@@ -8,9 +8,7 @@ BR2_ARM_FPU_VFPV3=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y

 # Additional features needed for packages
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

 # System

,but in this case the Qt5 package is not installed anymore.
