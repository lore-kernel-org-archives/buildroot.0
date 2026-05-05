Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910A9FF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6899340C2B;
	Tue,  5 May 2026 21:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-gWWM__h0Li; Tue,  5 May 2026 21:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF2440C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016037;
	bh=QHfer/q9x4Icqq6AtFARMZH+KFT43E5HJ2Kk6V4raOA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TUdt+S0muFkE/WKRS4PyUcM2uNj/W1bnqdp1f674sN31zTdiqOLtuVV+LYdEa4YxS
	 HHVrXi8fAiPSoFImaVrCCpnKCMCzlyVhKUxnhqy4fIf/1YG65YLqsjC4W447VDU2TV
	 WtAd/8ZhZ+2HNDhEAh78DHOupNdrqsJ+vtRq/mMg2tRV+2kEOhcBOoGJAW2W4pE3IJ
	 ep8Zcvfu3t/Kd9GYAj9p4jPx9zQyaz3IgGXvvRm3IaJaFvwz4N941io0P5NwajNMvY
	 NQ1qY/+rGoPXt7LwA28asP65k7U8fTSY5jVlFXltW33+5znCkcHw4f8zXeoE2VSp0d
	 uB2NcyBhETASw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF2440C35;
	Tue,  5 May 2026 21:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 011E6280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFCF560B5B
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUY-Nl9wGY7a for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89C9760B62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89C9760B62
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A77EC84569; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6195e97d6e660c13eb3eaad612e1c182abfc8b18
X-Git-Newrev: a03eaaecb3615910cb3550772bfcf8605d98e8c8
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.A77EC84569@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_octave: Bump kernel
 version to last LTS (6.18)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a03eaaecb3615910cb3550772bfcf8605d98e8c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_octave.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index cdbe2688df..4b269e3af0 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -13,7 +13,7 @@ class TestOctave(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.26"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
