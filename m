From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Dec 2012 13:57:32 +0100
Subject: [Buildroot] [git commit] dstat: needs mmu
Message-ID: <20121221125857.407F19A407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5649176a485e1138ed3e42ebb7700255f6c93153
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because python needs MMU, fixes:
http://autobuild.buildroot.net/results/7bb46ed3ffb46741b7cb7e3edd33f4729409b2ef/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dstat/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 1439c8b..5b8df23 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DSTAT
 	bool "dstat"
 	depends on BR2_USE_WCHAR # python
+	depends on BR2_USE_MMU # python
 	select BR2_PACKAGE_PYTHON
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
