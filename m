From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 21:53:46 +0200
Subject: [Buildroot] [git commit] erlang: needs thread support
Message-ID: <20140913200105.3F7C39CF0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=047cb1a46b142e391f5f98c40c77ca9959a4cd6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/1f3/1f313aee75328c27e260c55dbf7caa5d3d6a07d3/
  http://autobuild.buildroot.org/results/2f2/2f213d8cf6f828a68a2f36bb95564b8db043e7a2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
