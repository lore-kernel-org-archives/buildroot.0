Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ED6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E11A6105A
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E11A6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05941608B0;
	Mon, 25 Oct 2021 22:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vroP7NlSFupu; Mon, 25 Oct 2021 22:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 644DF608B3;
	Mon, 25 Oct 2021 22:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 975FC1BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93A794040F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcM8kBOMicE4 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:44:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 803E5403FB
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=Q75DhoFU7ZCGlfWtYOwws0CTm0LFYvBTykMJMBoKTNw=; 
 b=nfXVNgR9/2ENbW/VYKo8jYhYFIABT+O+B91dgynOiM36aiOoWZszz4U7b5Jl6ra6MZdyD24rQlXO2F2gD8x1cQInSk/7jJNfy9Mi9no7fRAMoWWIH5reijJHxZipFvxvcXnTvLO6A3h8QLJXhrOmPJqj1xj3mT67DD17K53LZPP7FO0y+71XA+whC9OlO1BfQhyRLYpW9E0pfw4U3NWH7atJPSe3XUxGPQA2DqNugDa4W4nSNfVA9nm23ooCjMK31aD7fHkyCDAKUDX1vtGFSayKrocsqLvlNt1owSaZe7yl7JpJRITnrQuOeBe7mc05XusiV5s+WS2sKO+RUv4TdA==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mf8hT-00030o-S2; Tue, 26 Oct 2021 00:44:16 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4c10a0cd;
 Mon, 25 Oct 2021 22:44:03 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 01:43:59 +0300
Message-Id: <20211025224403.979315-1-aperez@igalia.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] Update WPE WebKit (and deps) to 2.34.1
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

Hi all,

This patch set updates WPE WebKit and its dependencies to the latest releases
of their current stable series. As often happens, I needed to make a patch to
fix the build with multimedia support disabled, and that has been sent to
upstream WebKit as well.

An additional patch to enable the new color management is in the series as
well; but for the moment the support to build with libsoup3 is left out.
I would rather submit that as part of different "add libsoup3 and enable
where supported" patch set some other day ;-)

Cheers,
-Adrian


Adrian Perez de Castro (4):
  package/libwpe: bump to version 1.12.0
  package/wpebackend-fdo: bump to version 1.12.0
  package/wpewebkit: bump to version 2.34.1
  package/wpewebkit: use lcms2 for if available

 package/libwpe/libwpe.hash                    |  8 +-
 package/libwpe/libwpe.mk                      |  2 +-
 package/wpebackend-fdo/wpebackend-fdo.hash    |  8 +-
 package/wpebackend-fdo/wpebackend-fdo.mk      |  2 +-
 ...e-build-issues-with-ENABLE_VIDEO-OFF.patch | 78 +++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |  8 +-
 package/wpewebkit/wpewebkit.mk                | 11 ++-
 7 files changed, 102 insertions(+), 15 deletions(-)
 create mode 100644 package/wpewebkit/0001-WPE-GTK-Multiple-build-issues-with-ENABLE_VIDEO-OFF.patch

-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
