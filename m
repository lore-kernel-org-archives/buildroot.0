From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 23:26:54 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
Message-ID: <20160601232654.07800a9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Our patchwork currently has ~270 patches pending, so we need to do
something to clean up the backlog of patches. To do this, I will try to
revive an initiative that was started by Thomas De Schampheleire a few
years ago, which had proven to be useful.

Every two weeks, I will pick ~10 patches from the backlog. The goal is
to find out:

 1/ What is blocking the integration of those patches
 2/ Whether the original contributor is still interested
 3/ Whether a well-known Buildroot contributor/developer is willing to
    help, either by adopting the patch or by working with the original
    contributor.

So: if you are the original contributor of one the patch listed below,
please speak up if you're still interested in seeing your patch merged.

If there is no interest shown in a given patch, either by the original
contributor or by another Buildroot developer within the two weeks
time, I'll mark the patch as "Rejected" due to the lack of interest.
I'm sending this e-mail on June 1st, so on June 15th, for the patches
that have not seen any discussion or activity, I'll mark them as
Rejected.

Here is the list of week #22 :

 1/ package/libgpg-error: bump to version 1.21
    http://patchwork.ozlabs.org/patch/562100/

    I don't really have any comments, other than the fact that it is
    super annoying for a package with so many dependencies to start
    having architecture dependencies. Could someone refresh and
    validate this patch?

 2/ mysql/maria-db patches
    http://patchwork.ozlabs.org/patch/538042/
    http://patchwork.ozlabs.org/patch/538045/
    http://patchwork.ozlabs.org/patch/538043/
    http://patchwork.ozlabs.org/patch/538198/

    These are pretty big patches, and they turn MySQL into a virtual
    package, which has all sort of consequences. It would be good if
    some other Buildroot developer could do some in-depth
    review/testing of these patches.

 3/ RFC: adding customizable linux logo
    http://patchwork.ozlabs.org/patch/577638/

    This creates a "Linux extension" to easily customize the Linux
    logo. Do we care? The current implementation assumes imagemagick is
    available on the host, which probably isn't good. Probably the
    customlogo package is not needed, and convert the image to the
    appropriate format can be done directly in the
    CUSTOMLOGO_PREPARE_KERNEL hook.

    Do we want such a feature?

 4/ coreutils: allow selection of installed programs
    http://patchwork.ozlabs.org/patch/577829/

    There's been a lengthy discussion, but no real conclusion. Of
    course, we are questioning the value of having so many fine-grained
    Config.in options.

 5/ [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
    http://patchwork.ozlabs.org/patch/581438/

    U-Boot uses LDFLAGS directly with the linker, with fails if you
    pass some -Wl,xyz options in BR2_TARGET_LDFLAGS. Do we care about
    fixing this issue? On the other hand, the fix is easy.

 6/ Makefile: Fix overlay overwriting everything
    http://patchwork.ozlabs.org/patch/581463/

    A problem with the merged /usr option, and when the rootfs overlay
    contains specific directories. Discussion has happened, no decision.

 7/ apply-patches.sh: handle any file name as *.patch
    http://patchwork.ozlabs.org/patch/595693/

 8/ util-linux: rework utilities menu for finer control
    http://patchwork.ozlabs.org/patch/589889/

 9/ host-fakeroot: re-run autotools to fix build on ppc64le host
    http://patchwork.ozlabs.org/patch/591255/

    I am not happy with having to force everyone to autoreconf for
    host-fakeroot (as it's a package part of the default Buildroot
    build), just for the few folks who use Buildroot on a ppc64le host.
    So either we make it conditional, or we get upstream to make a new
    release, or we find a minimal patch for the configure script that
    allows it to work on ppc64le. Suggestions?

 10/ The remaining "help text" related patches from Yann
     http://patchwork.ozlabs.org/patch/596393/
     http://patchwork.ozlabs.org/patch/596396/
     http://patchwork.ozlabs.org/patch/596397/
     http://patchwork.ozlabs.org/patch/596398/
     http://patchwork.ozlabs.org/patch/596399/
     http://patchwork.ozlabs.org/patch/596395/

     Do we want this?

     I like the general idea personally, but I continue to dislike the
     fact that the formatting is enforced at the infra level, with this
     weird syntax. I'd prefer packages to simply contribute a
     HELP_CMDS, or register a hook, where they can use "echo" to display
     whatever they want.

Thanks for your help,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
