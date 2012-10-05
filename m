From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Oct 2012 09:19:50 +0200
Subject: [Buildroot] [PATCH v8 01/11] host-qemu: new package
In-Reply-To: <CA+-urNSi+VTS93wP5cEFuLwZn7SCKawpDp6XR6OLqumofBXJyA@mail.gmail.com>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <20121004223334.64e74a6f@skate>
 <CA+-urNSi+VTS93wP5cEFuLwZn7SCKawpDp6XR6OLqumofBXJyA@mail.gmail.com>
Message-ID: <20121005091950.5833bed7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank,

On Thu, 4 Oct 2012 18:09:48 -0400, Frank Hunleth wrote:

> >> --- /dev/null
> >> +++ b/package/qemu/Config.in.host
> >> @@ -0,0 +1,15 @@
> >> +config BR2_PACKAGE_HOST_QEMU
> >> +     bool "host qemu"
> >> +     help
> >> +       QEMU is a generic and open source machine emulator and virtualizer.
> >> +
> >> +       In user mode emulation, QEMU runs single cross-compiled programs.
> >> +       Fast cross-compilation and cross-debugging are the main targets
> >> +       for user-mode emulation.
> >> +
> >> +       In system mode emulation, QEMU emulates a full computer system,
> >> +       including peripherals, and handles the filesystem image generated
> >> +       by Buildroot.
> >> +       (Buildroot is shipped with many configs/qemu_*_defconfig files).
> >> +
> >> +       http://qemu.org/
> >
> > I think you should not add a Kconfig option for the host-qemu package
> > for now. Until it supports the system emulation, it is kind of useless
> > to have it listed in the host tools. For the perl stuff, you only need
> > the user emulation, so let's add support for the user emulation only at
> > the moment.
> 
> Forgive me if I'm misunderstanding, but I think that listing qemu in
> Kconfig may be desirable to me even if only user emulation is
> supported. I currently run a set of regression tests as a post-build
> step. I use qemu user emulation mode for this. Right now, I use a
> system-installed version of qemu-arm but would prefer to use a
> buildroot version.

Sure. But for example the Kconfig help text was mentioning system mode
emulation, even though the current package didn't support it. My point
was: for the sake of building Perl, we don't need to have host-qemu in
Kconfig, so let's not do this, and keep the focus of the patch set.

Fran?ois has already done 8 versions of this patch set, and I am pretty
sure he wants to see it merged. And the best way to see a patch set
merged is to remain absolutely focused on the problem you're trying to
solve, and not to solve a gazillions of other unrelated problems at the
same time.

We will definitely welcome further patches improving the host-qemu
package.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
