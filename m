Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93BFEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A952961524;
	Fri, 13 Feb 2026 19:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i7MUIyRlDmv; Fri, 13 Feb 2026 19:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD5561542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011389;
	bh=FnCRiha6LgUGrKNku6J7BJXwvDvI/V8wYvvzLKeuhrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nGGUTr15um6gzQzR69sHFmJpShVNjsTC+ZkLksaPAz/I3n+MMWxnJFrfW7Q67xHpb
	 6U2Gm1ssflUu2sZoQ48DjeEgnQBBrz7iWrocX6AuZTPSGCmsUiEEr9dwJ2ifrWsrH1
	 ppHQo5xsbXdwT1UkPQ93Ye/H5/P9asChaaSYDU7Qj/tDBQzHmQERmqHxBHpwgd9G54
	 EwRjpMco/RUt4mv8SbrBo1QdqzLbsoi0vkUAyky2oRfGOB9+HXItN0NjjBb6B5r/qR
	 /JV022uJFKx2yPwAB07CzPU/dbxfvbS/bbTyN9RQGzeX9NLhp5qKxPSyiL6zlgPVWK
	 LpC9GMyO1Zc2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD5561542;
	Fri, 13 Feb 2026 19:36:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F1EA283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6772584520
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHJ5_oom_dLY for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51DAD844FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51DAD844FD
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46ECC8268D; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:59:51 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1e214ab549d641a575f98ba922520c65e11c3aaa
X-Git-Newrev: 2d82944aae5ae25152422e608633ab7fbc498f34
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.46ECC8268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/docker-engine:
 update CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d82944aae5ae25152422e608633ab7fbc498f34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

While `docker:docker` is not marked as deprecated by NVD after a
scan through the CVEs the last entry for `docker:docker`
is CVE-2022-34883 [1]. Replacing this tuple with `mobyproject:moby` that
is referenced in the upstream project GHSA [2]. The last entry for this
CPE is CVE-2025-54410 [3].

Note: Quoting [4], "Moby is an open framework created by Docker to
assemble specialized container systems without reinventing the wheel".
The old github URL [5] redirects to [6].

[1] https://nvd.nist.gov//vuln/detail/CVE-2023-5166
[2] https://github.com/moby/moby/security/advisories
[3] https://nvd.nist.gov//vuln/detail/CVE-2025-54410
[4] https://mobyproject.org/
[5] https://github.com/docker/docker
[6] https://github.com/moby/moby

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add the note about the Moby project]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9abaa88df92f6ac1b18f177b21377280a6ea1af4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/docker-engine/docker-engine.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ba4e7a4ae0..7aee63cc29 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -13,8 +13,8 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
-DOCKER_ENGINE_CPE_ID_VENDOR = docker
-DOCKER_ENGINE_CPE_ID_PRODUCT = docker
+DOCKER_ENGINE_CPE_ID_VENDOR = mobyproject
+DOCKER_ENGINE_CPE_ID_PRODUCT = moby
 
 DOCKER_ENGINE_LDFLAGS = \
 	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.BuildTime="" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
