Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61DB606A332
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Pb1wnZeC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D51811D7;
	Fri, 23 Oct 2026 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKSEPVPRyUTl; Fri, 23 Oct 2026 12:32:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C332C8166F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758745;
	b=Hn+HZG6hnDEKHddMcDrRGyGEcxmaRkGLtqkj37rwDsUzVihmj/yHMNZRh0EmAklv+Yp2
	 p+7prJFor+TNRvWkp5hIgLVYt2DMFGSbapTY/RHe130vn0vXyDkqQMpPASm6u9mLwJCp+
	 ISJlkRmc2Ttc+SwG0bCxCNaJHCtgBk/9Lzzyu/Ptp0o0qGviTPMQO8nmUDK7eofTLduuE
	 5C63DMX3nMXKQfoiE2vv68Bic1ieQHRC8SCrGqc2UgToBwGx+CeHk222XzG19tHvR0orh
	 oK9qJLR8jGQGQiflSy+4ok5YYTAOw47RcLEJivpNJmpQ3zlfvP8dnPQKuqSjZNcf8/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758745;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=nk1NrByTel8Z6uzZJWoOE/Vq0kj1HEBsEVOEmQ+UcLE=;
	b=N9/6GwMtm10bdZTQizzm6T2VQUMZnOBg+Jl9ojUzJYY/kv5joLRC0mILTAm1BjXfr/w2
	 zrallzgfm8vmaH72BXl2c5rGSJz1YKpwCsFugTCDRhQ774xBIGCO+DNBAu3VWNtCRyq2e
	 /NJKeVWxYTry0mDVJRlX3mRCaQ1v0J4vzzRTKAmL7uC8WRRs6/mpYY/3//P881nIHqSDK
	 pnjQZUm9Ql3ITnqhunKplLOqTO6p0DM+jisaHgYxp1LwhbBiY14b5B6MDw2GN9YNGLV1X
	 ZCrViUsbAQlmVoA08AXgg4yo0CDYsbOb1uWw/00MlDrSbjaoza5O7rLhMhxrtioQ/jg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758745;
	bh=nk1NrByTel8Z6uzZJWoOE/Vq0kj1HEBsEVOEmQ+UcLE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pb1wnZeCMWcFW0GaR6UGQJ4bnKEQaoPFTY9hpzhLEYdJLknmJ/vSq05UUi8oYMlyN
	 Cn1q2OEA9eZukFd7ANRZ2N2ZvcJTcNKcmBTuSq2CU5X3cjAjWilvMuulxS7Rwh8BTf
	 IZeuzzGe107osqdJZwv9FX5NpmsNXONxtsb4VIwXOQyogE0XaKxrd/0fNtBgBb6Smp
	 APntZOffOHRlVjOlasKcmm+2FheKlhWIk/QVZc+hm9hNyJMuhtynV6LoWlKWAOLSOi
	 8lZLc+/FCsHmVGRR+xX9LD/EKtTHQoicC7qVw5tU8etLl9+r/2evb1IUqBeKDpY02F
	 e70r6InVUNKlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C332C8166F;
	Fri, 23 Oct 2026 12:32:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 745F849D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 667424094E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlgW7wS1KhPD for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AA3BE40928
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=Wfj0KbzPsOaOlU5wtEL+ZfVE04s6ok1ozPAt+zjQN6xTFzJ8uYKyvRUBfjr9oeP0lsyO
 LBEAWfn5wQ7wFOu4MwWJkZjQZCqLOsLl0yu8URFOOs/KT9qrHG69FpcJKjsdH8XvUjnL7
 NoERvwzPORAlYFxzSENScJBoFgEkD0TZPzXVJyN3WGztNwydixeJIWQy9UP+h8dwAgLvh
 muIKKtf/Y81HFvC54b26RjwND/QTJG+2lmDKkqS5wRrEFELqy29yPr0KhB23Y3YVGmols
 jCTkp2z91leceCQtTlFp3vv+8wlc/JHcqlYPffeAl0wRO1zlm4HGAZwwOWIo6uMR7wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OU8Zb2kfzFG0OoQA0fCdjaAIXNhcdIJrjsVR+xjj3UI=;
 b=jwQ2WJwzNGLRJVOjFD8KMX2StnfQax8dGvYfFHw3D7GpeBrS7CEVg1GfAGc8ERgAw/e4
 wmizxvZemB+T7m/ROVoM2bi1OtPIXrPqb66dLBYrFyrBZW18TjkVx+CBNS8eBDwy/6Ksv
 wtiyF/EFuXfUL+9gy+WJIRXxzza8d1MHWwtRN0E/ouBbBoFQPu00/Yxwxgm0LvRrtAb9J
 Op2CnmRPSKm5VhvvMaoq3wxA2QX0DCszm0wmgE3VynU5R1YKbe/bO/+OMjoLIAeO+R21T
 ixYqJXUcTtm9dsxy6r9HekfiqRjl8wfou1QHi/C32lv4+cxN2QVVcBrkNBKcy0YTesw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA3BE40928
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 310199C669; Fri, 23 Oct 2026 12:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:25 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3d84c56479b9388a97b20f5c43ae2ce59853b8c6
X-Git-Newrev: a8f2764312114b446e87f5a6d2394536884335be
X-Patchwork-Hint: ignore
Message-Id: <20261023123042.310199C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libglib2:
 backport upstream security fix for CVE-2026-58016
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3531703757367706533=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3531703757367706533==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a8f2764312114b446e87f5a6d2394536884335be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes the following vulnerability:

CVE-2026-58016: A flaw was found in GLib.  A state confusion issue exists in
g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
processing malformed D-Bus introspection XML, specifically with a `node`
element nested within other elements like `method`, `signal`, `property` or
`arg`.  This issue can cause an unsigned integer overflow and lead to an
out-of-bounds read, resulting in a denial of service.

https://gitlab.gnome.org/GNOME/glib/-/merge_requests/5156

Backport the upstream patch (included in 2.89.0), but drop the test addition
for easier backport:

https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 58aedd45baf9406ed36e9e90b554d3a689440b7d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...pection-Fix-XML-parser-state-handling-for.patch | 42 ++++++++++++++++++++++
 package/libglib2/libglib2.mk                       |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
new file mode 100644
index 0000000000..4582382f80
--- /dev/null
+++ b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
@@ -0,0 +1,42 @@
+From c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 16 Apr 2026 15:27:37 +0100
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
+ element nesting
+
+The check for whether a `<node>` element in D-Bus introspection XML was
+nested correctly was broken. `<node>` elements can only be at the top
+level, or nested immediately within another `<node>` element.
+
+Fix the check and add some unit tests for it.
+
+Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
+uses example XML strings adapted from their report.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3932
+CVE: CVE-2026-58016
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: drop tests]
+---
+ gio/gdbusintrospection.c        |  2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
+index 1138ba9d7..4df8e87db 100644
+--- a/gio/gdbusintrospection.c
++++ b/gio/gdbusintrospection.c
+@@ -1266,7 +1266,7 @@ parser_start_element (GMarkupParseContext  *context,
+   /* ---------------------------------------------------------------------------------------------------- */
+   if (strcmp (element_name, "node") == 0)
+     {
+-      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
++      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
+         {
+           g_set_error_literal (error,
+                                G_MARKUP_ERROR,
+-- 
+2.47.3
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 45aa894b81..3770e8671a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -17,6 +17,9 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
 LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+# 0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
+LIBGLIB2_IGNORE_CVES += CVE-2026-58016
+
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CFLAGS += -marm

--===============3531703757367706533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3531703757367706533==--
