Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAF7C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94BE81254;
	Wed, 26 Oct 2022 13:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C94BE81254
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYGDXYD8DKQv; Wed, 26 Oct 2022 13:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 068D680C93;
	Wed, 26 Oct 2022 13:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068D680C93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 180DD1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31269402E7
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31269402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9JKxre3Qh6FW for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2876402E8
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2876402E8
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQXoqm5J; Wed, 26 Oct 2022 15:26:38 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:28 +0200
Message-Id: <20221026132634.999254-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFjmrHMp0LuSSRwPOz06pENnXE1vAMDp4xz3W1hyk33NscqGL0UUCstDDxJkCPysXvkgntIuJ1C6/33uY+7cBu5+hUd6s+7z27Schy0jHdRBFvZwMecB
 NnxzvKo/xqwD8hJD+58tmJc9vbp5dqJw1gJNzbZclHtShfaA3R5mvRU0qsFbIR7v6IiRdwhuHnTK93sasG0MJx1oh7mKW7K1vB369vY/w5dviDMgHXJmnsdk
 BbwKkw5JWfJIQ7DdVel6ParrMOfWDf5GYefy0m/C2rk4jZU2b6sw3AteExmkWMuOWNAyk6IZtsBGEce5SFxeaELE/tqnyPmhQSaq+I2jP7wZY+jaDu+n7Wlr
 gi+PWDYgtKUL06j9Jfqs075c/z0K7Batm8WTH8HtjjAZBbA4bU99C5nVG2z1VN93FaqLRPKhdtbAwd8nBXkBqhAzpgqPEwJMH0YVmQxaH2FsSDEZnf4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666790798; bh=50l+vpKCx+OeRlUXe+uqq6Sjnk3af4rNyS6E+U3Vdok=;
 h=From:To:Subject:Date:MIME-Version;
 b=ThdacUz1a7GR38yfUzdJL9PtfrqY1+qt7LTkd+Lq7k6YBGG2uCUhtZNFjrNS8XFn3
 RvOL4h7qUYvQlPU0mluOvNCTVC958CkOUiTKxF0JRcw96nR3LLP28wgSVZMpSAQdE1
 15w5g/xmz8YfDKZ5m/ELeDUpYFssb7n8bIwD07e557pLFrDxDAWye96My1rLjwLTrR
 Sgni8c3qyJdw8k/rCX6Wi77vW7rPH/KPWUieQmQL2yUY7MYWNhIwwX8mVszPoMtX/t
 jA1zvMvyr0E6Nl6k0o35ctVLEc/L4I17h0jAKbexxy7HLsl311+SxyIm80v4g9Adlo
 rhL8OFsF9XACA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ThdacUz1
Subject: [Buildroot] [PATCH 1/7] package/rtl8189es: disable package for
 s390x architecture
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this
package for this architecture.

Fixes:
http://autobuild.buildroot.net/results/693053491ba61edcff0f75a4f30c13958e7e12ce/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8189es/Config.in b/package/rtl8189es/Config.in
index 2e3474e5e1..11dd225436 100644
--- a/package/rtl8189es/Config.in
+++ b/package/rtl8189es/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8189ES
 	bool "rtl8189es"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  Wireless driver rtl8189es.
@@ -7,4 +8,5 @@ config BR2_PACKAGE_RTL8189ES
 	  https://github.com/jwrdegoede/rtl8189ES_linux.git
 
 comment "rtl8189es needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
