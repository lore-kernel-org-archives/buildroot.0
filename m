From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Feb 2015 09:20:29 +0100
Subject: [Buildroot] [git commit] legacy: add missing option for util-linux'
	wdctl
Message-ID: <20150208204619.EC9BE805FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d702aca30d4b0314bc503c9015becb132d380bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 349c9c7 (package/util-linux: add more tool select options), the
util-linux' wdctl option was renamed, but a entry in the legacy menu was
no added.

Add this now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0f1b202..8d99e24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_WDCTL
+	bool "util-linux' wdctl option has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_UTIL_LINUX_WDCTL
+	help
+	  util-linux' wdctl option has been renamed to BR2_PACKAGE_UTIL_LINUX_WDCTL
+	  to be aligned with how the other options are named.
+
 config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 	bool "rpm's bzip2 payloads option has been removed"
 	select BR2_LEGACY
