Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D301606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e380BefM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 506FB608A5;
	Fri,  6 Nov 2026 21:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KOmiG_LcFZg; Fri,  6 Nov 2026 21:14:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4BCD36090A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999674;
	b=bXwqiv4KktL/WGCeLMNfzju+ghi0EOs8qUzoJSYM5p/lhszKbuwhg6lu8Bg82ERn2LpZ
	 /bihyCXiruEbh8D6aWQMcfeG1eKU7pYafQX3p9nB1+a6u7ru5TgBRlXWm3MNurptQ0zMj
	 OkiFQk9GIKiv417n2lJwsxbnzsLHHp/PT9kvNpSWdzuoOWMq3DB1NLg6bfXXyl94k9mtz
	 Hx65l4TAdLsvCmenURasmlZuiA/oQ4YElAqFOwOE75392o/fZ3GETkXYvCTp8YC79wr7b
	 OLMleb81tRccwV80axhEQ54tamAPSWeKFOQoP/Ah06WdQWT2hrp0j2Z/0pZuSydY2VA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999674;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HTZBJOrVWEou78ntiEgoKkVt9yagJzijcvPf5j4bcVI=;
	b=CXmdEuxwukMBz8FqRVxSGKXShJYvHBtpBcuzWS2jXIwgbD9CLl9MtscV8LEQdz0/LT0+
	 vWgyte1jZTDrkVe5Z8WHd6J63/t861EIYhRSNa9nz8DOQdeNOOifh7YCcb6AJtAxvn/KD
	 J/lBuJrrgia633HOh9TjK3NxUXqgLifdlvbmTenypfLVDXJifO1qOlINohBtetGZoy8eD
	 VNTOCx+bfa2Pdr6LLVfDzZctII91aiXywpyGQwU0QfMIv1h/sNIR8F4zvegqfw8eGrIz2
	 jbHKH9caUoVbaRJRwM7bD3SFSrfOIHJAGJLSb59C2+He/La3sJgzwGai/ZEI4UQXuJg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999674;
	bh=HTZBJOrVWEou78ntiEgoKkVt9yagJzijcvPf5j4bcVI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e380BefMeJCcuwOlK3auV08+dIwaYfpogoRtjP/BQlhMO3lKAKyF10qYgHAp7ifbU
	 Y7EyB78sm9PhIvOc4nrBS42ILjXtErzsDB1ZzyXYsPGiHzETbsZlPiMcwwxK9LWstK
	 0LZhAhJGgnYS+kwZS/b4vYRcC+0nXrm6rb3gbBx+GeKeZjh4pNqHTMhoev6QqWgrwm
	 tpYMk0fT0gCGo6Dy8S2MBv5k4SzEFc/YLPmiov+f4ie48scRMQYMIYfYjTLREjQFHG
	 VipfrA7KCQbckG18uuoLJPKvbuLKgENzjPbwEYev6opIkLiP9CsdPzd/ZBWGyX33Rt
	 wLc3LMOv9SINQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BCD36090A;
	Fri,  6 Nov 2026 21:14:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 571B531F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D62F81289
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KghE1Wym01H for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 56C9C81230
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56C9C81230
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73A4B9E0FF; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fe87abcbfcc9964f1514119eea25ac664063d2c
X-Git-Newrev: 5b5c1c9b6b4086a405a5a2a8f3aa64e018e3697c
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.73A4B9E0FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 6.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b5c1c9b6b4086a405a5a2a8f3aa64e018e3697c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:
- CVE-2026-108147: memory exhaustion via base64-encoded file uploads.
- CVE-2026-111211: log injection through geometry form values.
- CVE-2026-111362: SSRF through GeoJSON coordinate system references.
- CVE-2026-113593: private data exposure through cached Vary headers.
- CVE-2026-113733: password hash disclosure to view-only admin users.
- CVE-2026-114582: SSRF through SpatialReference string input.

https://docs.djangoproject.com/en/6.1/releases/6.1.3/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0cab9700bb..4f51294adf 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  7c2461ccfcea3d11464ef207fa0bcbed  django-6.1.2.tar.gz
-sha256  a1e92451ccb8b514e91bbb3b6d186d20b4030558f116b5d9de6535455ff210b7  django-6.1.2.tar.gz
+md5  3cb5521afc0cd034743c7c258d3cb85f  django-6.1.3.tar.gz
+sha256  b5d2d9e35295065d13b1927b3f19a59bd119f737aa6299def14ccca1ae3c8c0d  django-6.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index b5b4a322f7..b3c4ae54ec 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.1.2
+PYTHON_DJANGO_VERSION = 6.1.3
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/89/24/20d187a22ac821288b53c53b8f696019dcb0c7b4f973f052ade19392c74d
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/55/79/49a609ea76ec51404b482932e33f1e6858946b920232c11b11a25bea3032
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
