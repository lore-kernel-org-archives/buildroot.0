Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF256D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E0140C23;
	Wed,  7 Jan 2026 17:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxxH-7oFUi7y; Wed,  7 Jan 2026 17:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFFD240C24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808112;
	bh=2p8uupEMppmzovLX/I9q6GkUAt/JP8V9hmKc52ZYZ6s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Lg60qqwAEJuP0emC3cynLel8HMWtFAMYUm9ENoHs3GtUcG3y9DFq6E+hOzdCZdMIC
	 G3Vbk6llWTFvz4+mG5JgUxL5T9a09q1IfQZr5fkDbEtceevpKKERL78HIEMHv+71N9
	 ljsEEWOL7zD3Kb3bNaUu7vhd/OdDUDMWPO2Snm5JQk+VMgGeWlFVdUF61Dzaepfbeq
	 Mv5pI3p+aHx6CJLalGdRCOyLEo2IADpVX+Ox4EiBP9Qo/YppBFOtvCbrC8prfIMrmr
	 v+ekpZsDRk1NLABUx7wYPwLQXL8Kygntuq8GayWkOaxH27866C6yIYHAwL978ddsB4
	 AN49mmLO8MIbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFFD240C24;
	Wed,  7 Jan 2026 17:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A519ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E937180C78
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bF29mg2JIH0a for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C6080CD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C6080CD4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 987B68225F; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:38 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e278e4a68ed5a70db56e24cc83ee27e69bde8217
X-Git-Newrev: 288e04ed508a74c53465d1f9ee325e29bb2747fd
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.987B68225F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libtomcrypt: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=288e04ed508a74c53465d1f9ee325e29bb2747fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
