From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:13:54 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160601232654.07800a9b@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
Message-ID: <20160608221354.171bdc47@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since we're one week after the announcement, and one week away from the
deadline, here is a quick status on the 10 patches.

On Wed, 1 Jun 2016 23:26:54 +0200, Thomas Petazzoni wrote:

>  1/ package/libgpg-error: bump to version 1.21
>     http://patchwork.ozlabs.org/patch/562100/
> 
>     I don't really have any comments, other than the fact that it is
>     super annoying for a package with so many dependencies to start
>     having architecture dependencies. Could someone refresh and
>     validate this patch?

Nobody cared.

>  2/ mysql/maria-db patches
>     http://patchwork.ozlabs.org/patch/538042/
>     http://patchwork.ozlabs.org/patch/538045/
>     http://patchwork.ozlabs.org/patch/538043/
>     http://patchwork.ozlabs.org/patch/538198/
> 
>     These are pretty big patches, and they turn MySQL into a virtual
>     package, which has all sort of consequences. It would be good if
>     some other Buildroot developer could do some in-depth
>     review/testing of these patches.

Nobody cared. I will clearly throw away those patches if nobody is
interested in them, it's too much work to go through them if nobody
cares.

>  3/ RFC: adding customizable linux logo
>     http://patchwork.ozlabs.org/patch/577638/
> 
>     This creates a "Linux extension" to easily customize the Linux
>     logo. Do we care? The current implementation assumes imagemagick is
>     available on the host, which probably isn't good. Probably the
>     customlogo package is not needed, and convert the image to the
>     appropriate format can be done directly in the
>     CUSTOMLOGO_PREPARE_KERNEL hook.
> 
>     Do we want such a feature?

The patch has been reviewed, and several improvements have been
suggested. Therefore, the patch has been marked as Superseded. It has
not be resubmitted so far.

>  4/ coreutils: allow selection of installed programs
>     http://patchwork.ozlabs.org/patch/577829/
> 
>     There's been a lengthy discussion, but no real conclusion. Of
>     course, we are questioning the value of having so many fine-grained
>     Config.in options.

Nobody cared.

>  5/ [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
>     http://patchwork.ozlabs.org/patch/581438/
> 
>     U-Boot uses LDFLAGS directly with the linker, with fails if you
>     pass some -Wl,xyz options in BR2_TARGET_LDFLAGS. Do we care about
>     fixing this issue? On the other hand, the fix is easy.

There has been some discussion between mean and Jeroen, and we
concluded that the patch was not necessary since anyway we are
currently not passing our LDFLAGS down to U-Boot. It has been marked as
Rejected.

>  6/ Makefile: Fix overlay overwriting everything
>     http://patchwork.ozlabs.org/patch/581463/
> 
>     A problem with the merged /usr option, and when the rootfs overlay
>     contains specific directories. Discussion has happened, no decision.

This patch was no longer needed, as the issue was already fixed, so it
has been marked as Supersed.

>  7/ apply-patches.sh: handle any file name as *.patch
>     http://patchwork.ozlabs.org/patch/595693/

Yegor said he would do more testing in the next weeks.

>  8/ util-linux: rework utilities menu for finer control
>     http://patchwork.ozlabs.org/patch/589889/

Carlos has resubmitted a newer version:
http://patchwork.ozlabs.org/patch/631262/

>  9/ host-fakeroot: re-run autotools to fix build on ppc64le host
>     http://patchwork.ozlabs.org/patch/591255/
> 
>     I am not happy with having to force everyone to autoreconf for
>     host-fakeroot (as it's a package part of the default Buildroot
>     build), just for the few folks who use Buildroot on a ppc64le host.
>     So either we make it conditional, or we get upstream to make a new
>     release, or we find a minimal patch for the configure script that
>     allows it to work on ppc64le. Suggestions?

Nobody cared. I'll throw it away if nobody comes back with a proper
solution.

>  10/ The remaining "help text" related patches from Yann
>      http://patchwork.ozlabs.org/patch/596393/
>      http://patchwork.ozlabs.org/patch/596396/
>      http://patchwork.ozlabs.org/patch/596397/
>      http://patchwork.ozlabs.org/patch/596398/
>      http://patchwork.ozlabs.org/patch/596399/
>      http://patchwork.ozlabs.org/patch/596395/
> 
>      Do we want this?
> 
>      I like the general idea personally, but I continue to dislike the
>      fact that the formatting is enforced at the infra level, with this
>      weird syntax. I'd prefer packages to simply contribute a
>      HELP_CMDS, or register a hook, where they can use "echo" to display
>      whatever they want.

Yann did a newer version, and after some changes I merged it. I believe
this topic is closed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
