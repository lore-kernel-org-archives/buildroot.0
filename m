From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Sep 2013 15:54:31 +0200
Subject: [Buildroot] [PATCH v2 2/7] sunxi-cedarx: bump to newer version,
	use armel2 binaries, add demo
In-Reply-To: <1378441521-10050-3-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 5 Sep 2013 23:25:16 -0500")
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-3-git-send-email-spenser@gillilanding.com>
Message-ID: <87pps3bnu0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/sunxi-cedarx/Config.in       | 10 ++++++++++
 Spenser>  package/sunxi-cedarx/sunxi-cedarx.mk | 26 ++++++++++++++++++++++----
 Spenser>  2 files changed, 32 insertions(+), 4 deletions(-)

 Spenser> diff --git a/package/sunxi-cedarx/Config.in b/package/sunxi-cedarx/Config.in
 Spenser> index b280db0..aa520b5 100644
 Spenser> --- a/package/sunxi-cedarx/Config.in
 Spenser> +++ b/package/sunxi-cedarx/Config.in
 Spenser> @@ -10,5 +10,15 @@ config BR2_PACKAGE_SUNXI_CEDARX
 Spenser>  	  http://github.com/linux-sunxi/cedarx-libs
 Spenser>  	  http://linux-sunxi.org/CedarX
 
 Spenser> +if BR2_PACKAGE_SUNXI_CEDARX
 Spenser> +
 Spenser> +config BR2_PACKAGE_SUNXI_CEDARX_DEMO
 Spenser> +	bool "install enc_dec_test demo"
 Spenser> +	help
 Spenser> +	  Install a test program which verifies the functionality of the CedarX
 Spenser> +	  libraries
 Spenser> +
 Spenser> +endif

Thanks, but it doesn't seem to build here:

make[1]: Entering directory `/home/peko/source/buildroot/output/build/sunxi-cedarx-74c3e9052/libcedarv/linux-armel2/sample'
arm-none-linux-gnueabi-gcc -Wall -O0 -g -I. -I./render -I./vdecoder/fbm -I./vdecoder/vbv -I./vdecoder/libvecore -I./vdecoder/libcedarv -I./vdecoder/adapter -I./vdecoder/adapter/cdxalloc -I./file_parser/pmp -I./include -I./file_parser/mov/inc -DFILE_PARSER -o main.o -c main.c
arm-none-linux-gnueabi-gcc -Wall -O0 -g -I. -I./render -I./vdecoder/fbm -I./vdecoder/vbv -I./vdecoder/libvecore -I./vdecoder/libcedarv -I./vdecoder/adapter -I./vdecoder/adapter/cdxalloc -I./file_parser/pmp -I./include -I./file_parser/mov/inc -DFILE_PARSER -o render/render.o -c render/render.c
arm-none-linux-gnueabi-gcc -Wall -O0 -g -I. -I./render -I./vdecoder/fbm -I./vdecoder/vbv -I./vdecoder/libvecore -I./vdecoder/libcedarv -I./vdecoder/adapter -I./vdecoder/adapter/cdxalloc -I./file_parser/pmp -I./include -I./file_parser/mov/inc -DFILE_PARSER -o file_parser/pmp/pmp.o -c file_parser/pmp/pmp.c
arm-none-linux-gnueabi-gcc -Wall -O0 -g -I. -I./render -I./vdecoder/fbm -I./vdecoder/vbv -I./vdecoder/libvecore -I./vdecoder/libcedarv -I./vdecoder/adapter -I./vdecoder/adapter/cdxalloc -I./file_parser/pmp -I./include -I./file_parser/mov/inc -DFILE_PARSER -o file_parser/pmp/pmp_ctrl.o -c file_parser/pmp/pmp_ctrl.c
In file included from file_parser/pmp/pmp.c:30:0:
file_parser/pmp/pmp.h:33:23: fatal error: libcedarv.h: No such file or directory
compilation terminated.
make[1]: *** [file_parser/pmp/pmp.o] Error 1
make[1]: *** Waiting for unfinished jobs....
main.c:5:46: fatal error: libcedarv.h: No such file or directory
compilation terminated.

-- 
Bye, Peter Korsgaard
