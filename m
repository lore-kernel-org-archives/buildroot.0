From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Mar 2021 11:05:57 +0200
Subject: [Buildroot] [git commit] package/pulseview: fix patch
Message-ID: <20210329084140.0F92786494@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86d70b64815ca5ced09525d0537e48aa69f6976c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4b7db318262a023a4a5396b06adafd9fd19d40a3 forgot to restore
upstream patch

Fixes:
 - http://autobuild.buildroot.org/results/589cfc6ea43dc5e714751f05be488f5c469641b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch b/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
index 42cdc467be..047fe2cccd 100644
--- a/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
+++ b/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] Replace obsolete/deprecated Qt methods
 ae726b70a7ada9a4be5808e00f0c951318479684, one conflict manually
 resolved in pv/util.cpp.]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Fabrice: restore original patch in pv/util.cpp for 0.4.2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  pv/util.cpp                     | 21 +++++++++++++++++++--
  pv/util.hpp                     | 10 ++++++++++
@@ -25,8 +27,8 @@ index 49b9467c..2a63038d 100644
  	if (sign && !v.is_zero())
 -		ts << forcesign;
 +		ts.setNumberFlags(ts.numberFlags() | QTextStream::ForceSign);
- 	ts << qSetRealNumberPrecision(precision) << (v * multiplier) << ' '
- 		<< prefix << unit;
+ 	ts << qSetRealNumberPrecision(precision) << (v * multiplier);
+ 	ts << ' ' << prefix << unit;
  
 @@ -171,7 +171,7 @@ QString format_value_si(double v, SIPrefix prefix, unsigned precision,
  	QString s;
