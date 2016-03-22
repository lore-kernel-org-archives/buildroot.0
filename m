From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 22 Mar 2016 13:37:32 -0400
Subject: [Buildroot] [PATCH] erlang: bump to version 18.3
Message-ID: <1458668252-15146-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erlang/OTP 18.3 is a service release on the 18 track with mostly bug
fixes, but is does contain a number of new features and improvements as
well.

Some highlights of the release are:

  . New statistics info about runnable and active processes & ports.
    Call erlang:statistics with: total_run_queue_lengths |
    run_queue_lengths | total_active_tasks | active_tasks.

  . Time warp improvements: dbg:p/2 and erlang:trace/3 with
    monotonic_timestamp |strict_monotonic_timestamp.

  . Introduced a validation callback for heart.

  . The module overload in sasl has been deprecated.

  . ~90 contributions since 18.2

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang/erlang.hash | 4 ++--
 package/erlang/erlang.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index f6519af..c39c26e 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,3 +1,3 @@
 # md5 from http://www.erlang.org/download/MD5, sha256 locally computed
-md5	ebb226d51f89ec54cc83ce5d417ce55e	otp_src_18.2.1.tar.gz
-sha256	82d76ebfeeda5db64ea5b0f1a04aa0e9ac63380b278722e0e6052249bd3fe39a  otp_src_18.2.1.tar.gz
+md5	7e4ff32f97c36fb3dab736f8d481830b	otp_src_18.3.tar.gz
+sha256	fdab8129a1cb935db09f1832e3a7d511a4aeb2b9bb3602ca6a7ccb9730d5c9c3	otp_src_18.3.tar.gz
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 3732d44..ff4452f 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 18.2.1
+ERLANG_VERSION = 18.3
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
@@ -19,7 +19,7 @@ ERLANG_AUTORECONF = YES
 
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.8.1
+ERLANG_EI_VSN = 3.8.2
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
-- 
2.5.0
