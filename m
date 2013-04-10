From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Apr 2013 11:45:07 +0200
Subject: [Buildroot] [git commit] tinyhttpd: needs mmu
Message-ID: <20130410095123.8979F9B4F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d10c45e0c8e1a864ee678b7e3a84017384d950f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2a3b5ab3ef58443c1bf86df5498df2f145cd840c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tinyhttpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tinyhttpd/Config.in b/package/tinyhttpd/Config.in
index 5a6ee88..f7365af 100644
--- a/package/tinyhttpd/Config.in
+++ b/package/tinyhttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TINYHTTPD
 	bool "tinyhttpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A relatively simple webserver written as a school project. It is
 	  exceedingly simple, threaded and handles basic CGI scripts.
