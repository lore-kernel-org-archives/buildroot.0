From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:18:31 +0100
Subject: [Buildroot] [git commit] glibc: disable 2.20 for sparc
Message-ID: <20150317221840.2304D8182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbf7da63188d461e738dcfcaa436b84baa23143c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable glibc 2.20 for sparc, it's broken, that leaves 2.21 as the
default in this case.
Fixes bug #7941.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 1dd22c9..53cd958 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -34,6 +34,8 @@ choice
 
 config BR2_GLIBC_VERSION_2_20
 	depends on !BR2_nios2
+	# Broken see https://bugs.busybox.net/show_bug.cgi?id=7941
+	depends on !BR2_sparc
 	bool "2.20"
 
 config BR2_GLIBC_VERSION_2_21
