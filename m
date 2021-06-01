From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:40:12 +0200
Subject: [Buildroot] [git commit branch/next] utils/genrandconfig: also test
 BR2_ENABLE_RUNTIME_DEBUG
Message-ID: <20210601201228.6FF978B3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c9dfe4fd93639ebc621449217c0bbc2f7415e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

... similar to BR2_ENABLE_DEBUG.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 93dc6d898b..ca3e77e3e3 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -357,6 +357,8 @@ def gen_config(args):
     # Amend the configuration with a few things.
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
+    if randint(0, 20) == 0:
+        configlines.append("BR2_ENABLE_RUNTIME_DEBUG=y\n")
     if randint(0, 1) == 0:
         configlines.append("BR2_INIT_BUSYBOX=y\n")
     elif randint(0, 15) == 0:
