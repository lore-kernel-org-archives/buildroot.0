Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DD6D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D1B140949;
	Wed,  7 Jan 2026 17:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rD_9gXW3_41k; Wed,  7 Jan 2026 17:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CACE4092B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808120;
	bh=fIZd1MdNOZr//f0UB4HxssuUE037yCXbvbXY0lrQ6hA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LHXAVuoiMoc3lMbY96O0EecSc8S8j3f/objGoYxpO1/AI5MUlEO9V+mgpaDZ0jJvt
	 sgEZUV8d/tOVHLZvsoeqf9njYQlXAUU1OjhpDipYXjCF/Pfm/4Q9evBBMgRlQxV7J2
	 gfIhSW1yU+SWj1vJNDRhhdNhil6ihCY1tDXU5W67/CFMiTilVmS/xqIfIztycpj87S
	 KKzZpQAjilpgMbQysxxc/P6dC4pf+dSxyB3cJBGiq87f5vx065eFgUu0pq/XB3QO59
	 QRz/t50k1H8ldZuKau5qDZ/q9O3O2/xUR86zDIJdBy9u8bCd+QedOLRhn8rjxWbr0J
	 y8i2qcbt7hh9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CACE4092B;
	Wed,  7 Jan 2026 17:48:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04DF625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E069380D0F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDECHQ7dZzzz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BBC80CD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68BBC80CD1
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67D6A8225F; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 41af7465004d3db8db6f6c43f515ef9a562f8190
X-Git-Newrev: 0be4ecbd7ed8ff8d37de0121d9911eee1bb35400
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.67D6A8225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lua-http: add CVE
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

commit: https://git.buildroot.net/buildroot/commit/?id=0be4ecbd7ed8ff8d37de0121d9911eee1bb35400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 848d7dc51f1ce2576cb071b0f91063e4687cc088)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
index fdbf5243f5..7672ff3794 100644
--- a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
+++ b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
@@ -8,6 +8,7 @@ then return `EPIPE`.
 This fixes a potential infinite draining loop when trying to trying to
 `:shutdown()` a stream.
 
+CVE: CVE-2023-4540
 Upstream: https://github.com/daurnimator/lua-http/commit/ddab2835c583d45dec62680ca8d3cbde55e0bae6
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
