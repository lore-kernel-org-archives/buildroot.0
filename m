From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 11:28:35 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: disable tirpc
	authdes_create tests
Message-ID: <20160201224714.2EEA87F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1ed5bdccf5dd87d36876f3444b821e3992f106e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d1d735a1480f0f37a5996cb57c5a35ca2c3c3d90 disables the tests
    tirpc_auth_authdes_seccreate
but not those in
    tirpc_auth_authdes_create
while these also fail on targets without native RPC support.

Update the added patch to exclude those tests too.

Fixes:
http://autobuild.buildroot.net/results/3a2/3a2b141d90b28a2954fa0ad3104cba81d648d2a3/
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...c-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch b/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch
index 6ab9d13..f69b364 100644
--- a/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch
+++ b/package/ltp-testsuite/0002-rpc-tirpc-disable-tirpc_auth_authdes_seccreate-tests.patch
@@ -1,4 +1,4 @@
-rpc-tirpc: disable tirpc_auth_authdes_seccreate tests
+rpc-tirpc: disable tirpc_auth_authdes_*create tests
 
 Due to Buildroot patch 0007-Disable-DES-authentification-support.patch on
 libtirpc, this library is built without method authdes_create. Any code
@@ -10,19 +10,20 @@ just disable the problematic tests.
 Upstream-status: not applicable
 Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 ---
- testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile | 3 +++
- 1 file changed, 3 insertions(+)
+ testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
 
 diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-index 45bc8a6..6c4089e 100644
+index 45bc8a6..c04a088 100644
 --- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
 +++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-@@ -19,4 +19,7 @@
+@@ -19,4 +19,8 @@
  top_srcdir		?= ../../../../../../..
  
  include	$(top_srcdir)/include/mk/env_pre.mk
 +
-+FILTER_OUT_DIRS += tirpc_auth_authdes_seccreate
++FILTER_OUT_DIRS += tirpc_auth_authdes_seccreate \
++		   tirpc_auth_authdes_create
 +
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
 -- 
