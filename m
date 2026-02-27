Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7048EEF312
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E48060A9D;
	Thu,  5 Mar 2026 08:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7PfzuV_JAbv; Thu,  5 Mar 2026 08:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C123560B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697744;
	bh=02FrwywXqQLv1RiGtlaexmxMUJBOzyEj0WAI4QfEY7A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Aki4DP6OVIOyh7o/Tbik/0SyD+sYvnFDh2BRODPQLl1l5YT9MQhzqyhR8USy/UJln
	 uwsjj5DAWrLp/2rQ7gN8ZlSEQExhbli1KrLktQfeLFNyaV5sq7lGuPsKU6rqADL0WA
	 j4kLtU/GOwx5le8i2lRlqI5V7xzc3GhX6EVslgfCNJXB/F5UIO4z2r98VKBTLTYivy
	 NJpcxLYtunL1CY4q70uhG2FqQV6skLv1i0Vb6vKxlp1UZEo94DXNSH2tWNfIAiEmnR
	 qF0byhWDxj4eeshUA9lsIqMVKLoMqZv0CWrCpq2tqqd5Dcz6hAZpT6XDsKxprwucZK
	 3yOOJ4AFYDsbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C123560B08;
	Thu,  5 Mar 2026 08:02:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E85334F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E73940635
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrpU2jMQtW3W for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8BA24057B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8BA24057B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00CB6815F8; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 17:38:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f721d9d935fb1c8c61b92efbd5a5fd82fb374cb1
X-Git-Newrev: 06c64513668c6ccccd4c53c35f5fc141554d77d8
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.00CB6815F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add
 configs/versal_vpk120_defconfig for Neal Frager
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06c64513668c6ccccd4c53c35f5fc141554d77d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add configs/versal_vpk120_defconfig to the list of files I maintain.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..88a684d9ac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2510,6 +2510,7 @@ F:	boot/xilinx-embeddedsw/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/versal_vek280_defconfig
+F:	configs/versal_vpk120_defconfig
 F:	configs/versal_vpk180_defconfig
 F:	configs/versal2_vek385_defconfig
 F:	configs/zynq_zc702_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
