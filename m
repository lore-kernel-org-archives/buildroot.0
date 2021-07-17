From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:04:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoup: fix build with gcc 4.8
In-Reply-To: <20210701202147.466600-1-fontaine.fabrice@gmail.com>
References: <20210701202147.466600-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717100457.66e3ca8f@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu,  1 Jul 2021 22:21:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build failure with gcc 4.8 which is raised since bump to version
> 2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:
> 
> In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/resolv.h:65:0,
>                  from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
>                  from ../libsoup/soup-address.c:14:
> /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
>   const u_char *_msg, *_eom;
>   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-meson.build-set-c_std-to-gnu99.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
