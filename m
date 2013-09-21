From: Michael Rommel <rommel@layer-7.net>
Date: Sat, 21 Sep 2013 11:08:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-20
In-Reply-To: <20130921063008.1D1C452C1BE@lolut.humanoidz.org>
References: <20130921063008.1D1C452C1BE@lolut.humanoidz.org>
Message-ID: <4A707D74-07C0-4DDD-A6E3-A3886295886C@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sep 21, 2013, at 8:30 , Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2013-09-20
> ===============================
>                aiccu-20070115 | 2 
> 
> Detail of failures
> ===================
> 
>       sh4 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/8c65e9f878af6c3b4edf8ac84f7dc3d8a703a189/
>       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/5fca5a9f7895c7d4b7cdb5a95e476e15eff3e3a6/

I don't understand this error. The Config.in file correctly depends on HAS_THREAS and GNUTLS and the .mk file lists gnutls as dependency.

Still the linker complains about the missing symbols:

../common/tun.o: In function `tun_start':
tun.c:(.text+0x2b0): undefined reference to `pthread_create'
../common/aiccu.o: In function `aiccu_InitConfig':
aiccu.c:(.text+0xcc): undefined reference to `gnutls_global_init'

I wonder if it has something to do with linking with the --static flag, but the build log also states, that a libgnutls.a file has been installed correctly.
libtool: install: /usr/bin/install -c .libs/libgnutls.a /home/test/test/2/output/target/usr/lib/libgnutls.a
libtool: install: chmod 644 /home/test/test/2/output/target/usr/lib/libgnutls.a
libtool: install: /home/test/test/2/output/host/usr/bin/arm-none-linux-gnueabi-ranlib /home/test/test/2/output/target/usr/lib/libgnutls.a

Do you have any suggestion where I can look further?

  Michael.

-- 
Michael Rommel, Erlangen, Germany
