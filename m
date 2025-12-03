Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B541DD2A538
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8F1407C8;
	Thu,  4 Dec 2025 20:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WdMdOLrNh7d; Thu,  4 Dec 2025 20:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98BD840A57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880771;
	bh=qF0T0YjWK6u/Nqr/IRTsCapBLtKjJcaBqv43x0mwN6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HrWu0CWdLDjIhGIlcm4pcje+ciJXifhmreDpYVRsOF3zF2rp592lWCKyxaAayXfPL
	 rELMJe2y/M9HK2FcggIsWmYQTFvi2ktRFtTORlW+2etxB+h+x6ZY1JzylHnQdeMLGB
	 S+LGiKfIb3p1e+iCrhe2Ybj7BR4ho2lmqmA2a9anupa6XND5LbEEn1JKasMEWTowYH
	 x2i5eI7J7knjpkvIp/ZZlOzNcCq/5jsyNzeKHnYzkHO1XGYSklYLhRzMDmpKneuZhv
	 omyP5HqkN2GFItTT6pn1WfNumPMf9THgz0iZcEbcmY4mKXSLcHtGGd0uo+TOqlrC6I
	 j7sHZrv6YgxWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98BD840A57;
	Thu,  4 Dec 2025 20:39:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E96ED3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3779B407CA
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXiK7Y90uE8N for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E3340780
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E3340780
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84F08864D9; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 17:22:45 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8215c5dea90880128b0335cf915ecced538e6f24
X-Git-Newrev: 5588bdec022dbc0d3eded0f7ad29d67f9d0c8466
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.84F08864D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gnutls: add patch
 to fix build with gcc < 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=5588bdec022dbc0d3eded0f7ad29d67f9d0c8466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] (package/gnutls: security bump to
version 3.8.11), gnutls fails to build with gcc or host-gcc
version < 11, with error:

    In file included from audit.h:22,
                     from audit.c:26:
    crau/crau.h:255:23: error: missing binary operator before token "("
         __has_c_attribute (__maybe_unused__)

This commit adds a patch fixing the issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548

Reported-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Tested-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5cd1fe636cd9a420241da5fe79995d149d467f59)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...01-audit-crau-fix-compilation-with-gcc-11.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
new file mode 100644
index 0000000000..0551d5c4fd
--- /dev/null
+++ b/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
@@ -0,0 +1,67 @@
+From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 23 Nov 2025 18:17:19 +0100
+Subject: [PATCH] audit: crau: fix compilation with gcc < 11
+
+If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
+automatically detect an appropriate value for it.
+
+This autodetection is using the cpp special operator
+`__has_c_attribute` [1], introduced in gcc 11 [2].
+
+When compiling with a gcc older than version 11, the compilation fails
+with the error:
+
+    In file included from audit.h:22,
+                     from audit.c:26:
+    crau/crau.h:255:23: error: missing binary operator before token "("
+         __has_c_attribute (__maybe_unused__)
+                           ^
+
+This has been observed, for example, in Rocky Linux 8.10, which
+contains a gcc v8.5.0.
+
+The issue happens because the test for the `__has_c_attribute`
+availability and the test for the `__maybe_unused__` attribute
+are in the same directive. Those tests should be separated in
+two different directives, following the same logic described in
+the `__has_builtin` documentation [3].
+
+This issue was found in Buildroot, after updating gnutls to
+version 3.8.11 in [4].
+
+This commit fixes the issue by splitting the test in two.
+
+[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
+[2] https://gcc.gnu.org/gcc-11/changes.html#c
+[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
+[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
+
+Upstream: https://gitlab.com/gnutls/gnutls/-/merge_requests/2045
+Reported-by: Neal Frager <neal.frager@amd.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ lib/crau/crau.h | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/crau/crau.h b/lib/crau/crau.h
+index 0d4f9f13e..53d33555b 100644
+--- a/lib/crau/crau.h
++++ b/lib/crau/crau.h
+@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
+ # else
+ 
+ #  ifndef CRAU_MAYBE_UNUSED
+-#   if defined(__has_c_attribute) && \
+-    __has_c_attribute (__maybe_unused__)
+-#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#   if defined(__has_c_attribute)
++#    if __has_c_attribute (__maybe_unused__)
++#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
++#    endif
+ #   elif defined(__GNUC__)
+ #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
+ #   endif
+-- 
+2.51.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
