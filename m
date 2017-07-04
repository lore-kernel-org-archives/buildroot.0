From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:37:42 +0200
Subject: [Buildroot] [git commit] CHANGES: add details on the gettext revamp
Message-ID: <20170704233520.DE6BB80420@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fce205673945c40c1ce3b0121eb6665348f371f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gettext revamp has some user-visible changes, so this commit
updates the CHANGES file to document them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 CHANGES | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/CHANGES b/CHANGES
index b284287..105c931 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
+2017.08-rc1, To be released
+
+	Major revamp of the gettext handling, with user-visible
+	effect:
+
+	  - prior to this revamp, when BR2_ENABLE_LOCALE=y, each
+	    package could decide to enable or not NLS support. When
+	    BR2_ENABLE_LOCALE was disabled, NLS support was forced off
+	    by passing --disable-nls to packages.
+
+	  - after this revamp, a new BR2_SYSTEM_ENABLE_NLS option
+            controls whether NLS support should be enabled or not in
+            packages. This option defaults to disabled, which means
+            that now, NLS support is by default disabled in all
+            packages.
+
+	Therefore, if you need NLS support in packages, you must now
+	explicitly enable the BR2_SYSTEM_ENABLE_NLS option.
+
 2017.05.1, Released July 4th, 2017
 
 	Important / security related fixes.
