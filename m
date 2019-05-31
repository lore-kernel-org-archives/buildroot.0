From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit branch/next] package/Makefile: add C-SKY
 ABI variable value
Message-ID: <20190531210133.BDDEA8D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f0e3ff8a09a9352a9772195f06d454b827a6aab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for adding support for the C-SKY architecture in the
internal toolchain backend, we need to make sure that GNU_TARGET_NAME
will contain the appropriate ABI, i.e abiv1 or abiv2 depending on the
selected C-SKY core.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2c18..f05b9cc3aa 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -70,6 +70,15 @@ ABI := $(ABI)hf
 endif
 endif
 
+# For C-SKY abiv1 & abiv2
+ifeq ($(BR2_csky),y)
+ifeq ($(BR2_ck610),y)
+ABI = abiv1
+else
+ABI = abiv2
+endif
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
 ABI = spe
