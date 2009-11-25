From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Nov 2009 23:38:38 +0000 (UTC)
Subject: [Buildroot] [Bug 743] New: Add Transmission bit torrent option to
	buildroot
Message-ID: <bug-743-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=743

           Summary: Add Transmission bit torrent option to buildroot
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jasaw81 at yahoo.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=761)
 --> (https://bugs.busybox.net/attachment.cgi?id=761)
Files that add transmission package option to buildroot.

Transmission is a bit torrent client or daemon. Transmission-remote can be used
to control transmission daemon remotely.

Dependencies that may have to be updated: libcurl, libevent

I made up a few scripts to help setup a transmission home directory and only
start transmission when network interface is up.

I have only tested it with:
- libcurl with large file support enabled
- libevent version 1.4.11-stable

Just untar the attached tarball and patch the package/Config.in file.



--- ../../buildroot-2009.08/package/Config.in   2009-11-25 10:22:07.034052000
+1100
+++ Config.in   2009-11-19 16:03:06.897232000 +1100
@@ -216,6 +216,7 @@ source "package/thttpd/Config.in"
 source "package/tinyhttpd/Config.in"
 endif
 source "package/tn5250/Config.in"
+source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 #if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # ATTENTION! This was merged into busybox!


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
