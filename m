From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Wed, 29 Feb 2012 14:49:09 +0100
Subject: [Buildroot] Question about float-abi
In-Reply-To: <20120229110850.GN23707@ldesroches-Latitude-E6320>
References: <20120228105550.GM23707@ldesroches-Latitude-E6320>
 <20120229110850.GN23707@ldesroches-Latitude-E6320>
Message-ID: <20120229134909.GO23707@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 29, 2012 at 12:08:51PM +0100, Ludovic Desroches wrote:

[snip]

> How can I have a hardware floating point support with Buildroot and uclibc?
> Looking at the BR2_VFP_FLOAT setting, it seems to be only used for external
> toolchains providing multi-lib support.
> I added mcpu, mfpu and mfloat-abi flags to BR2_TARGET_OPTIMIZATION and to
> UCLIBC_EXTRA_FLAGS. I think it really force hardware floating point support
> since I have this error during the build:
> 
> [snip]/arm-unknown-linux-uclibcgnueabi/bin/ld: error: lib/libuClibc-0.9.32.1.so
> uses VFP register arguments, [snip]/arm-unknown-linux-uclibcgnueabi/4.5.3/libgcc.a(bpabi.o)
> does not
> 
> Do I play with the good settings? Do I miss some settings?

Yes there were missing options for gcc: --with-float=hard and --with-fpu=...

Now floating score is correct. I am surprised by the good results of the uclibc.
I don't know if nbench is an accurate benchmark to test several libc but
scores obtained by glibc, eglibc and uclibc are very closed.

Regards

Ludovic
