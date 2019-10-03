From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Oct 2019 08:15:30 +0200
Subject: [Buildroot] Problem openning buildroot tar after upgrading
In-Reply-To: <CALFsTFVozBqGts4hy071EA-DO6_sy85bibig_vM2QPHTqm3xxA@mail.gmail.com>
 (Asaf Kahlon's message of "Thu, 3 Oct 2019 08:53:44 +0300")
References: <CALFsTFVozBqGts4hy071EA-DO6_sy85bibig_vM2QPHTqm3xxA@mail.gmail.com>
Message-ID: <87eezu2w3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

 > Hello all,
 > Recently, I've upgraded my Buildroot version from 2018.05 to 2019.05.
 > I build my rootfs image with tar and I encounter some problems when I try
 > to open the archive on the board. During the extraction I noticed the
 > following message:
 > tar: warning: skipping header 'x
 > In addition, every file with path longer than 99 chars is truncated.
 > I digged through the history and saw Yann's commit (6d688e2132: fs/tar: add
 > support for xattrs). I locally removed the --xattrs-include flag and now
 > everything looks fine.

 > This seems like a known problem with old busybox versions (
 > http://lists.busybox.net/pipermail/busybox/2012-February/077412.html).

:/

 > Unfortunately, I can't upgrade my busybox version, but I still want to be
 > able to open the archive. I also tried to pass --no-attrs to
 > BR2_TARTGET_ROOTFS_TAR_OPTIONS, but it doesn't seem to work.

You presumably only mistyped the option here in the email and not when you
tried it?

You could also try to force it into using gnu format (which your old
busybox apparently supports) by passing --format=gnu

-- 
Bye, Peter Korsgaard
