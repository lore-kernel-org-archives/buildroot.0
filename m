Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4228CDB46F
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D461861AA;
	Sat, 20 Jun 2026 09:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXB4e0FuLxDu; Sat, 20 Jun 2026 09:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60349861C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946411;
	bh=H/8g8of6H5gpAPGe4J6ylBepPM8iBqv3FDAEKovKBWY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HLcg9xTQUPyd1XZe66rm0L7xBdfheSZ0xlNr5QZtHHQAnga3LdZoXGGVTJJYk7kwN
	 tXnh50MekqrsDV9OsqOAYn3HtyHkN64YWWpA81ylSQE8LlCsomzzyVdUx67kWeHRXC
	 VJY6JyYmSzEniPGzqXGN9lD2Y88dnUesId3yodHJ3nIcePRKPgT1tONfLqqC0YkxtY
	 hqPO4YuwEpOBzBjhq/7FWkxAMqt5KQWA4GC5DwQ97nUZjvaa+bptn+yRcLL7W3JpEJ
	 +ld2CoIJMGi8fAiBULSJ4ST/gpR4CVVkO7vqa6otyWSlYwUtMVtIIKairb+Cm7NZ16
	 54zpgAZVcGl9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60349861C8;
	Sat, 20 Jun 2026 09:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1405B112A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D1476FABE
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejONWBUNqa3m for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176856FAB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 176856FAB1
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1277C81E43; Sat, 20 Jun 2026 09:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:54:02 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: ec7ca21032ea54413e4d51aca4c86956ad7b43e1
X-Git-Newrev: ffc2f56308b743cb1ec13d71b5970957f39363bc
X-Patchwork-Hint: ignore
Message-Id: <20260620090615.1277C81E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/python-django:
 security bump to v6.0.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ffc2f56308b743cb1ec13d71b5970957f39363bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit 00b9069f461075acdf49996b7ecd7c9175dc4ec3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
