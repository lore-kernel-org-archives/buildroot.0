From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:20 +0200
Subject: [Buildroot] [PATCH 100/100] CHANGES: add details on the gettext
	revamp
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-101-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gettext revamp has some user-visible changes, so this commit
updates the CHANGES file to document them.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/CHANGES b/CHANGES
index cf4b22b..7b98e84 100644
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
 2017.05, Released May 31st, 2017
 
 	Minor fixes.
-- 
2.9.4
