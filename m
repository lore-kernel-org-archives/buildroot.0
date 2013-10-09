From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:21:28 +0200
Subject: [Buildroot] [git commit] netatalk: needs mmu
Message-ID: <20131009202220.1807F9B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee35a27e2207f1f82cf866172718a418088646f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 5c676e9..9bf0515 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBEVENT
