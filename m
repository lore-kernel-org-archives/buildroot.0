From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Aug 2015 17:51:41 +0200
Subject: [Buildroot] [PATCH] package: add comment about ipkg/opkg/rpm
Message-ID: <1440085901-24479-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Too often the question is raised, that ipkg, opkg and rpm do not work,
and users complain they can not install packages.

Even though we do have a clear and clearly explained section in our
manual, people do not read it (when will users read manuals? sigh...).

So, add a big fat comment about ipkg/opkg/rpm, that Buildroot does not
generate binary packages and does not provide any package database for
any of those package manager.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Please note the little dirty trick to avoid kconfig eating up all spaces
on empty lines: the first space in those is U+00A0 (NO-BREAK SPACE). It
differs from the legacy menu, where we use a single '*' to avoid that.
---
 package/Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..c32c989 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1371,6 +1371,19 @@ endif
 endmenu
 
 menu "Package managers"
+comment "------------------------------------------------------------------------"
+comment "Please note:                                                            "
+comment "- Buildroot does *not* generate binary packages,                        "
+comment "- Buildroot does *not* install any package database.                    "
+# First space is U+00A0 (NO-BREAK SPACE), otherwise kconfig eats
+# up all spaces:
+comment "?                                                                       "
+comment "It is up to you to provide those by yourself if you want                "
+comment "to use any of those package managers.                                   "
+comment "?                                                                       "
+comment "See the manual:                                                         "
+comment "http://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages"
+comment "------------------------------------------------------------------------"
 	source "package/ipkg/Config.in"
 	source "package/opkg/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
1.9.1
