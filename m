From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 8 Oct 2018 08:52:17 -0500
Subject: [Buildroot] Qt5 build issues with glibc arm64 buildroot compiler
In-Reply-To: <CAMty3ZCAaycY2gazxhYwi1DU_E9tyYP71_ewzstFoba02wTqcw@mail.gmail.com>
References: <CAMty3ZCAaycY2gazxhYwi1DU_E9tyYP71_ewzstFoba02wTqcw@mail.gmail.com>
Message-ID: <CANQCQpbszgodeg1fEAS4TGcv-viG45FqGiZ9zPN1fTVoajwbsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jagan,

On Mon, Oct 8, 2018 at 1:29 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hello,
>
> Any one tried of building Qt5 on arm64 with glibc buildroot native
> compiler. I'm observing build issues as below, let me know If I missed
> something?
>
> BR2_TOOLCHAIN_BUILDROOT_GLIBC
> BR2_TOOLCHAIN_BUILDROOT_CXX
> BR2_PACKAGE_QT5
> BR2_PACKAGE_QT5BASE_EXAMPLES
> BR2_PACKAGE_QT5BASE_GUI
> BR2_PACKAGE_QT5BASE_EGLFS
>

As a datapoint, I've been using the following fragment of options in
my defconfig without a build issue.
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="gcc-linaro-5.2-2015.11-2-x86_64_aarch64-linux-gnu.tar.xz"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-linux-gnu"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
...
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_OPENGL=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5TOOLS=y
BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS=y
BR2_PACKAGE_QT5TOOLS_PIXELTOOL=y
BR2_PACKAGE_QT5TOOLS_QTDIAG=y
BR2_PACKAGE_QT5TOOLS_QTPATHS=y
BR2_PACKAGE_QT5TOOLS_QTPLUGININFO=y
BR2_PACKAGE_QT5XMLPATTERNS=y

Matt
