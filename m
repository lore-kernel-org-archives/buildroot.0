From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Aug 2013 16:17:45 +0200
Subject: [Buildroot] [PATCH] gcc-final: Drop obsolete code for handling
	lib64
In-Reply-To: <1377687378-19688-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Wed, 28 Aug 2013 11:56:18 +0100")
References: <1377687378-19688-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <87txi9hpbq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> Since 5628776c4a4d29d0715633ea463b64cc19e19c5a
 Markos> "toolchain-external: fix lib64 symlinks"

 Markos> lib64 is a symlink to lib so there is no reason to copy the libraries
 Markos> to lib64 anymore. This fixes multiple building problems
 Markos> for buildroot toolchains:

 Markos> [...]
 Markos> mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libuClibc-0.9.33.2.so'
 Markos> and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libuClibc-0.9.33.2.so'
 Markos> are the same file
 Markos> mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libutil-0.9.33.2.so'
 Markos> and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libutil-0.9.33.2.so'
 Markos> are the same file
 Markos> mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libutil.so.0'
 Markos> and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libutil.so.0'
 Markos> are the same file
 Markos> rmdir: failed to remove
 Markos> 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64': Not a directory
 Markos> [...]

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
