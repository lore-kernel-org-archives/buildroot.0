Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A707CC4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BC4940AF3;
	Fri, 17 Jul 2026 15:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8Vcdmn6n8nl; Fri, 17 Jul 2026 15:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E3740ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303165;
	bh=VhZYwLb9gVJJtlUyCQ0A86pJJW2+8NS/6dRMj/KLv08=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KClTQbYk57U80QihoUyn4lqeyNf3xpLUUCD5rzkVuvwgyH+XMObFTxugdB+gfomGE
	 iBMrSoC0BOxT9rrGVR18J2HP450N5b6D/mCLg42jwyjP/hHkFTjZNd1MHXZTwT9S1D
	 qbZc1xHhTlk0sBzxdCAl/HY2HiVrcEXBz9qyVFMRmFy3WCr/AtvtFP4XayZwkweg0R
	 RLP4jh4kcDUY6N05JN83lpJBHyB72AOak5pKEULrpWLHHwD3e5gFxzOsZqy66Fv/dp
	 pwOHutiJC+kOEtUra10Rg1bmRLfx/XCvH8m149DBzb+HvfF0rYEbC+h4OKzr4+FNvQ
	 3idVda3tmlawQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E3740ABF;
	Fri, 17 Jul 2026 15:46:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED0B1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E883240626
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8btOV7kA1vb for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 555BD40A5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 555BD40A5B
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 224DA88E52; Fri, 17 Jul 2026 15:45:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:11:55 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: f85f4793ffa286815d3b04dbf38867b918c9ace8
X-Git-Newrev: ce1c0d26090c56b7a120f6d826b95759e0bd8f81
X-Patchwork-Hint: ignore
Message-Id: <20260717154511.224DA88E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/open62541: fix
 CPE_ID_VERSION
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce1c0d26090c56b7a120f6d826b95759e0bd8f81
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Remove the prepended 'v' coming from the git version to correctly match
with vulnerability such as [1]

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-25761

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 03d952c5e206c4fe92bce426eb02c628f2e92c2b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/open62541/open62541.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 0d1abf724a..8d9c5e44bf 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.15
+OPEN62541_VERSION_UPSTREAM = 1.3.15
+OPEN62541_VERSION = v$(OPEN62541_VERSION_UPSTREAM)
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
@@ -12,6 +13,7 @@ OPEN62541_INSTALL_STAGING = YES
 OPEN62541_LICENSE = MPL-2.0
 OPEN62541_LICENSE_FILES = LICENSE
 OPEN62541_CPE_ID_VENDOR = open62541
+OPEN62541_CPE_ID_VERSION = $(OPEN62541_VERSION_UPSTREAM)
 
 # Force Release build to remove -Werror.
 # Don't use git describe to get the version number.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
