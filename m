Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3851AC10F04
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE7354149F;
	Sun,  3 Dec 2023 18:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE7354149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7VmwsEpg_qPx; Sun,  3 Dec 2023 18:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BF541506;
	Sun,  3 Dec 2023 18:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BF541506
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68CC01BF8C7
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409CA40438
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 409CA40438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5ATxLqv0xo9 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F558400D8
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F558400D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18F288781E; Sun,  3 Dec 2023 18:10:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 19:02:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a9d03feed642a860c11122a0b0ab32365201fc40
X-Git-Newrev: 302199957705ae9b63741ce8a571b706bcc577e2
X-Patchwork-Hint: ignore
Message-Id: <20231203181053.18F288781E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 RTL8851/RTL8852 firmware
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9190060361621830599=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9190060361621830599==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=302199957705ae9b63741ce8a571b706bcc577e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add firmware files for RTL8851 and RTL8852 cards used by the rtlbt driver.

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c2cf0fec19..96905dd909 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -90,7 +90,12 @@ LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8821c_config.bin rtl_bt/rtl8821c_fw.bin \
 	rtl_bt/rtl8822b_config.bin rtl_bt/rtl8822b_fw.bin \
 	rtl_bt/rtl8822cs_config.bin rtl_bt/rtl8822cs_fw.bin \
-	rtl_bt/rtl8822cu_config.bin rtl_bt/rtl8822cu_fw.bin
+	rtl_bt/rtl8822cu_config.bin rtl_bt/rtl8822cu_fw.bin \
+	rtl_bt/rtl8851bu_fw.bin rtl_bt/rtl8851bu_config.bin \
+	rtl_bt/rtl8852au_fw.bin rtl_bt/rtl8852au_config.bin \
+	rtl_bt/rtl8852bu_fw.bin rtl_bt/rtl8852bu_config.bin \
+	rtl_bt/rtl8852cu_fw.bin rtl_bt/rtl8852cu_config.bin \
+	rtl_bt/rtl8852cu_fw_v2.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 

--===============9190060361621830599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9190060361621830599==--
