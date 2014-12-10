From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:24:04 +0100
Subject: [Buildroot] [git commit] jasper: add a patch fixing CVE-2014-9029
Message-ID: <20141210202411.16D6580168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=421b4d0dde756969e4fc2abecd293dd97dcc62f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://www.ocert.org/advisories/ocert-2014-009.html for the details.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jasper/0001-fix-CVE-2014-9029.patch |   36 +++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/jasper/0001-fix-CVE-2014-9029.patch b/package/jasper/0001-fix-CVE-2014-9029.patch
new file mode 100644
index 0000000..c2e95a8
--- /dev/null
+++ b/package/jasper/0001-fix-CVE-2014-9029.patch
@@ -0,0 +1,36 @@
+Fix CVE-2014-9029
+
+Patch taken from https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2014-9029
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+--- jasper-1.900.1.orig/src/libjasper/jpc/jpc_dec.c	2014-11-27 12:45:44.000000000 +0100
++++ jasper-1.900.1.orig/src/libjasper/jpc/jpc_dec.c	2014-11-27 12:44:58.000000000 +0100
+@@ -1281,7 +1281,7 @@ static int jpc_dec_process_coc(jpc_dec_t
+ 	jpc_coc_t *coc = &ms->parms.coc;
+ 	jpc_dec_tile_t *tile;
+ 
+-	if (JAS_CAST(int, coc->compno) > dec->numcomps) {
++	if (JAS_CAST(int, coc->compno) >= dec->numcomps) {
+ 		jas_eprintf("invalid component number in COC marker segment\n");
+ 		return -1;
+ 	}
+@@ -1307,7 +1307,7 @@ static int jpc_dec_process_rgn(jpc_dec_t
+ 	jpc_rgn_t *rgn = &ms->parms.rgn;
+ 	jpc_dec_tile_t *tile;
+ 
+-	if (JAS_CAST(int, rgn->compno) > dec->numcomps) {
++	if (JAS_CAST(int, rgn->compno) >= dec->numcomps) {
+ 		jas_eprintf("invalid component number in RGN marker segment\n");
+ 		return -1;
+ 	}
+@@ -1356,7 +1356,7 @@ static int jpc_dec_process_qcc(jpc_dec_t
+ 	jpc_qcc_t *qcc = &ms->parms.qcc;
+ 	jpc_dec_tile_t *tile;
+ 
+-	if (JAS_CAST(int, qcc->compno) > dec->numcomps) {
++	if (JAS_CAST(int, qcc->compno) >= dec->numcomps) {
+ 		jas_eprintf("invalid component number in QCC marker segment\n");
+ 		return -1;
+ 	}
