Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B367CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 695C5859A1;
	Tue,  9 Jun 2026 13:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fVz7SoFsmQZ; Tue,  9 Jun 2026 13:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AED5859B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010198;
	bh=dsjSOkv5TWVOI18jwZHAOullolKRFg+HVC6ZAzbcUBo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hbiU46O4FuKOlpw3GUutT7MhozvL5mxK7GAnL+7mEui2T21739nfmI5YIEV21KHPT
	 0hH07n3eN45HQhClPxurj3Tee3x1ps5rUEhGj0yNuJh1Qzvph643aMosVAKkAvJHeU
	 rQoplz0RXkSBOF7IjgcjIQqNf8b9fBt+T/14CK4uL2amcheEZFLVtSNm9eSjCvYcU+
	 yAeZLVBKrXSRRkeXVxY1guursoG+sgShQcciNRgxr0Csm/ZL5GJ9gLBDiI/z1xpgb6
	 dtgFKVKNr5aBtdyMuK50kyjBRyYxkBYh9S559qPVb1WqsMsl3F8FpWFAMGUMrPttl5
	 A2tBcika501/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AED5859B9;
	Tue,  9 Jun 2026 13:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF782196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEA2E42706
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwzfygoWed1d for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11FA5426ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11FA5426ED
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DF8387E68; Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:43:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b12c9d3ccccab56c32857c6424a0617d70e613c9
X-Git-Newrev: 9129a431921d51d82eaee66f98d4969534978fd4
X-Patchwork-Hint: ignore
Message-Id: <20260609130119.4DF8387E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luksmeta: modify !BR2_STATIC_LIBS
 reason
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9129a431921d51d82eaee66f98d4969534978fd4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There are two libraries with same crc32 definition

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/luksmeta/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index ddc9b6f3bf..45732733e5 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LUKSMETA
 	bool "luksmeta"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
-	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
+	depends on !BR2_STATIC_LIBS # Build fails because of multiple crc32c() definitions
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
