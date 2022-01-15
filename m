Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FB2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 02:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CB541561;
	Sat, 15 Jan 2022 02:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGQ1DdnzoPnJ; Sat, 15 Jan 2022 02:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B80C41524;
	Sat, 15 Jan 2022 02:06:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3431BF344
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 02:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F53483005
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 02:06:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-E3oH0IEbMi for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 02:06:07 +0000 (UTC)
X-Greylist: delayed 00:15:11 by SQLgrey-1.8.0
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C7E981A34
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 02:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Qvnst
 i8ht2kNVqd+nPy1mseu9WevDjQA4U9se2x/Ca4=; b=gDOQwrpB3mC0m3yO/SGlc
 2NA6j9nWY4rzpt54JnbZ34JBuVnOi7HV2RqQ5k+DjDi+S+DG+iXhXjjVKJVKfvJx
 eKQZkY//GL0rYcvOIBN3zAOVFTpMx7OWb6Vhgs11fOAghNsI92zh5ILwoto5X27y
 t5wQmmUtamWYwZed4n5FXc=
Received: from localhost.localdomain (unknown [123.185.181.164])
 by smtp10 (Coremail) with SMTP id DsCowAD3_4N5KOJhvJXNAA--.29636S2;
 Sat, 15 Jan 2022 09:50:49 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:50:04 -0800
Message-Id: <20220115015004.2531151-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DsCowAD3_4N5KOJhvJXNAA--.29636S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr13Cr17Xr1DXr1rZw1DKFg_yoW8JFWfpa
 nrGF15Kr409an3J34Igr1UX3WrXayUWFy0q3W7C3y8J3ykKwnavas3Cr4rCrZxJF1Sya1U
 Zw17KrW0kayxXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVhFxUUUUU=
X-Originating-IP: [123.185.181.164]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRyJjVWBmtCSsAAAs5
Subject: [Buildroot] [PATCH 1/1] package/util-linux/util-linux-libs: add a
 missing patch
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit 2f5068640161f7b267099e28b69d4c2280b4ded3 added a patch for
util-linux, but forgot to create a symlink to util-linux-libs. This
results in inconsistent libblkid.so builds from util-linux and
util-linux-libs.

If you enable BR2_PER_PACKAGE_DIRECTORIES, you will find that different
libblkid.so is used in different
$(BASE_DIR)/per-package/$(PKG)_NAME/target.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 ...ibblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch

diff --git a/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
new file mode 120000
index 0000000000..2f3c482144
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
@@ -0,0 +1 @@
+../0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
\ No newline at end of file
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
