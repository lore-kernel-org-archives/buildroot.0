Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A436CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D20612DF;
	Thu,  9 Oct 2025 10:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPQAQ9ZJP8Sg; Thu,  9 Oct 2025 10:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E82C612D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E82C612D1;
	Thu,  9 Oct 2025 10:06:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 629D421B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB2FD40FAC
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtbCYzUP4osE for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB2EE40FA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB2EE40FA4
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B918D86D29; Thu,  9 Oct 2025 10:06:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:32:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: a722429b935337d9c7cb90e8db4bf1e74daaeac3
X-Git-Newrev: 96288e7adcb1318c7652670d615d5857f4a069e9
X-Patchwork-Hint: ignore
Message-Id: <20251009100623.B918D86D29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/raptor: add
 patches for CVE-2024-57822, CVE-2024-57823
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96288e7adcb1318c7652670d615d5857f4a069e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This fixes the following vulnerabilities:
- CVE-2024-57822:
    In Raptor RDF Syntax Library through 2.0.16, there is a heap-based
    buffer over-read when parsing triples with the nquads parser in
    raptor_ntriples_parse_term_internal().
    https://www.cve.org/CVERecord?id=CVE-2024-57822

- CVE-2024-57823:
    In Raptor RDF Syntax Library through 2.0.16, there is an integer
    underflow when normalizing a URI with the turtle parser in
    raptor_uri_normalize_path().
    https://www.cve.org/CVERecord?id=CVE-2024-57823

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e94cd21e7b5f806d5daad3d93ac6712f3e00d6bd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ap-read-buffer-overflow-in-ntriples-bnode.patch | 30 +++++++++++++++
 ...er-underflow-in-raptor_uri_normalize_path.patch | 43 ++++++++++++++++++++++
 package/raptor/raptor.mk                           |  5 +++
 3 files changed, 78 insertions(+)

diff --git a/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch b/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
new file mode 100644
index 0000000000..1242c7289c
--- /dev/null
+++ b/package/raptor/0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
@@ -0,0 +1,30 @@
+From ece2c79df43091686a538b8231cf387d84bfa60e Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Fri, 7 Feb 2025 11:38:34 -0800
+Subject: [PATCH] Fix Github issue 70 B) Heap read buffer overflow in ntriples
+ bnode
+
+(raptor_ntriples_parse_term_internal): Only allow looking at the last
+character of a bnode ID only if bnode length >0
+
+CVE: CVE-2024-57822
+Upstream: https://github.com/dajobe/raptor/commit/ece2c79df43091686a538b8231cf387d84bfa60e
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/raptor_ntriples.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_ntriples.c b/src/raptor_ntriples.c
+index 3276e790..ecc4247c 100644
+--- a/src/raptor_ntriples.c
++++ b/src/raptor_ntriples.c
+@@ -212,7 +212,7 @@ raptor_ntriples_parse_term_internal(raptor_world* world,
+             locator->column--;
+             locator->byte--;
+           }
+-          if(term_class == RAPTOR_TERM_CLASS_BNODEID && dest[-1] == '.') {
++          if(term_class == RAPTOR_TERM_CLASS_BNODEID && position > 0 && dest[-1] == '.') {
+             /* If bnode id ended on '.' move back one */
+             dest--;
+ 
diff --git a/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch b/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
new file mode 100644
index 0000000000..55e8ab3f11
--- /dev/null
+++ b/package/raptor/0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
@@ -0,0 +1,43 @@
+From da7a79976bd0314c23cce55d22495e7d29301c44 Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Thu, 6 Feb 2025 21:12:37 -0800
+Subject: [PATCH] Fix Github issue 70 A) Integer Underflow in
+ raptor_uri_normalize_path()
+
+(raptor_uri_normalize_path): Return empty buffer if path gets to 0
+length
+
+CVE: CVE-2024-57823
+Upstream: https://github.com/dajobe/raptor/commit/da7a79976bd0314c23cce55d22495e7d29301c44
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/raptor_rfc2396.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/raptor_rfc2396.c b/src/raptor_rfc2396.c
+index 8cc364f4..f8ec5798 100644
+--- a/src/raptor_rfc2396.c
++++ b/src/raptor_rfc2396.c
+@@ -351,6 +351,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+           *dest++ = *s++;
+         *dest = '\0';
+         path_len -= len;
++        if(path_len <= 0) {
++          *path_buffer = '\0';
++          return 0;
++        }
+ 
+         if(p && p < prev) {
+           /* We know the previous prev path component and we didn't do
+@@ -390,6 +394,10 @@ raptor_uri_normalize_path(unsigned char* path_buffer, size_t path_len)
+     /* Remove <component>/.. at the end of the path */
+     *prev = '\0';
+     path_len -= (s-prev);
++    if(path_len <= 0) {
++      *path_buffer = '\0';
++      return 0;
++    }
+   }
+ 
+ 
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index ec7643ce3d..1b850400f8 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -14,6 +14,11 @@ RAPTOR_CPE_ID_VENDOR = librdf
 RAPTOR_CPE_ID_PRODUCT = raptor_rdf_syntax_library
 RAPTOR_INSTALL_STAGING = YES
 
+# 0003-Fix-Heap-read-buffer-overflow-in-ntriples-bnode.patch
+RAPTOR_IGNORE_CVES += CVE-2024-57822
+# 0004-Fix-integer-underflow-in-raptor_uri_normalize_path.patch
+RAPTOR_IGNORE_CVES += CVE-2024-57823
+
 # Flag is added to make sure the patch is applied for the configure.ac of raptor.
 RAPTOR_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
