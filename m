From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 21:34:34 +0200
Subject: [Buildroot] [git commit] doc: update after gettext changes
Message-ID: <20120920195433.4E028996BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa8ba9608db7ffc2e05fb06ed678cbe6ea813e89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
