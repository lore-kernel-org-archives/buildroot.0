From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:57:52 +0200
Subject: [Buildroot] [git commit] erlang-p1-stun: bump to version 1.0.10
Message-ID: <20170601202859.A6C27818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a42eef42a5a3bd826ee701e3221b80e91415fee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License changed to Apache-2.0.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-remove-dependencies-from-rebar-config.patch     | 16 ++++++++++++++++
 package/erlang-p1-stun/erlang-p1-stun.hash               |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk                 |  6 +++---
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
new file mode 100644
index 0000000..3010135
--- /dev/null
+++ b/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
@@ -0,0 +1,16 @@
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+
+diff --git a/rebar.config b/rebar.config
+index 94ee830..d0af863 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -22,9 +22,6 @@
+
+ {erl_opts, [debug_info, {i, "include"}]}.
+
+-{deps, [{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.11"}}},
+-	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.7"}}}]}.
+-
+ {cover_enabled, true}.
+ {cover_export_enabled, true}.
diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-p1-stun/erlang-p1-stun.hash
index be56608..893bc30 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-p1-stun/erlang-p1-stun.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ca33833f4b6ef70a7628e6f3697d15cb4e26d32ef4e5a31bbddee86cabe19c50 erlang-p1-stun-0.9.0.tar.gz
+sha256 75aac56fa770b3b4ea2d32e63706d2b8d56f8e0db54243acffa7448f4256864e erlang-p1-stun-1.0.10.tar.gz
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
index f9056f5..5116c15 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_STUN_VERSION = 0.9.0
+ERLANG_P1_STUN_VERSION = 1.0.10
 ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
-ERLANG_P1_STUN_LICENSE = GPL-2.0+
-ERLANG_P1_STUN_LICENSE_FILES = COPYING
+ERLANG_P1_STUN_LICENSE = Apache-2.0
+ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
 ERLANG_P1_STUN_INSTALL_STAGING = YES
 
