From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 20:54:44 +0200
Subject: [Buildroot] [git commit] libyaml: fix libyaml-legal-info build
 failure
Message-ID: <20180907111605.3B4C87FE98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed9c758e20371adf3535d09997b478cad1efa490
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file changed and hash hasn't been recalculated, this leads to
libyaml-legal-info build failure.

Kirill Simonov Copyright now covers 2006-2016.
Ingy d??t Net Copyright has been added instead for 2017-2018.

Recalculate sha256 locally and substitute it in libyaml.hash file.

Fixes:
http://autobuild.buildroot.net/results/c10/c10baf6e9bae92d515264b677eeb1ce6c98c793d//
http://autobuild.buildroot.net/results/c66/c66ddb56fecf1570a8669bd9d8824cd2132f9776//
http://autobuild.buildroot.net/results/84e/84e9530aff0c981a009416f31470133fb2114421//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyaml/libyaml.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libyaml/libyaml.hash b/package/libyaml/libyaml.hash
index 755ea7bbd8..afc014dfb2 100644
--- a/package/libyaml/libyaml.hash
+++ b/package/libyaml/libyaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256 78281145641a080fb32d6e7a87b9c0664d611dcb4d542e90baf731f51cbb59cd  yaml-0.2.1.tar.gz
-sha256 d0d8b09800a45cd982e9568fc7669d9c1a4c330e275a821bbe24d54366d16fe9  LICENSE
+sha256 bfcb6a7dfbfd30e0ccc8bb34ab712bd1568586ad8c5b078ccae443b04e79749e  LICENSE
