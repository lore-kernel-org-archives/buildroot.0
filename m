Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3A2C43219
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 17:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3E060E03;
	Tue,  8 Nov 2022 17:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3E060E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0BmSX5VrA_k; Tue,  8 Nov 2022 17:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95ADB60DFE;
	Tue,  8 Nov 2022 17:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95ADB60DFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 847361BF84C
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 17:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B009416D1
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 17:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B009416D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Q-7RnWWJgDi for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 17:19:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A781416D0
Received: from mailproxy05.manitu.net (mailproxy05.manitu.net [217.11.48.69])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A781416D0
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 17:19:13 +0000 (UTC)
Received: from [IPV6:2001:a61:3540:8301:a8c6:cd8c:c16e:5e60] (unknown
 [IPv6:2001:a61:3540:8301:a8c6:cd8c:c16e:5e60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy05.manitu.net (Postfix) with ESMTPSA id B34961B604FE;
 Tue,  8 Nov 2022 18:19:04 +0100 (CET)
Message-ID: <3d7721bd-ab21-89b5-61c0-0a729442883d@grandegger.com>
Date: Tue, 8 Nov 2022 18:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: [Buildroot] [PATCH] package/udisks: fix the tool name in the config
 help
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
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The name of the tool in udisks2 is udisksctl.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
  package/udisks/Config.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index a3a0f82144..4804c0eba0 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_UDISKS
  	     interfaces that can be used to query and manipulate
  	     storage devices.
  
-	   o a command-line tool, udisks(1), that can be used to query
+	   o a command-line tool, udisksctl(1), that can be used to query
  	     and use the daemon
  
  	  http://www.freedesktop.org/wiki/Software/udisks
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
