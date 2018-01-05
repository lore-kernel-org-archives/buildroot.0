From: Norbert Lange <nolange79@gmail.com>
Date: Fri,  5 Jan 2018 22:50:17 +0100
Subject: [Buildroot] [PATCH 1/1] tcf-agent: disable package for microblaze
Message-ID: <20180105215017.5537-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

for now, tcf-agent fails to build on microblaze.
Disable microblaze until upstream is fixed.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/tcf-agent/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 50e58642b0..d2a05d0974 100644
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
-- 
2.15.1
