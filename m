From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:35:52 +0100
Subject: [Buildroot] [git commit] strongswan: only show comment if applicable
Message-ID: <20140311223920.6E4919BEA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4db797d5422eaef35ce2709b9662f9e08f0208be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strongswan needs USE_MMU, so only show comment if that is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/strongswan/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 0daedda..d2cadf3 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -1,4 +1,5 @@
 comment "strongswan needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 menuconfig BR2_PACKAGE_STRONGSWAN
