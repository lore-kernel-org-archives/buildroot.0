Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58ECEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63E0960745;
	Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7Ll_b8pLohC; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80055607E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011331;
	bh=dh+UOcJK2/+YPZRevOcHKhGB0GZZtp2uLmqMz3rqSSg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CI3MIkkw1VAF5Dlrz1q7pognknc6XQBMDZ00TRSbv9RBgKbfz62YGPqYBMyK/VtPo
	 Em3MecFcLugEjyYYB5KgGeFgPp4ae3lLGp8GQBLojpYuyVE2m4NoOmRGNhfWhGiE+L
	 JcL3SxET6CdW3NHCVrcBWMLkdsFNtvbWQ+a0k/fguSOrHx6ZJsoAtnvta3tdTe0fpK
	 VkaAS/1V1qp7+hdrMv566ZXctV9cuSV8N/2mU9PUz9heBsccbzwjApmBiUXoYKzrHO
	 Eqvki5Q2xLDxOV0HAyJu7DO4/gdXL/ZSoLbrpRj83vm5i9+Qi/QeeJhJfJEeHfXKSy
	 41i7j36SeIxIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80055607E8;
	Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FE27283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 511E141E37
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WECfuvHWlQb for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29E1140C14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29E1140C14
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B5D882A91; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 12:04:27 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5034989b1c1c769bea65212bdbfe00d550a39688
X-Git-Newrev: 44034d73fe9702368ab41b59410bab17f9ff1550
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.0B5D882A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 bump to 5.2.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44034d73fe9702368ab41b59410bab17f9ff1550
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Django 5.1 support ended December 3, 2025, bump to 5.2 LTS that's
supported until April 2028 [1].

[1] https://www.djangoproject.com/download/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Acked-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0c9b70959f..1c2b9bcd29 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  232748d1f2d6d1074f873dde91f7d75b  django-5.1.15.tar.gz
-sha256  46a356b5ff867bece73fc6365e081f21c569973403ee7e9b9a0316f27d0eb947  django-5.1.15.tar.gz
+md5  98e667c17123f7bbd2d7d1db32f9ccdd  django-5.2.10.tar.gz
+sha256  74df100784c288c50a2b5cad59631d71214f40f72051d5af3fdf220c20bdbbbe  django-5.2.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 32821e19a0..184f91bfa1 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.15
+PYTHON_DJANGO_VERSION = 5.2.10
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/45/1ac68964193cfcc0b0912a0f68025d5bdb54f71ba7b8716e85b959874bd0
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e6/e5/2671df24bf0ded831768ef79532e5a7922485411a5696f6d979568591a37
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
