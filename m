From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Nov 2010 13:52:49 +0100
Subject: [Buildroot] [PATCH 11/12] directfb: bump to 1.4.10
In-Reply-To: <1288839031-24277-12-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Thu, 4 Nov 2010 03:50:30 +0100")
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
	<1288839031-24277-12-git-send-email-llandwerlin@gmail.com>
Message-ID: <87hbfw3pb2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/directfb/directfb.mk |    2 +-
 llandwerlin>  1 files changed, 1 insertions(+), 1 deletions(-)

 llandwerlin> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
 llandwerlin> index e4b6d90..2703677 100644
 llandwerlin> --- a/package/directfb/directfb.mk
 llandwerlin> +++ b/package/directfb/directfb.mk
 llandwerlin> @@ -4,7 +4,7 @@
 llandwerlin>  #
 llandwerlin>  #############################################################
 llandwerlin>  DIRECTFB_VERSION_MAJOR:=1.4
 llandwerlin> -DIRECTFB_VERSION:=1.4.5
 llandwerlin> +DIRECTFB_VERSION:=$(DIRECTFB_VERSION_MAJOR).10

I'm getting build breakage with:

libtool: link: /scratch/peko/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
 --sysroot=/scratch/peko/staging -I/scratch/peko/staging/usr/include/freetype2 -
O3 -ffast-math -pipe -pipe -Os -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linu
x -msoft-float -I/scratch/peko/staging/usr/include -I/scratch/peko/staging/inclu
de -D_GNU_SOURCE -finstrument-functions -std=gnu99 -Werror-implicit-function-dec
laration -o .libs/dfbinspector dfbinspector.o  -L/scratch/peko/staging/lib -L/sc
ratch/peko/staging/usr/lib ../src/.libs/libdirectfb.so ../lib/fusion/.libs/libfu
sion.so ../lib/direct/.libs/libdirect.so -ldl -lpthread -Wl,-rpath -Wl,/usr/lib
../src/.libs/libdirectfb.so: undefined reference to `sqrt'
collect2: ld returned 1 exit status
make[3]: *** [dfbg] Error 1

We seem to be dropping -lm.

Any idea why? If not, then I'll revert the patch as I would like to put
out -rc1 this weekend.

-- 
Bye, Peter Korsgaard
