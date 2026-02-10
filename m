Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E14EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7C47613D7;
	Fri, 13 Feb 2026 19:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx_Az4zffy8R; Fri, 13 Feb 2026 19:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7AA5613E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011353;
	bh=c/69OwYCEJEuS7JN4elI4OiHep81lxKVMav3XJ6R6Jc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fs/WQgAvc4gaTQA8S0FQBRSxsy3rumHahIDjbDcHHrg24/Kef5Ulx+n9rLtpMYyqQ
	 8nRXfDMR13lzelMaLiZtJIGkWFJ0Ii46ypkFaMaMYD3X5J++TpkuC0huw935RJ60dy
	 mm9CPfs04hflSRJhamTSn+FLbffV1abY4gQAfFqEmpZLeRzM4vnx9kjYHapZcunoNe
	 gH3uoyCOe72DudW4ezfbcLQUbHL3cGLkc6t+ps71rn2sdhZgDOuXydqdATgjdxNmFr
	 VHSt9A5+jfcuG7Rh2XX9jbkWtDCkeMvlUO0IzErbqVA3j2MqYkYwKpCUQdaH2qzAQK
	 SCDPCoq/7NHNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7AA5613E2;
	Fri, 13 Feb 2026 19:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FCB669
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 677E0412A0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qinjD0W5VKtd for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C5EA4026C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C5EA4026C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1A5086D65; Fri, 13 Feb 2026 19:35:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Feb 2026 17:01:48 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5cd1cc9f8b061c7d39fc66cb85f070502c28ea53
X-Git-Newrev: 5034989b1c1c769bea65212bdbfe00d550a39688
X-Patchwork-Hint: ignore
Message-Id: <20260213193525.F1A5086D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xmlstarlet: Fix
 build with libxml2-2.14+
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5034989b1c1c769bea65212bdbfe00d550a39688
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b3bdf2f152f5821d93707f03b7765b0ce20440f6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch     | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
new file mode 100644
index 0000000000..dd7472301e
--- /dev/null
+++ b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
@@ -0,0 +1,49 @@
+From 6b3ca3549abb998947088bdf264d65a0a86684cd Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 12 Oct 2025 18:38:54 +0200
+Subject: [PATCH] xml_pyx: remove ATTRIBUTE_UNUSED
+
+This define was removed in libxml2 2.14.0:
+https://gitlab.gnome.org/GNOME/libxml2/-/commit/208f27f9641a59863ce1f7d4992df77f7eb0ea9d
+
+Upstream: https://sourceforge.net/p/xmlstar/patches/23/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/xml_pyx.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/xml_pyx.c b/src/xml_pyx.c
+index ab295f1..8adc028 100644
+--- a/src/xml_pyx.c
++++ b/src/xml_pyx.c
+@@ -200,7 +200,7 @@ pyxExternalEntityReferenceHandler(void* userData,
+ }
+ 
+ static void
+-pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
++pyxExternalSubsetHandler(void *ctx, const xmlChar *name,
+                          const xmlChar *ExternalID, const xmlChar *SystemID)
+ {
+     fprintf(stdout, "D %s PUBLIC", name); /* TODO: re-check */
+@@ -215,7 +215,7 @@ pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
+ }
+ 
+ static void
+-pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
++pyxCommentHandler(void *ctx, const xmlChar *value)
+ {
+     fprintf(stdout,"C");
+     SanitizeData(value, xmlStrlen(value));
+@@ -223,7 +223,7 @@ pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
+ }
+ 
+ static void
+-pyxCdataBlockHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value, int len)
++pyxCdataBlockHandler(void *ctx, const xmlChar *value, int len)
+ {
+     fprintf(stdout,"[");
+     SanitizeData(value, len);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
