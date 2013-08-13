From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 13 Aug 2013 18:11:01 -0500
Subject: [Buildroot] BeagleBoneBlack Status
Message-ID: <CAEBucnD__n6ebXT6_vNLoUwV4tiKKteQNM9njeAjbh-Ld6+mKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everyone,

I'm here with an update on the status of BBB. I have developed a
defconfig for the BBB.  It is the beagleblack_defconfig in my
github.com/Spenser309/buildroot (branch beagleblack) repo.  This takes
in the mega patch from RobertCNelson, adds the dtc kernel patch, my
linux_defconfig and builds a kernel/rfs that works on the BBB.

The Beagle Bone Black faces two main issues in order to be completely
supported in Buildroot.

1. The firmware (for BBB capes) must be builtin to the kernel as the
kernels firmware loading mechanism does not wait for the RFS to be
mounted.  This greatly increases the kernel size.
2. The SGX core has no support (or at least no documentation) for
integrating with the TI DRM Framebuffer (supposedly will be
implemented in next ti-gfx release.)

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
