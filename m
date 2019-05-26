From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 13:51:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix build of 7.12.1 with
 glibc 2.29
In-Reply-To: <20190513212918.16335-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 May 2019 23:29:18 +0200")
References: <20190513212918.16335-1-fontaine.fabrice@gmail.com>
Message-ID: <874l5hl9hy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Between glibc 2.28 and glibc 2.29, commit
 > 89983cb37c9319806a551e8fe9f3a11ff8f973e1 ("Update siginfo constants
 > from Linux kernel (bug 21286)") was merged. This commit moved the
 > TRAP_HWBKPT definition from an IA64-specific header to an
 > architecture-agnostic header.

 > This change exhibited a build issue that until then was only visible
 > on IA64 (which Buildroot does not support). This Buildroot commit
 > backports a patch from gdb upstream (which is in gdb since 8.2) which
 > mentions IA64 because it was originally meant to fix only the
 > IA64-related issue. But the glibc change, this change has become
 > visible on all architectures.

 > Fixes:
 >  - No autobuilder failures

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
