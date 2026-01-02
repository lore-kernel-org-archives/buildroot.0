Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D3FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BEAE813CB;
	Fri,  2 Jan 2026 20:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LVy_0VNAbGZ; Fri,  2 Jan 2026 20:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61C88125E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387108;
	bh=DbK8mf/PQYwp0aNlCmpW+GFPSaY9dLbqiXHWTIMFCd0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X/oLeD20eO5r8qews9L+QRSmKPQfOYQXHq/daD0n+fzUNenLwwl2IciAapEM8Xaf2
	 aaemIJWW0dB2LyZUkGLP8RQmIwV5by8KYDirKNI79hgfu0G5cOeWorI06ZiAdvR85T
	 rQpDmeZ86DmRo95AaJHJVra/yhIUbg+2Nq/jIZbjPR8KhmOFv1pmNvbVSVjFs9RLEd
	 qcumV2ybutCz1Mvd33i+mpHNcm448EEJCTpiBnNk9+uIqkBqkHPODGvYezDJ7Pk0sy
	 yxihi8iMXWQh/R+N1/Q8SNmMKom3EpZf5inA2xRReDX9SdU2D3rsJ/zTwk2QTb0ecm
	 Nco7G1QHXOhng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A61C88125E;
	Fri,  2 Jan 2026 20:51:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B099919D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97D3540888
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuW6h3T4w8lK for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A80484068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A80484068F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:51:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93D8988099; Fri,  2 Jan 2026 20:51:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 21:50:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ef9fd947ea7a672cf95ab11eea5046e960cddd7
X-Git-Newrev: 2092fdc003f853266cf23ae62b1de5204b370223
X-Patchwork-Hint: ignore
Message-Id: <20260102205145.93D8988099@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_openjdk: drop the X11 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2092fdc003f853266cf23ae62b1de5204b370223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3dd73c3 "package/openjdk: allow compiling without X11 support",
dropped the need for X11, so drop it from TestOpenJdk.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_openjdk.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index 26b7f9ee92..3bf89f9efe 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -18,7 +18,6 @@ class TestOpenJdk(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
-        BR2_PACKAGE_XORG7=y
         BR2_PACKAGE_OPENJDK=y
         BR2_PACKAGE_OPENJDK_HELLO_WORLD=y
         BR2_PACKAGE_OPENJDK_JNI_TEST=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
