From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  1 Jun 2021 16:34:21 +0200
Subject: [Buildroot] [PATCHv4 16/16] utils/genrandconfig: also test
 BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210601143422.25064-1-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
Message-ID: <20210601143422.25064-17-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

... similar to BR2_ENABLE_DEBUG.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

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
-- 
2.26.3
