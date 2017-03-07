From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Mar 2017 16:24:24 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] libwebsockets:
	cherry-pick upstream patch for v2.1.1
Message-ID: <20170307155609.7B8C981EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=052ae797324bbe652a14e38773dcf2953cace99a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This commit cherry-picks an upstream patch that fixes a compile error
that was introduced in v2.1.1

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f80fc852a3f9fc26fe522cf843b075da52c68dbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/libwebsockets.hash | 1 +
 package/libwebsockets/libwebsockets.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index df7221e..7976a69 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	96183cbdfcd6e6a3d9465e854a924b7bfde6c8c6d3384d6159ad797c2e823b4d  libwebsockets-v2.1.1.tar.gz
+sha256	49ae9f959394686d469f960951ece3ad1101655afe64df28ea5b1a61c1d124f0  f9f5a5760782b68fba190fb46d306f7c08f027c0.patch
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 983ffce..74b6b2b 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -12,6 +12,8 @@ LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
 
+LIBWEBSOCKETS_PATCH = https://github.com/warmcat/libwebsockets/commit/f9f5a5760782b68fba190fb46d306f7c08f027c0.patch
+
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
 # amount of pthread mutex code is built into the library.
