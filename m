From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Oct 2014 18:19:11 +0000 (UTC)
Subject: [Buildroot] [Bug 7562] New: musl buildroot-toolchain and
 BR2_MIPS_SOFT_FLOAT break
Message-ID: <bug-7562-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7562

           Summary: musl buildroot-toolchain and BR2_MIPS_SOFT_FLOAT break
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex+buildroot at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I use the following settings:

BR2_mipsel=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_MIPS_SOFT_FLOAT=y

Even trying to run busybox fails as ld-musl-mipsel.so.1 does not exist.  Some
digging around I found that ld-musl-mipsel-sf.so.1 does, I am guessing 'sf'
stands for "soft float".

To workaround the problem, I slipped into my post-build.sh script the
following:
----
ln -f -s /lib/libc.so "$1/lib/ld-musl-mipsel.so.1"
----

That gets things working again.  Not should how this should actually be fixed,
otherwise I would submit a patch.

Let me know if you need anything from me to help get this fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
