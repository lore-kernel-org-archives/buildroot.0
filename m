From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Oct 2015 22:29:44 +0200
Subject: [Buildroot] [PATCH v4 28/35] package/efl/libeio: remove package
In-Reply-To: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
References: <1445200191-18404-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445200191-18404-29-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libeio is now available in efl package.

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
index d0e2ca1..b0de4d3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_LIBEIO
+	bool "libeio package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libeio package has been removed with the efl bump to 1.15.
+
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 31dc066..9d258eb 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -19,7 +19,6 @@ source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libefl/Config.in"
 source "package/efl/libefreet/Config.in"
-source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
-- 
2.4.3
