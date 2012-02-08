From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 23:40:20 +0100
Subject: [Buildroot] [git commit] dependencies.sh: fix host g++ check when
	ccache is used
Message-ID: <20120208230356.CBEEF90A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7100a2cc337976b1a88a393881402a9590d42f2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for gcc.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/dependencies/dependencies.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 2b9c0b3..c47ffcf 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -101,7 +101,7 @@ if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ]
 fi;
 
 # check for host CXX
-CXXCOMPILER=$(which $HOSTCXX 2> /dev/null)
+CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
