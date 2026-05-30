Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84041CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0967F85018;
	Sat, 30 May 2026 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwpAat5UjEMh; Sat, 30 May 2026 08:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2473085010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129679;
	bh=FSq1UtGNpAfyQ5b86zHet9YR938V5XeqZpsi4+9py0Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CiXXS+sEN/MMRGymlb8oluymjkBaLeDCe7uXr5g1r5jFtSh/GqJsc2azWlosNHAkq
	 EQdz1lczhsNd2nDoAu9zs4s507U9wcGEgDRHDazaNQnHF5djwJgX9ehegzs1kug5E2
	 178HchyvkP0WXpWlmTnKF65c8kVpBl178DlV4Qotr8N5XHvd5+car8o62y5/Jg+6Vo
	 PEHqUrl0wqERcGbGisLsIf4FqSMR5g2JqsKED6u26tqq8lAQ5Bzt3eKM/818p6PZKV
	 UzprKnJBkVmGeulkXqEdkrxbtHXvG3fMnFl7IFDZS/saX8LME4C0jIJnqZK2QAKyd9
	 sO0LNciO601+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2473085010;
	Sat, 30 May 2026 08:27:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E71F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F72340608
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2I6WStsECiN for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DC3940363
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DC3940363
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77CD883A36; Sat, 30 May 2026 08:27:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:27:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da01b7271a4a9048ae8e8ae18753edc5da785a44
X-Git-Newrev: b3c1619c565c15416ec9c0131e1b688a79ae3e90
X-Patchwork-Hint: ignore
Message-Id: <20260530082744.77CD883A36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: ignore CVE-2026-33414
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3c1619c565c15416ec9c0131e1b688a79ae3e90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As stated in the advisory:

The affected code is only used on Windows, all other operating systems are
not affected by this and can thus ignore the CVE patch.

https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59

So mark it as ignored.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/podman/podman.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 80107f3d9e..f601f7e6d7 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -33,6 +33,10 @@ PODMAN_TAGS += libsubid
 
 PODMAN_CPE_ID_VERSION = $(subst v,,$(PODMAN_VERSION))
 
+# Windows only issue:
+# https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59
+PODMAN_IGNORE_CVES += CVE-2026-33414
+
 ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
 PODMAN_DEPENDENCIES += btrfs-progs
 define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
