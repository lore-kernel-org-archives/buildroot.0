Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A544FD0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78498415EF;
	Wed,  7 Jan 2026 18:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 695k0vx_icwD; Wed,  7 Jan 2026 18:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C00C415F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808997;
	bh=ftDyHlcU67iRRjmcHLHff744nlWVRO3mGIDc2sXLhTk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bTCkgpG+a6wzzteSl46pG6ZfV8ClXkHb8ZOrjOjhHRqZ/0+UcmbXCriecQk5GsNC8
	 yGdYWGef+8VPwmNfWXHl2jbiP6YOwXRygI3w8mKUcOQfXGW5uNtFdIzSeNcESBanro
	 RTJCiLCVBeM+bp9uQul62kbRn1i0abD5hPmlqimMzsQhDD85EtLmY8vTNdpl+8mHFn
	 ipKUZeTddWQtgJGVZiQY/hambky4lkwLWAr9mtKgan6IYFZbZtf5pZa88tmj5ed5VK
	 EEz17w/BPOoAPBgOBx5zkaX1RjMZNzFxr+zqDwlhIDOBMKAt98VF26lzmUxlRzW0tu
	 iqnOtzTE+3ozg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C00C415F1;
	Wed,  7 Jan 2026 18:03:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBD5A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8327A40A45
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLnVjlbM-_EV for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6A940C80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B6A940C80
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7907F81F75; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:07:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: e071e4dd0f61bb6886d2fce60cfe30c5c65f047f
X-Git-Newrev: bae0e9a4534c569869dd2596874515403c1959b3
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.7907F81F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/lua-http: add CVE
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

commit: https://git.buildroot.net/buildroot/commit/?id=bae0e9a4534c569869dd2596874515403c1959b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
