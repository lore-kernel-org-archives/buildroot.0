From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 22:39:26 +0100
Subject: [Buildroot] [git commit] docs/manual: document the new
	kconfig-package variable
Message-ID: <20151222215317.9768A826C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=217493eef8624b220e62ea39a8ddddc8678f6700
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous patch introduced the new FOO_KCONFIG_DEFCONFIG variable
to specify a defconfig rule rather than a (def)config file.

Add this to the manual.

Also document the pre-existing FOO_KCONFIG_FILE for which the
explanations were missing altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-kconfig.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index 17f91e3..3290024 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -46,6 +46,16 @@ This snippet creates the following make targets:
 and ensures that the source configuration file is copied to the build
 directory at the right moment.
 
+There are two options to specify a configuration file to use, either
++FOO_KCONFIG_FILE+ (as in the example, above) or +FOO_KCONFIG_DEFCONFIG+.
+It is mandatory to provide either, but not both:
+
+* +FOO_KCONFIG_FILE+ specifies the path to a defconfig or full-config file
+  to be used to configure the package.
+
+* +FOO_KCONFIG_DEFCONFIG+ specifies the defconfig 'make' rule to call to
+  configure the package.
+
 In addition to these minimally required lines, several optional variables can
 be set to suit the needs of the package under consideration:
 
