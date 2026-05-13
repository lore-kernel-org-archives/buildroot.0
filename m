Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF143CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 19:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC24C810BE;
	Wed, 13 May 2026 19:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkYtBDps7mza; Wed, 13 May 2026 19:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42642810B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778699119;
	bh=kiNp60AK5YZ4RA0fIsCmLPEa8L8+xmqCgeXFKF6atKQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dtNMdUY3F3aOSkRsWOl2DQNqDFRfK9INWrgdLXRkMBs9imqTb9L/UYLxh5NOo5mW9
	 4AIPwgQyD/y+DFGN8qVLdcKC2Kg3KDLZbMFQCsgkYE95cnBVIC/55NYO0hUCnCueIf
	 nJFpUalazamf4jl41WH98EwHK11NHdV1BC+8+R3itwi0NkQJc9AQxZQNWsgZd/1rg8
	 hlx4/RXpPewVQhdHI1RAvm+r54RAxxYvUQth29iOHLhwcolHayi6w201YViyKWKfVV
	 x8Tn+EMziH+ti7cxUoaoMPMN9/uR+CsJK8v99o0teCBEGfF66F8ZlD2aZU2lGaiieH
	 yQp2v92JmhV2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42642810B5;
	Wed, 13 May 2026 19:05:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FCC1270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FB8D60759
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtGGklfz7F23 for <buildroot@buildroot.org>;
 Wed, 13 May 2026 19:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60FC760758
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60FC760758
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:05:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EB208613E; Wed, 13 May 2026 19:05:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 21:03:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af2f3208cf31de0289a53a2c93fa1422da5c3acb
X-Git-Newrev: de4044a0c9854c761b42c45923a07eef9978a2b1
X-Patchwork-Hint: ignore
Message-Id: <20260513190512.8EB208613E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: fix typo in CPE vendor
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de4044a0c9854c761b42c45923a07eef9978a2b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There is no CVE assigned with the vendor name "cesenta".

The CPE ID introduced in [1], correctly reference "cesanta" as a CPE
vendor but introduced a typo while writing the vendor metadata in
`mongoose.mk`.

[1] 3d632c941f package/mongoose: add MONGOOSE_CPE_ID_VENDOR

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mongoose/mongoose.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 432c20a54c..8250751eb8 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -8,7 +8,7 @@ MONGOOSE_VERSION = 7.21
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
