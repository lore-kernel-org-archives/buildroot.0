From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 May 2019 10:54:40 +0200
Subject: [Buildroot] [PATCH] package/tpm2-totp: fix error due to
 variable used uninitialized
In-Reply-To: <20190526232433.31654-1-unixmania@gmail.com>
 (unixmania@gmail.com's message of "Sun, 26 May 2019 20:24:33 -0300")
References: <20190526232433.31654-1-unixmania@gmail.com>
Message-ID: <87lfysjmzz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Some inline declarations of strtok_r (specifically in Sourcery CodeBench
 > Lite 2016.11-19) contain code where an '__s' local variable can be used
 > uninitialized.

 > When GCC expands that declaration in tpm2-totp, __s becomes an alias to
 > a variable which fact is not initialized, but this is not relevant since
 > the execution path leading to the uninitialized use is never followed.

 > Anyway, apply a patch already submitted upstream to fix the compilation
 > error.

 > Upstream bug report:
 >   https://github.com/tpm2-software/tpm2-totp/issues/32

 > Fixes:
 >   http://autobuild.buildroot.net/results/5693a35e4d6bc76a1f46fe0e217abc49f7188aad/

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Great, I also just started looking at the issue - Committed, thanks.

-- 
Bye, Peter Korsgaard
