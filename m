Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF88FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899E040263;
	Sat,  3 Jan 2026 12:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw2y57zJgBZp; Sat,  3 Jan 2026 12:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1A78402DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767442262;
	bh=8aT6SNjJyejMgPG837u4NKWJR5GTahJcBgDhXbOmML0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jREBWNIpsHaq+y+qeDrhRxDT1tNW1BE/Ypiz8HPU8u0pj2KyEB7WJvfjrG2qqzIbU
	 aSBK6ASM5eEweqch9APVumyqRQ/7UWIHAAAvr4qNP0CITdI08G+qCJ8l2E+ZIAMtew
	 Gb6jxqbO9rYHKq9vs8GXTIIb9NoAjpR4XLRC39Ia3aPQIIq1OH62I9rBP6Y0YYwNtg
	 KCVu5YMGoIFjbpwaillWMLMXBL7b3E2WpIzNFXe+Y5KUG59qXrzTgbFwXeehQI0DpG
	 cG/Xt/sYFd2nMyKBH8FIeNhaJkN06ZFMjgibkTaraMTi+XAljpAlO428u4gydq+udG
	 fmFMwZtGpLDgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1A78402DD;
	Sat,  3 Jan 2026 12:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A32249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F254D605D4
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wur3pT0Q8DXV for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F46E605D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F46E605D0
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:10:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E8DC88112; Sat,  3 Jan 2026 12:10:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 13:04:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8d1065a86f6e4120f0e196c5cd70b9af71134f4
X-Git-Newrev: 79df2f2e57b9d38c507f55cd3dbfb8b8af6b322f
X-Patchwork-Hint: ignore
Message-Id: <20260103121058.1E8DC88112@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio-reflection: bump to
 version 1.76.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=79df2f2e57b9d38c507f55cd3dbfb8b8af6b322f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio-reflection/python-grpcio-reflection.hash | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index badabd1926..26045afec3 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  4ae2aa3781881acd8df23793965407e4  grpcio_reflection-1.70.0.tar.gz
-sha256  af46ce13e57fd7602deaef5b1d1903f6644f8982cc00f62fa9fa5b928acf6a49  grpcio_reflection-1.70.0.tar.gz
+md5  56a49e3d124061a79c094b053d29c778  grpcio_reflection-1.76.0.tar.gz
+sha256  e0e7e49921c2ee951e5ddff0bdbacbd1ac1a70888beb61d567f3d01b799decb1  grpcio_reflection-1.76.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 4339e31abe..b79ef083f7 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.70.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.76.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/42/98/f76681980ec7e9813e010d2778f4109816650760f6839661ae378286b3b5
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/10/767f9c2719c435616141efb3371f6e158f95cdde36a34876ae1d08ba7440
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
