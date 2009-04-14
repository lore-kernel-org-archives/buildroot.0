From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2009 10:41:34 +0200
Subject: [Buildroot] buildroot openssl compile error
In-Reply-To: <20090414090907.2c297e77@surf>
References: <49E16433.9010707@comcast.net> <87fxgcbfcp.fsf@macbook.be.48ers.dk>
	<20090413220823.210225fe@surf> <49E3FEAF.7040705@comcast.net>
	<20090414090907.2c297e77@surf>
Message-ID: <20090414104134.6b4d0362@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 14 Apr 2009 09:09:07 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> $(OPENSSL_TARGET_BUILD):
>         $(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) all build-shared
>         $(MAKE1) CC=$(TARGET_CC) -C $(OPENSSL_DIR) do_linux-shared
>         touch $@

Here, using CC="$(TARGET_CC) $(TARGET_CFLAGS)" allows openssl to find
zlib.h properly. However, it fails later with make thinking that the
-Os and --sysroot options are for him (and not for gcc). The openssl
build system looks strange, I don't have the time to look at time now.
Maybe tomorrow.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
