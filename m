From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:52 -0000
Subject: [Buildroot] [git commit branch/next] gob2: needs MMU
Message-ID: <20120802195248.CC2F68E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9741fd7031c648352b6acabfac4066f5482499fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

m4 needs MMU, so does bison, and so does gob2 which uses bison.
Fixes build failure:
http://autobuild.buildroot.net/results/f942b4ac770f3c7b27c42214af5bcec49f687da1/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gob2/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 562ac31..cbe30d6 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GOB2
 	bool "gob2"
 	depends on BR2_USE_WCHAR # glib2
+	# m4 uses fork(), so does bison then
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
