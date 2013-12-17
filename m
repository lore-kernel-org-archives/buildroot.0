From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Dec 2013 20:44:22 +0100
Subject: [Buildroot] [PATCH v3] sawman: Link using gcc instead of ld
In-Reply-To: <1387297332-28286-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 17 Dec 2013 16:22:12 +0000")
References: <1387297332-28286-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <8761qnp8ix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Using ld may cause a link failure due to using the default emulation
 > linker which is configured when building the linker in binutils.  Using
 > gcc instead will pass the appropriate -m value because the compiler
 > knows the ABI you are using.

 > Here is an example of the failure:

 > ld: .libs/libdirectfbwm_sawman.a.tmp/sawman_wm.o: ABI is incompatible
 > with that of the selected emulation
 > ld: failed to merge target specific data of file
 > .libs/libdirectfbwm_sawman.a.tmp/sawman_wm.o
 > ld: Attempt to do relocatable link with elf64-tradbigmips input and
 > elf32-tradbigmips output
 > ld: .libs/libdirectfbwm_sawman.a.tmp/sawman_wm.o: file class ELFCLASS64
 > incompatible with ELFCLASS32
 > ld: final link failed: File in wrong format

 > Fixes:

 >    http://autobuild.buildroot.net/results/e4b/e4b77681a44626efa2a44627604630697e785086/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
