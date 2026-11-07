Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E73606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C5Peybgr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D6160671;
	Sat,  7 Nov 2026 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFtHsGsf7_UN; Sat,  7 Nov 2026 17:15:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E5D5A60658
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794071719;
	b=M6HCCa+091x1d6T2xlkMOWHrRfz0uY/yEGAdKW5L35BAn5aRog7CrRNDgdUAImzKIN6h
	 zVvguG878yShWdkz/DjMnK0aQBsg0ngEBjTDDxmGsePhdc+GhwPndbm+z6c5tWVDT3MeY
	 0Df8n/bhK1F3IdZS71U0vDATyRWdPv03nAIPdRQKQ6dfU2V5FI/QY02PtJP53tPPhZT0q
	 pQBoxu/fJSwAGACqb/InKYzmuR7BqQxb/woZNZI6xSa1W/J3DrxWfEJOGtcTMUFv5IT4W
	 87TropvoKG6Mxsk19ONFXguTMgLuh6D1sO2IFC7p7fysBuf39067m51XWN1U9/rJbmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794071719;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YDd9P7K9QjtHgiwCl0FYAMngDZnrDu7Dp+/GWk9ZBSA=;
	b=CIyJ6X3gTecoqirHiNVIWGg4p0i2JiBVx1JXu7qpKAYUx5Eu8bQPu5csufdO0NA+r4fC
	 /gPImU3TpnaM7CsqSvewdGsraC/LzkBNHWOeodfTiBWHygY+d60C4TR0PzDW74SFBEtWU
	 mjjNBkU3dfU2AY6rFFHsMmKaGYDh31FpKk+hCdYU021gS/59ssNcN19K0dYf3yMiIppee
	 49TTEZ3sX6UiChL2aeTVcnu1NMCA3WZcH98iXch0vx95S0f/I5bpDnt+Bf3XCoOrI9amU
	 c0N06CF0jzS+cSb9kQ07lp2ZqYWdUkRHh9JS5ig/EllF9y9oXjou91++g/I9xz5GTVA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794071719;
	bh=YDd9P7K9QjtHgiwCl0FYAMngDZnrDu7Dp+/GWk9ZBSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C5PeybgrgINqf5uIWz8QH9W7vA+sOMDgrFplFnIts2gVoVRTS/lVqd2XI4V4lfiR2
	 yxQxS+PHofUvhpKTma1eyh/s2H4SVzHjmtk/G89YrdOVI4x8W7ybNhRhBbCw49edaK
	 Lhas9Zt6I6UYgAPlzcByhLW1h80jzWDjPHSBVQspV8KjqwevgTtmw1sKw+8OXxJ/8i
	 oj6YHLcZnzM0iqxtFfvgJmdBp04X/42mGw9IhL5n1F1W9OtqsGBFUZE9gaxSYZ3S87
	 aFPbIvTUQOiLBDXAoUTfphdM8kMTk0sBn+F5mV4If5ioJHyLjCcU8/6W8x5zoUWyHW
	 jmBPL8SUGsrHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D5A60658;
	Sat,  7 Nov 2026 17:15:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31A9D32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1795860608
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWWn28sx_B06 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 17:15:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0D8BC60658
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8BC60658
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:15:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D418886C4; Sat,  7 Nov 2026 17:13:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 17:50:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acda85c85827c123a5238f3628009d8ae3ec0735
X-Git-Newrev: 8f1de081c25b823d10a43921fac4c381ca3e70ef
X-Patchwork-Hint: ignore
Message-Id: <20261107171342.9D418886C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swugenerator: bump to version 0.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f1de081c25b823d10a43921fac4c381ca3e70ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Starting from release 0.7 swugenerator depends on python3 lzma so select
BR2_PACKAGE_HOST_PYTHON3
and
BR2_PACKAGE_HOST_PYTHON3_XZ
in its Config.in.host

For release notes, see:
https://github.com/sbabic/swugenerator/releases/tag/0.7
https://github.com/sbabic/swugenerator/releases/tag/0.8
https://github.com/sbabic/swugenerator/releases/tag/0.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/swugenerator/Config.in.host    | 2 ++
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/Config.in.host b/package/swugenerator/Config.in.host
index df0e9a5170..0d2b63b6bc 100644
--- a/package/swugenerator/Config.in.host
+++ b/package/swugenerator/Config.in.host
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HOST_SWUGENERATOR
 	bool "host swugenerator"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_XZ
 	help
 	  A host tool to generate SWU update package for SWUpdate.
 
diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 75a902f2c4..c5c78aa5ad 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  06098c4b3a6c3e5946a11929f95f280baacb512fc4154e16af2262c60a36cbc6  swugenerator-0.6.tar.gz
+sha256  4c434a3d49a0a98076ef160bd3ec90f5c83aa7e6fb22f29a52d7db0e53b7a028  swugenerator-0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index a892002369..2076d59ef4 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.6
+SWUGENERATOR_VERSION = 0.9
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
