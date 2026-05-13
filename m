Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C0DCD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A685141B65;
	Fri, 15 May 2026 13:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckrtOwTeRXcy; Fri, 15 May 2026 13:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9AB341B47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851814;
	bh=XhLKqA7rteT6HiwjuYbPOAOyTzMGIipLmX5UdGjIwss=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E0MEv3ZGiPHIZq5VrTMhHpMWbvKFF2iL15cXY8OiucnTupwwqRkDxTA8gGhbSdf6H
	 9vveEO7uwQVecLigo/EBOHXlwmkSnPSatezB8Nuixm7Nz3hsdpTjfjGv/ClGVfNC+Z
	 Ll3mom3V1Wavd3P1xpDUMnr5Cykcpts8a54Y/J/KOuVlJTuiTn6YgBhqHa5J+xTQz6
	 6KpZQMIV4Jiw87ScJV/yVeJQ/tITxp31vE3XsZdCX06sDLkulI4MWPyksCX6m9G8Dr
	 NVBK55b1rTv8Ojp1Y/+P+NihIZbbscYTr5rn8WIviVDN+g19/osI0IKcrGxbXhfzS0
	 ZXdIy13NXoiog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9AB341B47;
	Fri, 15 May 2026 13:30:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D68736F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F03FC40A78
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LO6vNgQ1KBu6 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ECED41ABD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ECED41ABD
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2E8586354; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:57:53 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: fc08d9c32c813247d3018778ac457dd16e35d928
X-Git-Newrev: e90e6c7aa9811c933647c70769a08f540afd3f04
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.E2E8586354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-cbor2:
 security bump version to 5.9.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e90e6c7aa9811c933647c70769a08f540afd3f04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/agronholm/cbor2/blob/5.9.0/docs/versionhistory.rst

Fixes CVE-2026-26209.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b676a4f51b99ac9faf437eecc637293914809d88)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 2c72626637..b4d3025889 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  43d53d2eedc711252f5f66b1e05389a5  cbor2-5.8.0.tar.gz
-sha256  b19c35fcae9688ac01ef75bad5db27300c2537eb4ee00ed07e05d8456a0d4931  cbor2-5.8.0.tar.gz
+md5  21a7e1096c25ef19a81730e2c0ce05a6  cbor2-5.9.0.tar.gz
+sha256  85c7a46279ac8f226e1059275221e6b3d0e370d2bb6bd0500f9780781615bcea  cbor2-5.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 6f8bc31996..859ee4a1b5 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.8.0
+PYTHON_CBOR2_VERSION = 5.9.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/d9/8e/8b4fdde28e42ffcd741a37f4ffa9fb59cd4fe01625b544dfcfd9ccb54f01
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d155b5d4ac262e39877875f5f7e36eea66beb359f647bd0
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
