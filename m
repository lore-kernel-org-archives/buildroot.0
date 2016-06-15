From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 21:52:58 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160601232654.07800a9b@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
Message-ID: <20160615215258.5e9e85a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 23:26:54 +0200, Thomas Petazzoni wrote:

> If there is no interest shown in a given patch, either by the original
> contributor or by another Buildroot developer within the two weeks
> time, I'll mark the patch as "Rejected" due to the lack of interest.
> I'm sending this e-mail on June 1st, so on June 15th, for the patches
> that have not seen any discussion or activity, I'll mark them as
> Rejected.

We are on June 15th.

> Here is the list of week #22 :
> 
>  1/ package/libgpg-error: bump to version 1.21
>     http://patchwork.ozlabs.org/patch/562100/
> 
>     I don't really have any comments, other than the fact that it is
>     super annoying for a package with so many dependencies to start
>     having architecture dependencies. Could someone refresh and
>     validate this patch?

I'm keeping this one around, since we really want to bump libgpg-error
at some point.

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

Nobody has reacted on those patches, so I'm marking them as Rejected.
They are still available on the mailing list if anyone wants to revive
them some day.

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

This one had already been marked "Changes Requested".

> 
>  4/ coreutils: allow selection of installed programs
>     http://patchwork.ozlabs.org/patch/577829/
> 
>     There's been a lengthy discussion, but no real conclusion. Of
>     course, we are questioning the value of having so many fine-grained
>     Config.in options.

In agreement with the author, this one has been marked Rejected.

> 
>  5/ [PATCH 1/1] uboot: Strip "-Wl," from LDFLAGS
>     http://patchwork.ozlabs.org/patch/581438/
> 
>     U-Boot uses LDFLAGS directly with the linker, with fails if you
>     pass some -Wl,xyz options in BR2_TARGET_LDFLAGS. Do we care about
>     fixing this issue? On the other hand, the fix is easy.

After testing and discussion with the author it has been marked
Rejected.

> 
>  6/ Makefile: Fix overlay overwriting everything
>     http://patchwork.ozlabs.org/patch/581463/
> 
>     A problem with the merged /usr option, and when the rootfs overlay
>     contains specific directories. Discussion has happened, no decision.

This had already been fixed differently, so it has already been marked
Superseded.

>  7/ apply-patches.sh: handle any file name as *.patch
>     http://patchwork.ozlabs.org/patch/595693/

This one has several comments that have not been taken into account, so
I'm marking it as Changes Requested.

> 
>  8/ util-linux: rework utilities menu for finer control
>     http://patchwork.ozlabs.org/patch/589889/

This one has already been marked as Superseded, since Carlos did a
newer version: http://patchwork.ozlabs.org/patch/631262/.

>  9/ host-fakeroot: re-run autotools to fix build on ppc64le host
>     http://patchwork.ozlabs.org/patch/591255/
> 
>     I am not happy with having to force everyone to autoreconf for
>     host-fakeroot (as it's a package part of the default Buildroot
>     build), just for the few folks who use Buildroot on a ppc64le host.
>     So either we make it conditional, or we get upstream to make a new
>     release, or we find a minimal patch for the configure script that
>     allows it to work on ppc64le. Suggestions?

Nobody has suggested a better solution, and it's a corner case, so I
marked it has rejected.

>  10/ The remaining "help text" related patches from Yann
>      http://patchwork.ozlabs.org/patch/596393/
>      http://patchwork.ozlabs.org/patch/596396/
>      http://patchwork.ozlabs.org/patch/596397/
>      http://patchwork.ozlabs.org/patch/596398/
>      http://patchwork.ozlabs.org/patch/596399/
>      http://patchwork.ozlabs.org/patch/596395/

A newer version of this has been submitted by Yann and merged.

Summary of the cleanup: on a total of 10 patches, we have 2 left: one
that has been revived by a newer version, and one that we keep because
it is really something we want to do (bumping libgpg-error).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
