Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7241BEB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 17:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB29E403A4;
	Tue,  4 Jul 2023 17:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB29E403A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UX9cIZvxcaan; Tue,  4 Jul 2023 17:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 113B9400D9;
	Tue,  4 Jul 2023 17:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113B9400D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6C81BF82F
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 17:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F8E400D9
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 17:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F8E400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXi0CH9ghlDB for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 17:03:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A46400D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78A46400D0
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 17:03:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD57CA4C0946
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 19:03:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49602)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGjQe-0004PB-29
 for buildroot@buildroot.org; Tue, 04 Jul 2023 19:03:04 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  4 Jul 2023 19:03:04 +0200
Message-Id: <20230704170304.754954-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704170304.754954-1-bernd@kuhls.net>
References: <20230704170304.754954-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688490184;
 bh=o/rd/YH1N7wgI/057E2eWVoQcHww6ScQgw/3lI2RXLw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LHBpN9bE4Cp4OFOwDaXsq2w4LrBSmquav9tfHvzWBK7JG3WwfRb/UZAzYAxT2tzGm
 2zkl9U6uxLM/+Jns/J4ozCflaPRBi8Nx5diNAnoj9PL9ShvlMcLOjPVKQ9kPAUggQK
 ngEr+Zr0r2SLrL5niY3w0UCIYM9cDZJOKFcRT4RDbdXUjvoo+Yc+xgg8ss0DPzGVA7
 6FVKtLmRutlAwFfRVn7hHr9GF2wW3bH7R2RUJiDumL+XHalYsHespzhbNVP7JoF6co
 dLxrZNhKeHLUd6v0eLkTVB88qf9weTqPriuczeOjTcKDKVbF3QtQyG0EP2s30TOZXv
 ysyTIKiHi0g7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=LHBpN9bE
Subject: [Buildroot] [PATCH 2/2] package/libva-utils: bump version to 2.19.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/intel/libva-utils/blob/v2.19-branch/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 3cde9cd284..e46a0522f8 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c4c0555c96ca678f9ac47fbb56f0ae56ca39fd50fe3553bae5cb13117bfcb406  libva-utils-2.18.2.tar.gz
+sha256  4135992ab534d0cfd71a93c28e1a22f79c0003cf8d157ffd4621e5e482191b4f  libva-utils-2.19.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 38d46a08c9..4b2f5907ea 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.18.2
+LIBVA_UTILS_VERSION = 2.19.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
