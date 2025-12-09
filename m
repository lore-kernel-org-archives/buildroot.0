Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B11D3B98C
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E73EB407E6;
	Tue,  9 Dec 2025 18:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNX8tsAEVyFO; Tue,  9 Dec 2025 18:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2007D407F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304902;
	bh=fvjIPyTiG5qTa+DSUpKPlpxUR1Fku37GxTSASnjqquQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bK5IoLoXuDf7la82VJ1tlTCcT2ZZYROv9ZgZY8qYxCJifoQvng0hmqQE6GzSrxJwQ
	 7/K4wDO0P/SQ2TpsjwxqAWM6GjB8ozQIIpf+7i05USlXqjm4bCb6vZM+a3bDpW4Scp
	 mQQiIqRaFCikcfr5AcLSLInOM3qzcxuzYgrX+os3zq6Wg/4RLP9Hw6wNZYlKX/pCAn
	 brUjFckkifTUlK5ECxq+6h8Of8g1BNZZixbyE1E+5KdS1y7vpbJBUE3e32PN6zw/FA
	 sSjPhILJ2QpKiOvN4aU1sKFUnHitgCTPcFZQTZetESgVU5gKgdP9Jfs+FdBw3CJkqk
	 LUsi7hcbPumJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2007D407F9;
	Tue,  9 Dec 2025 18:28:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3A3C2C6
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 989D940820
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah2EB5gpNMyH for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A9A4407E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A9A4407E6
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 948D786968; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9b96ce2c80cb970fe282ddf84b1af597fb6e3e84
X-Git-Newrev: 3ef8d613d7412c54375bdb5c5a683ffbe8a3f85b
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.948D786968@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/firmware-utils: bump
 version to git commit c42a3bc53d
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ef8d613d7412c54375bdb5c5a683ffbe8a3f85b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This bump includes a patch which adds cmake4 compatibility.

For changes, see:
https://git.openwrt.org/?p=project/firmware-utils.git;a=log;h=c42a3bc53da869d02c8ae4d62b3b08a95ff5833f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to upstream repo commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/firmware-utils/firmware-utils.hash | 2 +-
 package/firmware-utils/firmware-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firmware-utils/firmware-utils.hash b/package/firmware-utils/firmware-utils.hash
index 8e09c06733..e258516aec 100644
--- a/package/firmware-utils/firmware-utils.hash
+++ b/package/firmware-utils/firmware-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d6fdc6ba3cb3976df68625cbc59a1e0acbd5ecaf9daa41c3a2aaad1ff368f51  firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4-git4.tar.gz
+sha256  8a12240dfdca5e26a4b2443724276a0a25f61797e133757605ed1b9941145fc3  firmware-utils-c42a3bc53da869d02c8ae4d62b3b08a95ff5833f-git4.tar.gz
diff --git a/package/firmware-utils/firmware-utils.mk b/package/firmware-utils/firmware-utils.mk
index d5b079e4f5..77be4a9224 100644
--- a/package/firmware-utils/firmware-utils.mk
+++ b/package/firmware-utils/firmware-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_UTILS_VERSION = 86739f2b3ae9502368b89ef37fa6f31c42aad6f4
+FIRMWARE_UTILS_VERSION = c42a3bc53da869d02c8ae4d62b3b08a95ff5833f
 FIRMWARE_UTILS_SITE = https://git.openwrt.org/project/firmware-utils.git
 FIRMWARE_UTILS_SITE_METHOD = git
 FIRMWARE_UTILS_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
