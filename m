Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF2CD0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEC8E81919;
	Wed,  7 Jan 2026 17:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaKk3n9wxW4o; Wed,  7 Jan 2026 17:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D204882166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808082;
	bh=8X5IOsIibbeRZ07rTE5JepthsbQS5KOBn5qPypBaBl4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sRLYKnJWwFR60xsYSertqOfgEgGL4B5oP4DI5AOjlnKLzUi6zh0QFmpY0lKc3Fnnb
	 sQqYvwjKEyJc///88X9LkeyJOGobgWeUHY/BrSRWW8mCXukOHNYSul73uGhi4lF9tx
	 gqg0i/JoCif4xQ2kNJw1vYvecQY4m7LWjgoS8skwBxzOuKlaasi6F28m2m4BuigTw0
	 GQXPk8sp55JjTHaSKW5V5NjwcwlcVzYrC967ajz8+GuFiBGGGPyWImSUJawu7ik1+q
	 hK0ypQs0IzTgrNo5Ij5dmpPSJcs0EB+E+ClgIHU4y4LfpO2X5XqzZS9bZgcBoUNCTB
	 WAw/vURBzcjiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D204882166;
	Wed,  7 Jan 2026 17:48:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A24A25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A48B760BA4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v17nfWBwFu9o for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61625607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61625607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FA6486FC2; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:07 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e0a2bfea0a4de41f46f9df968bb805ebd893aca4
X-Git-Newrev: a18f729bbabb10590c87460336cd7472e848c12e
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.5FA6486FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/yasm: add CVE
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

commit: https://git.buildroot.net/buildroot/commit/?id=a18f729bbabb10590c87460336cd7472e848c12e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1b656345ecb8353a788f809a2aeca5c580fa0d8f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
index 976c2f7a13..b563fda71c 100644
--- a/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
+++ b/package/yasm/0001-fix-null-pointer-dereference-in-yasm_expr_get_intnum.patch
@@ -10,8 +10,8 @@ For more info see:
   - https://nvd.nist.gov/vuln/detail/CVE-2021-33454
   - https://github.com/yasm/yasm/pull/244
 
+CVE: CVE-2021-33454
 Upstream: https://github.com/yasm/yasm/pull/244
-
 Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
 ---
  libyasm/expr.c | 2 +-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
