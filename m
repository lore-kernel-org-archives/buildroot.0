Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E52FC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 23:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94726400E3;
	Sun,  7 Jan 2024 23:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94726400E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDyDI0OxyDL2; Sun,  7 Jan 2024 23:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E274441638;
	Sun,  7 Jan 2024 23:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E274441638
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C67F01BF48B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DE3B41638
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DE3B41638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWwevvxH5VEJ for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 23:22:47 +0000 (UTC)
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BBD041619
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 23:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BBD041619
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id McTarVOj11f5IMcTarANbR; Mon, 08 Jan 2024 00:22:42 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:22:38 +0100
Message-Id: <20240107232241.666769-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCoUO7dRtfH9I7Z6HYO5AlVO3lMGSo1YI9z7BtRy6gP0FXJIeQXzoW4PxWWiTqDiwkkSDPyWUXMjMP+aykX9zsRMhUkRp4bUWj4cayMwQzil6jD3Av7H
 ql9rvUX1R3WpAUGAsRDnD/UPwN63CgI9ManCrC2htqMFFaj6mw6Yry9sQnu4G2dTFxvRRsb44sCloeGAd8Mt3nHo6HoG6KuK+FT6ms2QFbqwjtzmP6TsDRlI
 cvaFApMHD46yU/zZ8B2CZDYt7xTFpVAUdsQz+LannW6IE4kytAWQzs3PlXMibD8afPgzMRo7m9Ob09o2TbOOO2ZidynORzwPCeNZPLAroWTUzysCM1lzeGsu
 JzYc7Naw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704669762; bh=aBhSYGwVTILc69Fc9VLbxM0iSFkegHXEYzvH7s8uvoQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=LSOwPY8jR3eVB42w+Vr4qzOBIj29gdbDoMli0WySo5udxJGLiEd+8nNHIg7eWw1cU
 tWfNxtbV7ZM5pvfSUZJXzVnQTapFZUXgt83qWUmET01HBVno/MT0RtwKbTN/8GLcCO
 mKlpSx7iIDUcvSNp5ZVDZ0kz+wYH6TfKy9eSXN1kqn/h3TnrrU/HW/6YCZXBmddxWn
 AcatGny8aYprYdxEhaSplqErWj7gE7BEQdTi+o4virIczVZEIVw4ZkjJI2hWmc0OfH
 6Ld8MzQq6/IspuZuRQuLN8QcuL5stnuMlUWEJBmWGtf4PO8L65tjuq1xAscshMscvW
 Wa7/vUVKMTtgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LSOwPY8j
Subject: [Buildroot] [PATCH 1/4] package/libtraceevent: fix build failure
 while building with static libs
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
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building with static libs we lack libdl library, but it is mandatory
for libtraceevent, so let's build this package only with shared libraries.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtraceevent/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
index 399238eef1..b41aeaaf2c 100644
--- a/package/libtraceevent/Config.in
+++ b/package/libtraceevent/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBTRACEEVENT
 	bool "libtraceevent"
+	depends on !BR2_STATIC_LIBS # dlopen()
 	help
 	  libtraceevent is a library that interfaces with the ftrace
 	  subsystem in the linux kernel.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
