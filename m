From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Aug 2013 23:04:59 +0200
Subject: [Buildroot] [git commit] strongswan: fix typo in tnccs_20
	dependencies
Message-ID: <20130822210602.DFFF29B52F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a737dfccd5a05114b03a8a0b127a20a88c8540d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It looks like there is a typing error in dependencies of tnccs_20 in strongswan
configure script. Add a patch to solve it.

Resolve issues detected here:
    http://autobuild.buildroot.net/results/b069e304c42660e7f7eba0b358f95dbaf879df64
    http://autobuild.buildroot.net/results/7355ddbaa213f4fcfd1b6d37b25bed1aab525723

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...trongswan-0002-fix-dependency-to-libtnccs.patch |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch b/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch
new file mode 100644
index 0000000..059fc42
--- /dev/null
+++ b/package/strongswan/strongswan-0002-fix-dependency-to-libtnccs.patch
@@ -0,0 +1,26 @@
+It looks like there is a typing error in dependencies of tnccs_20.
+
+Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
+
+--- a/configure	2013-08-19 12:09:33.934651935 +0200
++++ b/configure	2013-08-19 11:50:34.465118187 +0200
+@@ -15897,7 +15897,7 @@
+ 	radius=true;
+ fi
+ 
+-if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
++if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_20 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
+ 	tnc_tnccs=true;
+ fi
+ 
+--- a/configure.in	2013-08-19 12:08:41.762913778 +0200
++++ b/configure.in	2013-08-19 11:50:22.222886206 +0200
+@@ -317,7 +317,7 @@
+ 	radius=true;
+ fi
+ 
+-if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
++if test x$tnc_imc = xtrue -o x$tnc_imv = xtrue -o x$tnccs_11 = xtrue -o x$tnccs_20 = xtrue -o x$tnccs_dynamic = xtrue -o x$eap_tnc = xtrue; then
+ 	tnc_tnccs=true;
+ fi
+ 
