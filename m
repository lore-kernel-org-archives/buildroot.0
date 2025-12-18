Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42294D6E2B2
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1824110A;
	Thu, 18 Dec 2025 16:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyEe8JUJ8BBf; Thu, 18 Dec 2025 16:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F8F841135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076247;
	bh=Yncp/I03ZlcCxKxneLkbgNWfxcR2W81EOog3Sd1po9Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fwcaEzmKsItJvruQoB+ODgq6TIiR9WeKgI49ThEJAGaIZ9qzNuc+R7jZnfdxUWheU
	 b9qUbInhk7IMscGxRD/FgtydfCh3gyogjVxZBdgynSW8RALeSDA1/s7wkFWsJ/Bv9S
	 a3ZWZMDdUQ9JKjCr0rq/VJBVVapNgQqpqgYb3fwkj96YHh00ifNlV0Eja9SFeZTBW0
	 vJBASWA21wo2ERgFrejlUTvOlXDBE6nRiOvxvAwTqENZmHLhw1mtCmnVyw/hNxjNc7
	 sijcTg1p7tThUYB9GRmwDXddQUD7dGRicGT4XgrimyuCV+wrfQcwuJ0Vtp4ozNTR98
	 MbTRdXFlrs3Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8F841135;
	Thu, 18 Dec 2025 16:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB56E361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F4604102F
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoKJJjudPoqk for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CEC441042
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CEC441042
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B9A1873D5; Thu, 18 Dec 2025 16:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 16:56:26 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 2942d6592da36400acbd08a3f54aec54a4252a42
X-Git-Newrev: 3709f8ee857ae122027fdfc6d9abecd4c388077f
X-Patchwork-Hint: ignore
Message-Id: <20251218164358.7B9A1873D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] docs/manual: mention CVE
 trailer
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

commit: https://git.buildroot.net/buildroot/commit/?id=3709f8ee857ae122027fdfc6d9abecd4c388077f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Adds documentation about adding a patch that address a vulnerability.

The patch-policy file now explain mention that patches that address a
vulnerability needs to include a `CVE:` trailer with the reference of
that vulnerability.

Until now only adding the reference to the `_IGNORE_CVES` variable was
necessary, so the documentation of this entry is modified as well to
point to the patch policy.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1167d0ff3d225ca9ce2b6299da28a9307d370142)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
