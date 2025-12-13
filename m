Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FC4D5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE28A6059F;
	Sat, 13 Dec 2025 14:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngXrM5-qgQSb; Sat, 13 Dec 2025 14:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4432605EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634544;
	bh=YOXBP4TSYtrHT2+4lG7/emqAakIgLlVKSJTbvABXRIs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f6hHIz1MrWYanD6ToePluTw9RF4rzm9VwYr72HW6omGNOFZAPaIezCyAwZ+wmlcaU
	 RNX3QuTVDBRgIdapo/v1W+Jk5rNvVik32myC20Dk4PkBmImIZRMaeqognTmLvqwuct
	 677yR7fMv28M+SxDThZASEzF4FXAOONgs92+3Vn0bzPmeuqLG1LuDnk/uAAjCZ5Ivp
	 PGteqaqTzZNNUFBJXiXbAK+pIXjvtDIxuB05R5oa4ak2MPwnAyM1581kUc1XZYHb2D
	 15ie9KQDatf/6lSBVvENiEILXrDWANqP15+BNti1XF74vN8xgARD4xZ6VGFz1b3708
	 p1A4OJm19vMUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4432605EB;
	Sat, 13 Dec 2025 14:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D814913D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA457830C2
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R460Fe2YFP2Q for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14136828DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14136828DF
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:02:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E853F86C58; Sat, 13 Dec 2025 14:02:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 14:50:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9415529923c9f7eaeec44c8fd3eecca79bf6b8d2
X-Git-Newrev: 1167d0ff3d225ca9ce2b6299da28a9307d370142
X-Patchwork-Hint: ignore
Message-Id: <20251213140222.E853F86C58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: mention CVE trailer
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1167d0ff3d225ca9ce2b6299da28a9307d370142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds documentation about adding a patch that address a vulnerability.

The patch-policy file now explain mention that patches that address a
vulnerability needs to include a `CVE:` trailer with the reference of
that vulnerability.

Until now only adding the reference to the `_IGNORE_CVES` variable was
necessary, so the documentation of this entry is modified as well to
point to the patch policy.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.adoc |  6 +++---
 docs/manual/patch-policy.adoc            | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 6827b9975e..e7547460fd 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -509,9 +509,9 @@ not and can not work as people would expect it should:
 * +LIBFOO_IGNORE_CVES+ is a space-separated list of CVEs that tells
   Buildroot CVE tracking tools which CVEs should be ignored for this
   package. This is typically used when the CVE is fixed by a patch in
-  the package, or when the CVE for some reason does not affect the
-  Buildroot package. A Makefile comment must always precede the
-  addition of a CVE to this variable. Example:
+  the package (see xref:additional-patch-documentation[]), or when the CVE for
+  some reason does not affect the Buildroot package. A Makefile comment must
+  always precede the addition of a CVE to this variable. Example:
 +
 ----
 # 0001-fix-cve-2020-12345.patch
diff --git a/docs/manual/patch-policy.adoc b/docs/manual/patch-policy.adoc
index a4bc5f391a..02051f2f0e 100644
--- a/docs/manual/patch-policy.adoc
+++ b/docs/manual/patch-policy.adoc
@@ -144,6 +144,7 @@ AC_PROG_MAKE_SET
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
 ----
 
+[[additional-patch-documentation]]
 === Additional patch documentation
 
 Ideally, all patches should document an upstream patch or patch submission, when
@@ -177,4 +178,14 @@ Upstream: N/A <additional information about why patch is Buildroot specific>
 ----
 
 Adding this documentation helps streamline the patch review process during
-package version updates.
\ No newline at end of file
+package version updates.
+
+If the patch addresses one or multiple vulnerabilities, list each identifier on
+a separate line with a +CVE+ trailer.
+
+----
+CVE: <vulnerability identifier>
+----
+
+If multiple patches address the same vulnerability, reference the vulnerability
+in every patch.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
