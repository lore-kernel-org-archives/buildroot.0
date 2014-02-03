From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2014 09:25:09 +0100
Subject: [Buildroot] [git commit] manual: Clarify wrapper and debug
Message-ID: <20140203083900.34F909C76B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bcb7e74be71990e7c88facd54d6b90d3d04d681
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Try to clarify how the wrapper passes arguments and why.
This is mainly because the output you can see when you build, does not
reflect what is invoked by the wrapper.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-toolchain.txt |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 31c9140..4f3fe23 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -17,9 +17,10 @@ generate it.
 It also requires to set the Buildroot settings according to the toolchain ones
 (see xref:external-toolchain-backend[]).
 
-When using an external toolchain, Buildroot generates a wrapper program, that
-passes the appropriate options (according to the configuration) to the
-external toolchain programs. In case you need to debug this wrapper, you can
+When using an external toolchain, Buildroot generates a wrapper program,
+that transparently passes the appropriate options (according to the
+configuration) to the external toolchain programs. In case you need to
+debug this wrapper to check exactly what arguments are passed, you can
 set the environment variable BR_DEBUG_WRAPPER to either one of:
 
 * +0+, empty or not set: no debug
