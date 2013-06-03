From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 16:37:38 +0200
Subject: [Buildroot] [git commit] aespipe: needs mmu
Message-ID: <20130603143944.EDDB79A893@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e1ec378b32486c27bdd69589a493ed79dac2708
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9f3/9f3f85a024791cdc6b10e3e40cf41707eb074447/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/aespipe/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/aespipe/Config.in b/package/aespipe/Config.in
index ccc94c2..df99523 100644
--- a/package/aespipe/Config.in
+++ b/package/aespipe/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AESPIPE
 	bool "aespipe"
+	depends on BR2_USE_MMU # fork()
 	help
 	  aespipe program is AES encrypting or decrypting pipe. It reads from
 	  standard input and writes to standard output. It can be used to
