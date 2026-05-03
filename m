Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821D8CD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27AF461317;
	Sun,  3 May 2026 14:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrdCRa-lKjgH; Sun,  3 May 2026 14:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C7B2612F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819852;
	bh=0XIlBCeFsvGzzh5zEJuFT/5In5VnG0763fSt1n1jG+I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y27gVkcPy9dUTtycPMeOkPx5ra4ljDkR4MNmvGKDvjvO05U98OvZcaIH991J7tFIy
	 0s+34qAqu3E0dgQdAH9JFVta93aq1t4enNfmznyQLXKwqpoxb7Q8q2TGV8c1omhGr3
	 VdanEzzL1NnCp8GLP2ngpW2+4iJFS71hA32gW4ke/qTJnMHN3tXvz0yflIZbRBanIs
	 N+XjtMNs1VXK7BayA4OrCwhufZofRFiW/j5l+0Tskw/PaC/gAyR/Pt/lfHNjDdwKI2
	 94sortknqqG25opW20DDnbXtzs1eCVMJZUXq+THMpv2HGrIsDcc34LZVWB9uByOj3i
	 wNwMwl7orbE+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C7B2612F5;
	Sun,  3 May 2026 14:50:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B08190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 541684046D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMnQccTySJTw for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98046406FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98046406FA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5259E83FD0; Sun,  3 May 2026 14:50:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9252f73ffc94dd08d5b1b51fec05adecf1ac337d
X-Git-Newrev: 11a430cfafa7e23c330f596e0b10a9e9364c130e
X-Patchwork-Hint: ignore
Message-Id: <20260503145029.5259E83FD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-more-itertools: bump
 version to 11.0.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11a430cfafa7e23c330f596e0b10a9e9364c130e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/more-itertools/more-itertools/blob/v11.0.2/docs/versions.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 113c243e8b..f19c07f278 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  05fc46d7baf167d89c82a383c9f0c2fa  more_itertools-10.8.0.tar.gz
-sha256  f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd  more_itertools-10.8.0.tar.gz
+md5  cce8548e1d2882b00d83b4b436c7e47c  more_itertools-11.0.2.tar.gz
+sha256  392a9e1e362cbc106a2457d37cabf9b36e5e12efd4ebff1654630e76597df804  more_itertools-11.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index befbb80402..9fd9da10e4 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.8.0
+PYTHON_MORE_ITERTOOLS_VERSION = 11.0.2
 PYTHON_MORE_ITERTOOLS_SOURCE = more_itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/ea/5d/38b681d3fce7a266dd9ab73c66959406d565b3e85f21d5e66e1181d93721
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/a2/f7/139d22fef48ac78127d18e01d80cf1be40236ae489769d17f35c3d425293
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
