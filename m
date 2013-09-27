From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Sep 2013 19:54:02 +0200
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639AD6B4A@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
 <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
 <20130927100513.690cdd23@skate>
 <F9C551623D2CBB4C9488801D14F864C639AD6A6C@ex-mb1.corp.adtran.com>
 <F9C551623D2CBB4C9488801D14F864C639AD6B4A@ex-mb1.corp.adtran.com>
Message-ID: <20130927195402.3320eeb0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Fri, 27 Sep 2013 15:41:36 +0000, ANDY KENNEDY wrote:

> Okay, I see the difference between my patch and what HOST_DIR does.
> When using HOST_DIR, the normal location of output/host is redirected
> to /opt/somedir then the toolchain, all existing libs, all buildroot
> built libs get dumped into that location.
> 
> In my patch, I have made this assumption:  The user already has
> a toolchain in /opt/somedir/mytoolchain and desires to keep that
> location.  After looking at what the code does, I don't really think
> that I can specify the SAME location for HOST_DIR as it would attempt
> to copy files onto itself (which would then, presumably, error out).
> In the case of using the SYSROOT as the staging directory, ONLY the
> libraries get copied back to the toolchain's sysroot (and the really
> nice thing about this is that the user never has to tell me where to
> put the stuff, I asked the toolchain for the sysroot dir).
> 
> So, as I stated before, I'll keep dragging this patch around if you
> don't want to include it into Buildroot, but I believe this may be
> something that others would like to use.  But, I've been wrong
> MANY times before ;).

I still don't quite understand your use case. If you don't use
BR2_HOST_DIR=/opt/someplace/ and keep telling your users to use their
original toolchain, they have to pass many options to the compiler and
linker to point to the right library locations. They also don't have
access to the right pkg-config that works in cross-compilation mode
that Buildroot has built.

I *really* believe you should have a deeper look at what it means to
specify a custom BR2_HOST_DIR, I think it's really what you should be
using.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
