From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:41:44 +0200
Subject: [Buildroot] [git commit] minidlna: do not select
	BR2_PACKAGE_GETTEXT_TOOLS
Message-ID: <20140609134342.283B79CF7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=078470ac5839f4fde59f6ecb67320216d4f2383b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9ff640ae30ca588228030faf2c6fd13af292cb66 ("minidlna: needs
gettext and host-gettext tools if locale is enabled") modified the
minidlna package to fix gettext related issues. As part of this patch,
a select of BR2_PACKAGE_GETTEXT_TOOLS was added, which according to
the commit title is used to have host-gettext tools installed.

However, this is not what this option is about: this option is about
having gettext tools installed on the target.

Since this is not what minidlna needs, and we anyway plan to remove
this BR2_PACKAGE_GETTEXT_TOOLS option, this commit removes this
incorrect select statement.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/minidlna/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 4a46b0c..5c5306d 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBJPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_GETTEXT_TOOLS if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
