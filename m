Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A370BEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC1C8459D;
	Fri, 13 Feb 2026 19:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97YPId3r1piR; Fri, 13 Feb 2026 19:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D99A84837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011533;
	bh=p9wmf22IQgKwnLek+BZyuBlNPZbMN4ki5WAfrFn9AWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d7ZXgDcJgGqtYvDex9M9+CNjGXlw7qm0/NSxXAH9RoQtnVeleQacAVTqVaLptQCtn
	 bIw2uj1PP00s/0VaxrmZiJ009LIJyI50MxfkZxcMuQUYqkROMkIw3E+hYEmgerRtZH
	 ewnR8ovWXObcnDMWS/2mXfEGiBTn859mm2V6A0bkjhG0GfVACj10odmgFj40JlbRki
	 uH6ILzud1sbBj+8/C2iyy9my2QQkyw2+5NvAt5XD8Abu78Kf8smXyj1eABdeyg+1bH
	 5yIUXNyQ5Rp8A6S08pZHtp1kyomCPohmpguosNyyIoVyOCryU2ztAa13iOPFUdCz/S
	 ACTK4VT7ivRMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D99A84837;
	Fri, 13 Feb 2026 19:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A4FEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE004412A0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO9c6c6AE2gM for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A3C54130F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A3C54130F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EA7185DA7; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:30 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d94991e1f0267dfdf385d8d463efd61523273915
X-Git-Newrev: da873e5a114de478b7d4cc4d5ba2ea6ca6b06193
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.7EA7185DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/podman: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da873e5a114de478b7d4cc4d5ba2ea6ca6b06193
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Add the `podman_project:podman` CPE referenced in the GHSA page [1].

The last entry with this CPE is CVE-2024-3056 [2].

Dropping the `v` prefix from the version to track the CPE version
correctly.

[1] https://github.com/containers/podman/security
[2] https://nvd.nist.gov//vuln/detail/CVE-2024-3056

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3848bea3c3cedddf173b621503d351025266ee4b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
