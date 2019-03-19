From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:27:53 +0100
Subject: [Buildroot] [git commit] package/angularjs: fix license file hash
Message-ID: <20190319212611.E1E9A81E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e4da9c1f953679fa2bf42ad4b23fc51e2bfbeb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The update of angularjs to 1.7.8 in commit
00dcde3eb12d194d31356fd6e54c0328acd371a1 broke legal-info for this
package, because the hash of the license file changed.

In fact, we are using angular.js as the license file and obviously it
is likely to change between each release. The new angular.js still
specifies a MIT license, so we can update the license file hash.

Fixes:

  http://autobuild.buildroot.net/results/0b8ad8d8384d605c2230e862548ccaba1f06d9b0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/angularjs/angularjs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/angularjs/angularjs.hash b/package/angularjs/angularjs.hash
index 61a9ceeb7c..81ef5c160f 100644
--- a/package/angularjs/angularjs.hash
+++ b/package/angularjs/angularjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
 sha256	4d1e5755d7722fed1fa223d854f209251bfee042c72ffe5cca63c4c1a7a19d78	angular-1.7.8.zip
-sha256	db7862d0083ae74b5c94005d18274c3528f1be2932b72438e2f606a3d1f23ab5	angular.js
+sha256	e3b0100b35fa76ace389c29ee0f69b68126d2e759f7e5df82d4f56254ba53688	angular.js
