From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 19:35:51 +0200
Subject: [Buildroot] [PATCH 2/2] libaio: use alternative upstream URL
In-Reply-To: <7b0e3e05280562b758638a0582516394a3164675.1336235161.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 5 May 2012 18:26:06 +0200")
References: <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
 <cover.1336235161.git.thomas.petazzoni@free-electrons.com>
 <7b0e3e05280562b758638a0582516394a3164675.1336235161.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bom2cyyw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since the kernel.org security problem and reinstallation, libaio is no
 Thomas> longer available from this site. Use snapshot.debian.net as an
 Thomas> alternative source.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libaio/libaio.mk |    4 ++--
 Thomas>  1 file changed, 2 insertions(+), 2 deletions(-)

 Thomas> diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
 Thomas> index 3ffc49c..f90ef4d 100644
 Thomas> --- a/package/libaio/libaio.mk
 Thomas> +++ b/package/libaio/libaio.mk
 Thomas> @@ -4,8 +4,8 @@
 Thomas>  #
 Thomas>  #############################################################
 Thomas>  LIBAIO_VERSION=0.3.109
 Thomas> -LIBAIO_SOURCE=libaio-$(LIBAIO_VERSION).tar.bz2
 Thomas> -LIBAIO_SITE=$(BR2_KERNEL_MIRROR)/linux/libs/aio/
 Thomas> +LIBAIO_SOURCE=libaio_$(LIBAIO_VERSION).orig.tar.gz
 Thomas> +LIBAIO_SITE=http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio/
 Thomas>  LIBAIO_INSTALL_STAGING=YES

I've fixed up the lines to have spaces around the '=' while we're at
it. Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
