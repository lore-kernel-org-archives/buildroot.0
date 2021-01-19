From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:22:47 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] utils/get-developers: use
 Developers.hasfile() where appropriate
Message-ID: <20210119141354.555978870D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bdae5980c9841ff2b3976fa379aa76921daacb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Instead of open-coding Developers.hasfile() in utils/get-developers,
use it directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 57ecb6c8ebba1d742254f4fc251fe358017cdd2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
