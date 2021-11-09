Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041EEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3721610A0
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3721610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E5866078A;
	Tue,  9 Nov 2021 10:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUzuszpEfMrk; Tue,  9 Nov 2021 10:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC3F160764;
	Tue,  9 Nov 2021 10:20:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB7AE1BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA24F40320
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L8KlfhXKFUb1 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:19:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD8584012D
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:19:14 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODemOa6a; Tue, 09 Nov 2021 11:19:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453154; bh=EtF+0Vd19QrCVc9x3Jj5NwYDJECehq2uyQeg8defj3E=;
 h=From:To:Subject:Date:MIME-Version;
 b=IGSjKvUvaFUOj5MdlmOcQKXaMBqcAQN2l468GcyPX+bQkKYQt7VeCgAkPmU4tXuIl
 abbEBXwuvCDRv7RjIeJhtZTAr5O+0olj018C+vKO/y0D22lwvto6h0PPfiJd2vhH1O
 FNjxRy7RR0IQtzkY5Tg7mya55XPHtMtXvI4CJxCGe4PR9qEMztSpdYNKxxjmXDDLGW
 VxGLh+zODDEvLHojq4qVz/U9SGJ6wG4Mr7+HO+QtE61ZtGmeYr4g2OHaSTBdbAx3OT
 CR9COxu27Ireq7P/pd18/Aden0u/jTmj+AotORTXf3nRq2NUjHDnfvoqzVYAnArn/3
 90a70nqq6pHPA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:42 +0100
Message-Id: <20211109101844.1132067-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAaqr0dbgvwrk49otM8lG83YgPbPQEJDTSC7bFEqBtG2m6VVfTTKpteYXSmv2MMENHlb9XfMjz4xkkuOFgsSnVTJEvNciFcg1TqfJnqMPuYmzmsB2gZZ
 qmkJAGgJYAWbjhSGp20OHmMNHeoUIkd6/XwihIhC0Npxud7n/6OOClGMLA8z161vXZZ2YeZwn/xQUcKwFXLDqHo/Zs77+8BkGBRu8PZRCesqoZRbqepyX2sg
 +lt/rrrieiN/8fRAdcsQjepejC2snSgHsj7urVDGnljdr+aVevslDzLG7gl30LCCg0zFee7NLTfOFOkeuX/uv/oNolJZSeVO1MsBOnGBKPc/mEmCbs/LibAs
 1pQZBMrzvplvDg6SfQZprGV3q7dnO64OQLsSusLScaDUp4GgztDO6n6eKQafS7l6G5urPZMFJKzQDhE+CWKZyoTPZu8mojpb/MmFMunFPgRIjctpqRhVPN1q
 yNRniyuAuYWDIukZCy/78lQWn7zCPXGSugSa6TiqHvX1C3ubv+Yn0tnxWTdJOOgRpPZF4SeOYFuzenCBIlF+cHprVJgjaJlHsdJ4i6t6dW3GRSLRbnXcEPRP
 jxg=
Subject: [Buildroot] [PATCH v2 7/9] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Option 'offset = 4k' must be 'offset = 4K'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/kontron/smarc-sal28/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index f3fb77e00a..8c8a7baaae 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard-emmc.img {
 	}
 
 	partition rcw {
-		offset = 4k
+		offset = 4K
 		in-partition-table = "no"
 		image = "rcw.bin"
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
