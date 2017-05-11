From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:16:18 +0200
Subject: [Buildroot] [git commit branch/next] erlang: bump version to 19.3
Message-ID: <20170511191630.A5B318287F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85dd8db43a684265edacc9a4afb0a68775412266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This change bumps the Erlang version from 18.3 to 19.3. Erlang 19.0 has
many improvements but introduces a few incompatible changes to Erlang
18.3. Details are at:

  http://erlang.org/download/otp_src_19.0.readme

The 19.x minor releases primarily contain bug fixes, optimizations and
other minor imporvements. Details are at:

  http://erlang.org/download/otp_src_19.1.readme
  http://erlang.org/download/otp_src_19.2.readme
  http://erlang.org/download/otp_src_19.3.readme

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.hash | 4 ++--
 package/erlang/erlang.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index c39c26e..dc12ccd 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,3 +1,3 @@
 # md5 from http://www.erlang.org/download/MD5, sha256 locally computed
-md5	7e4ff32f97c36fb3dab736f8d481830b	otp_src_18.3.tar.gz
-sha256	fdab8129a1cb935db09f1832e3a7d511a4aeb2b9bb3602ca6a7ccb9730d5c9c3	otp_src_18.3.tar.gz
+md5	a8c259ec47bf84e77510673e1b76b6db	otp_src_19.3.tar.gz
+sha256  fe4a00651db39b8542b04530a48d24b2f2e7e0b77cbe93d728c9f05325bdfe83	otp_src_19.3.tar.gz
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 364085c..0f04a84 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 18.3
+ERLANG_VERSION = 19.3
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
@@ -19,7 +19,7 @@ ERLANG_AUTORECONF = YES
 
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.8.2
+ERLANG_EI_VSN = 3.9.3
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
