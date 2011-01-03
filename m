From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jan 2011 10:14:58 +0100
Subject: [Buildroot] [PATCH 04/10] binutils: make it a proper package
In-Reply-To: <4D1B9D16.1080902@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
	<1293563435-10054-5-git-send-email-gustavo@zacarias.com.ar>
	<874o9xldzj.fsf@macbook.be.48ers.dk>
	<4D1B9D16.1080902@zacarias.com.ar>
Message-ID: <20110103101458.61270f4a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Dec 2010 17:41:58 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> >  Gustavo>  $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
> >  Gustavo>  	mkdir -p $(GCC_BUILD_DIR2)
> >  Gustavo> -	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
> >  Gustavo> -	mkdir -p $(STAGING_DIR)/lib
> >  Gustavo> -	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
> >  Gustavo> -	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
> >  Gustavo> -	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
> > 
> > Why remove this ARCH_IS_64 stuff?
> 
> This is from commit 3c77bab2eeace3ee675bd745ca335fa3dd1630bb which does
> a symlink trick to make libstdc++ available. It's simpler to just copy
> libstdc++ (and libgcj/libgcc while at it) to the sysroot which is fixed
> in patch #5 from my series.

I am not sure about this justification, since I don't see what change
in the toolchain build procedure removes the need for this symbolic
link. Have you actually tested building WebKit on x86_64 for example ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
