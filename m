From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 6 Mar 2017 15:41:39 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: cherry-pick upstream patch
	for v2.1.1
In-Reply-To: <20170306143901.0cb1e1f6@free-electrons.com>
References: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
 <20170306091911.05fb09c2@free-electrons.com>
 <20170306104327.GC24367@airbook.vandijck-laurijssen.be>
 <20170306143901.0cb1e1f6@free-electrons.com>
Message-ID: <20170306144139.GA14390@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit cherry-picks an upstream patch that fixes a compile error
that was introduced in v2.1.1

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index df7221e..7976a69 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	96183cbdfcd6e6a3d9465e854a924b7bfde6c8c6d3384d6159ad797c2e823b4d  libwebsockets-v2.1.1.tar.gz
+sha256	49ae9f959394686d469f960951ece3ad1101655afe64df28ea5b1a61c1d124f0  f9f5a5760782b68fba190fb46d306f7c08f027c0.patch
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 983ffce..e2e6bb2 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -12,6 +12,9 @@ LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
 
+# patch specific for v2.1.1
+LIBWEBSOCKETS_PATCH = https://github.com/warmcat/libwebsockets/commit/f9f5a5760782b68fba190fb46d306f7c08f027c0.patch
+
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
 # amount of pthread mutex code is built into the library.
