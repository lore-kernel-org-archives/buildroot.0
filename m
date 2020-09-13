From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 22:14:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/sofia-sip: fix static build
 with openssl
In-Reply-To: <20200913165226.2685331-1-fontaine.fabrice@gmail.com>
References: <20200913165226.2685331-1-fontaine.fabrice@gmail.com>
Message-ID: <20200913221414.6ee0cb96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Sep 2020 18:52:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use --with-openssl=pkg-config otherwise sofia-sip will fail to retrieve
> openssl dependencies resulting in the following build failure:
> 
> /srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../libsofia-sip-ua/.libs/libsofia-sip-ua.a(tport_type_ws.o): in function `tport_ws_deinit_primary':
> tport_type_ws.c:(.text+0x2c): undefined reference to `SSL_CTX_free'
> /srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../libsofia-sip-ua/.libs/libsofia-sip-ua.a(tport_type_ws.o): in function `tport_ws_init_primary_secure':
> 
> pkg-config option has been added to freeswitch sofia-sip since 2007 and
> https://github.com/freeswitch/sofia-sip/commit/044ac9d8fa7e840cf3e38c3fa7f8cacd0d21b3ea
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8a0c9dbad74a3b358f90c7a3b56b638c4bdb8045
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sofia-sip/sofia-sip.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
