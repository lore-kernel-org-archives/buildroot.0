From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Oct 2013 11:43:33 +0200
Subject: [Buildroot] [git commit] openssh: needs mmu
Message-ID: <20131007094613.8E7C89B3BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d3f2897f82c85d45c2f3d19e60875df35d4acea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 0c3d993..78cc615 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
