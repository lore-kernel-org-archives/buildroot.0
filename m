Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1A2CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EF8783B21;
	Fri, 29 May 2026 08:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqJQUPdkL5Ud; Fri, 29 May 2026 08:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3758283B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043140;
	bh=RbzkGl/gmyxhtyX1oO0+p5DHL8s1pfbe1zsfVro8Hb8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sxiySdyrF0gLEygdS3As5Ophkz8jxiBqKEaM8QE0qz/qzQeaDO2RC7xNIvfPs/0UZ
	 7w7IyJ4mNULRsZx6h19cynsu+upTCAob1j0x3GI9wOJRzQHrN9hpC/icf42Fn/iT4t
	 Rf6cfWJ6glyjN/raUKMJfSyxv8VDuy1HwF0Izm69Y/AZVB7+oBc4XhXZ4qHOFtB/lQ
	 zXEwWta7xKkL6NXR5teUvQEKVDFXKx8Z8QFANyg4jsrlE46xmRvUBV+22j9VmGiTgr
	 VQ0FBPCoD4YpOI3usAjKd4hAhDJ9LFl3qzx/fyTd2vvWip0lznHoYxJN8B8dQgDh8o
	 NifsEEPFZxo8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3758283B2A;
	Fri, 29 May 2026 08:25:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B3B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B89C41F57
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzJIyc0EaDZr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA5AC41F63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA5AC41F63
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A12C870C6; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:02:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4eed3816f468b46f91a452253106dbe82a473e71
X-Git-Newrev: c43c33f6ea6a74c728aa9e1e06437999ad12524e
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.5A12C870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mongoose: fix
 typo in CPE vendor
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c43c33f6ea6a74c728aa9e1e06437999ad12524e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

There is no CVE assigned with the vendor name "cesenta".

The CPE ID introduced in [1], correctly reference "cesanta" as a CPE
vendor but introduced a typo while writing the vendor metadata in
`mongoose.mk`.

[1] 3d632c941f package/mongoose: add MONGOOSE_CPE_ID_VENDOR

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit de4044a0c9854c761b42c45923a07eef9978a2b1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 02c2ac5626..9b8920a9f3 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -8,7 +8,7 @@ MONGOOSE_VERSION = 7.17
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-MONGOOSE_CPE_ID_VENDOR = cesenta
+MONGOOSE_CPE_ID_VENDOR = cesanta
 MONGOOSE_INSTALL_STAGING = YES
 # static library
 MONGOOSE_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
