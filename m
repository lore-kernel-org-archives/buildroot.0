From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:34:46 +0200
Subject: [Buildroot] [git commit] package/libstrophe: bump to version 0.10.0
Message-ID: <20200917202620.978C082602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e438d09f52401eddf280d888b219ada060f06479
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
  * Coding style has been unified
  * SCRAM-SHA-256 and SCRAM-SHA-512 support
  * c-ares support
  * LibreSSL support
  * Introduced global timed handlers that fire periodically regardless
    of connections status, such a handler can be used to implement
    deferred re-connection
  * examples/register implements XEP-0077
  * Fixed issue with IPv6 on Windows (#153)
  * Improved portability across systems such as Haiku, Windows
  * New API:
    - xmpp_stanza_get_child_by_name_and_ns()
    - xmpp_conn_is_connecting()
    - xmpp_conn_is_connected()
    - xmpp_conn_is_disconnected()
    - xmpp_stanza_new_from_string()
    - xmpp_stanza_add_child_ex()
    - xmpp_stanza_get_context()
    - xmpp_stanza_reply_error()
    - xmpp_global_timed_handler_add()
    - xmpp_global_timed_handler_delete()

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libstrophe/libstrophe.hash | 2 +-
 package/libstrophe/libstrophe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index 1e46a82bc9..5f3b098c89 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 8a3b79f62177ed59c01d4d4108357ff20bd933d53b845ee4e350d304c051a4fe  libstrophe-0.9.3.tar.gz
+sha256 8d804e4c74cea1133203cc95a59a88f700fbdaead076e7959b495d734dd7936d  libstrophe-0.10.0.tar.gz
 sha256 82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index d5434f5033..81fc1b9f97 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.9.3
+LIBSTROPHE_VERSION = 0.10.0
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 # Doesn't ship configure
