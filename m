From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 13:37:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: needs dynamic
 library
In-Reply-To: <20190712212918.14055-1-fontaine.fabrice@gmail.com>
References: <20190712212918.14055-1-fontaine.fabrice@gmail.com>
Message-ID: <20190714133726.25ba10ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jul 2019 23:29:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable libvncserver for static builds and drop second patch following
> upstream feedback on patch fixing openssl issue:
> https://github.com/LibVNC/libvncserver/pull/319
> 
> This will also fix build failure when building statically with libgcrypt
> 
> Don't update x11vnc, the reverse dependency of libvncserver, because
> BR2_PACKAGE_XORG7 already depends on !BR2_STATIC_LIBS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d7b109d085e3931a874c4fb99f465789485565a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ts.txt-use-pkgconfig-to-find-openssl.patch | 34 -------------------
>  package/libvncserver/Config.in                |  6 ++++
>  2 files changed, 6 insertions(+), 34 deletions(-)
>  delete mode 100644 package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch

Applied to master, thanks. For the record, the CMake issue is reported
upstream at https://gitlab.kitware.com/cmake/cmake/issues/16885 (I
reported it two years ago).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
