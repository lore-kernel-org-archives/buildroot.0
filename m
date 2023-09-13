Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1601EEE020D
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF612813B1;
	Wed, 13 Sep 2023 20:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF612813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QVOHCXvvZrR; Wed, 13 Sep 2023 20:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00D8D82C1E;
	Wed, 13 Sep 2023 20:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00D8D82C1E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 624031BF5F5
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42D9A82BA7
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42D9A82BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncMYgIQBaIdB for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 20:23:02 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B88E813B1
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 20:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B88E813B1
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B8C305C1703;
 Wed, 13 Sep 2023 22:22:58 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 22:22:39 +0200
Message-ID: <8ea671337eeee89169fec537dc0f4eca9e2a51ca.1694636470.git.stefan@agner.ch>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1694636578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=+KBZATK8ESh4SGlQLMf2/cQWYVuysaIw1wiJ9C4n+Is=;
 b=ysvT39VMLfWYiYPWWCs6UTe+c+3UY8ROP0rLTv7FTNhcZvHn6hk+aS3kzuS1W8R43QHifJ
 21wVI+VTLjlHXqEGD5k6uGilvvLpqYqv9ZBGs8qbRSYf77neyMW8smQTnzo4DOIYn2SZD5
 rdYVsQg7N4j+1Vvk78Ff4JC7ctfx0sM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=ysvT39VM
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: bump to
 v1.19.13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: dominique.tronche@eviden.com, Stefan Agner <stefan@agner.ch>,
 christian@aperture.us
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.19.13 (released 2023-09-06) includes a couple of bug fixes. In
particular it fixes a bug introduced in with the update o v1.19.11
which broke http using a unix socket addressing.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index ac8499e7dc..d61663cac9 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  ee5d50e0a7fd74ba1b137cb879609aaaef9880bf72b5d1742100e38ae72bb557  go1.19.12.src.tar.gz
+sha256  ccf36b53fb0024a017353c3ddb22c1f00bc7a8073c6aac79042da24ee34434d3  go1.19.13.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 9189032ba8..ea2a46f36c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.12
+GO_VERSION = 1.19.13
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
