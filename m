Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE39C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:12:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832126101C
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 832126101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2F983B9F;
	Fri, 30 Jul 2021 14:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZaFcS4PSgLn; Fri, 30 Jul 2021 14:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FC1183B93;
	Fri, 30 Jul 2021 14:12:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCEAC1BF377
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C50A460618
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fsHI2Q_NabX for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBEE56060A
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8988186544; Fri, 30 Jul 2021 13:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 15:27:34 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 6cbb0d8db9d47eb2ee0db0613fd9da782de5ab66
X-Git-Newrev: 7efeef34ef80139ad1603c0313f680cad767be8a
X-Patchwork-Hint: ignore
Message-Id: <20210730133428.8988186544@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/python-django:
 security bump to version 3.2.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7efeef34ef80139ad1603c0313f680cad767be8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix CVE-2021-35042: Django 3.1.x before 3.1.13 and 3.2.x before 3.2.5
allows QuerySet.order_by SQL injection if order_by is untrusted input
from a client of a web application.

https://www.djangoproject.com/weblog/2021/jul/01/security-releases
https://docs.djangoproject.com/en/dev/releases/3.2.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dd4e09e0e4a8d0daeff62a8998eed250a49e0bcf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index fe91740f5f..2f5f96a501 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  2f30db9154efb8c9ed891781d29fae2a  Django-3.2.4.tar.gz
-sha256  66c9d8db8cc6fe938a28b7887c1596e42d522e27618562517cc8929eb7e7f296  Django-3.2.4.tar.gz
+md5  46e306a5a775cace03a03d5a158ff767  Django-3.2.5.tar.gz
+sha256  3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd  Django-3.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 81a3c8b8f3..1603063beb 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.4
+PYTHON_DJANGO_VERSION = 3.2.5
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/27/94/123b3a95e9965819a3d30d36da6fc12ddff83bcfb0099f3e15437347480a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/95/3b/468fa33908feefac03c0a773bd73bb8a1ab1fb4ee06e9dd62d24981f4603
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
