Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72CFC02194
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 18:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E05083FC5;
	Fri, 31 Jan 2025 18:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoLd2yV9tUD7; Fri, 31 Jan 2025 18:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C2583FBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76C2583FBA;
	Fri, 31 Jan 2025 18:39:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0254417D
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E40A26080A
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sclsizmVFoa1 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F8360667
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44F8360667
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 324E1866E2; Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 18:41:40 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 4ad263555e11842c7188572fc92be31682e11a20
X-Git-Newrev: 48230a4b79ebcf4775ecdc2ad8fdc1b2ed5f1d1b
X-Patchwork-Hint: ignore
Message-Id: <20250131183857.324E1866E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/python-django:
 security bump to version 5.1.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48230a4b79ebcf4775ecdc2ad8fdc1b2ed5f1d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes the following vulnerability:

CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation

Lack of upper bound limit enforcement in strings passed when performing IPv6
validation could lead to a potential denial-of-service attack.  The
undocumented and private functions clean_ipv6_address and
is_valid_ipv6_address were vulnerable, as was the
django.forms.GenericIPAddressField form field, which has now been updated to
define a max_length of 39 characters.

The django.db.models.GenericIPAddressField model field was not affected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c87726dd336b7f9a1cebd26a327e47aa25d8b4d2)
[Peter: Mark as security bump, add CVE info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 53c4ceead3..6632246af8 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  03ec3e0f2d6cbcb9eb11c629ca1c538b  Django-5.1.4.tar.gz
-sha256  de450c09e91879fa5a307f696e57c851955c910a438a35e6b4c895e86bedc82a  Django-5.1.4.tar.gz
+md5  272e951dbc4ccb7854c5a69aa5650749  Django-5.1.5.tar.gz
+sha256  19bbca786df50b9eca23cee79d495facf55c8f5c54c529d9bf1fe7b5ea086af3  Django-5.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 4facc6b6c4..81d526ca35 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.4
+PYTHON_DJANGO_VERSION = 5.1.5
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d3/e8/536555596dbb79f6e77418aeb40bdc1758c26725aba31919ba449e6d5e6a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e4/17/834e3e08d590dcc27d4cc3c5cd4e2fb757b7a92bab9de8ee402455732952
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
