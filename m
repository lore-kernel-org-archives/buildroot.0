From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 18:59:49 +0100
Subject: [Buildroot] [PATCH v2] perf: append endianness argument to ld
	when building for MIPS
In-Reply-To: <1456136565-6167-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 22 Feb 2016 10:22:45 +0000")
References: <1456136565-6167-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87a8mmrq3u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > We need to pass an argument to ld for setting the endianness when
 > building it for MIPS architecture, otherwise the default one will always
 > be used (which is big endian) and the compilation for little endian will
 > always fail showing an error like this one:

 > LD    foo.o
 > mips-linux-gnu-ld: foo.o: compiled for a little endian system and target
 > is big endian

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 > Changes v1 -> v2:
 > - Simplify the logic of the ifeq block.

Committed, thanks.

-- 
Bye, Peter Korsgaard
