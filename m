Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC4606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JIBrx6Ax;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=cKB4IPqO
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B79CF40576;
	Mon, 16 Nov 2026 12:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BqAPz6k3Ixo; Mon, 16 Nov 2026 12:14:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AF04F405E2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794831292;
	b=ZVWTBBLB1Wkymb4E3eKh0kmxTqIzdVn9zlZm5fe2QtyAwZz6kAH+WmznRSWCqG5OPiSn
	 3/ffPxfTtziu2SpPqK7my/esOGd7KERNnIpjicfkTtZRg+HTtHwX11wj2t5fKYFiNXlw5
	 AqB0g3NGjHleeCPITYgpa87tADG5AlKOE5i7ZHPl4C7xh0OgGEjQif6Td6fPmDVNZcUbR
	 9mt5iuhzCOClPvMPHor3hyGje6b3W+tAgyOQ9liFMD9AFZsk1ilhVTB1GqVmI+xbSWGuf
	 0vW31C3M+9UBXkLNSO9N2GoBXkbrEIbG3No5/DPeTJ/VUKSNC0nt1mR27LAtXF0mRNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794831292;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=95q8TNLptvon8GncJG7GPnIYLUe5n5yW5FkygEliT5c=;
	b=V2OcJhJYIGAt5Fth5MhBMK50o4SdsSXIxTApX9Q9xbM4cbzmlJr1+pmucbrh1vgmunRD
	 Isb5jVoFb5qgz1Z0+PtEURpURaj1WG1FGNnfn5Mf0RgBmzOmkpYZCh6Q2aQ5GN7VsvwBG
	 ziqy8heU8P0T/VuJekvN9t5S19F0zxCJjgO6wfwSbLGaxqHgBpOxLh8VcfX488Ax0fVqP
	 Zu13V32dkkKyFh7oe3PoJuHF9Np7RsT/vuFd8c5BsTC6D28NgiFue18LHyPqsPXvV2wdi
	 cJfzOapMviwP/uTlikzJT6G432oTZtH43keooEBmzpyRrOYS5Ka1/hXKUJaF2ya+csQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=cKB4IPqO;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794831292;
	bh=95q8TNLptvon8GncJG7GPnIYLUe5n5yW5FkygEliT5c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIBrx6Axa6Amb7xzzj4PQUautB4s9g8At6qHd3BfBcbnR9Fn5E3vrnPIAORB3PkRH
	 sW2/GblDth+JprQgRFgN5Ah6La182f2Rb8U52KlWsDVx1UdhL3POSvKnAjeZQFLDOA
	 Kl9VnWAFAlaI6dI1a3iGnxrGNde3ZNfBp1j8o23gfWCl95Zp1+Ip9a4wUsX4l7qrYr
	 CzaD2XsHxPu8uQ75z1K/oulYjIFsZ9KuAa78F6H05QOkWtYCkp/R99lG816/6ou00+
	 M4jFG56di+URkdDlATy3VbWyeEj1ccTUVlYOE5Zqj0acXeIPzc9N5ogmcKDVjnXgHX
	 pIO3Aqh7S21SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF04F405E2;
	Mon, 16 Nov 2026 12:14:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D17184DD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7ACF4052C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsQq97X4ONhO for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 12:14:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 20BFB4051D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.161
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cKB4IPqO
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20BFB4051D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 12:14:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SvbexcvC2TDqGSvbex55Cm; Mon, 16 Nov 2026 13:14:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794831282; bh=0IsnjVELmZ8Ay5ZhjedreZvLneiwNEv0MrABeRqqYZY=;
 h=From:To:Subject:Date:MIME-Version;
 b=cKB4IPqO3/Q+fUwRNNPQDV499KqYMm0jS7ZMiKHzJXOw2ujVwIYQZtFj7u6tGt2Ki
 F1yJGATkdwk+gl9tYuttNxsHTJrRIxX7BSK9SsDaaUV9nXEtuKljDQO6J5ejabd5CN
 Z1TF9KEKduTkljkovyikCmfumrZHZpnXpQ9Gb32cd5IfB9eXhGwyYs72egOPHZ0fJd
 kYJ1tdEPTgM33hc2TXEK+NrJNJGLf/DalYPENWMXAUGIBLt3Z5gE4rxKJr00j8O7/X
 4Dtkv1fSFfDlqJ5cX4kWypOmqfd9pSc/fzkZBC77fC0esxC/UULBtxK9yyumLlVq86
 a69WniBBK4utw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Mon, 16 Nov 2026 13:14:41 +0100
Message-ID: <20261116121441.6513-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116121441.6513-1-giulio.benetti@benettiengineering.com>
References: <20261116121441.6513-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK7m1V6Az1OVlUKMOGassMYOFviA/XV5rO/fPrEYTaItIq0JwyGjSQ5+Fu/mX3Bt5n9w0NvSsH/AbaMXsaS2dVWCs3sWXMmkTA8CuhnQiup4sxqmFQnt
 AK53OKnQa8AWOkmBgF5TTSyhwC0kwMk5dceUQjc7oLR881nDEI0xIcdETYkF1ICkFF//nOEWLS5BO/x68j5YJyFMFKu1pvERRpOZYqq3tRe9IRGldg8OlJK4
 oMzZJDoPjLhTu2BVpolqLIOqci0eYdfUdIwFFWarfm2YlJuHFGscZL74iTvHSgc7RHSSzqGKi1unn9nw1tjcOg==
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.40
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changelog:
https://github.com/mozilla/nspr/commits/NSPR_4_40_RTM

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 9a0da47e23..068ac6b795 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.39/src/SHA256SUMS
-sha256  bbd02ee87a55676063a63e5bc819e0227de2666b47307b2a0134414cdf42368e  nspr-4.39.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.40/src/SHA256SUMS
+sha256  c0c1884c627f3db7a783f7c7314c695226b2043696791d15519e7e0578c19bdc  nspr-4.40.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 49fcf30640..4ecdccf7b5 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.39
+LIBNSPR_VERSION = 4.40
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
