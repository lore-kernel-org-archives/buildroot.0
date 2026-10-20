Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC7606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A6P056/k
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF1C04096F;
	Thu, 22 Oct 2026 09:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmIm1DmOd0I0; Thu, 22 Oct 2026 09:34:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 11D674097B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661679;
	b=LVowh5szBT8C2s0EaEt3On8q98f5vkBSAJIvC8cKb4kH5cVccZ2ztyu1vJA1ij3SHH4M
	 c9NaD6p8SUj61UB4LLFXpYBznRAT0SySBTs+T2jVr1U6u0slJCeqKGHxFuhp/Ytth7Dgx
	 y9J1LrP13JRi9lmxCNhYbhZ0+/hrWC/WhYguP3KShtKjr5JPpKNPrmG7sQsRYx0VmwStZ
	 +rYsG6oRowhBIQFXCZxEgLkmdQ4moa6T8w0fHgBrxPqmOy4V7fcoIrIoG2mlEU3cuKH2w
	 DR6gg+onTiVmL3ego8aKeu0B/MaJ/kCVD/oQH2yU/8866+SwQnDH7aXqHzpJNKlgW8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tQFikXPQ3Gelb74pM6kJrNny8G6nj115CI0y2YrPj/w=;
	b=ZVMWRpoSMTGtl/aVOYuiJrs28fcAKLF2HUtvw0W426LzGbFE0AI3t+y1FSnruXijiWus
	 Q9ToOiuvB6YVMxYMHwzaQn/kPj1Kkc9enQIdiW+l5kFNTmUr+XOcK7hsD/NLeej/h7oPA
	 +Q1MMZn7zAHnL7SrsIiqMYLlbRmIZ5YujzVHNR+hZ+HZFaoVX1m6hVgXOks/xG6cni2QH
	 bmeIX/YmiS+K1hzp9KjLEG16L5vczsIdt28Yk6+tncocxV/k9o2Z4la9qGdg/3tWHPk6L
	 QKINFygzwdkKn/wNK3Ew3ZloCL88zhqHCyBV9SyUWkXDyYn0FBLGj2mzUc8t+m+b54g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661679;
	bh=tQFikXPQ3Gelb74pM6kJrNny8G6nj115CI0y2YrPj/w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A6P056/kjt0pYzLwRuJm0qjEzPzIm40w8YRzygwq2rf57h5k/J0YXnfp0OdtNlkO1
	 ST7i9IX1sQVMXpPJf8lo6NC4OnEaOWEfPTitdqABjklMPG89PAa6INHR8xuCcosOuh
	 aq+uNPFMZ9YNwsQi2DELUorgegkvTBdZ8gplIfbCiCMi+R1C8B30yLXcuvRctbA9ue
	 MdO3jaCa/n06O3ObvBNU/j89DmVV5vju2M35HLdR2xjrYHYNC+5oExGV2H0QB2k6gU
	 4YVsc25rqu9pgry19ighToQxtZiwsE/0mzcSjlVb8+9d1KG6JCDW+5aDMgr7G3Iy+c
	 C55TvusWXZ7yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11D674097B;
	Thu, 22 Oct 2026 09:34:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F260A1E11
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2B4C403DB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgTc5ybTzIk9 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 35654401A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661673;
 b=C8mmppsV3/NuD2wwhVk7C2iu1SsZ241do1I/DllvrGglr6TRSPZV8dc1Gy8MGPoxNw0c
 ug/N/IqF8mLSeSYkj9MmbgVWMEw66ljoLCzstmGiZhxuYKmt+7WdVsASIRMhfpsqVxWBU
 J/1vU51ZFqDgXvohI8oap+q9weoo4+zRJ/UrZKHNQpW7aBz0gCOrZdIcrHWRGinbsOhlP
 7M6viDTcXR9L5a/0hnV35pXdqAw+hFc9itwavVQPeRy4pG5mOv5W/ggtO4jthySm3g9Qc
 ycyyNdCYD6oLj6naWliRYiWGJxUilkqURoJWkodW/BfOBXdGfM5x8AFmOnIVRpisfTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661673;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HlkQ3SpZDjQZMzPOeARhgLztiBSdAocdc3bPAaMnypY=;
 b=HUD3zClK6o68QwNJwPTrzjK6rOZhQzoJ5W7VHA+bXAX9pP5MLnNE4cFQ82ngIqwPhHnh
 UUoc5OslBT2aor70TAuXNhvMos3aysooNl617uj7YQqRnfEoqy5fRd8dFVc8hKoAGVtw3
 WLSevFF3gwvZdMkVa08EUQedN7GoFvJYwSqOFCK9q8doMiGbuInWk60PaaeWewhhLWVOG
 djNho6oqXXenfJuuEyGfgsRMief8azR4Tl8cpL4DZGetRDxA5dGfSMDOrOA5oakbS+XX9
 8ChTFAbMxIjD75BV4aCTZnmqkvcSN8PV+Ti+/FdK2P7mHm6+ELBeqkiPnrMkhkGJM8g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35654401A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D9229B985; Thu, 22 Oct 2026 09:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:45:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9f6df9b7d6158757ab08f5a83622888a0c7310df
