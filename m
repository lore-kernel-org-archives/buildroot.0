Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217AAD5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9C860E20;
	Sun, 14 Dec 2025 21:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kxsui3y-AB_7; Sun, 14 Dec 2025 21:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C2460E07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747318;
	bh=8h0Lyc7usEWZwdliVqYcm5rJZXVUkhQJ2iRHqhLIzlw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XptZ86/e3xgIO07IGzU+X6yWJrDlUQqVaPrqhUU4DI/4OrlYarefXfnXynticzOfh
	 gaZKr/RIVQiXQdLDovYFFJKWcfHTHKrELPclB/hLg6WwsTrxL/EMTaY7oaDj7en1HB
	 9ljk9DtHMpukkAbvLZKnZu0WYuMxFz/jMdAYXUZCAVPO7otX21F0TbOCG/mpGPPjP1
	 w9oYtpH1P3M59tEqxucnIRWig0hm/NG1dlA0FhLaj6qOyQxA+H2lo26cdopjYWZO1G
	 K0rvEVA8zUzWXs2L+Z2ZtuD1RbHkmTOPfX66bk2OMKVfNrVkIcssYyJ9wRYf6Pg2lu
	 JpaxgXeXN1sdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7C2460E07;
	Sun, 14 Dec 2025 21:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F98F2ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008BD40676
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnjlZKuAjdnb for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49C840680
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A49C840680
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A21037FF02; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc81f995cc9f1d965e29d2f55ff728a0e065ed86
X-Git-Newrev: e0bb91fd64135c285fb61c0a3c5be234b5dd624e
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.A21037FF02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-humanize: bump version to
 4.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0bb91fd64135c285fb61c0a3c5be234b5dd624e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-humanize/humanize/releases

Updated project URL according to https://pypi.org/project/humanize/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-humanize/Config.in            | 2 +-
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-humanize/Config.in b/package/python-humanize/Config.in
index f4f4e67b65..b47fec5027 100644
--- a/package/python-humanize/Config.in
+++ b/package/python-humanize/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_HUMANIZE
 	  duration ('3 minutes ago') or into a human readable size or
 	  throughput.
 
-	  http://github.com/jmoiron/humanize
+	  https://github.com/python-humanize/humanize
diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index ea30ca5c22..86dfd80b78 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  c37298e6bc6604b54aeb0e158c7c0512  humanize-4.11.0.tar.gz
-sha256  e66f36020a2d5a974c504bd2555cf770621dbdbb6d82f94a6857c0b1ea2608be  humanize-4.11.0.tar.gz
+md5  acac6b2378dd0d9b1d9d1ffefb08e00b  humanize-4.14.0.tar.gz
+sha256  2fa092705ea640d605c435b1ca82b2866a1b601cdf96f076d70b79a855eba90d  humanize-4.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 4915da2cef..df2e99043a 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.11.0
+PYTHON_HUMANIZE_VERSION = 4.14.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/6a/40/64a912b9330786df25e58127194d4a5a7441f818b400b155e748a270f924
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/b6/43/50033d25ad96a7f3845f40999b4778f753c3901a11808a584fed7c00d9f5
 PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
