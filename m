Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6E4D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A04260B90;
	Sun,  7 Dec 2025 17:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBuuyEq4MV-R; Sun,  7 Dec 2025 17:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E15960BE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127621;
	bh=uLa/2qpHTpgJLX3piGwKVlpPuZc4xjtDZHTprLR4H9A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mBa1IT3EDvE4dg3oEyQ57Hm8mjOzx7996QgELwdCychNpYN/cNHepseUhJLeA9Aih
	 jURH+J0BG+TrMcNCPfdKqmf6/kZhJaDgUOVHKfZcM1Oh/84GdNCpJ604954O4aHXth
	 NY+SSYPEwK/JmDOzVlOMTaIlmoGP+2fXOVevBmdwqqLeRH0A/c2kJq5FlpivBHyo3O
	 9idLL28qyYQPm3JMeye6gVEoyYA2SH1bcZY5Y9v3LVERfl/iNq4okAxkXgPb3b9WLR
	 VFMOKtq3/0InrASqntwsWQJhD4qwaAws1XfoWycJ5MLqymuHEMIX2vr8pPuvf461Lm
	 8zfBZ1ZhW67NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E15960BE0;
	Sun,  7 Dec 2025 17:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3ECD2F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A646F60730
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NahPy5yQQOa2 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC06460617
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC06460617
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA8BA867FA; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:09:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d61edf6b1b5b23f285f30f67a2d67695b153909
X-Git-Newrev: dd2b3607940123a3aa1ab870e55021f454d19fec
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.AA8BA867FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: update SITE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd2b3607940123a3aa1ab870e55021f454d19fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Original site is down, unchanged tarball can be downloaded from github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/softhsm2/softhsm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/softhsm2/softhsm2.mk b/package/softhsm2/softhsm2.mk
index 5e37e42dde..ae44b93bc4 100644
--- a/package/softhsm2/softhsm2.mk
+++ b/package/softhsm2/softhsm2.mk
@@ -6,7 +6,7 @@
 
 SOFTHSM2_VERSION = 2.6.1
 SOFTHSM2_SOURCE = softhsm-$(SOFTHSM2_VERSION).tar.gz
-SOFTHSM2_SITE = https://dist.opendnssec.org/source
+SOFTHSM2_SITE = https://github.com/opendnssec/opendnssec/releases/download/2.1.14
 SOFTHSM2_LICENSE = BSD-2-Clause
 SOFTHSM2_LICENSE_FILES = LICENSE
 SOFTHSM2_DEPENDENCIES = openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
