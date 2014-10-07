From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 00:11:57 +0200
Subject: [Buildroot] [PATCH] package/trinity: New package
In-Reply-To: <1412594507-48779-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 6 Oct 2014 12:21:47 +0100")
References: <1412594507-48779-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <874mvffs2a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Adding the Trinity Linux System call fuzz tester.
 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Thanks, but a quick test build with uClibc fails:

make[1]: Entering directory '/home/peko/source/buildroot/output/build/trinity-c02034ec08d951cde3429905e64afe450cbc47db'
  CC    arg-decoder.o
  CC    blockdevs.o
  CC    child.o
  CC    debug.o
  CC    devices.o
debug.c:5:22: fatal error: execinfo.h: No such file or directory
compilation terminated.
Makefile:96: recipe for target 'debug.o' failed
make[1]: *** [debug.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory '/home/peko/source/buildroot/output/build/trinity-c02034ec08d951cde3429905e64afe450cbc47db'

execinfo.h is only available if uClibc is built with
UCLIBC_HAS_BACKTRACE=y (which it isn't by default).

Perhaps the backtrace() stuff can get #ifdef'ed out if not available?

-- 
Bye, Peter Korsgaard
