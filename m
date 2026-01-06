Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AF7D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBA9381416;
	Wed,  7 Jan 2026 18:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQjVMvuoqith; Wed,  7 Jan 2026 18:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6B9822CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808901;
	bh=L+2+kf8tLcPFTpwBrWVbGS/QnH904iPx1I9rr7hM52E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VgqOfZ7KETBZDGDcClPfJFff1cpYXdCE3M5vEloINiST105JaetL5hPy2eo5y7142
	 9cEmtRR98Pi1+C6X+MtaNwGd9pVjhlp4q/vS4qBPCOwACpxIJgG9Zlfx2aupiy1nuV
	 t2OOhzLMA7hF4LqRCYvnPZCpb39+8qRRChKJ0mOFXLmkX8s0TNltuPjuGE+qovdVVY
	 0Qe9BNLJhg3ljedeS0JHFEGPEjSGId5Sddr84cr+LdOHMMa5y8jG+pbp/71/gRVQh4
	 fwyyZtm4/tOhrV08JqFXgEsW8vh5dak8vWXnt9V2m+c7wK4GMF+QbhMTWimMVlnEq9
	 lnhHsyZjTu97w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E6B9822CE;
	Wed,  7 Jan 2026 18:01:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 159E0A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4594980CDB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5s3Mi5vIK53N for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FDD780EA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FDD780EA5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D55D873D4; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:33:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 70072dc0e2f2d3b82f54b69cfdfd3dd0236f8540
X-Git-Newrev: 60d6b2a58c1100a02f1d9ee29276b3c3ba3d7864
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.7D55D873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-django:
 security bump to 5.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=60d6b2a58c1100a02f1d9ee29276b3c3ba3d7864
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Fixes:
* CVE-2025-13372: Potential SQL injection in FilteredRelation column aliases on PostgreSQL
* CVE-2025-64460: Potential denial-of-service vulnerability in XML Deserializer

Full release notes: https://docs.djangoproject.com/en/6.0/releases/5.2.9/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2622f9ca25cdc179ed1be3d733fb9b963a7fc5b8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 448e98613b..b5b2460d2d 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  0268c52cb99bb764490fdd90502def32  django-5.2.8.tar.gz
-sha256  23254866a5bb9a2cfa6004e8b809ec6246eba4b58a7589bc2772f1bcc8456c7f  django-5.2.8.tar.gz
+md5  e7d89ddfdca79542039dbab31e4bede8  django-5.2.9.tar.gz
+sha256  16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495  django-5.2.9.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 920fd8a577..7aabce68ef 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.8
+PYTHON_DJANGO_VERSION = 5.2.9
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/05/a2/933dbbb3dd9990494960f6e64aca2af4c0745b63b7113f59a822df92329e
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/eb/1c/188ce85ee380f714b704283013434976df8d3a2df8e735221a02605b6794
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
