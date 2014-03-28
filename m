From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2014 09:55:49 +0100
Subject: [Buildroot] [PATCH 1/2] slang: fix linking issue
In-Reply-To: <1395961593-9826-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Fri, 28 Mar 2014 00:06:32 +0100")
References: <1395961593-9826-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87zjkag0ru.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > The installation location of the slang library
 > does not take into account the DESTDIR directory.
 > So SLANG_INST_LIB is initialized with -L/usr/lib/
 > and slang may be linked with host's libdl.so (if any)
 > Therefore, we have to pass correct installation paths.

 > Fixes:
 > http://autobuild.buildroot.net/results/df4/df435d9cebbdc84b3581ba258b618123570dde8b/

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

The real problem is that the slang build system gets confused and
rebuilds slsh even though it has just built it in the build step (called
slsh_exe for some reason though).

But ok, I tried fiddling a bit with Makefile.in, but also didn't manage
to fix it - So committed, thanks.

-- 
Bye, Peter Korsgaard
