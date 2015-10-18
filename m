From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:46 +0200
Subject: [Buildroot] [PATCH v4 30/35] package/efl/libedbus: remove package
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-31-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libedbus is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: todo
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy      | 7 +++++++
 package/efl/Config.in | 1 -
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7592d71..5a7e7c8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_LIBEDBUS
+	bool "libedbus package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libedbus package has been removed with the efl bump to 1.15.
+
 config BR2_PACKAGE_LIBEFREET
 	bool "libefreet package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index ba71705..3092c8f 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -20,7 +20,6 @@ source "package/efl/libeet/Config.in"
 source "package/efl/libefl/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libelementary/Config.in"
-source "package/efl/libedbus/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
-- 
2.4.3
