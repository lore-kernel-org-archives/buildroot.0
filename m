From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 15:28:02 +0200
Subject: [Buildroot] [PATCH] package/gnutls: Fix build with uClibc
In-Reply-To: <20200623101533.1459806-1-stefan.sorensen@spectralink.com>
References: <20200623101533.1459806-1-stefan.sorensen@spectralink.com>
Message-ID: <20200727152802.17517177@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Jun 2020 12:15:33 +0200
stefan at astylos.dk wrote:

> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> Since v3.6.14 gnutls wants to use the 'e' flag with fopen to set the
> O_CLOEXEC flags. Since this is a glibc extension, it will trigger a
> gnulib override of fopen on non-glibc systems, but that override
> breaks the uClibc stdio.h header.
> 
> Fixes:
> http://autobuild.buildroot.org/results/02f/02f2b524add307c8f7cc1af1ed0783bb1baf029a
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  ...Fix-gnulib-stdio.h-include-on-uclibc.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch

This patch was applied to master quite some time ago, but I forgot to
notify. Here is the notification! :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
