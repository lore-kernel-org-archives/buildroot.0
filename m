Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D415CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 18:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C46061570;
	Mon,  4 May 2026 18:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDPKff-MzvvJ; Mon,  4 May 2026 18:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8FE361355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777920238;
	bh=0LnOmEG8plWfX4Kx1JpM8YFkisKr6WRJjIIujj9ws/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rDo93aNyRQbQeFru4YCOo+K2wJJ+iUok8qReX6g1i3C04Gl4hIZm1Tv8awicRlYxw
	 Sn6io/tAjNmSfpH8Ni24ZAPGpBv3/i/y4R1yp3bK5Z+TnSFFNM3zRJdfXW2PRS7yob
	 Lqfsarz+NCztai3lCOT3SJOQ5uofDRP7Brch/lvvLS5sq92h5Okf956wksd0VDUgzm
	 yI1KKuDeLE7fdirYeFO+AWtPawYGZ30cpIR5dK8lno2gSQq/9TRL5VET7mCYqgCawb
	 7COYx0bLf/2/FSzBPxVfmBb1Ne2ZSTksHw/mey8SLzL4Ap+v1MyjEEzh/yWgpnAOJi
	 de4KpX/RLkwcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8FE361355;
	Mon,  4 May 2026 18:43:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC9D25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D09661355
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEeNiQsfjPpe for <buildroot@buildroot.org>;
 Mon,  4 May 2026 18:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B1DA6134B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B1DA6134B
 for <buildroot@buildroot.org>; Mon,  4 May 2026 18:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F85F843B1; Mon,  4 May 2026 18:43:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 May 2026 20:39:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 206cd3cd31e1bff61f42b2bde9f71e0e003f6c14
X-Git-Newrev: f513a952076e99fe008eb80d8180c0172c6e4764
X-Patchwork-Hint: ignore
Message-Id: <20260504184357.4F85F843B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add RTL8125D rev.b
 firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3905530801216111824=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3905530801216111824==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f513a952076e99fe008eb80d8180c0172c6e4764
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add firmware for RTL8125D rev.b added in [1]. The r8169 driver currently
supports this card since Linux 6.14. The firmware was added in [2] included in
linux-firmware since version 20250109.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b3593df26ab19f114d613693fa8a92ab202803d0
[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=163296523cd4ccebbbd9026a769c76901c3a8e83

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4d7c608947..8187d1feaf 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -761,6 +761,7 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8125a-3.fw \
 	rtl_nic/rtl8125b-2.fw \
 	rtl_nic/rtl8125d-1.fw \
+	rtl_nic/rtl8125d-2.fw \
 	rtl_nic/rtl8168d-1.fw \
 	rtl_nic/rtl8168d-2.fw \
 	rtl_nic/rtl8168e-1.fw \

--===============3905530801216111824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3905530801216111824==--
