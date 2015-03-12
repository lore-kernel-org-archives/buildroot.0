From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 12 Mar 2015 07:41:00 -0500
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
Message-ID: <CANQCQpb=uFNRcp9k5pnH5DU5rsC8R6MrTY3tV9jhwpGnfsVXwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Thu, Mar 12, 2015 at 4:08 AM, Angelo Compagnucci <
angelo.compagnucci@gmail.com> wrote:

> Deal All,
>
> I'm in the process of building a rootfs for a custom application and
> wondering the best way to change permissions recursively for a
> directory.
>
> What I'm trying to achieve is to add some files via an overlay, but
> files should have a specific owner/permission which should be read
> from the buildroot's users table.
>
> I cannot find something like that in the documentation. Instead, the
> documentation specifies how to add single files and change
> owner/permission accordingly.
>

I assume you've looked at building the a permissions table file which you
would add to your "System configuration -> Path to the permission tables"
config option (which uses makedev to apply the correc uid/gid and
permissions to files/folders).  However I do believe it requires you to
itemize out all items like you've mentioned.
(http://buildroot.uclibc.org/downloads/manual/manual.html#makedev-syntax)

Matt


> If I understand correctly, I should create a new user (if necessary)
> with a specific UDI/GID and than use a POST_INSTALL_TARGET to change
> permission using that UID/GID.
> Alternatively, I can use FOO_PERMISSIONS with a per file granularity.
>
> Is this correct?
>
> Thanks!
>
> Sincerely, Angelo
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150312/c2f6abc8/attachment.html>
