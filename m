From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Dec 2012 07:49:18 -0300
Subject: [Buildroot] [PATCH 1/2] cdrkit: needs mmu
Message-ID: <1356518959-30055-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
autobuild.buildroot.net/results/10129d06088149a5ce9bd9762b5a17e5d89eec34

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
