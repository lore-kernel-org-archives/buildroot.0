From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 3 Oct 2015 23:44:21 +0200
Subject: [Buildroot] [PATCH 1/1] system: rootfs remount feature doesn't
 apply to systemd
In-Reply-To: <CANQCQpa=CYrfHkVj5LHxM9JhR4aKmGf2a3YuhzHSGvc9TBVrRg@mail.gmail.com>
References: <1432572925-956-1-git-send-email-james.knight@rockwellcollins.com>
 <CANQCQpa=CYrfHkVj5LHxM9JhR4aKmGf2a3YuhzHSGvc9TBVrRg@mail.gmail.com>
Message-ID: <CAGduivzk07PO9R_X70+=xupuA_sqnoAEOx_aSifpNfL4688K+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James, all,

This patch doesn't apply anymore since everything in system.mk has been
moved to a new 'skeleton' package.
I have respinned it a little bit, you can find it here:
http://lists.busybox.net/pipermail/buildroot/2015-October/140904.html

You patch has been marked as superseeded.

Thank you very much



On Wed, May 27, 2015 at 3:33 PM, Matthew Weber <
matthew.weber@rockwellcollins.com> wrote:

> James,
>
> On Mon, May 25, 2015 at 11:55 AM, James Knight
> <james.knight@rockwellcollins.com> wrote:
> > The ability to configure a system to remount a typical read-only mounted
> > root as read-write is achieved by adjusting the option
> > BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW. The option alters the
> > `/etc/inittab` file.
> >
> > Under systemd, inittab is not used. Adjusting REMOUNT_ROOTFS_RW will not
> > affect the result of a built target. There is also a risk that if a
> > building target removed the inittab file before the target finalization
> > occurs, the build process can fail (ex. removing any generated inittab
> > file during a post-build script will result in a build failure).
> >
> > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> > ---
> <snip>
>
> Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151003/4cc293e0/attachment.html>
