From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:07:47 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix installation
 for CodeSourcery AArch64 toolchain
In-Reply-To: <57c6fe6e-361e-d826-4264-cfcc9b0ba5b8@gmail.com>
References: <20160430164629.A99CF818F2@busybox.osuosl.org>
 <57c6fe6e-361e-d826-4264-cfcc9b0ba5b8@gmail.com>
Message-ID: <20160508150747.6b1f11d5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 May 2016 12:54:28 +0200, Romain Naour wrote:

> > +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
> > +define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
> > +	ln -sf ld-2.18.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
> > +endef
> > +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP  
> 				   ^^^^^^^
> It should be TARGET here, no ?

Thanks for spotting! Fixed in
https://git.busybox.net/buildroot/commit/?id=60b843edf0b53397b6712a3a3b30bdf9f5ff7237.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
