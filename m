From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 23:36:03 +0200
Subject: [Buildroot] [PATCH] erlang: needs thread support
Message-ID: <1410471363-13293-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/1f3/1f313aee75328c27e260c55dbf7caa5d3d6a07d3/
  http://autobuild.buildroot.org/results/2f2/2f213d8cf6f828a68a2f36bb95564b8db043e7a2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 2ee8515..06833b9 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,6 +1,10 @@
+comment "erlang needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
-- 
2.0.0
