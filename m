From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 15:11:28 +0200
Subject: [Buildroot] [PATCH] toolchain: GCC bug 85862
In-Reply-To: <647b5badffcc071f204e324a62cfc8dc@230ruedubac.fr>
References: <1526934582-53824-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180522230033.0daffecb@windsurf>
 <21765fd8-362a-0534-69d9-4a2b9d197121@gmail.com>
 <CANQCQpbT7m4H6gFjPg5BNssOzUqHsBQRnNpDhH_y5t3-x-gS0g@mail.gmail.com>
 <e1330fb2-8262-d2c9-433d-d3d22b574f72@gmail.com>
 <CANQCQpazxbnb4dcvtPdoXCLL5enKTKucDhPeG50Dhho9c6Xuvg@mail.gmail.com>
 <647b5badffcc071f204e324a62cfc8dc@230ruedubac.fr>
Message-ID: <20180607151128.2ca5e5ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 07 Jun 2018 14:43:46 +0200, davidb wrote:

> Regarding the commit id bd03966d4ebeb284ac3afb5f3b8cba13da2b9983 that 
> disables qt5webengine when the bug 85862 can be triggered on microblaze 
> arch, I can't enable qt5webengine when selecting QT5 Latest version 
> (5.10) and x86_64 arch.
> 
> I think the test about the bug should be inverted:
> 
> diff --git a/package/qt5/qt5webengine/Config.in 
> b/package/qt5/qt5webengine/Config.in
> index 38486c6dcf..744d659567 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -31,7 +31,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>          depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
>          depends on BR2_HOST_GCC_AT_LEAST_4_8 # qt5base-icu
>          depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # qt5base-icu
> -       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || 
> BR2_PACKAGE_QT5_VERSION_5_6 # libnss
> +       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85862 || 
> BR2_PACKAGE_QT5_VERSION_5_6 # libnss

Gah, indeed! Could you send a patch to fix this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
