From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 21:24:04 +0200
Subject: [Buildroot] [PATCH v2 1/1] libvdpau: new package
In-Reply-To: <1466434827-17088-1-git-send-email-damien@kal-host.com>
References: <1466434827-17088-1-git-send-email-damien@kal-host.com>
Message-ID: <20160703212404.16425a1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Jun 2016 17:00:27 +0200, Damien Lanson wrote:
> Signed-off-by: Damien Lanson <damien@kal-host.com>
> ---
>  package/Config.in                                  |    1 +
>  .../libvdpau/0001-missing-configh-include.patch    |   29 +++++++++++++
>  package/libvdpau/0002-link-with-libx11.patch       |   30 +++++++++++++
>  .../libvdpau/0003-vdpau-module-searchpath.patch    |   45 ++++++++++++++++++++
>  package/libvdpau/Config.in                         |   15 +++++++
>  package/libvdpau/libvdpau.hash                     |    4 ++
>  package/libvdpau/libvdpau.mk                       |   27 ++++++++++++
>  7 files changed, 151 insertions(+)
>  create mode 100755 package/libvdpau/0001-missing-configh-include.patch
>  create mode 100755 package/libvdpau/0002-link-with-libx11.patch
>  create mode 100755 package/libvdpau/0003-vdpau-module-searchpath.patch
>  create mode 100755 package/libvdpau/Config.in
>  create mode 100755 package/libvdpau/libvdpau.hash
>  create mode 100755 package/libvdpau/libvdpau.mk

Thanks for your patch! I've done the following changes:

    [Thomas:
     - Add dependency on BR2_PACKAGE_XORG7, which is necessary when
       selecting BR2_PACKAGE_XLIB_LIBX11 and BR2_PACKAGE_XLIB_LIBXEXT.
     - Fix indentation of Config.in help text.
     - Add host-pkgconf to the dependencies, since the configure script uses
       pkg-config to detect dependencies.
     - Add references for the patches.]

and then I applied your patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
