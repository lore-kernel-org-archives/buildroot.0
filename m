From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Jul 2018 14:42:07 +0000
Subject: [Buildroot] [Bug 11186] New: Building wireless-regdb fails on BR
 2018.05.1
Message-ID: <bug-11186-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11186

            Bug ID: 11186
           Summary: Building wireless-regdb fails on BR 2018.05.1
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: porto.rio at gmx.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

When trying to build a BR-image with crda/wireless-regdb I get the following
error:

>>> wireless-regdb 2017.03.07 Extracting
xzcat /home/daemon/tfs/rpo2/dl/wireless-regdb/wireless-regdb-2017.03.07.tar.xz
| tar --strip-components=1 -C
/home/daemon/tfs/rpo2/work/porto/build/wireless-regdb-2017.03.07   -xf -
>>> wireless-regdb 2017.03.07 Patching
>>> wireless-regdb 2017.03.07 Configuring
>>> wireless-regdb 2017.03.07 Building
>>> wireless-regdb 2017.03.07 Installing to target
/usr/bin/install -m 644 -D -T
/home/daemon/tfs/rpo2/work/porto/build/wireless-regdb-2017.03.07/regulatory.bin
/home/daemon/tfs/rpo2/work/porto/target/usr/lib/crda/regulatory.bin
/usr/bin/install -m 644 -D -T
/home/daemon/tfs/rpo2/work/porto/build/wireless-regdb-2017.03.07/sforshee.key.pub.pem
/home/daemon/tfs/rpo2/work/porto/target/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
/usr/bin/install -m 644 -D -T
/home/daemon/tfs/rpo2/work/porto/build/wireless-regdb-2017.03.07/regulatory.db
/home/daemon/tfs/rpo2/work/porto/target/lib/firmware/regulatory.db
/usr/bin/install: cannot stat
'/home/daemon/tfs/rpo2/work/porto/build/wireless-regdb-2017.03.07/regulatory.db':
No such file or directory
package/pkg-generic.mk:304: recipe for target
'/home/daemon/tfs/rpo2/work/porto/build/wireless-regdb-2017.03.07/.stamp_target_installed'
failed
make[1]: ***
[/home/daemon/tfs/rpo2/work/porto/build/wireless-regdb-2017.03.07/.stamp_target_installed]
Error 1
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

The files "regulatory.db" and "regulatory.db.p7s" are missing in the used regdb
archive "wireless-regdb-2017.03.07.tar.xz"

Looking at the wireless-regdb.mk of BR 2018.05.1 I wonder why "05" is using
very old regdb 2017.03.07 when BR 2018.02.4 is using the much newer regdb
2018.05.31?

See
https://git.busybox.net/buildroot/tree/package/wireless-regdb/wireless-regdb.mk?h=2018.05.1
vs
https://git.busybox.net/buildroot/tree/package/wireless-regdb/wireless-regdb.mk?h=2018.02.4

-- 
You are receiving this mail because:
You are on the CC list for the bug.
