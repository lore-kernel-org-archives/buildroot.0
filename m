Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610BDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 11:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB1AA41B4B;
	Thu, 28 Apr 2022 11:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2lE2bp1YVgs; Thu, 28 Apr 2022 11:55:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F717419B2;
	Thu, 28 Apr 2022 11:55:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63FFA1BF46A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 11:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51C3B419B2
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 11:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTJ7yhV3IOVS for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 11:55:47 +0000 (UTC)
X-Greylist: delayed 00:15:35 by SQLgrey-1.8.0
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABF71417BE
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QqtzS
 IT8wrrcBvVknW5+DLFP9QMsiYOVGgoxDfbWxyw=; b=nndaLbAf+eP61wP+vydgu
 JbUf9noIee9RGpgZOX+hjbM+ZVlkTKsZzQUm6fh7Mm7/mHgm9FPm1xgE56Mk5jHu
 /VeiEBJLRaex4h6RrMKIDK9vOlBD6Ql+HJkaOUtXyWmsacvDI+scw8Dn7cx2mz6c
 IwXxHMvf6TA8VQiJJ0/wW4=
Received: from localhost.localdomain (unknown [123.185.180.111])
 by smtp14 (Coremail) with SMTP id EsCowADHn6EWfWpiSlpcDQ--.65068S2;
 Thu, 28 Apr 2022 19:40:06 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 04:39:29 -0700
Message-Id: <20220428113929.1018091-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425111148.87319-1-tianyuanhao3@163.com>
References: <20220425111148.87319-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: EsCowADHn6EWfWpiSlpcDQ--.65068S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kry3KFWxKFyDAw4DAw1DWrg_yoW8AF4rpr
 4fCF12gr1rCr1UCFyUK3W2vryxXrs8Wan8C3srC3W0qF15Gw1kGr15ta15Jr47Way3Cw15
 G3Z8trW5ZryjgaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziDUU5UUUUU=
X-Originating-IP: [123.185.180.111]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGgnwjVaEBPBNCwABsP
Subject: [Buildroot] [PATCH v2] package/udev: move render and sgx to
 package/systemd
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
Cc: Carlos Santos <unixmania@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Moved groups render and sgx from UDEV_USERS to SYSTEMD_USERS as they
currently only appear in systemd's udev rules.

In systemd, group render was introduced since commit 4e15a73, and group
sgx was introduced since commit c9c4899.

In eudev, group render was introduced since commit bb070c1, but was
removed since commit a8ffcd1 [1].

[1]: https://github.com/eudev-project/eudev/issues/160

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Carlos Santos <unixmania@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---

Changes v2: UDEV_USERS_SYSTEMD to SYSTEMD_USERS
---
 package/systemd/systemd.mk | 2 ++
 package/udev/udev.mk       | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 58a1376b51..7a711319cf 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -603,6 +603,8 @@ endef
 
 define SYSTEMD_USERS
 	# udev user groups
+	- - render -1 * - - - DRI rendering nodes
+	- - sgx -1 * - - - SGX device nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index ce93d98431..d70d13ebb3 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-# Required by default rules for input devices
+# Required by default rules
 define UDEV_USERS
 	- - input -1 * - - - Input device group
-	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
-	- - sgx -1 * - - - SGX device nodes
 endef
 
 $(eval $(virtual-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
