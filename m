From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:57:52 +0200
Subject: [Buildroot] [git commit branch/next] erlang-p1-tls: bump to version
	1.0.11
Message-ID: <20170530220258.4511C82867@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd8580fdd5d2d96292cfd33a2650663be1fe85d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License changed to Apache-2.0.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-tls/Config.in          |  1 +
 package/erlang-p1-tls/erlang-p1-tls.hash |  2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk   | 10 +++++-----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
index 0df3348..a684fbb 100644
--- a/package/erlang-p1-tls/Config.in
+++ b/package/erlang-p1-tls/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG_P1_TLS
 	bool "erlang-p1-tls"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Erlang interface to OpenSSL
diff --git a/package/erlang-p1-tls/erlang-p1-tls.hash b/package/erlang-p1-tls/erlang-p1-tls.hash
index fd8d801..eb707f1 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.hash
+++ b/package/erlang-p1-tls/erlang-p1-tls.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8e8b848a112ff6bf146df34b4f6bc50160a8858a18499a7a6124193b37237a40 erlang-p1-tls-1.0.0.tar.gz
+sha256 c42237e5dd231c558b48633788a0e9ca55b4f3b5bc4692107fee031a8f91cda3 erlang-p1-tls-1.0.11.tar.gz
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index b2451df..63d0112 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-ERLANG_P1_TLS_VERSION = 1.0.0
-ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
-ERLANG_P1_TLS_LICENSE = GPL-2.0+ with OpenSSL exception
-ERLANG_P1_TLS_LICENSE_FILES = COPYING
+ERLANG_P1_TLS_VERSION = 1.0.11
+ERLANG_P1_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_P1_TLS_VERSION))
+ERLANG_P1_TLS_LICENSE = Apache-2.0
+ERLANG_P1_TLS_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_TLS_INSTALL_STAGING = YES
-ERLANG_P1_TLS_DEPENDENCIES = openssl
+ERLANG_P1_TLS_DEPENDENCIES = openssl erlang-p1-utils
 
 $(eval $(rebar-package))
