Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333D1C83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95864414D2;
	Thu, 17 Jul 2025 20:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iut1WKLCgXgv; Thu, 17 Jul 2025 20:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56747416F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56747416F4;
	Thu, 17 Jul 2025 20:33:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15FDEA59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8A760781
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVyiVvjQcIvh for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7702660835
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7702660835
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74EB28667F; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 22:58:52 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e99cfb81cb83ea74959a129532e6f78a21654282
X-Git-Newrev: 8071e5634185a59a46f7ebc7eca20b84a448e076
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.74EB28667F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libxml2: add
 patch for CVE-2025-49795
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8071e5634185a59a46f7ebc7eca20b84a448e076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This patch mitigates CVE-2025-49795 [1] by backporting the commit [2] to
libxml2 2.13.

[1] https://nvd.nist.gov/vuln/detail/cve-2025-49795
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/499bcb78ab389f60c2fd634ce410d4bb85c18765
[3] https://security-tracker.debian.org/tracker/CVE-2025-49795

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bb1a5689459a6f6fead0c0cfec0052cafa77d2c3)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...Fix-null-pointer-dereference-leading-to-D.patch | 70 ++++++++++++++++++++++
 package/libxml2/libxml2.mk                         |  3 +
 2 files changed, 73 insertions(+)

diff --git a/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch b/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
new file mode 100644
index 0000000000..38b3e9be41
--- /dev/null
+++ b/package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
@@ -0,0 +1,70 @@
+From 4df1c80c4edc51ecb9f2f574203128a06fd31406 Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Sat, 21 Jun 2025 12:11:30 -0400
+Subject: [PATCH] Schematron: Fix null pointer dereference leading to DoS
+
+(CVE-2025-49795)
+
+Fixes #932
+
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/499bcb78ab389f60c2fd634ce410d4bb85c18765
+CVE: CVE-2025-49795
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+---
+ result/schematron/zvon16_0.err | 1 +
+ schematron.c                   | 2 ++
+ test/schematron/zvon16.sct     | 7 +++++++
+ test/schematron/zvon16_0.xml   | 5 +++++
+ 4 files changed, 15 insertions(+)
+ create mode 100644 result/schematron/zvon16_0.err
+ create mode 100644 test/schematron/zvon16.sct
+ create mode 100644 test/schematron/zvon16_0.xml
+
+diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.err
+new file mode 100644
+index 00000000..465cf2eb
+--- /dev/null
++++ b/result/schematron/zvon16_0.err
+@@ -0,0 +1 @@
++xmlSchematronParse: could not load './test/schematron/zvon16.sct'
+\ No newline at end of file
+diff --git a/schematron.c b/schematron.c
+index 426300c8..b51b20e1 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1509,6 +1509,8 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+             select = xmlGetNoNsProp(child, BAD_CAST "select");
+             comp = xmlXPathCtxtCompile(ctxt->xctxt, select);
+             eval = xmlXPathCompiledEval(comp, ctxt->xctxt);
++            if (eval == NULL)
++                return ret;
+ 
+             switch (eval->type) {
+             case XPATH_NODESET: {
+diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
+new file mode 100644
+index 00000000..4d24c054
+--- /dev/null
++++ b/test/schematron/zvon16.sct
+@@ -0,0 +1,7 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
++	<sch:pattern id="TestPattern">
++		<sch:rule context="book">
++			<sch:report test="not(@available)">Book <sch:value-of select="falae()"/> test</sch:report>
++		</sch:rule>
++	</sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
+new file mode 100644
+index 00000000..551e2d65
+--- /dev/null
++++ b/test/schematron/zvon16_0.xml
+@@ -0,0 +1,5 @@
++<library>
++	<book title="Test Book" id="bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+-- 
+2.39.5
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index a4373a691a..0149ba1f0a 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -21,6 +21,9 @@ LIBXML2_IGNORE_CVES += CVE-2025-6021
 #0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
 LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
 
+#0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
+LIBXML2_IGNORE_CVES += CVE-2025-49795
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
