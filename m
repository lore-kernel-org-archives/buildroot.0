Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B3DE8782D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8B6607D9;
	Tue,  3 Feb 2026 13:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 586GxB8xLDVP; Tue,  3 Feb 2026 13:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7426608A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126335;
	bh=C5CCBJo/cvYKlMloOMubHbA0m9cqGQ96Sfe9N3lyTDU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kmn68eUAa2SHRTmJwCKK77KM5ncFHf0x+FkbUuNluu9Zh6YAbe421BeLk96rz5O2p
	 m5xDxkcKnm2M5xv4rNuEbSHLw7UMBqj8iNb+36ceaYVzxalV3MfbSZZ+fbobDT0O9k
	 rivNtVUPK6CdhEdKAVw3cgGM4oG26GhhAYrT7FHpuYvObUhNAEPRDm1XLKF+whmcOR
	 Q3x5IxWAXoZexv7jwc2vFtHVfKKtb/6KYwUwQyj83lV4G+C6BYR1F0OcpY0ChZKhoA
	 /iN0DQlT6wkoAnzDrv3aACLeFVtwo8IDvgIId4XUgBkPD6Q2bfgeMjBS0VlRqpChd2
	 ua3JICusIf0VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7426608A5;
	Tue,  3 Feb 2026 13:45:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CA59F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D87607D9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIDsrcK75Fit for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF5AD607B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF5AD607B9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A560086655; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 14:42:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bfd193bed7fcb8a3968935067bbe67aa2e5913e
X-Git-Newrev: 9abaa88df92f6ac1b18f177b21377280a6ea1af4
X-Patchwork-Hint: ignore
Message-Id: <20260203134518.A560086655@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: update CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=9abaa88df92f6ac1b18f177b21377280a6ea1af4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/docker-engine/docker-engine.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 37d42edaea..5fe225fbbc 100644
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
