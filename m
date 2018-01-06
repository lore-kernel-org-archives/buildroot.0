From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:06:29 +0100
Subject: [Buildroot] [git commit] tcf-agent: disable package for microblaze
Message-ID: <20180106140642.815D581133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=920d2adfaa531f1058f86db15a7224177953805e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now, tcf-agent fails to build on microblaze. Disable microblaze
until upstream is fixed.

Fixes:

  http://autobuild.buildroot.net/results/72554c9c70c1a068e4ed6612e65ea294e678bb0c/

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcf-agent/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 50e5864..d2a05d0 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -29,7 +29,8 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "x86_64"     if BR2_x86_64
 	default "powerpc"    if BR2_powerpc || BR2_powerpcle
 	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
-	default "microblaze" if BR2_microblaze || BR2_microblazeel
+#	fails to build currently
+#	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
 config BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
 	bool
