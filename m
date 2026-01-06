Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0B0D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670738102A;
	Wed,  7 Jan 2026 18:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABIsizWWp-OX; Wed,  7 Jan 2026 18:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FC5183560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808996;
	bh=lqF1k/i+LikLwYKs/jmGoPnDZtM11CpfIHlhFzQH3YM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RcnXmGb6HJQaX+1xSLXrjSNfiUNbVWWyd/5iuI3b3EPjNp8FuoGTQ+lElvSn8njr6
	 KC2q1czx/WzKUf5zvdD3h1b/DWhbWkSMzanzEa9a/WsYrMKNf3UN9G7yZ0/D4jhY8u
	 ZOOaPIo1rnlfWnyZhXplpH7xe64B+jq45jnA9sf5YLCBHdIKaNUuxJ6FcYlj+PBGnw
	 vajN0SrM1adA+JyP4lfYk6iDUvMBdv7VC8GOnadiFHyv1QizofKIDzXIRlmqntlZHY
	 qfsABWfDHM7+HWOgpWKmXhSwnbmLfEWbbkEH+VbljNwqghMJytQInufDVoYICnR1+Z
	 0nPRj7jOcEGMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC5183560;
	Wed,  7 Jan 2026 18:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECA025B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6509240A38
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3Iqv3JNQ7MT for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63B8440A45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63B8440A45
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6181881F75; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:03:10 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ed0fb7130fd72ead525d58bcf48826b61c555a19
X-Git-Newrev: 350261e5b9534271ac5a6f4803ac85714cf157cd
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.6181881F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/x11vnc: add CVE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=350261e5b9534271ac5a6f4803ac85714cf157cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6244163284a05ae38a819abcb7b65e03b04102dd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-scan-limit-access-to-shared-memory-segments-to-curre.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
index 05977375d8..015a8c4c41 100644
--- a/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
+++ b/package/x11vnc/0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
@@ -3,6 +3,7 @@ From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
 Date: Wed, 18 Nov 2020 08:40:45 +0100
 Subject: [PATCH] scan: limit access to shared memory segments to current user
 
+CVE: CVE-2020-29074
 Upstream: https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
