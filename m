From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Dec 2012 23:38:34 +0100
Subject: [Buildroot] [git commit] cdrkit: needs mmu
Message-ID: <20121226224224.E18DE9A43C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eca5721813e66d034fc9e45a83ca202dbccebd72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
autobuild.buildroot.net/results/10129d06088149a5ce9bd9762b5a17e5d89eec34

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cdrkit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index 7ff50f3..dfe3811 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CDRKIT
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_LIBCAP
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork
 	bool "cdrkit"
 	help
 	  cdrkit is a suite of programs for recording CDs and DVDs,
