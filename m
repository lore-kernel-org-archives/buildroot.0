From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Sep 2015 12:58:00 +0000 (UTC)
Subject: [Buildroot] [Bug 8366] New: libevent does not build
Message-ID: <bug-8366-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8366

           Summary: libevent does not build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: florian.koch1981 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Using the latest stable release buildroot-2015.08.1, or the latest snapshot
from today , libevent does not build

Resolving downloads.sourceforge.net (downloads.sourceforge.net)...
216.34.181.59
Connecting to downloads.sourceforge.net
(downloads.sourceforge.net)|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location:
http://skylink.dl.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
[following]
--2015-09-23 14:49:04-- 
http://skylink.dl.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
Resolving skylink.dl.sourceforge.net (skylink.dl.sourceforge.net)...
109.230.212.53
Connecting to skylink.dl.sourceforge.net
(skylink.dl.sourceforge.net)|109.230.212.53|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 854987 (835K) [application/x-gzip]
Saving to:
?/root/buildroot/output/build/.libevent-2.0.22-stable.tar.gz.fCWLgF/output?

100%[=====================================================================================================================================>]
854,987      705KB/s   in 1.2s   

2015-09-23 14:49:05 (705 KB/s) -
?/root/buildroot/output/build/.libevent-2.0.22-stable.tar.gz.fCWLgF/output?
saved [854987/854987]

libevent-2.0.22-stable.tar.gz: OK (md5: c4c56f986aa985677ca1db89630a2e11)
libevent-2.0.22-stable.tar.gz: OK (sha1:
a586882bc93a208318c70fc7077ed8fca9862864)
>>> libevent 2.0.22-stable Extracting
gzip -d -c /root/buildroot/dl/libevent-2.0.22-stable.tar.gz | tar
--strip-components=1 -C /root/buildroot/output/build/libevent-2.0.22-stable 
-xf -
>>> libevent 2.0.22-stable Patching

Applying 0001-Disable-building-test-programs.patch using patch: 
patching file Makefile.am
Hunk #1 succeeded at 127 (offset 1 line).
>>> libevent 2.0.22-stable Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/root/buildroot/output/build/libevent-2.0.22-stable -name $file); do cp
support/gnuconfig/$file $i; done; done
>>> libevent 2.0.22-stable Configuring
>>> libevent 2.0.22-stable Autoreconfiguring
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
Can't locate Thread/Queue.pm in @INC (@INC contains:
/root/buildroot/output/host/usr/share/automake-1.15
/root/buildroot/output/host/usr/lib/perl /usr/local/lib64/perl5
/usr/local/share/perl5 /usr/lib64/perl5/vendor_perl
/usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at
/root/buildroot/output/host/usr/bin/automake line 55.
BEGIN failed--compilation aborted at
/root/buildroot/output/host/usr/bin/automake line 58.
autoreconf: /root/buildroot/output/host/usr/bin/automake failed with exit
status: 2
make: ***
[/root/buildroot/output/build/libevent-2.0.22-stable/.stamp_configured] Error 2
[root at buildroot buildroot]#

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
