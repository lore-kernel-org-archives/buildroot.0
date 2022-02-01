Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD6BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C139E40191;
	Tue,  1 Feb 2022 17:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57SxSv1fa5JX; Tue,  1 Feb 2022 17:34:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C285F400C4;
	Tue,  1 Feb 2022 17:34:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 033D61BF396
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E66CB60EE9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHSxH2ZTtA95 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:33:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E42C60C20
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:33:56 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ex2Pnexn1QUuPEx2Qnix9Z; Tue, 01 Feb 2022 18:33:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643736834; bh=p3HIC/vwdrNBbz55dd7qaszfPVM5pO7MpXkF0sp81zU=;
 h=From:To:Subject:Date:MIME-Version;
 b=d5XGUuvh7eZBYXGr/VjGZf+ZqCeTjo6uQhqTXbIhBAHv86Nrjt+eCNYf3hW1e2ahH
 e8cJll+8h8oDx6pj7aYsBN827yWLRpHMEQMGIoou7xU/kIY1RQ9PAa7wQMuXZsrRnC
 93R3vScXabN4EAUUC6xj2hBwx6dDdQsp64Odfn5kVneCRZMjAt0X82o2HhZbcMmv1J
 NrnxbNLJ7ugs8+64KTINoH4ZNXzrfJBhCh3Iv1zuT5pX5KnEmQyNCQQ1MmlLn9Z9zI
 8eaUZOK2C6ehDyMA8rpqqF3HIU8Cv7LkguUdIUZ1m8GwPa7osmF7Z8iabS3hqToo6p
 YjkAmAs/3SM2A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 18:33:52 +0100
Message-Id: <20220201173352.160244-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201173352.160244-1-giulio.benetti@benettiengineering.com>
References: <20220201173352.160244-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBEB0BSxL9ncuBD1RiMjWz8sE+Xvn1bg1r/Zf/Yqh7IMPr3nE4Qj9Cw17l2M2mh9vseGkhjZc9j6x4R2li+Q8lcArF9Xcz5p1/Er68K944yMyIlyiOeH
 vxh3qFpQLrkFUuts+bCiwuuzEFgPwM+Lr6KDjSuoo76638nogPHJTEK9McIXGcmoS6j/aAluNjAb7x80dz9HBY2THCE2ZDMXXJxQ2lLkNoHKIoMkK1Fa8eyZ
 SPUFxY76XnSscHIoFkAFI17pwUxPxqJ16d+2REjc4UeHUVEa6DsPHN1cRoqskXYQ
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Giulio Benetti to
 cryptsetup package
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
 Martin Hicks <mort@bork.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 38724726d4..5255b096b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1097,6 +1097,7 @@ F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
+F:	package/cryptsetup/
 F:	package/erlang-jiffy/
 F:	package/gcc/
 F:	package/harfbuzz/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
