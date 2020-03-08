From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 21:38:10 +0100
Subject: [Buildroot] [PATCH v1] package/ser2net: fix gensio detection
 with openssl enabled
In-Reply-To: <20200308165149.31293-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 8 Mar 2020 17:51:49 +0100")
References: <20200308165149.31293-1-ps.report@gmx.net>
Message-ID: <87zhcqr39p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add openssl linker flags via LIBS to fix configure gensio
 > library detection.

 > Fixes:

 >   http://autobuild.buildroot.net/results/66e0d3e0a2a8dc5a62c267d16a53216f0f2ce8dd

 >   checking gensio/gensio.h usability... yes
 >   checking gensio/gensio.h presence... yes
 >   checking for gensio/gensio.h... yes
 >   checking for str_to_gensio in -lgensio... no
 >   configure: error: libgensio won't link, please install gensio dev package

 > The build/ser2net-4.1.1/config.log files states:

 >   .../arm-buildroot-linux-uclibcgnueabi/bin/ld: .../host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgensio.a(gensio_filter_ssl.o): in function `gensio_do_ssl_init':
 >   gensio_filter_ssl.c:(.text+0x34): undefined reference to `OPENSSL_init_ssl'

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

The real solution would be for gensio to provide a .pc file / ser2net
use pkg-config, but OK - This is good enough for 2020.02.

-- 
Bye, Peter Korsgaard
