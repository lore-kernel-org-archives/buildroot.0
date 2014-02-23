From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 23 Feb 2014 08:47:06 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-02-21
In-Reply-To: <20140222073009.F3DE0100FC3@stock.ovh.net>
References: <20140222073009.F3DE0100FC3@stock.ovh.net>
Message-ID: <CAHkwnC-2CDAH2dsdrvJ8Aw1OjrDZdWCzFeGug++m5o0vDoMcqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 22, 2014 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-02-21
<snip>
>     x86_64 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/1e608a4800361be26a674798418a6a246f026cfb/

Maybe the cause of the failure is the prebuild toolchain because using
the internal uclibc toolchain it builds fine.

The minimal defconfig to reproduce the failure is:
BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/ctng-x86-64-atom-uclibc.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="x86_64-unknown-linux-uclibc"
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y

Just using the internal uclibc toolchain it builds fine:
BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y

Regards
Fabio Porcedda
