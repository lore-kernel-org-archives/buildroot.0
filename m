Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AC0E67497
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 18:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AB7B80F62;
	Mon, 22 Dec 2025 18:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWQJwaoaysUp; Mon, 22 Dec 2025 18:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7157980F87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766426801;
	bh=DboSLuEKmD+CVnA76+aQeSNmeAxbgpLhhG9n4nxF260=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gwMQxUaqgvsyNSqjUpQjNXpfmOB7ihJT6u8N+Uc+9OOom5uRcjJPFYun1WOwqjYok
	 cyCXR0+yfzLyfOUp7SAPV785QiyDk6ZG5O62KmKcoE4BvGLc/PmRTJHcDbB0wRt3f7
	 H01YP9dh5D/li0KLfArPik7e84/96FRhMCXlsgKSfq3bUFz7wKfamDemQpre0hn5BZ
	 2aJ7KYeYDUm2iWNKvqDEr+tnlXchcVWK7M256aGQB5S/tKGcH5AQGkG9PEaaBYprPO
	 0czBuq7v7iha99DwV4rp5PcZjYf4KL/uwZuG28t6XWNDbS/O9CXcydP51/b6NZigrA
	 94l24IsS75tgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7157980F87;
	Mon, 22 Dec 2025 18:06:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9186E195
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83728608B0
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzVYR8DSsH2l for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 18:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8519960724
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8519960724
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:06:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C21D875DD; Mon, 22 Dec 2025 18:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 19:05:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98cdff07cffe1534147bc4294ed0343492b9edc9
X-Git-Newrev: 2622f9ca25cdc179ed1be3d733fb9b963a7fc5b8
X-Patchwork-Hint: ignore
Message-Id: <20251222180639.6C21D875DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 5.2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=2622f9ca25cdc179ed1be3d733fb9b963a7fc5b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
* CVE-2025-13372: Potential SQL injection in FilteredRelation column aliases on PostgreSQL
* CVE-2025-64460: Potential denial-of-service vulnerability in XML Deserializer

Full release notes: https://docs.djangoproject.com/en/6.0/releases/5.2.9/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
