Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A0BD66BA6
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA59440317;
	Wed, 17 Dec 2025 20:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rd8ZVwFflsLD; Wed, 17 Dec 2025 20:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 259B740256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766004644;
	bh=BxzH9cw8gDlmUQ8u7xC0+0z/GyYBH2+D9cQgzdnS4gk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rvVg4W7bzP8cB5OgyoH5ZRJZez2pbfyctGgley5o+zUi2wptY6DomgwAwclBQXz0B
	 N66rvEgmp3fnDQLWYCfgloKg0wuF/2wRcuz5g5sMyg0Aqz+6DoTewC/VNjVLzQafsi
	 m7PWDl1jzm/7EA5XUAriNzsl26N7BBXqBNSVTy5LT133RKfDMj0G+lECEMr4s5W42b
	 qIK1Eyt8AFEuMlSnpqi0AmW7F92d3k/DfzMOvRWdgQ4foQxZqBZKMbdqoeN4zublhO
	 Vi/vr9WP8Axo8Pl8Ll/jmGeTX1i/GJPcSWR/PpwZjyRpDbUbRDiuIwRi3hd2Z2Pqse
	 MOJmA3fCY3PZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259B740256;
	Wed, 17 Dec 2025 20:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FEFE35B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E7D9610D1
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWOo5PGmeqCe for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B16560B89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B16560B89
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:50:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 496CB870EA; Wed, 17 Dec 2025 20:50:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 21:46:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c958889b10fe377942493ffa87f05ee9d582bc4e
X-Git-Newrev: 4ffd6166a639a63dd4f00eb735f8dffb78733bdc
X-Patchwork-Hint: ignore
Message-Id: <20251217205042.496CB870EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jeepney: bump version to
 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ffd6166a639a63dd4f00eb735f8dffb78733bdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/takluyver/jeepney/-/blob/0.9/docs/release-notes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jeepney/python-jeepney.hash | 4 ++--
 package/python-jeepney/python-jeepney.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jeepney/python-jeepney.hash b/package/python-jeepney/python-jeepney.hash
index 31a5bac183..4e405bfd34 100644
--- a/package/python-jeepney/python-jeepney.hash
+++ b/package/python-jeepney/python-jeepney.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jeepney/json
-md5  7e2151e9197c751ceca6550bc6b3294c  jeepney-0.8.0.tar.gz
-sha256  5efe48d255973902f6badc3ce55e2aa6c5c3b3bc642059ef3a91247bcfcc5806  jeepney-0.8.0.tar.gz
+md5  d0c0d388ee003d6475750aebe56fc699  jeepney-0.9.0.tar.gz
+sha256  cf0e9e845622b81e4a28df94c40345400256ec608d0e55bb8a3feaa9163f5732  jeepney-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-jeepney/python-jeepney.mk b/package/python-jeepney/python-jeepney.mk
index ac4c0283a8..f61e54b871 100644
--- a/package/python-jeepney/python-jeepney.mk
+++ b/package/python-jeepney/python-jeepney.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEEPNEY_VERSION = 0.8.0
+PYTHON_JEEPNEY_VERSION = 0.9.0
 PYTHON_JEEPNEY_SOURCE = jeepney-$(PYTHON_JEEPNEY_VERSION).tar.gz
-PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/d6/f4/154cf374c2daf2020e05c3c6a03c91348d59b23c5366e968feb198306fdf
+PYTHON_JEEPNEY_SITE = https://files.pythonhosted.org/packages/7b/6f/357efd7602486741aa73ffc0617fb310a29b588ed0fd69c2399acbb85b0c
 PYTHON_JEEPNEY_SETUP_TYPE = flit
 PYTHON_JEEPNEY_LICENSE = MIT
 PYTHON_JEEPNEY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
