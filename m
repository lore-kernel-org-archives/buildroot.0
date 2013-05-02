From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 11:57:32 +0200
Subject: [Buildroot] Smallish rootfs for wm8505 netbook
In-Reply-To: <3759295.eBGGfacrkH@nc10>
References: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
 <3759295.eBGGfacrkH@nc10>
Message-ID: <20130502115732.547b8eb2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Faasse,

Please do not reply to an e-mail on the list to start a new thread.
Just send a new mail to buildroot at uclibc.org. Thanks.

On Thu, 02 May 2013 09:00:49 +0200, Peter Faasse wrote:

> With varying degrees of success, i've been building buildroot based
> rootfs-s, toolchains and kernel images. All part of a hacking project
> with a few wm8505 (armv5) based netbooks.
> 
> I'm attempting to use buildroot to build a rootfs & kernel that i can
> use to do some native development on the machines.

We decided to no longer support native development on the target
platform. If you're looking at a full-featured distribution that
provides development tools, installing a Debian armel distribution is
probably a wiser choice.


> 1) If i enable c++ support the toolchain, the build of the rootfs
> will fail because of a lack of UCLIBC_HAS_FENV (fenv.h not found).
> This can easily be remedied using make uclibc-menuconfig after
> configuring buildroot ('Target Architecture Features and
> Options'-->'Enable C99 Floating-point environment'), but i think it
> would make sense if that option is -if possible- automatically
> enabled by activating this uclibc option when c++ support is enabled
> in buildroot itself. 

Strange. Did you do a 'make clean; make' cycle? Can you share a
Buildroot .config that exhibits the problem?

> 2) I do include the obsolete 'toolchain on the target'. The resulting
> gcc on- target is by default not usable because glibc.so (a linker
> script it seems) is not copied to the on-target directory. This can
> be remedied by adding *.so to the support/scripts/copy.sh, but i'm
> not quite sure if that has any side- effects. 

Yes, we know the support for toolchain on the target is broken, and
since no-one every sent patches to fix this, and because we think it's
a bit outside of the scope of the Buildroot project, we decided to
deprecate it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
