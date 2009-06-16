From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue, 16 Jun 2009 11:24:41 +0200
Subject: [Buildroot] [PATCH] iptables: use multipurpose binaries
Message-ID: <20090616112441.47d6b67c@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let iptables use the *-multi binaries:

before:
-rwxr-xr-x 1 ore ore 25645 2009-06-16 11:13 usr/sbin/ip6tables
-rwxr-xr-x 1 ore ore 30773 2009-06-16 11:13 usr/sbin/ip6tables-multi
-rwxr-xr-x 1 ore ore 29773 2009-06-16 11:13 usr/sbin/ip6tables-restore
-rwxr-xr-x 1 ore ore 26693 2009-06-16 11:13 usr/sbin/ip6tables-save
-rwxr-xr-x 1 ore ore 25653 2009-06-16 11:13 usr/sbin/iptables
-rwxr-xr-x 1 ore ore 38077 2009-06-16 11:13 usr/sbin/iptables-multi
-rwxr-xr-x 1 ore ore 29781 2009-06-16 11:13 usr/sbin/iptables-restore
-rwxr-xr-x 1 ore ore 26605 2009-06-16 11:13 usr/sbin/iptables-save

after:
lrwxrwxrwx 1 ore ore    15 2009-06-16 11:14 usr/sbin/ip6tables -> ip6tables-multi
-rwxr-xr-x 1 ore ore 30773 2009-06-16 11:14 usr/sbin/ip6tables-multi
lrwxrwxrwx 1 ore ore    15 2009-06-16 11:14 usr/sbin/ip6tables-restore -> ip6tables-multi
lrwxrwxrwx 1 ore ore    15 2009-06-16 11:14 usr/sbin/ip6tables-save -> ip6tables-multi
lrwxrwxrwx 1 ore ore    14 2009-06-16 11:14 usr/sbin/iptables -> iptables-multi
-rwxr-xr-x 1 ore ore 38077 2009-06-16 11:14 usr/sbin/iptables-multi
lrwxrwxrwx 1 ore ore    14 2009-06-16 11:14 usr/sbin/iptables-restore -> iptables-multi
lrwxrwxrwx 1 ore ore    14 2009-06-16 11:14 usr/sbin/iptables-save -> iptables-multi

Also bump the version to 1.4.3.2 which includes a former patch.

Regards
Olaf
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-iptables-use-multipurpose-binaries.patch
Type: text/x-patch
Size: 5520 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090616/c4046bc5/attachment.bin>
