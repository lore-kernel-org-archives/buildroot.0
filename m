Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0644C44524
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089D540A64;
	Fri, 17 Jul 2026 15:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpsWzOhX4_mG; Fri, 17 Jul 2026 15:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C588440A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303070;
	bh=inTNbqNDWFuYQmsV83J7DWw4XMJgIZ7FVahANjnZze8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ajhj4NiPV9RA+jr+14IUIEnfezJ3wmyFsZsL2t4/cWgRBAcP30PGZ22B/RC/JZLPP
	 FeRoIeI12S3H6c2xrV70Rq1AG0y7uad4W6Fwc3/YBZ3I++ERRdezjI5PjiBmoxhV3n
	 ci5l6B1pPaqyYqZqFUNtwtLJNqgVsusedbPQIn2rbaCqJPKvre6V1naSNq69CLU3tf
	 rcYi57V2GdVjZWJ9ATm86zbiuNfag5GdjX9l/eUHN70/hkvGUFGwj27WFl0peTtfJi
	 cO3pej9rWGMZOT6Cb75waq/jm9qy5HGdEmtfzTlhzUBQMRfdzgOPYOQbnZkK/cruhE
	 qym0jXWhy5fJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C588440A69;
	Fri, 17 Jul 2026 15:44:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06C3E36E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDA92409C4
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id URQUslW1X9Xn for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24554409D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24554409D5
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E58BE88E52; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:11:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f20bcc4a4ff22d4a47b9e73f7e6d00a9971ab16f
X-Git-Newrev: 487e73e976a49711d0c928ba7ca582cde03193b6
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.E58BE88E52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/open62541: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/487e73e976a49711d0c928ba7ca582cde03193b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
