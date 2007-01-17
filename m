From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 17 Jan 2007 22:16:15 +0100
Subject: [Buildroot] mtd broken with 2.6.19 headers
Message-ID: <45AE921F.7030609@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Looks like a real mess.
oobblock is renamed to writesize and this kills nanddump.c
other things kills mkfs.jffs2
Seems like some of the compression algorithms are gone (LZO,LZARI).

Tried downloading mtd_20061007.orig.tar.gz from the debian site,
and this is not any better.
<sys/acl.h> is gone, but I think that <linux/posix_acl.h> contains
missing info.

Anyone got anything ready to fly with 2.6.19 headers?

Best Regards
Ulf Samuelsson
