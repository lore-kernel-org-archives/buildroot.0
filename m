From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Jan 2010 19:01:02 +0000 (UTC)
Subject: [Buildroot] [Bug 851] New: Add option to specify --sysroot value
 for external toolchain
Message-ID: <bug-851-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851

           Summary: Add option to specify --sysroot value for external
                    toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=887)
 --> (https://bugs.busybox.net/attachment.cgi?id=887)
Patch to allow use of relocated external toolchains that require a --sysroot
option

The current support for external toolchains assumes that the
external toolchain supports but does not require that a sysroot
value be passed when invoking the compiler, linker, etc.

This is inconvenient and overly restrictive for a couple
reasons:

  * You might want to be able to switch back and forth between
    different toolchains.  Building the toolchains with unique
    install paths is painful.

  * Developers want to be able to do development in "isolated"
    non-system directories without having to put the external
    toolchain in a global, hard-wired location -- a location
    that might be in use by a different project for a different
    version/flavor of the toolchain.

The attached patch adds a boolean config option that tells
buildroot that the external toolchain requires a sysroot value.
IOW, the the sysroot value reported by "gcc -v" is not correct.

It also adds a configuration variable that specifies the
correct sysroot value for the external toolchain. This value
defaults to an appropriate value for the already-specified
location of the sysroot toolchain.  In most cases, setting the
boolean BR2_TOOLCHAIN_EXTERNAL_NEEDS_SYSROOT will be
sufficient.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
