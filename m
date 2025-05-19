Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67513C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 15:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E4381F35;
	Mon, 19 May 2025 15:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwmmPcFesQUr; Mon, 19 May 2025 15:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BAE8184F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42BAE8184F;
	Mon, 19 May 2025 15:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB09193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15AAC605CE
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6_DyLVKEhEE for <buildroot@buildroot.org>;
 Mon, 19 May 2025 15:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FB3060693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB3060693
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FB3060693
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:04:15 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 52E7AE0022C;
 Mon, 19 May 2025 17:04:13 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Mon, 19 May 2025 17:04:06 +0200
Message-ID: <20250519150409.25390-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1747667053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Y9vysqy8a05iOW3si9S+gbXx90hCy2lYs1oB+7BHEQ=;
 b=mfhVfW2X9eAz0V2Wu5itXQVhSumcW/fY7WVFfc5mEhKFfsBkwBZHOBbF7MqY81x5Vukh5I
 /o+t5J1chWgclf4w0tMObC9VsQaOiBEfvEAOQCNXNSYPTNHuqgAe/YGUI+Fici3Xracej2
 qsU/95VS0iHJuz9RAsrCv3S1Rp2XoVI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=mfhVfW2X
Subject: [Buildroot] [PATCH 0/2] package/casync-nano: fix autobuild issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this series fixes the autobuild problems[1] for the newly-introduced
casync-nano package that didn't pop up when I was testing it using
test-pkg.

While fixing this I also tried building with LibreSSL, which revealed
some further issues that needed to be fixed in the source code, hence
the version bump (otherwise this package would need
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL too).

Florian

[1] https://autobuild.buildroot.org/?reason=casync-nano-1.1.1

Florian Larysch (2):
  package/casync-nano: bump to version 1.1.2
  package/casync-nano: depend on openssl ChaCha20 support

 package/casync-nano/Config.in        | 1 +
 package/casync-nano/casync-nano.hash | 2 +-
 package/casync-nano/casync-nano.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
