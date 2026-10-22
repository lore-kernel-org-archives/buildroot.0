Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFA3606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nXPeElRi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 503D8812DB;
	Fri, 23 Oct 2026 12:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrIyzoY3U9oP; Fri, 23 Oct 2026 12:24:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2C7A781471
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758275;
	b=qIF08kKS7RROWF/vUxJCQfDDecPE4cSAISX0VkrHEYVcIyhyBCq0R7ufCL5p+wBKpY27
	 fHCbzVXDtUweVkRUQAoIsokXsBf6lgIZb0ewBtB/ZVnrUEkpbFogy5t35OU65I0noy+ea
	 ltAA3VkRQnAxNwzItO3GFGAlZSLOLp1OmkOgUXSU50/bAstSeWaSKQt01XooKVrxzN0lF
	 ppTNRXQ7Tz+Ofqab2Kz4pDG1UEBAB8PIfDu154ZJWuPn4MwuBywQIua4qrZkz4/EDgxI1
	 4DHl/IYmwChbFhQ2xrQAUIEqbWA1yosvyzFtzmJsQr4GKWv70BVuhss5Bl3yAbOOVkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gSyoKPJTmUUGp3wNPkvH+SGYIHb0X2BhdC43ZClVFLA=;
	b=NRvSzBSnEYy+HiB44Yne5pqyiHhzwXwD0bsxojuZ88O2BZSM13+kJhFkKtKILom5/mdj
	 DOB+edHdGEbgZ05B1gF+3gt6psV0lb0bY3jttCCHyKbMRg8gnLpNBXZT9YIAkbIQn2+LZ
	 rcF/pYpwzih69dALdZIIPCRZt9g3nxWKRwrbfHIfYyWSQ6ClqM/fu2RcDzZPiRvyqhC+3
	 znnC2fVIOYKdf8xyUq+eF1qGScz9SCMXl9mZOeNG6SlkZB6MhsuaCWibHTAmB3VzZXd+Z
	 0XZcQ+hOulwPEmkAXsP4z0kq3CkH/At2ptYKKe0HL19BsSH50ZzLRwDDepHAkuhHWZA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758275;
	bh=gSyoKPJTmUUGp3wNPkvH+SGYIHb0X2BhdC43ZClVFLA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nXPeElRiH4vPa8Ko3XNS8SbPRDqGndi80pkoCfkQGicr8OI5zhbDtWrAXuzFuYzcN
	 nHwm/Ptn0hUV1Gya0QtSh9X9yAjkbV6tvkrQPop9RpiqFBAu8WE3iy6LwB+mNR8pk0
	 8enzG8hPHo+CcJB2m5+GybkRFG8ml1UFhCRXpTTSzk38wJD0mZfTVO0Z/3HyI4ZNpY
	 mJOBvB7KCbFSv6kNAxbolzIGnvkqhnp2ySaiR5glg38Z39OtCcFhs/utnWJYSb0VDq
	 x3MTEeHc9TBqJxVVF92SShYh0+dom1MgYLtrzM1b5Z2Efq47EXwItBMeCVZC+11NKP
	 cY9Q+/fTenELw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C7A781471;
	Fri, 23 Oct 2026 12:24:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26F4612C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02A8081422
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJG8c-EjFcT7 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9B54C812FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758268;
 b=Dt5UNxS0AoxgctG0MNTnxF4mD04439B9yZlgUTDGdmQC3bz3ExcTNU2JCwq+nZdgMh5z
 lgE2qlfKRPiWlPXs9GmJkAo1wR8kMYcuXU/ZcJal3jEPTlx/e7wQ6LGsUq3lKqJ/K2CdO
 EsFE0TQ1I4dLhecX74fRVV+YaD46XCJyNcZ8FjWXz3lYjQrSeMlbcjNScEYN7a06CtVCK
 hVR5JxkpZsyBNwFbS4sQj/innIw7w0wNSfiOxEA/w1ifaQKEidjxxbqsp2ImaefXvilRw
 CwiAKDU8/qBFb4IdYHx8PkLgkSaa4cJJnYUNxsIm7VATUpOdS8oHxNgTe+QbmGaElbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758268;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wbxc4UbNV6HrX9H0OAYbp2rmK/6sKd5RQspoFVdZ+2Q=;
 b=jkHU8vVjbURp/m2oPeIfl/jYEnvbnjRfmD8rpYycRhIXWmPh2yLC5cs95zGIRdZGdx5Z
 KqwRvmAcxy8ZdfbDV1dNf0Y8zoP/Wux1aobsd565aN4pi1yNPA3EAWODZFG2Jd4YGTEZV
 VSlUvQJhlPPUxPzaVqRiww/HsYyThviFFeKQU4bxxGH19wJkNl3F59Oa1Ge04jfPJ1/8s
 S3RN6haF2+2AKG3DMNz41gCc/kMwt/sfY8axkl5hzHKIg9oD6BdOm0o2+T5VgO4E13VBL
 xsj2RwrAybWeUn6F+Ef63N1rxY1LjRauqQMT6pZRJVdeFRXaydhVna9niJAQykBCC0Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B54C812FE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C7A9C669; Fri, 23 Oct 2026 12:23:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cdfe52550d53c6cd6b5f075ea824ba051f19b414
X-Git-Newrev: d6c2ab7aab56532bffd2ee8488b4b4d30476f1f3
X-Patchwork-Hint: ignore
Message-Id: <20261023122304.21C7A9C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libglib2:
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
Content-Type: multipart/mixed; boundary="===============3244393657855078112=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3244393657855078112==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6c2ab7aab56532bffd2ee8488b4b4d30476f1f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index aa578c56bc..092d254ad1 100644
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

--===============3244393657855078112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3244393657855078112==--
