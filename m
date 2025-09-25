Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE4CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D84616EA;
	Thu, 25 Sep 2025 20:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZvYpBub_A-S; Thu, 25 Sep 2025 20:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7909261713
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7909261713;
	Thu, 25 Sep 2025 20:31:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2961A12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 432374028E
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIplNmLLdqer for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D38412D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8D38412D1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6D7C86433; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:42:02 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: f5d88700ecde8767f59fcad79c81cde06f438e6b
X-Git-Newrev: bcdd49dcebf93a92529e6fd03df1f419c42b0500
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.C6D7C86433@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/civetweb: add
 patch for CVE-2025-55763
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcdd49dcebf93a92529e6fd03df1f419c42b0500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This fixes the following vulnerability:

- CVE-2025-55763

Buffer Overflow in the URI parser of CivetWeb 1.14 through 1.16 (latest)
allows a remote attacker to achieve remote code execution via a crafted
HTTP request. This vulnerability is triggered during request processing
and may allow an attacker to corrupt heap memory, potentially leading to
denial of service or arbitrary code execution.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-55763
  - https://github.com/civetweb/civetweb/commit/76e222bcb77ba8452e5da4e82ae6cecd499c25e0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 426d7635c7e99af49c3cc24c122c95b1ed89c082)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...erflow-in-directory-URI-slash-redirection.patch | 56 ++++++++++++++++++++++
 package/civetweb/civetweb.mk                       |  3 ++
 2 files changed, 59 insertions(+)

diff --git a/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch b/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
new file mode 100644
index 0000000000..399fafb4bd
--- /dev/null
+++ b/package/civetweb/0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
@@ -0,0 +1,56 @@
+From 76e222bcb77ba8452e5da4e82ae6cecd499c25e0 Mon Sep 17 00:00:00 2001
+From: krispybyte <krispybyte@proton.me>
+Date: Sat, 21 Jun 2025 23:33:50 +0300
+Subject: [PATCH] Fix heap overflow in directory URI slash redirection
+
+CVE: CVE-2025-55763
+Upstream: https://github.com/civetweb/civetweb/commit/76e222bcb77ba8452e5da4e82ae6cecd499c25e0
+[thomas: fix offset]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/civetweb.c | 23 ++++++++++++++++++-----
+ 1 file changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/src/civetweb.c b/src/civetweb.c
+index bbc9aa8be..e969c939f 100644
+--- a/src/civetweb.c
++++ b/src/civetweb.c
+@@ -15242,7 +15242,6 @@ handle_request(struct mg_connection *conn)
+ 	/* 12. Directory uris should end with a slash */
+ 	if (file.stat.is_directory && ((uri_len = (int)strlen(ri->local_uri)) > 0)
+ 	    && (ri->local_uri[uri_len - 1] != '/')) {
+-
+ 		/* Path + server root */
+ 		size_t buflen = UTF8_PATH_MAX * 2 + 2;
+ 		char *new_path;
+@@ -15254,12 +15254,26 @@ handle_request(struct mg_connection *conn)
+ 			mg_send_http_error(conn, 500, "out or memory");
+ 		} else {
+ 			mg_get_request_link(conn, new_path, buflen - 1);
+-			strcat(new_path, "/");
++
++			size_t len = strlen(new_path);
++			if (len + 1 < buflen) {
++				new_path[len] = '/';
++				new_path[len + 1] = '\0';
++				len += 1;
++			}
++
+ 			if (ri->query_string) {
+-				/* Append ? and query string */
+-				strcat(new_path, "?");
+-				strcat(new_path, ri->query_string);
++				if (len + 1 < buflen) {
++					new_path[len] = '?';
++					new_path[len + 1] = '\0';
++					len += 1;
++				}
++
++				/* Append with size of space left for query string + null terminator */
++				size_t max_append = buflen - len - 1;
++				strncat(new_path, ri->query_string, max_append);
+ 			}
++
+ 			mg_send_http_redirect(conn, new_path, 301);
+ 			mg_free(new_path);
+ 		}
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 629c1b59b2..af221e9133 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -10,6 +10,9 @@ CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 CIVETWEB_CPE_ID_VALID = YES
 
+# 0002-Fix-heap-overflow-in-directory-URI-slash-redirection.patch
+CIVETWEB_IGNORE_CVES += CVE-2025-55763
+
 CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1 \
 	$(if $(BR2_INSTALL_LIBSTDCPP),WITH_CPP=1)
 CIVETWEB_COPT = -DHAVE_POSIX_FALLOCATE=0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
