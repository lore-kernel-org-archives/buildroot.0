From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Apr 2009 20:03:50 +0200
Subject: [Buildroot] buildroot openssl compile error
In-Reply-To: <49E16433.9010707@comcast.net> (Brad Johnson's message of "Sat\,
	11 Apr 2009 22\:46\:59 -0500")
References: <49E16433.9010707@comcast.net>
Message-ID: <87fxgcbfcp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brad" == Brad Johnson <bradjohn263@comcast.net> writes:

Hi,

 Brad> I am using buildroot to cross-compile an embedded ARM
 Brad> system. Everything else works fine, but I can not get openssl to
 Brad> compile (I am trying to add openssh and it requires openssl and
 Brad> zlib). It can not find zlib.h, although I have zlib1g-dev installed on
 Brad> my build machine (a 386 Ubuntu system).
 Brad> I have tried manually configuring openssl (./Configure
 Brad> --with-zlib-include=/usr/include), with no success.
 Brad> Here is the error I get:

Any special reason why you cannot use dropbear?

Is this with an internal or external toolchain?

There's no -I$(STAGING_DIR)/usr/include in the gcc invocation, so that
probably fails with an external toolchain.

 Brad> /opt/arm-linux/usr/bin/arm-linux-gcc -I.. -I../.. -I../../include
 Brad> -fPIC -DOPENSS
 Brad> L_PIC -DZLIB_SHARED -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN
 Brad> -DHAVE_DLF
 Brad> CN_H -DTERMIO -O3 -fomit-frame-pointer -Wall   -c -o c_zlib.o c_zlib.c
 Brad> c_zlib.c:25:18: error: zlib.h: No such file or directory

If not, do you have a build_arm/staging_dir/usr/include/zlib.h? Please
post your .config

-- 
Bye, Peter Korsgaard
