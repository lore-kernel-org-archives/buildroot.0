Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11A6EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 12:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A3D41484;
	Sun,  2 Jul 2023 12:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A3D41484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6ZKPaTFqAYw; Sun,  2 Jul 2023 12:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 592A64137D;
	Sun,  2 Jul 2023 12:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 592A64137D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29F711BF48C
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 12:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D3C40165
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 12:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D3C40165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TsPCLjt5_9Tu for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 12:33:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECF194012B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECF194012B
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 12:33:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6E07A4C00B7;
 Sun,  2 Jul 2023 14:33:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33796)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFwGV-00047v-1W;
 Sun, 02 Jul 2023 14:33:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 14:33:19 +0200
Message-Id: <20230702123319.3012714-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688301201;
 bh=7Y/Zk5UtNjOhl/Nc2fGPtrtCjmh0J7YowsDCBdhdCio=;
 h=From:To:Cc:Subject:Date:From;
 b=jn3FXTW1Rsv1DzEAnLe+2EvCMQ/mOQzoIOYF+tDI/CO4mSA4DvXSnmG1+ZGbP+4hd
 NH7htVB/c7DYh7rjVFRhSCJQyXXL51CYVxFxrBi1EV07FyZygTE72ncohj6MXtYWcQ
 iYV2F/s1yFMtBN1uTeaJlivGqHXeQq6dvEseeJZQFJVgclEM4OcfYsQwFSJpvmPF8L
 VlsPNV1d9hqpAw7oJ6+y5hEHSrxEMu/yebZYkGXpRchhcMUpb9CKBEUXER6dWP/N/4
 e78HHUJtI6s66oF+ie/LItSYLTxowrJbsOGoQfYA9anIltweXgzAQ+Ue5LOHau3jqF
 YoIpJ43JNK4Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=jn3FXTW1
Subject: [Buildroot] [PATCH 1/1] package/mpir: force arm mode instead of
 Thumb mode
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
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:
/tmp/ccuwJnnt.s:124: Error: selected processor does not support `umull ip,r6,r2,r1' in Thumb mode
/tmp/ccuwJnnt.s:159: Error: selected processor does not support `umull ip,r0,r7,r1' in Thumb mode

Fixes:
http://autobuild.buildroot.net/results/610/61094bc7b7eb1d1e49bf8fcd1864b5cd3d7c4499/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpir/mpir.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 91f704d30c..5dbd760aa1 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -36,4 +36,8 @@ ifeq ($(BR2_powerpc64le),y)
 MPIR_CONF_ENV += MPN_PATH="generic"
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+MPIR_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
