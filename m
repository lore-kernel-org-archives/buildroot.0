From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 18:01:44 +0100
Subject: [Buildroot] [git commit] ding-libs: fix Config.in dependency logic
Message-ID: <20141231170156.91966807F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7e0f3a78192425891745aafe93b23362bc70527
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ding-libs/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index bb4fa24..6069ed9 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DING_LIBS
 	bool "ding-libs"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR if BR2_NEEDS_GETTEXT
+	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT
 	help
 	  The ding-libs packages contain a set of libraries used by
 	  the System Security Services Daemon (SSSD) and other
