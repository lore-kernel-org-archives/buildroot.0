From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:36:32 +0200
Subject: [Buildroot] [PATCH] package/python3: fix configure issue for
 musl/uclibc GCC 8+ toolchains on powerpc
In-Reply-To: <20190802144945.22971-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 2 Aug 2019 16:49:44 +0200")
References: <20190802144945.22971-1-peter@korsgaard.com>
Message-ID: <87imqegzlb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/cb4/cb49c539501342e45cbe5ade82e588fcdf51f05b

 > GCC commit 6834b83784dcf0364eb820e8 (multiarch support for non-glibc linux
 > systems), which is part of GCC 8+, changed the multiarch logic to use
 > $arch-linux-musl / $arch-linux-uclibc rather than $arch-linux-gnu.

 > This then causes the python3 configure script to error out:

 > checking for the platform triplet based on compiler characteristics... powerpc-linux-gnu
 > configure: error: internal configure error for the platform triplet, please file a bug report

 > http://autobuild.buildroot.net/results/cb4/cb49c539501342e45cbe5ade82e588fcdf51f05b

 > As it requires that the --print-multiarch output (if not empty) matches the
 > deduced triplet (which always uses -linux-gnu).

 > It isn't quite clear why --print-multiarch returns something for a
 > non-multiarch toolchain on some architectures (E.G.  PowerPC), but as a
 > workaround, add a patch to rewrite the --print-multiarch output to match
 > older GCC versions to keep the configure script happy.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
