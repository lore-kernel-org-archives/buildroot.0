From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 17:12:21 +0200
Subject: [Buildroot] [git commit] libldns: replace patches with proper Git
	formatted patches
Message-ID: <20160329151632.0403181999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5637a0df266ae5ae1896595e55a192833395b0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-bugfix-548-Double-free-for-answers-4096.patch | 28 ++++++++++++++++++++
 ...-double-free-for-answers-bigger-than-4096.patch | 25 ------------------
 ...=> 0002-whitespace-bug-in-ldns-read-zone.patch} | 30 ++++++++++++----------
 ...xyparse-output-manpage-generation-issues.patch} | 13 +++++-----
 4 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/package/libldns/0001-bugfix-548-Double-free-for-answers-4096.patch b/package/libldns/0001-bugfix-548-Double-free-for-answers-4096.patch
new file mode 100644
index 0000000..4097cfe
--- /dev/null
+++ b/package/libldns/0001-bugfix-548-Double-free-for-answers-4096.patch
@@ -0,0 +1,28 @@
+From 128aeb54593d4dd8ff2403eb2dd7d6cd596717d2 Mon Sep 17 00:00:00 2001
+From: Willem Toorop <willem@nlnetlabs.nl>
+Date: Tue, 28 Jan 2014 11:06:38 +0100
+Subject: [PATCH] bugfix #548: Double free for answers > 4096
+
+in ldns_resolver_send_pkt.  Thank you sunthought at gmail.com
+
+[Backport from upstream commit 2853eb352b4461e98f2926ace4ea3810cedf4167]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ resolver.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/resolver.c b/resolver.c
+index 16efc90..1474dc8 100644
+--- a/resolver.c
++++ b/resolver.c
+@@ -1117,6 +1117,7 @@ ldns_resolver_send_pkt(ldns_pkt **answer, ldns_resolver *r,
+ 					ldns_pkt_set_edns_udp_size(query_pkt
+ 							, 4096);
+ 					ldns_pkt_free(answer_pkt);
++					answer_pkt = NULL;
+ 					/* Nameservers should not become 
+ 					 * unreachable because fragments are
+ 					 * dropped (network error). We might
+-- 
+2.6.4
+
diff --git a/package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch b/package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch
deleted file mode 100644
index 36bc875..0000000
--- a/package/libldns/0001-fix-double-free-for-answers-bigger-than-4096.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Downloaded from
-http://anonscm.debian.org/cgit/pkg-nlnetlabs/ldns.git/plain/debian/patches/fix-double-free-for-answers-bigger-than-4096.patch
-
-which is a backport from upstream
-http://git.nlnetlabs.nl/ldns/commit/?h=develop&id=2853eb352b4461e98f2926ace4ea3810cedf4167
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-From 2853eb352b4461e98f2926ace4ea3810cedf4167 Mon Sep 17 00:00:00 2001
-From: Willem Toorop <willem@nlnetlabs.nl>
-Date: Tue, 28 Jan 2014 11:06:38 +0100
-Subject: bugfix #548: Double free for answers > 4096
-
-in ldns_resolver_send_pkt.  Thank you sunthought at gmail.com
----
---- ldns.orig/resolver.c
-+++ ldns/resolver.c
-@@ -1117,6 +1117,7 @@ ldns_resolver_send_pkt(ldns_pkt **answer
- 					ldns_pkt_set_edns_udp_size(query_pkt
- 							, 4096);
- 					ldns_pkt_free(answer_pkt);
-+					answer_pkt = NULL;
- 					/* Nameservers should not become 
- 					 * unreachable because fragments are
- 					 * dropped (network error). We might
diff --git a/package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch b/package/libldns/0002-whitespace-bug-in-ldns-read-zone.patch
similarity index 61%
rename from package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch
rename to package/libldns/0002-whitespace-bug-in-ldns-read-zone.patch
index 4d8908e..ec87b18 100644
--- a/package/libldns/0002-fix-whitespace-bug-in-ldns-read-zone.patch
+++ b/package/libldns/0002-whitespace-bug-in-ldns-read-zone.patch
@@ -1,20 +1,19 @@
-Dwonloaded from
-http://anonscm.debian.org/cgit/pkg-nlnetlabs/ldns.git/tree/debian/patches/fix-whitespace-bug-in-ldns-read-zone.patch
-
-which is a backport from
-http://git.nlnetlabs.nl/ldns/commit/?h=develop&id=d6037a22fbedb8ef3a22de4107e4eaa36840865b
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-From d6037a22fbedb8ef3a22de4107e4eaa36840865b Mon Sep 17 00:00:00 2001
+From 055ea6aef77058f651b5571d98d2d9458821a977 Mon Sep 17 00:00:00 2001
 From: Matthijs Mekking <matthijs@nlnetlabs.nl>
 Date: Wed, 18 Jun 2014 09:55:17 +0200
-Subject: whitespace bug in ldns-read-zone
+Subject: [PATCH] whitespace bug in ldns-read-zone
 
+[Backport from upstream commit d6037a22fbedb8ef3a22de4107e4eaa36840865b]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
---- ldns.orig/rr.c
-+++ ldns/rr.c
-@@ -670,6 +670,18 @@ ldns_rr_new_question_frm_str(ldns_rr **n
+ rr.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/rr.c b/rr.c
+index cfee170..e530702 100644
+--- a/rr.c
++++ b/rr.c
+@@ -670,6 +670,18 @@ ldns_rr_new_question_frm_str(ldns_rr **newrr, const char *str,
  	                                    true);
  }
  
@@ -33,7 +32,7 @@ Subject: whitespace bug in ldns-read-zone
  ldns_status
  ldns_rr_new_frm_fp(ldns_rr **newrr, FILE *fp, uint32_t *ttl, ldns_rdf **origin, ldns_rdf **prev)
  {
-@@ -745,6 +757,9 @@ ldns_rr_new_frm_fp_l(ldns_rr **newrr, FI
+@@ -745,6 +757,9 @@ ldns_rr_new_frm_fp_l(ldns_rr **newrr, FILE *fp, uint32_t *default_ttl, ldns_rdf
  		s = LDNS_STATUS_SYNTAX_TTL;
  	} else if (strncmp(line, "$INCLUDE", 8) == 0) {
  		s = LDNS_STATUS_SYNTAX_INCLUDE;
@@ -43,3 +42,6 @@ Subject: whitespace bug in ldns-read-zone
  	} else {
  		if (origin && *origin) {
  			s = ldns_rr_new_frm_str(&rr, (const char*) line, ttl, *origin, prev);
+-- 
+2.6.4
+
diff --git a/package/libldns/0003-doxyparse-manpages.patch b/package/libldns/0003-let-doxyparse-output-manpage-generation-issues.patch
similarity index 90%
rename from package/libldns/0003-doxyparse-manpages.patch
rename to package/libldns/0003-let-doxyparse-output-manpage-generation-issues.patch
index 7aaa0d1..223ebe9 100644
--- a/package/libldns/0003-doxyparse-manpages.patch
+++ b/package/libldns/0003-let-doxyparse-output-manpage-generation-issues.patch
@@ -1,13 +1,12 @@
-From 168ee09a4bf184947798c3ee3ac99b6651470d64 Mon Sep 17 00:00:00 2001
+From d8a3da12be085fbc92e3d4d4d084c328fc37485a Mon Sep 17 00:00:00 2001
 From: Willem Toorop <willem@nlnetlabs.nl>
 Date: Thu, 27 Nov 2014 16:21:54 +0100
-Subject: let doxyparse output manpage generation issues
-
-This patch fixes a build error with perl 5.22.
+Subject: [PATCH] let doxyparse output manpage generation issues
 
+[Backport from upstream commit
+168ee09a4bf184947798c3ee3ac99b6651470d64, fixes the build with Perl
+5.22.]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Patch backported from upstream commit:
-http://git.nlnetlabs.nl/ldns/commit/?h=develop&id=168ee09a4bf184947798c3ee3ac99b6651470d64
 ---
  doc/doxyparse.pl | 45 ++++++++++++++++++++++++++++++++++++++-------
  1 file changed, 38 insertions(+), 7 deletions(-)
@@ -113,5 +112,5 @@ index 96a1732..a09b2e8 100755
 +
 +exit ($report_errors and $errors != 0);
 -- 
-cgit v0.11.2
+2.6.4
 
