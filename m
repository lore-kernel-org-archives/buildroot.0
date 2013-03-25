From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 22:42:36 +0100
Subject: [Buildroot] [PATCH 2/2] vala: deprecate target package
In-Reply-To: <1364247756-31480-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364247756-31480-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364247756-31480-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vala generates C code from Vala code, and therefore requires a
compiler. Since we are deprecating the native compiler support on the
target, having vala on the target doesn't make sense.

Of course, we keep vala for the host, where compilation happens.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/vala/Config.in b/package/vala/Config.in
index e0d665c..805c770 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_VALA
 	bool "vala"
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-- 
1.7.9.5
