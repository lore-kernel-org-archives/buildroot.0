From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 22:00:46 +0100
Subject: [Buildroot] [PATCH] fs/iso9660: md5 checksum boot dir files
In-Reply-To: <CANQCQpaZZ708bi1N3m2EqoT8+apV7wgLqE6CXNJ8q5Go3OGbLQ@mail.gmail.com>
References: <1478884419-22717-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161111212436.16bd7898@free-electrons.com>
 <CANQCQpaZZ708bi1N3m2EqoT8+apV7wgLqE6CXNJ8q5Go3OGbLQ@mail.gmail.com>
Message-ID: <20161111220046.72d2547e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 14:54:06 -0600, Matthew Weber wrote:

> We thought for a iso9600 formatted iso, this was a way to add a quick
> integrity check capability to the images used for kernel/rootfs. Since the
> bzimage and initrd are both present in this boot folder.  This allows a
> product's install process to check the integrity of a disk after flashing
> the iso to a bare drive (mount the new boot partition and run md5sum -c).
> It also opens up the option for runtime verifying the images you booted
> from if you add scripting in your rootfs.

This all seems interesting, but if we want to solve this problem, we
want to solve it globally for all filesystems, and the entire contents
of the filesystem, not just the specific /boot directory of the
specific iso9660 filesystem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
