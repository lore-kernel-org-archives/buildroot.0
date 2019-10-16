From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 23:23:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: fix usage
 of libbsd
In-Reply-To: <20191013195443.19032-1-bernd.kuhls@t-online.de>
References: <20191013195443.19032-1-bernd.kuhls@t-online.de>
Message-ID: <20191016232337.470ac810@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Oct 2019 21:54:43 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream added optional support for libbsd:
> "Add strlcat & strlcpy fallbacks if not provided by libc nor libbsd"
> https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=d4c941ea8b1dc07a14efce656bff58d31a14c985
> 
> and forgot to define HAVE_LIBBSD.
> 
> Also add libbsd as optional dependency because the build error occured
> only when libbsd was built before building xlib_libXfont2.
> 
> Fixes:
> http://autobuild.buildroot.net/results/165/165f9f948419fc69fbf6b9281d759b37bb7d40c6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ne-HAVE_LIBBSD-when-libbsd-was-found.patch | 33 +++++++++++++++++++
>  .../x11r7/xlib_libXfont2/xlib_libXfont2.mk    |  6 ++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
