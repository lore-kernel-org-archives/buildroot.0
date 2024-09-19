Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971FBCE8D7D
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 12:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31DA74241E;
	Thu, 19 Sep 2024 12:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2z0wnXdhSqE; Thu, 19 Sep 2024 12:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 167C74242E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 167C74242E;
	Thu, 19 Sep 2024 12:58:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6356C1BF310
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 12:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51A634242E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 12:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNUw0lrtuZXP for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 12:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.3;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C1594241E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C1594241E
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C1594241E
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 12:58:30 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.84.87])
 by gzga-smtp-mta-g2-3 (Coremail) with SMTP id _____wAHpS7uH+xma9tmBw--.40024S2;
 Thu, 19 Sep 2024 20:58:23 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:58:20 -0700
Message-ID: <20240919125820.3583-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wAHpS7uH+xma9tmBw--.40024S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWxtrW7Kw1ftFW8CrW3ZFb_yoWDXFgEgF
 40yrnYyr1FgrWkXr10yFs3tF9a934UGw4jq3ZxtrsIyr1xWw1q9r1UCr10ga13WF1Ut3W5
 tw15Wr4jqFnxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbOzsJUUUUU==
X-Originating-IP: [223.102.84.87]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRFfjWXAnWXXEwAAsH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=k42CK
 V3oJCBPBGGq0AxIRTFT7mmzmhIBNylwoRy/7FE=; b=AbhCBg/xAMY3lrVfVEP+K
 7en1aT5YeHRlCfHQPiR19Y/iNriwLJpC9uUtl3roFXS29HuMP5w0LbkKNEAE8nsU
 UB/6Iycu7sWnP8ITMPqb6ffz6RNPhHyn3GQyJxfM82i/ugqpwswsehdaQImKyYmA
 R8Vx4xxtv6xMy7+mCTNRTA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=AbhCBg/x
Subject: [Buildroot] [PATCH 1/1] package/chrony: set the permissions with
 CHRONY_PERMISSIONS
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
  chronyd[241]: Could not open /var/lib/chrony/chrony.drift.tmp : Permission denied

Refs:
https://github.com/jens-maus/RaspberryMatic/blob/3.77.7.20240826/buildroot-external/overlay/base/etc/init.d/S46chrony#L44
https://github.com/troglobit/myLinux/blob/5ab2ec53d70904b1c3f2570afaa31eeaa4c4487b/package/skeleton-init-finit/skeleton/etc/tmpfiles.d/chrony.conf

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/chrony/chrony.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 9ed9dcff56..11270206bd 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -24,6 +24,10 @@ define CHRONY_USERS
 	chrony -1 chrony -1 * /run/chrony - - Time daemon
 endef
 
+define CHRONY_PERMISSIONS
+	/var/lib/chrony d 755 chrony chrony - - - - -
+endef
+
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CHRONY_DEPENDENCIES += libnss
 else
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
