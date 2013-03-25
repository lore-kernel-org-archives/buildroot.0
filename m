From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 23:36:31 +0100
Subject: [Buildroot] [git commit] vala: deprecate target package
Message-ID: <20130325225558.1186D9B2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d26c729845a9e04e871f88878fa3916c7ab272b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Vala generates C code from Vala code, and therefore requires a
compiler. Since we are deprecating the native compiler support on the
target, having vala on the target doesn't make sense.

Of course, we keep vala for the host, where compilation happens.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/vala/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
