Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFACC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 05:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A5081E6B;
	Tue,  8 Aug 2023 05:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A5081E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DCXWtx9bQMo; Tue,  8 Aug 2023 05:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E79E81E4A;
	Tue,  8 Aug 2023 05:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E79E81E4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC7F1BF3AA
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4583281E60
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4583281E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1eyRS6bRLVb for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 05:01:30 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2F0A81E04
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 05:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2F0A81E04
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id E52D0A0412
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:01:27 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id C9959A00E2;
 Tue,  8 Aug 2023 07:01:27 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 8EB6E10013C;
 Tue,  8 Aug 2023 07:01:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 07:01:20 +0200
Message-Id: <20230808050122.6788-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1216
X-purgate-ID: 154282::1691470887-90D0F7B6-BB3D040F/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691470887;
 bh=7eKMiFU6EUjeYdg6iTNrAGMHIIqK7mR2ZKnvsyWAuY0=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=BOp3uaeQ3Qw6XekUWW16HLdlLW6BNgBeMg2ZKS8nEoMqdAm0BkVK2ehPEZra7rAXB
 qy/W5FGa1NAxqbB5QuriTCRqAOw3F0p4A0qmfj3roNDnJKaj/wN7V6UvbBFmhcNA7n
 PbGXtSJX8sUwyzg6su9nEUJjVYKF4e8CUJf1iZQt+G4Nev7B7V1+lvFdF5KosCGiqn
 CnV2ckAjhXbLITP3Y6E1QJB64DN9Yis/1wehc4IMqdZhOqt+PZJzVQxnNyOet/EVoN
 1BsN6FDUaAJgCiJSNkCPY3sa+3VtO1vDvhdEOwHUh54MSFEIO/ti0BsexUtd+mrFrC
 7EfUPeRHCxJbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=BOp3uaeQ
Subject: [Buildroot] [PATCH 0/2] Fix Rock 5B build, broken by gcc 12 warnings
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building the image for the Radxa Rock 5B currently breaks: The gcc
version was recently changed to version 12 and gcc 12 seems to stop
compiling, if certain warnings occur. See the broken build here:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673759

This patch series adds two patches from the mainline Linux kernel,
which fix two of the warnings. However, also custom code parts of the
used custom kernel break due to warnings from gcc 12. The best
solution would be to fix those issues as well. However, until they are
fixed, the version of gcc used for the Rock 5B is set to the previous
version, gcc 11.

Kilian Zinnecker (2):
  configs/rock5b: Freeze gcc to version 11
  board/radxa/rock5b: Add patches for gcc12 warnings

 ...st-ether_addr-prototypes-to-silence-.patch | 62 +++++++++++++++++++
 ...x-building-error-on-Werror-array-com.patch | 45 ++++++++++++++
 configs/rock5b_defconfig                      |  2 +
 3 files changed, 109 insertions(+)
 create mode 100644 board/radxa/rock5b/0001-etherdevice-Adjust-ether_addr-prototypes-to-silence-.patch
 create mode 100644 board/radxa/rock5b/0002-mm-page_alloc-fix-building-error-on-Werror-array-com.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
