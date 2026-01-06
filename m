Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFF0D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B6ED40B6E;
	Wed,  7 Jan 2026 17:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oP9-mdePI002; Wed,  7 Jan 2026 17:48:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 641EC40B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808087;
	bh=sa0YEibRa3DgSfF4r8xaU5im/qy85t8reX94Nr0K4bs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jjnn+0fxRoETnoPvLvwLf8P0ntdD5s7co099x8utSOOCr+70rC2ojViinzO03kpuY
	 Q3IFlmG/0pvk04Yq2Vkt14Z1reM5qBW3uzUj6CVzkfD0+jqiaxKmhdn+gS3nbeXP1A
	 vfVyWkfF7VYJhcbCqMCDGJfJ2n0FxV7A1bSPnjWgsg1r2J2iyNZMr5l7bEfuZUePy7
	 Bem7xvO8Jbw0aboo8EnmqAA4PczE3pgCf5jUrbkVxilLd93Qt4qNbth8TQZW8pkGm5
	 fyg05EXODv5qfwHd6gPbqSGFP81sLPsRoxLZADaFmjK1T5MiA8GDtn4hG7fhR1Kj0x
	 ci1CAg+qGkwaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 641EC40B70;
	Wed,  7 Jan 2026 17:48:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BCB29ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C87486085F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiqBXYN_hXjW for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AFD960843
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AFD960843
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99BA786FC2; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:15 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b97e9adb890b52d7b1a5d430e6fb976535bfcc80
X-Git-Newrev: fe6204462a1e2524818ca69332380f528b553914
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.99BA786FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jbig2dec: add CVE
 trailer in patch
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
Content-Type: multipart/mixed; boundary="===============0658241182970888194=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0658241182970888194==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fe6204462a1e2524818ca69332380f528b553914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51a3cb5db4b4c1be51e7572028555b5a53055752)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
index 8331d5f2a4..dd96c45ebd 100644
--- a/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
+++ b/package/jbig2dec/0001-Bug-705041-jbig2dec-Avoid-uninitialized-allocator-in.patch
@@ -4,6 +4,7 @@ Date: Sun, 5 Nov 2023 12:21:52 +0100
 Subject: [PATCH] Bug 705041: jbig2dec: Avoid uninitialized allocator in
  command-line tool.
 
+CVE: CVE-2023-46361
 Upstream: https://github.com/ArtifexSoftware/jbig2dec/commit/ee53a7e4bc7819d32e8c0b2057885bcc97586bf3
 Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
 ---

--===============0658241182970888194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0658241182970888194==--
