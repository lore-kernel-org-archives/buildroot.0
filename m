Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8820BE7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 297F4608B4;
	Fri,  3 Apr 2026 10:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taAq89vLm7Ik; Fri,  3 Apr 2026 10:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC5D760898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212023;
	bh=lixbV8wsd7WeA6HdA7AElTvaj1Op9MvhKRatQia0Fd4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YHREjcVQFn1M80xekdX11cQoeUA95+czbLptHW5ldG5aDFTIRB14ZYWSc+7wtR31R
	 9nnmMWPwTKeh3YIr23OIstzD4W+0D8dOWvhuqbVZdLEIrspZNDJZi8sCAJcBN2zi5k
	 V35sgDOXzFGtx2BqBRvYbo7HlzoiedPyjYH1RxPiLoAR4ZsnlEwZo0ORJ0DqPu4jox
	 2/QFRC2hChKwhe64OTPUcDdWcl5T1C4oNgr2MD5Otrk8cB7gLN+lDOS9rlbbnsNEfP
	 1/GnqwjOXWaT6IDrh2Y+DX7kHjt1U3qfPwJUbPZCgE2CketO+IHagGhsLDGzeE1Sxu
	 SLOAOhs0l0u+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5D760898;
	Fri,  3 Apr 2026 10:27:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95D231A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BCBC608A1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asSqMvc8JfYd for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2488060891
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2488060891
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A14D77FFAA; Fri,  3 Apr 2026 10:26:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:27 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a5e8381a3e701d93e94363e89b9a368f4eaf336f
X-Git-Newrev: bc3bd08b601c07391d50c6deadbf6902c91a2059
X-Patchwork-Hint: ignore
Message-Id: <20260403102656.A14D77FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/asterisk: bump to
 22.8.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc3bd08b601c07391d50c6deadbf6902c91a2059
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See here for Changes:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.1.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.8.0.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.7.0.html
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.6.0.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 94a817a58909e1cfe0c1f63b63754079f1866523)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index c09a5bc183..12700dc38b 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
+sha256  4f30af0695a0131fc091d85e7b91e22504609434b3fbd263898c7354d41959c9  asterisk-22.8.1.tar.gz
 
 # Locally computed
 sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 0d40ebf2b4..e92ed55e03 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.5.2
+ASTERISK_VERSION = 22.8.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
