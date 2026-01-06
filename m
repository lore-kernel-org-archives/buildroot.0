Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94712D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C69A8376E;
	Wed,  7 Jan 2026 18:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQVgxFkga9KW; Wed,  7 Jan 2026 18:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F71183705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809011;
	bh=q2HH+3JLF6kn/shrjGDWy7b+jWJOOZR5hY3g4XIsc4E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nc3w9eOu/FxtQqgsrG333x14DD2/j6CIhx9DWOtul/Qp5pAG39T/KOP+val35c2zq
	 C2pOuEW0zsnd9y2LqeS4apNqK4n0BDVmiJqzhzRw4D4wfxw5EC6Db52c1/iODuVbUc
	 fMJOqwSI7nV/tvTefPma2Xuekfh6YGWqVCJ7DBwZrbDPogNVDxXttaEkEM5TivGV2w
	 QOe19r2Kr0dh/NSdG83H1T4oeC2r0+GjRMo4XSkpacffnFJvoEC5x8zoa/sySQYwRg
	 +j8+KBuIm/JW0FsSD1K0m+0T+ZhOE5xCLpxYE3OwFfle1UtWoc+1xjjEpRoZycU1IF
	 91XJmQu05+1BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F71183705;
	Wed,  7 Jan 2026 18:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F962A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA36F80EB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpOUv3_vq9yw for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AFF781109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AFF781109
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 990BF80333; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:09:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7ca4625da76069dc181d6c88eadffcbd3856d801
X-Git-Newrev: 0d2f7675a2d9a0bbd5a99379a04b8d72aa70720e
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.990BF80333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libtomcrypt: add
 CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d2f7675a2d9a0bbd5a99379a04b8d72aa70720e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9265e6973593240104c8f9e2a675c01c6c8e37a3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
index 91e2145853..adf5020049 100644
--- a/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
+++ b/package/libtomcrypt/0001-fix-CVE-2019-17362.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] Fixes #507
 Fix a vulnerability in der_decode_utf8_string as specified here:
 https://github.com/libtom/libtomcrypt/issues/507
 
+CVE: CVE-2019-17362
 [for import into Buildroot]
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
