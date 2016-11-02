From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 23:24:39 +0100
Subject: [Buildroot] [PATCH] tinyalsa: bump version to 1.0.2
In-Reply-To: <20161102174624.25414-1-maxime.hadjinlian@gmail.com>
References: <20161102174624.25414-1-maxime.hadjinlian@gmail.com>
Message-ID: <20161102232439.4d240c95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Nov 2016 18:46:24 +0100, Maxime Hadjinlian wrote:
> tinyalsa has started doing release, so we will use it.
> 
> With this release, both our patches were applied mainline:
>     - 0001-tinypcminfo-make-function-pcm_get_format_name-static.patch [1]
>     - 0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch [2]
> 
> The Makefile has changed a lot, so we take advantage of that to simplify
> our package.
> 
> 1. https://github.com/tinyalsa/tinyalsa/commit/7d204edfe87f4e22105bcaeb750d69ac769afdd6
> 2. https://github.com/tinyalsa/tinyalsa/commit/c8333f8c7a4e4b9549abeef7530b2cd20a18e537
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  ...-make-function-pcm_get_format_name-static.patch | 45 ----------------------
>  ...clude-time.h-to-get-struct-timespec-proto.patch | 33 ----------------
>  package/tinyalsa/tinyalsa.hash                     |  2 +-
>  package/tinyalsa/tinyalsa.mk                       | 20 +++++-----
>  4 files changed, 10 insertions(+), 90 deletions(-)
>  delete mode 100644 package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
>  delete mode 100644 package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch

I've applied, but I had to add a patch to remove the usage of Doxygen,
otherwise the build would fail if doxygen was not installed on the
build machine. It would be nice to report this upstream so that they
add a check in the Makefile and only use Doxygen if available.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
