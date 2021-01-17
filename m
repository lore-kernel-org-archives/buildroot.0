From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:32:07 +0100
Subject: [Buildroot] [git commit] utils/get-developers: use
 Developers.hasfile() where appropriate
Message-ID: <20210117141307.AC89086C18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57ecb6c8ebba1d742254f4fc251fe358017cdd2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of open-coding Developers.hasfile() in utils/get-developers,
use it directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
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
 
