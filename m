From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Dec 2010 13:44:44 +0000 (UTC)
Subject: [Buildroot] [Bug 2881] New: Can't build project statically with
 external toolchain
Message-ID: <bug-2881-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2881

           Summary: Can't build project statically with external toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: serj.kalichev at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2749
  --> https://bugs.busybox.net/attachment.cgi?id=2749
Don't copy shared libraries to the target dir if BR2_PREFER_STATIC_LIB defined

Hello

Buildroot version: 2010.11

I tried to build minimal busybox-only project for using as initramfs. I use
external buildroot toolchain. The buildroot copy the .so libraries from
external toolchain to the target dir unconditionally. But I build busybox
statically and don't need shared libraries (the size of resulted image is too
big with unneeded libraries).

The attached patch use BR2_PREFER_STATIC_LIB to find out if the project prefer
static linking and if the static linking is preferred don't copy shared
libraries to the target dir.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
