From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 May 2013 13:05:15 +0200
Subject: [Buildroot] [git commit] crda: needs threads
Message-ID: <20130516110701.6EC829A0F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a58963ab4a5d29ec75a557f9569a5ebd3f88671
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because libnl needs threads, fixes:
http://autobuild.buildroot.net/results/8e32f222ddeba262ee2471d22e1c6a8afbf241c2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/crda/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index 66baf14..539a5c7 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRDA
 	bool "crda"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
 	# regdb is a runtime dependency
@@ -13,3 +14,6 @@ config BR2_PACKAGE_CRDA
 	  may operate within for a given location.
 
 	  http://linuxwireless.org/en/developers/Regulatory/CRDA
+
+comment "crda requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
