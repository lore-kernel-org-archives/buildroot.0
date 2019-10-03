From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 3 Oct 2019 08:53:44 +0300
Subject: [Buildroot] Problem openning buildroot tar after upgrading
Message-ID: <CALFsTFVozBqGts4hy071EA-DO6_sy85bibig_vM2QPHTqm3xxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Recently, I've upgraded my Buildroot version from 2018.05 to 2019.05.
I build my rootfs image with tar and I encounter some problems when I try
to open the archive on the board. During the extraction I noticed the
following message:
tar: warning: skipping header 'x
In addition, every file with path longer than 99 chars is truncated.
I digged through the history and saw Yann's commit (6d688e2132: fs/tar: add
support for xattrs). I locally removed the --xattrs-include flag and now
everything looks fine.

This seems like a known problem with old busybox versions (
http://lists.busybox.net/pipermail/busybox/2012-February/077412.html).

Unfortunately, I can't upgrade my busybox version, but I still want to be
able to open the archive. I also tried to pass --no-attrs to
BR2_TARTGET_ROOTFS_TAR_OPTIONS, but it doesn't seem to work.

The only solution I have for now is locally removing the flag, but I don't
think it's the correct way to solve the problem.
Any ideas what else can I do?

Thanks,
Asaf.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191003/6830c602/attachment.html>
