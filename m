From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Nov 2012 23:25:18 +0100
Subject: [Buildroot] Xtensa in the autobuilders, first build failures
Message-ID: <20121118232518.091b6154@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

As you have probably noticed, we merged your Xtensa support in
Buildroot a few days ago. I'm really happy that your patches came in,
as it means that the removal of the Xtensa architecture will not be
visible (we removed it during this development cycle, and later
re-introduced it thanks to your patches).

I have also added one Xtensa toolchain configuration in our
autobuilder, and we are therefore starting to see a few Xtensa-related
build issues. Note that this is not at all a blocking issue for now:
when a new architecture is introduced, we expect to have build
failures. I'm listing below the failures we had, in case you have some
time to look at them:

 * Failure to build gdbserver for the target, and gdb for the target as
   well, both for the same reason: PTRACE_GETXTREGS and
   PTRACE_SETXTREGS are not defined by the kernel headers apparently.
   I'm not sure if they are just missing from the kernel headers, of
   the ptrace support is missing in the kernel. See:

   http://autobuild.buildroot.org/results/1d2f307b2aa59bebca3bcb9ea854839f4b1d14fb/build-end.log
   http://autobuild.buildroot.org/results/ec58e302030b8f72b19e9bada16dabb076c60261/build-end.log

   It would be nice if you could have a look at this.

 * Xtensa apparently does not have libffi support. However, it is quite
   a bit of work to get libffi support, so maybe we should just mark
   libffi as not available on Xtensa (which is quite annoying because
   libffi is a dependency for a huge number of packages, but we have
   the same problem with other architectures as well). See:

   http://autobuild.buildroot.org/results/e097c27d38e49d4bf4e07f95c52e995709c08aa8/build-end.log

Besides those issues, I'm just reminding you that we are still very
interested in having a Qemu Xtensa configuration to be able to run the
Xtensa systems we generate with Buildroot.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
