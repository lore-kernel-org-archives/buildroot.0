From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:42 +0200
Subject: [Buildroot] [PATCH v4 26/35] package/efl/libedje: remove package
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-27-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libedje is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: update Config.in to use libefl
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy      | 7 +++++++
 package/efl/Config.in | 1 -
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0fc78c7..e06c873 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_LIBEDJE
+	bool "libedje package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libedje package has been removed with the efl bump to 1.15.
+
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 0729e02..5a14192 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -22,7 +22,6 @@ source "package/efl/libefreet/Config.in"
 source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
-source "package/efl/libedje/Config.in"
 source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
 
-- 
2.4.3
