From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 23:13:25 +0200
Subject: [Buildroot] [git commit] package/kvazaar: needs threads
Message-ID: <20170620211259.363B381E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79c7873b64aff13a924dc61ff021eefa835d5be9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/6e1eabd691b8674f61898bc0fe734208d226f965/

Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvazaar/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
index 3377145..06ab9ac 100644
--- a/package/kvazaar/Config.in
+++ b/package/kvazaar/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_KVAZAAR
 	bool "kvazaar"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  An open-source HEVC encoder licensed under LGPLv2.1
 
 	  https://github.com/ultravideo/kvazaar
+
+comment "kvazaar needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
