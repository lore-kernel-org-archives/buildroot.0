Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35248CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B12E4065D;
	Sat, 30 May 2026 09:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5msSrALitCAx; Sat, 30 May 2026 09:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3359340750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780133013;
	bh=5bnQz8dtWOq28OlKebAZabNGqz01io/N+o4lAkcTDAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CXhz4IVTbNfUIcQrkBcHJXvlwPc5yOmS4nCjGsX4DaeRB7SY2IBScvg7x4RLA/jns
	 xr3bH50hE+DqTNRUgiRo5ewp626+GtrM+9TVzPDcJmEdKx7CizRD2ZnIbad9yMAKzB
	 Gs7l1pDaQcohtqKaIurB8jGc9rKbdLg1OQCKPK/dHXUEYkt42aEE78ZSiB7DiiLNfr
	 L5EUbcps3C1PS8gH7VnusZB677r5kK1d2egN5tSs91iZXgzHTeq1cAxJYmvieU/YDg
	 oK8imtHKdzVrhAloHEnC4uYfdAXNuR/I4RSkNww0lii9ajN/Fu943QhjNzztLfrurb
	 2U3jFGhC8E6dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3359340750;
	Sat, 30 May 2026 09:23:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65253D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 541F140750
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLIYq29F3sLh for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 773E04065D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 773E04065D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:23:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 607C186F89; Sat, 30 May 2026 09:23:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:21:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a2602d10a16e1d32d619fa8dfb696df81265a2c9
X-Git-Newrev: 5d7800b210b535f98b959de4a00d88482fe983e2
X-Patchwork-Hint: ignore
Message-Id: <20260530092318.607C186F89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/powerpc-utils: bump
 version to 1.3.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d7800b210b535f98b959de4a00d88482fe983e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/ibm-power-utilities/powerpc-utils/compare/v1.3.11...v1.3.13

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/powerpc-utils/powerpc-utils.hash | 2 +-
 package/powerpc-utils/powerpc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 32387014cc..d24017684c 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6bb16078068d8b889afdd78927d2f061702ef155e57fc548ae573e2b0b90ca13  powerpc-utils-1.3.11.tar.gz
+sha256  35efb04063f1b7bd9d715f1d8d3ab75352b595b1fd12349d7570a7ba19ba6d86  powerpc-utils-1.3.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index ddeb830b07..38195835e6 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.11
+POWERPC_UTILS_VERSION = 1.3.13
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
