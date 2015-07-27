From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:53:17 +0200
Subject: [Buildroot] [PATCH] package/libselinmux: fix build with musl
In-Reply-To: <1437937396-23254-1-git-send-email-yann.morin.1998@free.fr>
References: <1437937396-23254-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150727235317.683a0b11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 Jul 2015 21:03:16 +0200, Yann E. MORIN wrote:
> musl does not define glibcisms, so we ar emissing some macros.
> 
> Define what we need in case the macro is missing. We're using a dumb
> implementation, which is rather slow, to avoid copying from glibc, to
> avoid propagating the LGPL to libselinux, which is Public Domain.
> 
> Fixes a buncha autobuild failures:
>     http://autobuild.buildroot.org/results/d4d/d4d209719d1ce5219f84719ad72fcb6a0c684007/
>     http://autobuild.buildroot.org/results/1a6/1a65cc3d2c23a3c17c605788be62dbd18cbdaf76/
>     http://autobuild.buildroot.org/results/0d0/0d0e4713833182d0f634b9b39b2c56f2bc0adcac/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
>  package/libselinux/0002-fix-musl-build.patch | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libselinux/0002-fix-musl-build.patch

I've fixed a bunch of typos and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
