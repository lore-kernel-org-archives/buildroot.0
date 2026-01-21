Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F91C44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BDA040C95;
	Wed, 21 Jan 2026 20:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cadL_LDPk7Yj; Wed, 21 Jan 2026 20:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 809D440C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028294;
	bh=mUarpJza0rApRtih4Fb5rkseJcNkj4b38e33sadpaQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L+0oakvpoSs87KGhC72bnZXSPt/TWyHkUBkO3qiSyfYz+KZO2ZELVmMkhToSXjhNm
	 sDUFj2COFaK6YYEpL/BxzLh18ajthzN6iYZvxGDuYvnfm5k6WuHT2AQlAtPwHqLG0J
	 B++sPHcjJEjiBfsBAlBjKBfFnBfkuqXVNRSH2NMtDVDbdi3oehEO8rBXnEHsEmnkqF
	 1NCmueyvc/TkBxn+CNfyyUcLqniH0eP30//YMdnyAQRdY5lEMAduUT7eXJRy64hmwa
	 +64kY7blycrapFRnCdjlWtIQQd392OcNhHvZxFfkqd4Ym+QN1AIuUojJ3Gc8SPKvfO
	 S9keW5c5/Wwiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809D440C84;
	Wed, 21 Jan 2026 20:44:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAE9734C
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B21044041C
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLsDz0fjjvLn for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA8A5404E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8A5404E4
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9A70874AD; Wed, 21 Jan 2026 20:44:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 21:06:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fa9c7c3f0c0059828eecb5ea7e498a3546a2ea2
X-Git-Newrev: 5978e0157be195e7712f1cb9b01929968b30f5fc
X-Patchwork-Hint: ignore
Message-Id: <20260121204445.C9A70874AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-html5lib: fix build with
 python 3.14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5978e0157be195e7712f1cb9b01929968b30f5fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...tup.py-fix-version-parsing-on-Python-3.14.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch b/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
new file mode 100644
index 0000000000..0147aa1418
--- /dev/null
+++ b/package/python-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14.patch
@@ -0,0 +1,42 @@
+From b90dafff1bf342d34d539098013d0b9f318c7641 Mon Sep 17 00:00:00 2001
+From: Andrew Sukach <andrew@sukach.org>
+Date: Fri, 12 Sep 2025 21:53:31 -0700
+Subject: [PATCH] `setup.py`: fix version parsing on Python 3.14 (ast.Str
+ removed)
+
+Python 3.14 removes the ast.Str node type. String literals now appear
+as ast.Constant(value=str).
+Update the AST check to accept both ast.Str (for older Pythons) and
+ast.Constant with a string value (for Python 3.8+), allowing html5lib to
+build successfully on Python 3.14 while remaining compatible with older
+version.
+
+Upstream: https://github.com/html5lib/html5lib-python/pull/589
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 30ee0575..42ab6f67 100644
+--- a/setup.py
++++ b/setup.py
+@@ -92,9 +92,14 @@ def default_environment():
+     for a in assignments:
+         if (len(a.targets) == 1 and
+                 isinstance(a.targets[0], ast.Name) and
+-                a.targets[0].id == "__version__" and
+-                isinstance(a.value, ast.Str)):
+-            version = a.value.s
++                a.targets[0].id == "__version__"):
++            if hasattr(ast, "Str") and isinstance(a.value, ast.Str):
++                version = a.value.s
++            elif (hasattr(ast, "Constant")
++                  and isinstance(a.value, ast.Constant)
++                  and isinstance(a.value.value, str)):
++                version = a.value.value
++assert version is not None
+ 
+ setup(name='html5lib',
+       version=version,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
