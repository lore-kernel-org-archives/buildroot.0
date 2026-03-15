Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCBBF3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59077610B9;
	Sun, 15 Mar 2026 22:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bL7c0KaanRG0; Sun, 15 Mar 2026 22:19:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C26E6140C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613179;
	bh=stVhz+RDXmYcPsuDDDf6aEgdUja5AEUvnmMBq+Zpy7I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fUXHb20P3sqLP8Nf3Bxs42kx+3C62bfbMom1xwgGDn1txZuLrfgA6Sf750n6Y5Hb6
	 aexnbyrqLNn0fdY/oG5FXqZE6ZUousQZMmSi5s4iEfXPUVRk9AwexzY3e3j3SoNqeM
	 HSXz4WumLGbRvvQU1at8rTlNyBYPlzJVq4gxEHpjz8YHeiUkL3O7mPYBEv33we688c
	 vvUhdrVdld9bjrZzSEZO1gahx+/+LwPhdHMJfvI3AYBSwc1ehzdofrHMEw8wvJ6mWy
	 oBfcfc9Ia2RNZlmsuJ2YSEeqBDrEEYLoVClQV1TCS5J7AQz+gF0NxXzce3jjwljzQA
	 IyArpiT23PynQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C26E6140C;
	Sun, 15 Mar 2026 22:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1BD357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408A140A1F
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbjwH7V9ph2W for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81BAE40AF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81BAE40AF1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3B3080FBC; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f90a703b2733a7c1ca8cbf07249dd32c69cc76de
X-Git-Newrev: 52f5beb7d41789470464c29cad10acb97bf8d1bb
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.C3B3080FBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-psutil: bump version
 to 7.2.2.20260130
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52f5beb7d41789470464c29cad10acb97bf8d1bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/typeshed-internal/stub_uploader/blob/main/data/changelogs/psutil.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-types-psutil/python-types-psutil.hash | 4 ++--
 package/python-types-psutil/python-types-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
index ac43dcce97..0b2e5aa7c7 100644
--- a/package/python-types-psutil/python-types-psutil.hash
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-psutil/json
-md5  4c6196cba53b8b8218bc829681e82a67  types_psutil-7.2.1.20251231.tar.gz
-sha256  dbf9df530b1130e131e4211ed8cea62c08007bfa69faf2883d296bd241d30e4a  types_psutil-7.2.1.20251231.tar.gz
+md5  d4d19bc7bb21bd5ff2c909e425760f79  types_psutil-7.2.2.20260130.tar.gz
+sha256  15b0ab69c52841cf9ce3c383e8480c620a4d13d6a8e22b16978ebddac5590950  types_psutil-7.2.2.20260130.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index f935b28ae0..4a596de1b1 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PSUTIL_VERSION = 7.2.1.20251231
+PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260130
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/09/e0/f4881668da3fcc9473b3fb4b3dc028840cf57374d72b798c0912a183163a
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/69/14/fc5fb0a6ddfadf68c27e254a02ececd4d5c7fdb0efcb7e7e917a183497fb
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
