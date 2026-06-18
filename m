Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CE0CDB466
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD9C861B9;
	Sat, 20 Jun 2026 09:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dZFZWJw1pQ3; Sat, 20 Jun 2026 09:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 494478619C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946401;
	bh=2WiK631T2hB38ImLsVjHYNfYRcAM7ONCJU9rSnlCKRI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pvjlrd+sV/0ldbWjyn+qsxMajoy8DSjYc+ZCs3N+DUq5ZZHgnkRyA9FGvUYT6qSB7
	 nb2rx9vYVBP09cFBDOMpiL14wwUfWsS6AmjaH+XnTON+BpHBbT+voR4voF4v0AfC8v
	 +QwEjHTd6uZyk0f8edwaYWMHEsrexvoKeW4Q6cGut+WpXDE2prbr2BP5W6NhD2gkHj
	 f7VRDkZngDXjJtRDSUti1Vyb2Qpf2dZe69J8uTxHznDh5VtxyCDyXLdjN0cP2Uu0SM
	 PfTkq4T26z+0f1xAa7f2oVJ3WP1JSuCLp8GS2gPhD05Et4dQ+xbQAhIi5PY4VInABP
	 37ftWZBFBi53Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 494478619C;
	Sat, 20 Jun 2026 09:06:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C483112A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10ADF401EF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-P22uS76Dxn for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40D604019A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40D604019A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48D8481E3E; Sat, 20 Jun 2026 09:06:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:58:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bb975551e65e9a71db68d6d556cbb1ac88ffb051
X-Git-Newrev: 24e0c552a4ad1b1dad26731d67636934bb97f233
X-Patchwork-Hint: ignore
Message-Id: <20260620090612.48D8481E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 security bump to v5.2.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/24e0c552a4ad1b1dad26731d67636934bb97f233
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
- https://docs.djangoproject.com/en/5.2/releases/5.2.14/
- https://docs.djangoproject.com/en/5.2/releases/5.2.15/

This fixes the following vulnerabilities:
- CVE-2026-5766 : Potential denial-of-service vulnerability in ASGI requests
                  via file upload limit bypass
- CVE-2026-35192: Session fixation via public cached pages and
                  SESSION_SAVE_EVERY_REQUEST
- CVE-2026-6907 : Potential exposure of private data due to incorrect handling
                  of Vary: * in UpdateCacheMiddleware
- CVE-2026-6873 : Signed cookie salt namespace collision
- CVE-2026-7666 : Potential unencrypted email transmission via STARTTLS
                  in the SMTP backend
- CVE-2026-8404 : Potential exposure of private data via case-sensitive
                  Cache-Control directives
- CVE-2026-35193: Potential exposure of private data via missing
                  Vary: Authorization
- CVE-2026-48587: Potential exposure of private data via whitespace padding
                  in Vary header

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 00b9069f461075acdf49996b7ecd7c9175dc4ec3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index a7bf2aed8b..8121d67796 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  4af55cc09a3d1a828259ad0c05330e6b  django-5.2.13.tar.gz
-sha256  a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4  django-5.2.13.tar.gz
+md5  9db6f4aaaf130e3f53a4c5255c1b1bcd  django-5.2.15.tar.gz
+sha256  5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7  django-5.2.15.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index a478c95f95..cae4542099 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.13
+PYTHON_DJANGO_VERSION = 5.2.15
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
