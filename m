From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 21:11:52 +0200
Subject: [Buildroot] [PATCH v2 5/5] toolchainfile.cmake.in: do not force
	the CMAKE_{C, CXX}_FLAGS to the cache
In-Reply-To: <1408653920-18954-6-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 21 Aug 2014 22:45:20 +0200")
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
 <1408653920-18954-6-git-send-email-s.martin49@gmail.com>
Message-ID: <87wq8nv9tz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Fix #7280 [1]
 > When the FORCE option is passed to the set command, the variable is
 > added/updated in the CMake cache every single time CMake processes this
 > command.

 > Because the toolchainfile.cmake prepends architecture/toolchain flags
 > to the CMAKE_{C,CXX}_FLAGS, this makes the CFLAGS being updated in the
 > generated Makefiles each time one reconfigures its project. So it
 > forces the compilation of everything, even when nothing has changed.

 > [1] https://bugs.busybox.net/show_bug.cgi?id=7280

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 > Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > (tested the SimpleApp reproduction scenario described in the bug report)

Committed, thanks.

-- 
Bye, Peter Korsgaard
