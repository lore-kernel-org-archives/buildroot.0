Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2FCC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 22:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90562409A3;
	Wed,  2 Feb 2022 22:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLXD6E2AZ-n7; Wed,  2 Feb 2022 22:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E99D40253;
	Wed,  2 Feb 2022 22:05:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BDBC1BF5DE
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89F87404F7
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FpANEdJaNbwX for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 22:05:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19C6440339
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 22:05:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FNkxnvHOX0FuyFNkxn5Vjf; Wed, 02 Feb 2022 23:05:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643839540; bh=LUC3wU27hJFo0lmmDEuv71a3/NzAB9hvc+IHUNAMliY=;
 h=From:To:Subject:Date:MIME-Version;
 b=enHxM8noTnUi0j70jwwV+XSf5CREDYlYIaaGIx578HpucFbiCDXywWnsmZJlnwgGB
 6cgv+vL5JdAg7Wd8h0kJb7fbrH062s6pYgXyHo95q/G6JI4KkVN5E8HRcCTVJtfg/7
 0oRgMH9iggLgIuyjgj5Yeo7CV8A20gCfYKiJbrtyPoGIFl1ya9pdV0hMD3sSqC4KTc
 GHDHyt5//TIB2rvxUigoXw+tVjDPuv1FWU49x6ez9bwq+sfOfU7fSld0JzR+Xd1sTw
 uX+QwvlKyryALnVO4kxZ/5KRg2ZF8VvIAI1/2z3LzqgCiF40rxkWoMx7w+YlXDssbz
 81CdmGQPbo1Jg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 23:05:38 +0100
Message-Id: <20220202220538.2858380-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <412baee3-b818-521a-99bf-ee868d3e1be2@benettiengineering.com>
References: <412baee3-b818-521a-99bf-ee868d3e1be2@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB8jf7sZGl5WXw+ELigwfFKeA1qW2/ImJYvE0UIWbdoIW67gEzm/HCPB7MrkPvsiFfS7XEsPjHmFi6PhhoOSUmHdCsEp9cE+ydIl68ol3KX0FwX6EcWX
 93QQoRMetuYZJycXgOefPpdSGykEYIlLUqNftu6fxt/dzhoPhCPuOSM968BBXt8wi9hHo0JscafdThMTSg0S3tXzUk9aZ2sc3QC7QXfvMmpOZ/lAY+qTJgU5
 +hJVKI0PF56wGMnj5Z2oX87epASHxiq1e8thcdEaRTQ+CPKRRL6M1v8APl04DwtXkjYx3Cg6syYUkO11/HIymTTpogblmN7Br4/i6DzCZDSv98N823NeWCJR
 qAvCDR6DKyao4TAkxrNnwsOObuVJSZW3e/9mz2BodiX9vIPcFmd47RYT3y/sHI+p3UTY3q2uYF9rDBrDIk2MzG5cKKaAMg==
Subject: [Buildroot] [PATCH] package/util-linux: improve host build failure
 fix
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As suggested by Peter Seiderer package util-linux doesn't need raw support
when built for host, so let's remove:
HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
in favor of:
HOST_UTIL_LINUX_CONF_OPTS += --disable-raw
This is a better approach than my commit:
https://git.buildroot.net/buildroot/commit/?id=d895bd973b35fde10d3dd7db530d9e4782926497

Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/util-linux/util-linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5a4ff64d01..f3297257cf 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -41,7 +41,6 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 	touch $(@D)/disk-utils/raw.8
 endef
 UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
-HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
 
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
@@ -49,7 +48,8 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 HOST_UTIL_LINUX_CONF_OPTS = \
 	--without-systemd \
 	--with-systemdsystemunitdir=no \
-	--without-python
+	--without-python \
+	--disable-raw
 
 ifneq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_CRAMFS)$(BR2_PACKAGE_UTIL_LINUX_FSCK)$(BR2_PACKAGE_UTIL_LINUX_LOSETUP),)
 UTIL_LINUX_SELINUX_MODULES = fstools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
