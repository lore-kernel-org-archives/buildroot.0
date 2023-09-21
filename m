Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A358E7107F
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 14:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEADB60F80;
	Thu, 21 Sep 2023 14:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEADB60F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uZ1ExE6Xjp3; Thu, 21 Sep 2023 14:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E80960EA0;
	Thu, 21 Sep 2023 14:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E80960EA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B05E1BF3B8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 14:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44ABE83C08
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 14:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44ABE83C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4uN21gg6G4Pw for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 14:26:34 +0000 (UTC)
X-Greylist: delayed 904 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 21 Sep 2023 14:26:33 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBF583C06
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BBF583C06
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 14:26:33 +0000 (UTC)
Received: from ubuntu-jammy.. (unknown [223.102.85.15])
 by zwqz-smtp-mta-g2-3 (Coremail) with SMTP id _____wAHCJ0KTwxlc9TWCg--.8669S2; 
 Thu, 21 Sep 2023 22:11:23 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 14:11:13 +0000
Message-Id: <20230921141113.1742-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920130754.2258-1-tianyuanhao3@163.com>
References: <20230920130754.2258-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAHCJ0KTwxlc9TWCg--.8669S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWfJFWUtryrZw4xKF43Awb_yoWfJwb_ZF
 4jqF4kWrZYqrWDWFWvkFn5Ar95K3s8Gr1vyF18t3Z8tryUJw45KF1vgr1rAF15Ja17Kr1U
 Aa9rWr93Kr43XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREoqc7UUUUU==
X-Originating-IP: [223.102.85.15]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBRw7xjWI0VaPhBAAAsw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=h5ftq
 QYUBRpPZqh7yWatlh0twstndN3wqQiWta8fcvU=; b=dGwwSnoyYItnjbjmoAFQW
 RcHiPXSOxBKDtlA4BR63qsgxnBjV0bmZKvjloLpnIWB6AFzEQIZtRvQNJTjyT6qr
 XW0utCWH6ZP88Zr6gmI07NbX7SkTwYILWMNR1GiH00rh+OCx90Vj7m6LcCPMfEpc
 obXTzGzazguSPrHYFVOXq0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=dGwwSnoy
Subject: [Buildroot] [PATCH v2 1/1] package/nftables: install libnftables to
 staging
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for network-config-manager:
https://github.com/vmware/network-config-manager/blob/v0.6.4/meson.build#L119

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/nftables/nftables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 20a7cd07ef..9cba243372 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -10,6 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
+NFTABLES_INSTALL_STAGING = YES
 NFTABLES_SELINUX_MODULES = iptables
 
 # Python bindings are handled by package nftables-python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
