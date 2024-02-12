Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B809C48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 14:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D074A402E4;
	Mon, 12 Feb 2024 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5Xt6mIvcsCK; Mon, 12 Feb 2024 14:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A9EF40320
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A9EF40320;
	Mon, 12 Feb 2024 14:32:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD1491BF860
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA8DB82B97
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 14:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Rro6Xihremp for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 14:32:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9E6282B61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E6282B61
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9E6282B61
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 14:32:28 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rZXM8-00GWZJ-2I; Mon, 12 Feb 2024 15:32:24 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 0fed490d;
 Mon, 12 Feb 2024 14:32:22 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 16:32:17 +0200
Message-ID: <20240212143222.1555220-1-aperez@igalia.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BEST/tqrEKuK3/v8YCyI1HKSu4tWIoUYakLCwpo/btM=; b=s3ua8fO4hx1ZeYQVWtYChBVXdu
 Xna/uRZ3RcbdQgaH9WGz0F5aBEQLBZk/mVmWIF1kmphcbMhL9FpZrYTJ2Xqu9gYr4CozMXVPrKhVT
 zsOux2/bbsC6z0FKLnrVDgybQYDxR9hulZwOB0Hw6dMRZ28rFNDo4PeQNe2wmKnkC9xbJJnVzxdJl
 VG0OG+38JIGoFEqGF8bNReUPaei/R4X6+XInbGZ6ac0EF7cc3QHLhFLCYSeo74i5twxHt3Ki24aoQ
 MDN03qUquTRIVw6cdTnsnaRf36GkchhAEYFCT4o6suyxhwB8okBPDo3RrLXVvVW7tADxdHaeTU9d9
 RpE4sMSA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=s3ua8fO4
Subject: [Buildroot] [PATCH 0/2] Update wpewebkit to 2.42.5 and update patch
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

These two patches don't neccessarily need to be applied together, but
it wouldn't hurt to do so.

Cheers,


Adrian Perez de Castro (2):
  package/wpewebkit: security bump to version 2.42.5
  package/wpewebkit: update ARM NEON patch for 2.42.x

 ...cpp-fails-to-build-NEON-fast-path-se.patch | 105 ++++++++++--------
 ...velInterpreter.cpp-339-21-error-t6-w.patch |  39 +++++++
 package/wpewebkit/wpewebkit.hash              |   6 +-
 package/wpewebkit/wpewebkit.mk                |   3 +-
 4 files changed, 101 insertions(+), 52 deletions(-)
 create mode 100644 package/wpewebkit/0002-GTK-2.42.5-LowLevelInterpreter.cpp-339-21-error-t6-w.patch

--
2.43.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
