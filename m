From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Oct 2009 13:18:05 +0000 (UTC)
Subject: [Buildroot] [Bug 645] New: allow to build nbd-server with NBD
	package
Message-ID: <bug-645-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=645

           Summary: allow to build nbd-server with NBD package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: vincent.palatin_buildroot at m4x.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=681)
 --> (https://bugs.busybox.net/attachment.cgi?id=681)
nbd-server binary build

At the moment, the NBD package can only build the "nbd-client" binary.
The attached patch adds the ability to build "nbd-server" binary (ie the
userspace daemon used to serve block to a remote client)
it can activate client, server or both.

It includes 2 patches for nbd-server source code :
- remove SUSv3 deprecated function "index()"
- fix read function usage when -EAGAIN occurs (same fix as in nbd-server debian
package)

I have tested this on an ARM target.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