X-Git-Newrev: 0f238d5a207bae39f6a6675d305770bb6fafffa3
X-Patchwork-Hint: ignore
Message-Id: <20261022093309.4D9229B985@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-scipy: fix
 build with cython >=3.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f238d5a207bae39f6a6675d305770bb6fafffa3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since Cython version 3.1.0 [1] and buildroot commit [2] python-scipy
failed to build. This has been fixed upstream with [3].

This commit backports it to fix the build with the cython present in
2025.02.x.

[1] https://github.com/cython/cython/commit/ed7e95912b6ed7d20e190fbf1aecb9f2a997d479
[2] b536caaec0 package/python-cython: bump to version 3.1.2
[3] https://github.com/scipy/scipy/commit/217748476403a1e5726a921cedb674e7ffbc952e

Fixes: b536caaec0 package/python-cython: bump to version 3.1.2
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...02-use-int-instead-of-long-in-cython-code.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch b/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch
new file mode 100644
index 0000000000..6763c8cc5e
--- /dev/null
+++ b/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch
@@ -0,0 +1,37 @@
+From 217748476403a1e5726a921cedb674e7ffbc952e Mon Sep 17 00:00:00 2001
+From: Thomas A Caswell <tcaswell@gmail.com>
+Date: Thu, 21 Dec 2023 14:20:52 -0500
+Subject: [PATCH] MNT: use int instead of long in cython code (#19725)
+
+https://github.com/cython/cython/pull/5830 /
+d7e95912b6ed7d20e190fbf1aecb9f2a997d479 in cython removed
+long as a valid type in favor of int.
+
+Upstream: https://github.com/scipy/scipy/commit/217748476403a1e5726a921cedb674e7ffbc952e
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ scipy/_lib/_ccallback_c.pyx | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scipy/_lib/_ccallback_c.pyx b/scipy/_lib/_ccallback_c.pyx
+index 59ba74369267..6c493dac7c9c 100644
+--- a/scipy/_lib/_ccallback_c.pyx
++++ b/scipy/_lib/_ccallback_c.pyx
+@@ -58,7 +58,7 @@ def get_raw_capsule(func_obj, name_obj, context_obj):
+     elif context_obj is None:
+         context = NULL
+     else:
+-        context = PyLong_AsVoidPtr(long(context_obj))
++        context = PyLong_AsVoidPtr(int(context_obj))
+ 
+     if PyCapsule_CheckExact(func_obj):
+         capsule_name = PyCapsule_GetName(func_obj)
+@@ -70,7 +70,7 @@ def get_raw_capsule(func_obj, name_obj, context_obj):
+         if name == NULL:
+             name = capsule_name
+     else:
+-        func = PyLong_AsVoidPtr(long(func_obj))
++        func = PyLong_AsVoidPtr(int(func_obj))
+ 
+     if name == NULL:
+         name_copy = name
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
