From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Apr 2009 11:06:47 +0200
Subject: [Buildroot] OpenSSL build system knowledge somewhere ?
In-Reply-To: <20090414104134.6b4d0362@surf>
References: <49E16433.9010707@comcast.net> <87fxgcbfcp.fsf@macbook.be.48ers.dk>
	<20090413220823.210225fe@surf> <49E3FEAF.7040705@comcast.net>
	<20090414090907.2c297e77@surf> <20090414104134.6b4d0362@surf>
Message-ID: <20090415110647.1bf85daa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 14 Apr 2009 10:41:34 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Here, using CC="$(TARGET_CC) $(TARGET_CFLAGS)" allows openssl to find
> zlib.h properly. However, it fails later with make thinking that the
> -Os and --sysroot options are for him (and not for gcc). The openssl
> build system looks strange, I don't have the time to look at time now.
> Maybe tomorrow.

I had a quick look, and the openssl build system is definitely strange.
I don't see how one can pass custom CFLAGS to this build system (and
this is needed to pass --sysroot $(STAGING_DIR)).

The Configure script usage is :

==================================================================
Usage: Configure [no-<cipher> ...] [enable-<cipher> ...]
[experimental-<cipher> ...] [-Dxxx] [-lxxx] [-Lxxx] [-fxxx] [-Kxxx]
[no-hw-xxx|no-hw] [[no-]threads] [[no-]shared] [[no-]zlib|zlib-dynamic]
[enable-montasm] [no-asm] [no-dso] [no-krb5] [386] [--prefix=DIR]
[--openssldir=OPENSSLDIR] [--with-xxx[=vvv]] [--test-sanity]
os/compiler[:flags]
==================================================================

I tried to use os/compiler[:flags] to pass flags, but didn't succeed.

On
http://www.therareair.com/2009/01/01/tutorial-how-to-compile-openssl-for-the-iphone/,
where they explain how to compile OpenSSL for the iPhone, they suggest
to directly hack the Configure script to add the proper CFLAGS.

Any suggestion on this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
