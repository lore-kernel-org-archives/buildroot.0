Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BE0EC1126
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 20:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BE7060AEE;
	Mon, 23 Feb 2026 20:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGKE4xPzr8Ac; Mon, 23 Feb 2026 20:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67FA561246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771878121;
	bh=B3bVBqdXM779OZf5MfAe3leIoliS2NnVP8rPph14alc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WaCHtmN6kcSEK5qZ6vn/Y3UlnC9ag/BE7rs4Q5HGAkrl8MwLTn8CUppkSr4bFgJ8l
	 4BSht1H/59CKlZ94w2UFgsdZzu8UN59bbLcUzWvFsc3NJcx6AfK1c69pk1dXaCUsui
	 upFX+3oVoggWvVtq7A7ke8G0DHwlmT2b8YSslBK1mKxjb+wEOuPEbjF76WsUdpuklw
	 VC1LG55b+bEPVrwuLovx6jjwNZG2GtsZR3K3/i+kOdSOu7fYBVu63VZtmDcL4iRgwl
	 ft1w8ICwNtqGEMjsUVsMpjLVex4fHKNm0VMIxMet23NVmySGTAZ7FvEIcEHlophHpa
	 x87W3haUsdjBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67FA561246;
	Mon, 23 Feb 2026 20:22:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16070237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06E9960AD7
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CWy4wcOvjF6 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 20:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6AD860ABB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6AD860ABB
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:21:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 200A187130; Mon, 23 Feb 2026 20:02:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 20:55:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 461eac6f23181c008110c11e911dfb453886a732
X-Git-Newrev: 603b0350b67201cd9e21f45be00dc04fece26d2d
X-Patchwork-Hint: ignore
Message-Id: <20260223200223.200A187130@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bdwgc: bump version to
 8.2.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/603b0350b67201cd9e21f45be00dc04fece26d2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog: https://github.com/bdwgc/bdwgc/releases/tag/v8.2.12

This commit updates the README.QUICK license hash after year
update in upstream commit [1].

Also, the github URL [2] redirects to [3]. This commit updates
the _SITE url accordingly.

[1] https://github.com/bdwgc/bdwgc/commit/c40b182fa58b92a584571aebe50e07105476cbe9
[2] https://github.com/ivmai/bdwgc
[3] https://github.com/bdwgc/bdwgc

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
[Julien:
 - update _SITE
 - add extra info in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bdwgc/bdwgc.hash | 4 ++--
 package/bdwgc/bdwgc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index d38b2bb1b5..dca7e61771 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  832cf4f7cf676b59582ed3b1bbd90a8d0e0ddbc3b11cb3b2096c5177ce39cc47  gc-8.2.10.tar.gz
-sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
+sha256  42e5194ad06ab6ffb806c83eb99c03462b495d979cda782f3c72c08af833cd4e  gc-8.2.12.tar.gz
+sha256  46cf78d79f08ec7295e1c767213582c60eccba2c5bcb07b1b29fd7ddb138fbdc  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 0700ee7bf5..e81ad3b288 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.2.10
+BDWGC_VERSION = 8.2.12
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
-BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
+BDWGC_SITE = https://github.com/bdwgc/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
