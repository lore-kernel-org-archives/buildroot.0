From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:06:34 +0200
Subject: [Buildroot] Patchwork cleanup week #24
Message-ID: <20160615220634.67eb8fa9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The previous patchwork cleanup period being over, it's time to start
the second period, with 10 other patches. We're on June 15th, so I'll
give people until June 30th to react on the following patches. If
there's no reaction, like no interest from either the original
submitter nor any other Buildroot developer, the patch will be marked
Rejected on June 30th.

If you are in To: of this e-mail, then one or several of the patches
below have been authored by you, so you should be interested :-)

Thanks,

Thomas

 1. board: add support for Chromebook Snow
    http://patchwork.ozlabs.org/patch/563197/

    This one has not been reviewed. It would be sad not to merge it,
    because we have merged some specific packages that are needed for
    this defconfig (host-vboot-utils).

 2. pyqtgraph: new package
    http://patchwork.ozlabs.org/patch/529864/

    It seems to be a pretty straightforward package, but nobody
    reviewed it.

 3. toolchain-wrapper: prevent use of unsupported -fstack-protector*
    http://patchwork.ozlabs.org/patch/545315/

    This patch proposes to make the toolchain wrapper fail immediately
    when -fstack-protector is passed to gcc, but SSP support is not
    available. This helps with some packages that assume that compiling
    with -fstack-protector is enough to determine if SSP support is
    available, while in several cases, doing a link test is necessary.

    I personally don't really like this change, as I believe it's
    adding even more sorcery to our toolchain wrapper. Instead, the
    problematic upstream packages should be fixed. Plus, at the time,
    we had a few packages in this situation, but nowadays, I don't
    think we have build failures due to this.

    So, my proposal would be to reject this patch.

 4. uboot: install multiple spl images
    http://patchwork.ozlabs.org/patch/595980/

 5. Fix for the makeinfo / missing issue, proposal from Romain
    http://patchwork.ozlabs.org/patch/595041/
    http://patchwork.ozlabs.org/patch/595042/
    http://patchwork.ozlabs.org/patch/595043/

    We need to take a decision on this one. The problem also occurs for
    gdb and binutils on ARC, for which we've added a custom hack
    recently.

    I tried to play with timestamps by touch'ing the .info files before
    the build, it worked with one of gdb or binutils, but failed for
    the other.

    So either we take Romain's approach, or we bite the bullet and add
    a host-makeinfo package on which we depend when gdb/binutils are
    fetched from Git.

 6. wget download: 'scheme missing' results in empty output file
    http://patchwork.ozlabs.org/patch/599387/

 7. Fortran support
    http://patchwork.ozlabs.org/patch/599678/
    http://patchwork.ozlabs.org/patch/599679/
    http://patchwork.ozlabs.org/patch/599680/

    Nobody reviewed this.

 8. new package: alsacap
    http://patchwork.ozlabs.org/patch/607045/

    Isn't there already a tool in alsa-utils that does the same thing
    more or less?

 9. overlay: Add archive-based (tar) rootfs overlays
    http://patchwork.ozlabs.org/patch/610752/

10. Improvements to kernel headers version selection
    http://patchwork.ozlabs.org/patch/612316/
    http://patchwork.ozlabs.org/patch/612315/
    http://patchwork.ozlabs.org/patch/612313/

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
