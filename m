Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DF9D68BC3
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE26D61187;
	Wed, 17 Dec 2025 21:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5gCog7d8tv3U; Wed, 17 Dec 2025 21:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AC1611BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007925;
	bh=0t/qznwJzdT7/pnnHiGmuxmF/wyi83DOVHMjNZCIqnA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z/1oLLHkiG9kHejI4BDwPfMm2D5cPEE5F0RHmwhr0c8a6BklT6SzcZgiWdNL7+z3U
	 RGhYqfRhlRV/IOXgRTFVt8UofSVhLceBPzNsOlYSr/lAFhwTAP4acARAN/vaWehjNf
	 VXPEyptcphQa3e37ZIuTF3c2LC8LF3e2w/n8xEJny2/4WWD+ZmfGP1F2+wTyU35KqV
	 shKvzvHktyJd0Ypy3WUnmCqelRTcs8B/srt7PgCDZgD9bSD4LUxaZAxCIAfFeNqGh6
	 pQemj3/oOHIQCM1I10XwUUfUC653RUyfEH3QfEbofob1Ofp9EXptVym5jvrNEfqWnt
	 1ygkDnMs58PJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7AC1611BF;
	Wed, 17 Dec 2025 21:45:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D2FB375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09594401A0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 694rC9d0RyU5 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C086D40F7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C086D40F7C
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE5178120D; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:11:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7074ac656a7aa484c7d25e3d7f6532829efb5292
X-Git-Newrev: b4b951da9203fa8195366397d491631fe3dcaad1
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.BE5178120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zeroconf: bump version to
 0.148.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4b951da9203fa8195366397d491631fe3dcaad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.148.0
https://github.com/python-zeroconf/python-zeroconf/blob/0.148.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-zeroconf/python-zeroconf.hash | 4 ++--
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index cf49e6f21e..3e9a2c06ec 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  13003da434beff520db50460d8d603bd  zeroconf-0.141.0.tar.gz
-sha256  c0c41cfe1331cf885f132dd2400e4091f59ae0a571cae14f3db66919a055489b  zeroconf-0.141.0.tar.gz
+md5  adda1c72099e20b2968ff7f22d9f6f36  zeroconf-0.148.0.tar.gz
+sha256  03fcca123df3652e23d945112d683d2f605f313637611b7d4adf31056f681702  zeroconf-0.148.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4d1d974999ae8655ee47afb47ac3b327cd1baeea3509aecb35341ba1a1a53c94  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 7f14651b86..fe7676e2ee 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.141.0
+PYTHON_ZEROCONF_VERSION = 0.148.0
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/d1/36/78f2cc563958d55b079c977ad2d4ae5d8b182f2dab9f1224d89c9b1311d3
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/67/46/10db987799629d01930176ae523f70879b63577060d63e05ebf9214aba4b
 PYTHON_ZEROCONF_SETUP_TYPE = poetry
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
