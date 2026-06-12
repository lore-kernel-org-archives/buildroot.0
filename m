Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABB9CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E72D813D8;
	Fri, 12 Jun 2026 16:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQLYr6RjEdfo; Fri, 12 Jun 2026 16:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76BEA813ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781283003;
	bh=83qUTdwVOE3uBCIUhVVeHSBXf6VwAVgeBbbThijf6fQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A5Jztwze5iJP/+IrfVz7N1e7NfgL9wxlgGqkwF25V5Wv4GwlH+Nri/6736RXnfvkc
	 iS9hJlO/5yZL31LBCuvYv2IvHWa+DdguZZuiKi9aUFjlbWpnEXSh+5A1exfvdvwpux
	 msy7GNjR1h1Rqv8Y3m2zxYTkJ451pTgKCp9o6eD70RladrTCX17cvfCHl3TFB63Iw7
	 DM2CbvaGdo5gzRw38KR9k/iJjWPpqqpwu7xA+39mcqkQwGU36+Sm2dtgk3lfkdvOon
	 oxl/Wc0um2OaYV+P5CCjBu8h4Vzgz4SxSveMUIBNYNd0PNNYbDfgXf5YJSgeaeT9uN
	 5bMShSjRooOlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76BEA813ED;
	Fri, 12 Jun 2026 16:50:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C5F6F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AFED40601
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbwVeQhlI7GN for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE7540099
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DE7540099
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:50:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E206D88121; Fri, 12 Jun 2026 16:49:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:39:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdb2fab2e84d365d57106fc245ae51a6c4ff5efa
X-Git-Newrev: 00b9069f461075acdf49996b7ecd7c9175dc4ec3
X-Patchwork-Hint: ignore
Message-Id: <20260612164941.E206D88121@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 v6.0.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/00b9069f461075acdf49996b7ecd7c9175dc4ec3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://docs.djangoproject.com/en/6.0/releases/6.0.6/

This fixes the following vulnerabilities:
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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 5af043f2c2..993b7b0d68 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  44c18a8f264c1326e6fe4f1053fea5fc  django-6.0.5.tar.gz
-sha256  bc6d6872e98a2864c836e42edd644b362db311147dd5aa8d5b82ba7a032f5269  django-6.0.5.tar.gz
+md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
+sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fe88128e24..764e72084c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.5
+PYTHON_DJANGO_VERSION = 6.0.6
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
