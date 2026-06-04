Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6EDCD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E996C4118E;
	Fri,  5 Jun 2026 12:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksusMRTawJmH; Fri,  5 Jun 2026 12:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C1CA41065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663179;
	bh=CMFk1V3x1/BnqE3KlAqWtln32tdlHSHME0u1WdiHm7Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c/NPoaUi5E7JISkx/UO30dk1K6ZNjZqgsTqbvAc8C2wc3Ol1i7wMB99Rfh+DGScYZ
	 2klOJrIiITWrxFYAE4zpD2F1Y9PYwmslU2SdXNSZoYJQ8SBEPy7Lqpm7IWY0/O1M5Z
	 0PDjyox9b3djOsk5uDM5PQIUQlnQro+1OsZpWe+NlYlBUkRPlbaKbM7C5FqvbpBky/
	 8RtU4ObdP5ULs3n0YQqlxMFDV4EjFSMDUTKQaYPagmyftEUegi1Z8hV2awdxLr3YqI
	 ylpzVUk914LsHV1pmNXgwGPjTxJq0Jr8da3hVxsXHbg17aIs8bMnL+s/rhWjgDi6Zi
	 HOTrg4BBNNLvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C1CA41065;
	Fri,  5 Jun 2026 12:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 107E23B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4E8741065
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kb4Yk2LA3-cQ for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCA34102A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CCA34102A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6653487B3F; Fri,  5 Jun 2026 12:38:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:46:45 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4e360506605ef79d3f410fdd6c5a120049d50acd
X-Git-Newrev: ae710096ba890f51c5d4f8fccb8a7ff43dda3921
X-Patchwork-Hint: ignore
Message-Id: <20260605123836.6653487B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/podman: ignore
 CVE-2026-33414
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ae710096ba890f51c5d4f8fccb8a7ff43dda3921
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

As stated in the advisory:

The affected code is only used on Windows, all other operating systems are
not affected by this and can thus ignore the CVE patch.

https://github.com/containers/podman/security/advisories/GHSA-hc8w-h2mf-hp59

So mark it as ignored.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit b3c1619c565c15416ec9c0131e1b688a79ae3e90)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
