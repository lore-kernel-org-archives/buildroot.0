Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE670C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4ABE83FC3;
	Mon, 19 May 2025 10:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DG4AW1l11yNI; Mon, 19 May 2025 10:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F205883FC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F205883FC8;
	Mon, 19 May 2025 10:48:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17180D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4777441280
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XD6j-LdbFAKo for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8795740D5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8795740D5F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84AC484A21; Mon, 19 May 2025 10:39:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 21:04:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e40db2ac5526574df66407236bf771755abe9f8a
X-Git-Newrev: ed408d6fdefb80b9b8d019014b1a9b0558329a3c
X-Patchwork-Hint: ignore
Message-Id: <20250519103948.84AC484A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 RTL8125D firmware
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0172128945306638293=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0172128945306638293==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ed408d6fdefb80b9b8d019014b1a9b0558329a3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add firmware for RTL8125D added in [1]. The r8169 driver currently supports
this card since Linux 6.13. The firmware was added in [2] included in
linux-firmware since version 20241017.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f75d1fbe7809bc5ed134204b920fd9e2fc5db1df
[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=2af74771a7bab8265c6c8ad8fca1419f5fe53c6b

Signed-off-by: Jan Čermák <sairon@sairon.cz>
[Julien: add linux-firmware commit and version comment in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e5e1b32dfd..3d6c2b624c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -701,6 +701,7 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8107e-2.fw \
 	rtl_nic/rtl8125a-3.fw \
 	rtl_nic/rtl8125b-2.fw \
+	rtl_nic/rtl8125d-1.fw \
 	rtl_nic/rtl8168d-1.fw \
 	rtl_nic/rtl8168d-2.fw \
 	rtl_nic/rtl8168e-1.fw \

--===============0172128945306638293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0172128945306638293==--
