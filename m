From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 14:47:04 +0200
Subject: [Buildroot] [PATCH 1/1] eudev : bump version to 1.5.3
In-Reply-To: <1396132833-20016-1-git-send-email-sagaert.johan@skynet.be>
References: <1396132833-20016-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140405144704.0c1ec926@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Mar 2014 23:40:33 +0100, Sagaert Johan wrote:
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/eudev/eudev.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index a2fe528..8e5e83d 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EUDEV_VERSION = 1.5.2
> +EUDEV_VERSION = 1.5.3

There are some build problems with eudev 1.5.3 :

  CC       accelerometer.o
In file included from ../../src/libudev/libudev-private.h:31:0,
                 from accelerometer.c:65:
../../src/libudev/util.h:302:32: warning: 'struct ucred' declared inside parameter list [enabled by default]
../../src/libudev/util.h:302:32: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
accelerometer.c: In function 'test_orientation':
accelerometer.c:203:9: warning: implicit declaration of function 'open' [-Wimplicit-function-declaration]
accelerometer.c:203:28: error: 'O_RDONLY' undeclared (first use in this function)
accelerometer.c:203:28: note: each undeclared identifier is reported only once for each function it appears in
accelerometer.c:203:37: error: 'O_CLOEXEC' undeclared (first use in this function)
make[4]: *** [accelerometer.o] Error 1

See http://autobuild.buildroot.org/results/d20/d20f4d959789a2a3167f8bca0a8ac6b0bda2dd9b/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
