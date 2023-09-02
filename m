Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74296C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 22:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C43881F9E;
	Sat,  2 Sep 2023 22:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C43881F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvpoilgoRdLJ; Sat,  2 Sep 2023 22:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D66381F99;
	Sat,  2 Sep 2023 22:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D66381F99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5791F1BF3F2
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C9B281F99
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C9B281F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sIqEQsmlRRUK for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 22:12:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0442181F97
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 22:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0442181F97
Received: by mail.gandi.net (Postfix) with ESMTPA id CA0201BF203;
 Sat,  2 Sep 2023 22:12:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 00:12:17 +0200
Message-ID: <20230902221217.3577073-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693692739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iehJmAF+Txw5tbPSpl90vKtBGOxF1vnh5mf5oWtolEM=;
 b=bw+pHA1fBp2g+WcjSVprl1ROdY505dQBFJYOoZAEFT3bbZBj36u11r7WvemKxtLV1ONBGz
 kt2LYIXlUo0BxnyMDHerlbrOcPQn5icwuYJvS4/YuommwKz1A+O5iFCrNiRZtW9P4HjXoD
 8XqCN+YfH8qoOX8Z44GuMHPtsdhAamMMwusSlBJsVZ9yCABP68HErIqSjGnoj1JyB6ndo7
 9OePbCAL8RZRG2G/78BHEug45ZO9sogtnqlg4n9zgGUU6sURq4porUCUWag8TtOi38i605
 EiTPsRWlo1ffmPELQWkpLePep8d+8UTrluBwCa3U+ixzrfuwKWj7tnfD3Ylcjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bw+pHA1f
Subject: [Buildroot] [PATCH] package/python-django: security bump to 4.1.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

4.1.9 is affected by CVE-2023-36053, and 4.1.10 was released to fix
it. The changes between 4.1.9 and 4.1.10 are just:

f9a14b8f0668029fb7e0aebcae57b60dcec4a529 (tag: 4.1.10) [4.1.x] Bumped version for 4.1.10 release.
beb3f3d55940d9aa7198bf9d424ab74e873aec3d [4.1.x] Fixed CVE-2023-36053 -- Prevented potential ReDoS in EmailValidator and URLValidator.
3b48fe413f91612fb8c43fe9d489860d10c84bf7 [4.1.x] Added stub release notes for 4.1.10 and 3.2.20.
0e5948b8df5d25deb48a505cbf16f010d9dc603c [4.1.x] Fixed MultipleFileFieldTest.test_file_multiple_validation() test if Pillow isn't installed.
66e1e9b006618ba00e804d18bd90d3a9e94801b3 [4.1.x] Added CVE-2023-31047 to security archive.
d1385cc51b142b05b21b721d9d68fc461bc7241f [4.1.x] Post-release version bump.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
