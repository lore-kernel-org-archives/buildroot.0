From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:06:33 +0100
Subject: [Buildroot] [PATCH/next 3/6] package/mediastreamer: bump to
 version 4.3.1
In-Reply-To: <20200227174714.3727844-3-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
 <20200227174714.3727844-3-fontaine.fabrice@gmail.com>
Message-ID: <20200309220633.004d8403@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 18:47:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (already in version)
> - Update second patch
> - License is GPL-3.0+ since version 4.3.0 and
>   https://gitlab.linphone.org/BC/public/mediastreamer2/commit/85094197cfaaaa8768a86562a0bce9d3d738d2da
> - Switch to cmake-package and so drop third patch as autotools is not
>   updated anymore (and fails to build due to missing po/Makefile.in.in)
> - Add a mandatory dependency to mbedtls (to enable crypto support in
>   bctoolbox)
> - Add bcg729, jpegturbo, libgsm, libpcap, libsrtp and zxing-cpp optional
>   dependencies
> - Add a dependency on dynamic library as no pkg-config calls are done in
>   cmake (static build with ffmepg and opus will fail for example)
> - Drop libupnp optional dependency (not available anymore)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...mpilation-issue-with-latest-bctoobox.patch |  38 -----
>  ...-nowebcam.c-fix-build-without-ffmpeg.patch |  55 +++++++
>  ...FER_PADDING_SIZE-to-determine-paddin.patch |  24 +--
>  ...ffmpeg-and-avcodec-function-conflict.patch |  42 -----
>  package/mediastreamer/Config.in               |   9 +-
>  package/mediastreamer/mediastreamer.hash      |   4 +-
>  package/mediastreamer/mediastreamer.mk        | 153 ++++++++++++------
>  7 files changed, 171 insertions(+), 154 deletions(-)
>  delete mode 100644 package/mediastreamer/0001-fix-compilation-issue-with-latest-bctoobox.patch
>  create mode 100644 package/mediastreamer/0001-src-videofilters-nowebcam.c-fix-build-without-ffmpeg.patch
>  delete mode 100644 package/mediastreamer/0002-m4-fix-local-ffmpeg-and-avcodec-function-conflict.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
