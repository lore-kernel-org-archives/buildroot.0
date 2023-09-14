Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072C7EDE99E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3CE06124A;
	Thu, 14 Sep 2023 09:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3CE06124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuw1Ys0RtDbm; Thu, 14 Sep 2023 09:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C0E61246;
	Thu, 14 Sep 2023 09:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C0E61246
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FFB91BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1C360D72
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1C360D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPMqvOFu1Fhl for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2A856121E
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A856121E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C034D86F2A; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:47:41 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9d86c326431062e376e816044985ef987e40beb3
X-Git-Newrev: ac74741cbf82abdc674bb391895debc462015b9e
X-Patchwork-Hint: ignore
Message-Id: <20230914095229.C034D86F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-django:
 security bump to 4.1.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac74741cbf82abdc674bb391895debc462015b9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

4.1.9 is affected by CVE-2023-36053, and 4.1.10 was released to fix
it. The changes between 4.1.9 and 4.1.10 are just:

f9a14b8f0668029fb7e0aebcae57b60dcec4a529 (tag: 4.1.10) [4.1.x] Bumped version for 4.1.10 release.
beb3f3d55940d9aa7198bf9d424ab74e873aec3d [4.1.x] Fixed CVE-2023-36053 -- Prevented potential ReDoS in EmailValidator and URLValidator.
3b48fe413f91612fb8c43fe9d489860d10c84bf7 [4.1.x] Added stub release notes for 4.1.10 and 3.2.20.
0e5948b8df5d25deb48a505cbf16f010d9dc603c [4.1.x] Fixed MultipleFileFieldTest.test_file_multiple_validation() test if Pillow isn't installed.
66e1e9b006618ba00e804d18bd90d3a9e94801b3 [4.1.x] Added CVE-2023-31047 to security archive.
d1385cc51b142b05b21b721d9d68fc461bc7241f [4.1.x] Post-release version bump.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2397349fa99787a4ccbf75917e113087fa1a67d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 922f468a67..ee1776b44f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  1a6f4e5318e3272deaa9cfd61e252fab  Django-4.1.9.tar.gz
-sha256  e9f074a84930662104871bfcea55c3c180c50a0a47739db82435deae6cbaf032  Django-4.1.9.tar.gz
+md5  3720c85a8c25cacbce2f95d345d0f5ad  Django-4.1.10.tar.gz
+sha256  56343019a9fd839e2e5bf203daf45f25af79d5bffa4c71d56eae4f4404d82ade  Django-4.1.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fa58f65797..61dfd54dcd 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.9
+PYTHON_DJANGO_VERSION = 4.1.10
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/11/ea/8b514434c57c3bef89a475b75f74d768471d8e1bc61f4e5c79daeae9b5ef
-
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/70/d4/eded564fa5928f68771d082ec0eef4d023f9d19dfa1d2923305bc3e62afe
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
