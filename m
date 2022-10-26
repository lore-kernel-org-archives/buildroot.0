Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A93FA373E
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5781E400F3;
	Wed, 26 Oct 2022 13:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5781E400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yzbiTq6Puaek; Wed, 26 Oct 2022 13:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A73C402EA;
	Wed, 26 Oct 2022 13:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A73C402EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06D6C1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D007040304
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D007040304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndv6n4t8zh1y for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4A89402EC
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4A89402EC
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQcoqmAu; Wed, 26 Oct 2022 15:26:44 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:34 +0200
Message-Id: <20221026132634.999254-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
References: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEAwE6O4/5v98SlulnjE/5yKfPffFsP7E6nPfwu8KHsxOVhTmx/QXXbdNcT2IGlYZrIJDb2sEkx3FmEV2+J9zAfYc2mfVrJkIxtRhj0mHiDlUKQ9J6eO
 5CI5aBFPJB0QvPKmkjoBwJVi/6FD/9AmOgbqnINFX8OLDAVhA7Dn0dNc4M7WnyPKx65WrenW4KBe+61cIOdv+v6auNo1I6CSLybFLU4I4hc/ikzK0/Jq2FGw
 pHF2QMkUu7VkORHdMyCWsz0R3d62g056/sYLoWuXuNO2V5RaxgnYT6/HZv5DGEpkv4233+J7wXWtVXhi73AAtMz5qy413DiicCjiMjnenKnmkMveFtVDuIpK
 Y8/lr5yT+33eY8OEvlgYB+HEXI6cR5Vs8vcNAa1Xyc0MY9jsSxDQVYsM1FhpeV6tlIwAZaCr/uBlWOpvyq6e6Ia433bk6S6oFFXA/IYMiXNypYIW1j4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666790804; bh=Tc9p5Zl3mk5Ll13jErwIr5uPMFZPgKCt7uicEpt7Kes=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZgEjJReXXnnbdlxA4eSOgRo0ORjRuv5qmY4FNVaVSB+cvnu8tntAAoAJx+UNXPehm
 OjxXLGfM8i1PecXsLtlFtaTEyDLvyv37X42aSNRbN+QGkgyIFO39VWcAE3sbmil6i7
 jQJxJmJwswHbt0qD3rj/PCvP6gLuHKC8dz/VttcOptzn1AY+TpPWar7TTcKfITWsn5
 C5r+KgGOjwWoyTYDh9+pshXZWRVo5LY2Tbzx/goLCvKC+LNhSG9uO2EGWvuizhZxAz
 IqsLJ/yEjdv31YrXh++hEUCPaMBKPfmrNBZvCxu3uiWXLKPFjKPTg+HL9br7RpN1R0
 FQ57g8IShlIUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ZgEjJReX
Subject: [Buildroot] [PATCH 7/7] package/wilc-driver: disable package for
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wilc-driver/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Config.in
index 7ed062bb66..7f970bd38b 100644
--- a/package/wilc-driver/Config.in
+++ b/package/wilc-driver/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WILC_DRIVER
 	bool "wilc kernel module"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  External kernel module for WILC1000/3000 devices.
@@ -59,4 +60,5 @@ endif
 endif
 
 comment "wilc kernel module needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
