From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 2 Sep 2015 09:50:34 -0400
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <20150902091051.7ee82cf3@free-electrons.com>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
 <20150902091051.7ee82cf3@free-electrons.com>
Message-ID: <CANPyyuP-7XUHqJET+UOKEtGS8_N4R0nAFY1tfffrUK5oko5DnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 2, 2015 at 3:10 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Yann E. MORIN,
>
> On Wed,  2 Sep 2015 00:55:13 +0200, Yann E. MORIN wrote:
> > systemd is incresaingly expected things to live in /usr/bin or
> > /usr/sbin.
> >
> > However, a lot of packages stil install stuff directly into /bin or
> > /sbin.
> >
> > Add an option so that /bin and /sbin be symlinks to /usr/bin and
> > /usr/sbin. Ditto for .lib for consistency.
> >
> > That option is forcibly enabled when the init system is systemd.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> But do we actually need this? Vicente sent a patch to fix the systemd
> issues that were discussed on the list:
>
>    [PATCH] systemd: override the path for kill, sulogin, mount and umount
>

It's not just what systemd expects, many packages by default install their
systemd-related items to /lib, etc. instead of /usr/lib, so we either have
manual fixes to the .mk files for those packages or inconsistencies in
where those items go. As an example, I believe rsyslog is passed a special
flag setting its systemd install location to /usr/lib, and gpsd is still
just installing to /lib/systemd/system.

It wouldn't surprise me if most of our systemd users had already merged
their directories in their skeleton; I will probably do so soon as well.

Mike
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150902/aa8dc4b1/attachment.html>
