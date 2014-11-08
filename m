From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 22:16:04 +0100
Subject: [Buildroot] [PATCH 2/2] libiscsi: only build the test tool and
	ld-iscsi if we have shared libs
In-Reply-To: <1415103896-64469-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 4 Nov 2014 12:24:56 +0000")
References: <1415103896-64469-1-git-send-email-Vincent.Riera@imgtec.com>
 <1415103896-64469-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <878ujltmuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Backporting an upstream patch to fix a failure when doing a static
 > build:

 > /br/output/host/usr/bin/mipsel-ctng-linux-uclibc-gcc -shared -o
 > ld_iscsi.so ld_iscsi.o -ldl
 > /br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld:
 > ld_iscsi.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be
 > used when making a shared object; recompile with -fPIC
 > ld_iscsi.o: could not read symbols: Bad value
 > collect2: error: ld returned 1 exit status

 > Upstream commit:
 >   https://github.com/sahlberg/libiscsi/commit/3d6c2be3428d88682cecfa2a4ad172aaacffb318

 > Fixes:
 >   http://autobuild.buildroot.net/results/7a9/7a9caf1f4080c2c4b04ee3b13c1240f475a22ea7/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
