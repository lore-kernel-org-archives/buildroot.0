From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 10:35:56 +0200
Subject: [Buildroot] [git commit] gettext: allow building when
	BR2_NEEDS_GETTEXT is not selected
Message-ID: <20140818084325.BEDE69D49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bc3bca6d85bcdaa1abc582eab5e95274896fece
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, we thought that gettext was only needed for the target for
uClibc toolchains, to provide the gettext functions that are normally
provided directly by glibc.

However, the gettext runtime actually does more than providing the
equivalent of those C library functions: it also provides certain
command line tools, like 'gettext' to get translated strings from the
shell. This tool is for example used by certain ecryptfs-utils scripts
to get translated strings. It is therefore necessary to be able to
build the gettext package even for glibc toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 158b14e..7871a48 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GETTEXT
 	bool "gettext"
-	depends on BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
