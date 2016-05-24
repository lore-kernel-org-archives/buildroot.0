From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 13:16:29 +0200
Subject: [Buildroot] [PATCH] valgrind: disable for MIPS soft-float
In-Reply-To: <1464003111-59011-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 23 May 2016 12:31:51 +0100")
References: <1464003111-59011-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87h9dnd7ua.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > As stated here [1], recent changes on the MIPS binutils sources have
 > made it necessary for GCC to pass the -msoft-float to the assembler. Due
 > to that, valgrind fails to build for MIPS soft-float when using a
 > version of binutils >= 2.25 because its using some hard-float
 > instructions.

 > However, we cannot just disable it for the soft-float and binutils >=
 > 2.25 combination since external toolchains don't provide information
 > about the binutils version they use. So, instead, we simply disable it
 > for soft-float.

 > 1: https://gcc.gnu.org/ml/gcc-patches/2014-08/msg00905.html

 > Fixes:
 >   http://autobuild.buildroot.net/results/5f5/5f576c7f8d56058a19ed0e7ff4b1ec620bcafb65/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
