Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ElOVifNS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576E660614;
	Sat, 31 Oct 2026 18:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61ak7EtaEjpA; Sat, 31 Oct 2026 18:36:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3FCF06061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793471804;
	b=MTC7jECxsO193Pa+KkiJKdyHCxv31RaXtVWcGGZeCx986+neLJ2bNfWhgYValv5C3nd9
	 +GdlYW1OxpKzm2/xmQT6cyqmN8jhEk1jWjWCGO/rvvUpz3tn25h7oHnhILNAtGYH3mrGt
	 fw3aTmMhDg9UKIWq/0clxMlr+jKVMjxr+N6JOXM0wayoalbcwSoLM/jFA//7ClmUyJb4v
	 1GwSq1s0jNFCN2BbkC6zo2HzBKcluhB0quoy4lHZJhOaeJPd4NWJ76lFF7rSgojBlz2IR
	 jfzZEQW2pOM5XQnAVrBP/K47sd5wbkEoM7tNI7wtT9FEL8+hQBiowyGr4i2Zjj7h9/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793471804;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PZCEN0AvVwLaqKB4RJwjHV2GH04lXLRXAWqtT9mz4sc=;
	b=Pi169wWfAkJR3EORG/JIHR01DkaZKHCB8DTF2vCb7z0/eXKtThYq9ljl5VO7G+kRSk6z
	 xJnNRd9r9MuPsJJdiOKCWodrO6kwxOdGEEwMtk1QC33DRw53KUhIpW/h5latX11nW35fw
	 7NyGOGXEbM4R0EyOBDuw27b603mdVttwYAyAsx1mCWt9vyCE3PBoSitns5LCBk/3AWFmV
	 tLFCpdiPwvUZh8Ak0myHI0TYAEkeIJqH1cBGkF7zZ6Dwon7BAuRM1DCE3iV1e+rbo5QvR
	 GolabgFYGpRHlvL23lg1oOqTwO4vxbAv9Wv2hs+TY98ffi7c5BJhn746/n4AOX8LSAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793471804;
	bh=PZCEN0AvVwLaqKB4RJwjHV2GH04lXLRXAWqtT9mz4sc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ElOVifNSC0WnHbh3CHavIcDHsSiV14Br5Ledh9DFD8CgKsy8HtQq036aYNUjbnq4i
	 xBXjjtDJmO4zIeQAVpO2ZtC6CeOtoVga/iyMDLjxQNNFTWYSCFD7KI5y/7yCXa5t+5
	 CVc+GsH/+ZxKnpsWJAeGTS/HS4pljh7859ROadVVSHA86CGcyZfr65CZ0poLtfdPl5
	 xHQkCytG60fi36SMg8ZTFy5IjGi/om8aYTVsdDumyaCcN/gPpjqH2VLfF0AFmN0sxX
	 d48a2k78UkMwMFcXBwfnzShBDWCTxFBFjIDRG8V1wG+9L46fxT/1Jmvaf/dBXBb36s
	 at2+cC5jC7IdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCF06061B;
	Sat, 31 Oct 2026 18:36:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 326FE411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F994020B
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzb0B2-sbPuf for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:36:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BA338401EC
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793471800;
 b=rVbH97vqqcVSKzK+gglmSB380bXr2Cj9c4l6jmIGE+oChwu8N1gu3xTHRhZopmrYo0ys
 ZYPoAaF33T+SsPs6qrymEoU0b+3eYauAvzt6HTCVMPY65Qd8gTVtEc84597URwGMgAeRq
 /UNA36UmmVFELp3JWsYBRNXI2NkKvSipcFmlJ99asW9sSKjMGq+TQ9m1ETQwvAU8PZZJU
 SvdeiEVRoUafgZDc1s405a/3NNlXT6mh+Cd437Q/CmOmcpLHxWRI63ld3iehZ2w9iPN/h
 TZG3LcrG+bZ6uqXcXDf43q3NdJxQ0thRFqGZQXl0wElcXhWkXkwAgt4Ba1FLGbLCPTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793471800;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
 X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MAorVTYlrKdGRw0VQenwgxhHHfA7SdxsfMsIKuBJWJk=;
 b=R+CZFIfMLrHP+MFuUrFvM05HWuA7aKtyru9OvLYF/Dd8hdySTGf7YYXpP3+wTYMCAGF3
 mjbE0BciOJugEXIsND4NYC1y8My/clwiRhphFgbAA/qhdQSfWIzyIDZux33SExGTPix4p
 u2M1O7Go/CTME1yZIJl7plDFScdBPWjs65mNo0sWFnwsy5Q/fpgas/DB5Y1TgClllX4r/
 k5Z6ujlUHPpyg2aIMU3RapMCx/Ko5ACSaRq6hWuhF5Bn9tO7ei6oKfX0xmXWbV0alUvmZ
 j26MpbPcLIfXQ9y+bI7OQVf/QL8jPnnRgIRvUY3/lId9uKdZT6Ktjo6H38U64R8Su+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.128.50
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.50;
 helo=mail-wm1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA338401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:36:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso11828415e9.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793471795; x=1794076595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MAorVTYlrKdGRw0VQenwgxhHHfA7SdxsfMsIKuBJWJk=;
 b=r1seK6g2HYyhMYInS/henBg6HDJJC9SsogMz6JAsJCbgm2MyIVJQf94Og0j3DWTFVH
 npfCsYT872RDy1DpwMEzznq8v+GvdV4r1Beq21ppaGfwlyrLcLjgoC0CcxErHsODLZuM
 Vmz3AaVh5oV7K7pVOCj1/rTigA3aSZXCWrAga4IsDfz41vlahJYUpK1LOMAH+rbFvp4I
 XrHFasyMb2t+PABOVZ5h6S9k8TMdGIvrfAZnjtQhBCogEkYWRMnuKubF1w0Aa7jyj4+T
 5t/9kyjJBNrlCwZRCoJxY7IHT4SL8SX1JhHuZNZ2LWzxW0OyGet9RPMba+oiTD3xKWuk
 4DrQ==
