Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E43AE87829
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E43B83D0F;
	Tue,  3 Feb 2026 13:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSVBoKWLK5io; Tue,  3 Feb 2026 13:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15EB283D12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126330;
	bh=lIquK3nvHziJtxGaYOb06fjUmZwtD3MdW3D/R/ePzMo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G83j80j7/ewSqaa5P60uKAGhJO7yczZkSGZyWBPTStD74N2JoId/25QKZisLk+ptr
	 8lOgdP5Ii8FYzUXnM6umeaXV8cYvYQVKfaGhXriiQ8C8+UsIU352/SHcz6o8GqK1Ii
	 1bHX4RfPsh3xw9EVZ45MIICuqF881uKbrUQnmQZ8/LdCzFmxFevBijAnZnYk634AEt
	 z9I/aRqjWLZpKF/1WcRlRjxgUxyQ/6dfWZBirlzEvv5J/NWr3FzYlj7VzvkmMr2CCO
	 v5rV7MgyKE7pFjxkhzrsBhG0Jy6zpwKbrAt7x8ydXSSaqytYXHILPyaofJrUuro0I9
	 JTjj57MAGoCvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15EB283D12;
	Tue,  3 Feb 2026 13:45:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D1536D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8FE34045D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3OQJcD3sDcp for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D10FC40060
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D10FC40060
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6C1386692; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 14:44:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9abaa88df92f6ac1b18f177b21377280a6ea1af4
X-Git-Newrev: 3848bea3c3cedddf173b621503d351025266ee4b
X-Patchwork-Hint: ignore
Message-Id: <20260203134518.B6C1386692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/podman: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=3848bea3c3cedddf173b621503d351025266ee4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the `podman_project:podman` CPE referenced in the GHSA page [1].

The last entry with this CPE is CVE-2024-3056 [2].

Dropping the `v` prefix from the version to track the CPE version
correctly.

[1] https://github.com/containers/podman/security
[2] https://nvd.nist.gov//vuln/detail/CVE-2024-3056

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/podman/podman.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/podman/podman.mk b/package/podman/podman.mk
index 31cc9ba349..80107f3d9e 100644
--- a/package/podman/podman.mk
+++ b/package/podman/podman.mk
@@ -31,6 +31,8 @@ PODMAN_TAGS += seccomp
 PODMAN_DEPENDENCIES += shadow
 PODMAN_TAGS += libsubid
 
+PODMAN_CPE_ID_VERSION = $(subst v,,$(PODMAN_VERSION))
+
 ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
 PODMAN_DEPENDENCIES += btrfs-progs
 define PODMAN_LINUX_CONFIG_FIXUPS_BTRFS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
