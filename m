From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Sep 2012 17:43:49 +0200
Subject: [Buildroot] [PATCH 06/12] doc: update after gettext changes
In-Reply-To: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1346600635-30946-7-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-gettext.txt |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index 1ed834e..e0df1a4 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -27,18 +27,14 @@ Therefore, Buildroot defines two configuration options:
 
 Therefore, packages that unconditionally need gettext should:
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+ and possibly
-  +select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT+, if libintl is
-  also needed
+* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+
 
 * Use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
   +DEPENDENCIES+ variable
 
 Packages that need gettext only when locale support is enabled should:
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+ and
-  possibly +select BR2_PACKAGE_LIBINTL if
-  BR2_NEEDS_GETTEXT_IF_LOCALE+, if libintl is also needed
+* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+
 
 * Use +$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)+ in the package
   +DEPENDENCIES+ variable
-- 
1.7.2.5
