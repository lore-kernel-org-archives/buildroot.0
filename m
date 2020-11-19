From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 15:53:53 +0100
Subject: [Buildroot] [PATCH 3/4] utils/get-developers: use
 Developers.hasfile() where appropriate
In-Reply-To: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
References: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119145354.1175043-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of open-coding Developers.hasfile() in utils/get-developers,
use it directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/get-developers | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index 750fc556dc..20272ed60b 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -77,9 +77,8 @@ def __main__():
     if args.files is not None:
         args.files = [os.path.abspath(f) for f in args.files]
         for dev in devs:
-            for devfile in dev.files:
-                commonfiles = [f for f in args.files if f.startswith(devfile)]
-                if commonfiles:
+            for f in args.files:
+                if dev.hasfile(f):
                     print(dev.name)
                     break
 
-- 
2.28.0