X-Gm-Message-State: AFq9FYLfnO4kwxs+jLjdzzma7Ptlw3Dgxy3+C5tsLW2ydVhRM+hID8BX
 bfqRJdD0nWTpF89ueFQ5IGQ2FKMiXDN29Cx1wznU31LtPV/wcECyJAiD0R/BsA==
X-Gm-Gg: AYBFou0jlRujQk0NtEltLR6KJi54s/d9HDxmko9ZI7aY9LJDUNRKsdy2an3hIUQrQ0s
 3UE/9EmE0o1ZCJygbQ3YlJj80gD7FJLSSzSdhNXTRGl2HXfXfIQRbQgMQy6TLAuw7d9a94WtVCx
 ZTb3d+sAJgwvzMlEcFMehbqW27HyH/WTF+jKlsILKxYQDDFeRAaChF4FSbsMgqk6OjsNd/9KRRP
 p10n3Rp01WjhBOg5LCDIKhm+n8WE87ZVNybIk1LF4zb2Q0crCAE8KREDQGkoHGVs/Y9gWvp5+16
 e86dzM/2BWJuVuQpMJyUp3E1SGG37n8uUipqNLmLGgp+9xSmIRTrPpv1xK33qjE1l6mHGOa96xz
 GVGtjDexvZlQ090foiKdMWxGOQ9573s8qeNTYMEcV+DZI7Jvq4r/zgvni4Ykfb/KdXcW9I3rf1f
 HGTjNqgsY2z2Vx2nyP1fvOFDNbSdRPw/WySp1cJrqSrQXQ7CKKSh7fK4d5obKNuKOZbtAdWOhMy
 +96DsG8ZdFepg/BeIK04BOG48vjaV66Uv+eJ6bMoFwMYZ/7cDukOykcm9F+D4NqsP1p6q45GQ30
 hcs3z4j08UlQOY/ZPqRQ/vRn0vSmPc8gyHTG//evoiWKO82rK5wovDjqRrfUs99vT8oSYsXXGJb
 YMaP/kEUB7/crWZyHFOpU/iUKYYMbtPse2o2wzohg1SYNbOi3LZbFqoGPf8u++d4=
X-Received: by 2002:a05:600c:800c:b0:4a2:d99:3171 with SMTP id
 5b1f17b1804b1-4ac17753c13mr139608305e9.23.1793471795260; 
 Sat, 31 Oct 2026 11:36:35 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb5f:fa00:7047:f4fc:5b2:60ec])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4ac0a66caefsm116462835e9.5.2026.10.31.11.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:36:34 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 31 Oct 2026 19:36:31 +0100
Message-ID: <20261031183632.1561453-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/2] package/libglib2: bump to version 2.90.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.90.1/NEWS

- COPYING is now a symlink to LICENSES/LGPL-2.1-or-later.txt
- CVE-2026-58016 is fixed upstream, drop the patch

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...on-Fix-XML-parser-state-handling-for.patch | 42 -------------------
 package/libglib2/libglib2.hash                |  6 +--
 package/libglib2/libglib2.mk                  |  9 ++--
 3 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch

diff --git a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch b/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
deleted file mode 100644
index 4582382f806..00000000000
--- a/package/libglib2/0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
- element nesting
-
-The check for whether a `<node>` element in D-Bus introspection XML was
-nested correctly was broken. `<node>` elements can only be at the top
-level, or nested immediately within another `<node>` element.
-
-Fix the check and add some unit tests for it.
-
-Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
-uses example XML strings adapted from their report.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3932
-CVE: CVE-2026-58016
-Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: drop tests]
----
- gio/gdbusintrospection.c        |  2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 1138ba9d7..4df8e87db 100644
---- a/gio/gdbusintrospection.c
-+++ b/gio/gdbusintrospection.c
-@@ -1266,7 +1266,7 @@ parser_start_element (GMarkupParseContext  *context,
-   /* ---------------------------------------------------------------------------------------------------- */
-   if (strcmp (element_name, "node") == 0)
-     {
--      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
-+      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
-         {
-           g_set_error_literal (error,
-                                G_MARKUP_ERROR,
--- 
-2.47.3
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 95bf4d3179a..b6203dd0271 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.88/glib-2.88.4.sha256sum
-sha256  25fd169f3b2f91fe2391ad297883ce0fcf30c69fc789ffd1c9672d1332b1c5a8  glib-2.88.4.tar.xz
+# https://download.gnome.org/sources/glib/2.90/glib-2.90.1.sha256sum
+sha256  93c941aa17d5eb1d53fe838365f29a8b4e539c222a256d974ec8f30fc413e396  glib-2.90.1.tar.xz
 # License files, locally calculated
-sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 3770e8671a1..23f6643f10a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.88
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.90
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-LIBGLIB2_LICENSE_FILES = COPYING
+LIBGLIB2_LICENSE_FILES = LICENSES/LGPL-2.1-or-later.txt
 LIBGLIB2_CPE_ID_VENDOR = gnome
 LIBGLIB2_CPE_ID_PRODUCT = glib
 LIBGLIB2_INSTALL_STAGING = YES
@@ -17,9 +17,6 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
 LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
-# 0001-gdbusintrospection-Fix-XML-parser-state-handling-for.patch
-LIBGLIB2_IGNORE_CVES += CVE-2026-58016
-
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CFLAGS += -marm
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
