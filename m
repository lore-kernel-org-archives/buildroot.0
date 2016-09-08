From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Sep 2016 20:27:55 +0200
Subject: [Buildroot] [PATCH] glibc: fix MIPS and SPARC builds for glibc
	< 2.24 with recent binutils
In-Reply-To: <1473350850-40372-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 8 Sep 2016 17:07:30 +0100")
References: <1473350850-40372-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87y4325jro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

 > Backport two upstream patches to fix a build failure on MIPS and SPARC
 > architectures when using recent binutils versions. It appears that on
 > these architectures pt-vfork.S includes vfork.S (through the alpha
 > version of pt-vfork.S) and that the __vfork aliases are not
 > conditionalized on IS_IN (libc) like on other architectures. Therefore
 > the aliases are also wrongly included in libpthread.so.

 > The build failure looks like this:

 > /br/output/build/glibc-2.22/build/nptl/libpthread.so:(*IND*+0x0):
 > multiple definition of `vfork at GLIBC_2.0'
 > /br/output/build/glibc-2.22/build/nptl/libpthread.so::(.text+0xeea0):
 > first defined here

 > This problem was reported in Debian here:

 > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=827477

 > Upstream patches here:

 > https://sourceware.org/git/?p=glibc.git;a=commit;h=43c2948756bb6e144c7b871e827bba37d61ad3a3
 > https://sourceware.org/git/?p=glibc.git;a=commit;h=b87c1ec3fa398646f042a68f0ce0f7d09c1348c7

 > I have tweaked them a little bit in order to not patch the ChangeLog
 > file, otherwise it will fail.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
