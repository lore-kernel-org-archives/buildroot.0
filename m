From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2014 08:57:04 +0100
Subject: [Buildroot] [PATCH] elfutils: disable for static builds
In-Reply-To: <1415184166-61950-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 5 Nov 2014 10:42:46 +0000")
References: <1415184166-61950-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87wq77wii7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Even when doing static builds, a shared library is built. This causes a
 > build failure under some circumstances, for instance when building for
 > MIPS + uClibc + static.

 > After asking upstream if it would be possible to add a configure option
 > to not build the shared library, the answer was that doing a static
 > build is not a good idea. Here is a small snippet of the conversation:

 > "Note that fully static builds are problematic.  elfutils uses dlopen to
 > open the EBL backends (the CPU-specific support snippets), so even if
 > you link statically, the final binaries are still considerably dynamic."

 > Related:
 >   https://lists.fedorahosted.org/pipermail/elfutils-devel/2014-November/004223.html

 > Fixes:
 >   http://autobuild.buildroot.net/results/691/6913f5af6519463fbed39ef37b6a40ecf6a67b54/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
