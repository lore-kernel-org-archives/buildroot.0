Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA12E9273E
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A6040757;
	Mon, 29 Dec 2025 16:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYR5zhjULVXB; Mon, 29 Dec 2025 16:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B3974074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767025935;
	bh=OvXL7IrBDFozELS9Ck0IJmtGElhDPlCnOZg3m+OVBAo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZkIfyhlWeDWGpzWdxMufap2FL/YciYI18WNsXuLsdI7lbQ27NnybVhNc8NjIeSBSy
	 gkZenVUqTEJ2Q/yTzszUeUeQLuCeAnd5iucOPCbFZKZgGRB4RuVYbvkmqNI86afJeM
	 HzubsNwWjuGEwozotvKlK0QsDTMZ5ZwspxynLPsKAmEefdleYfOirspfJyEgwMggYQ
	 WBhJiTkBsKifOYl2/BBuDuwxHn/4wnvfNLQZnT4V5h6D1Hd2983y+zPVRs+evouEHw
	 andLRwkNLSz2djZJoYPNTqc01haAnRajFP1EqRZC9nDuncKLIXp4RHoFn/IuXBLfeD
	 X8Zg+l7iFJZRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B3974074C;
	Mon, 29 Dec 2025 16:32:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 58DDFB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF234074C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nygKBHTSdjVF for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 879634039D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 879634039D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6576987B67; Mon, 29 Dec 2025 16:32:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 17:31:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d2dbb4684941ea35fbee5be5eaa5333f00e9b16
X-Git-Newrev: 8c64a83c43820dfc8240c9fef63f3dbda9d4d2e6
X-Patchwork-Hint: ignore
Message-Id: <20251229163213.6576987B67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: move iiod init script from
 S99 to S60
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c64a83c43820dfc8240c9fef63f3dbda9d4d2e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running in S99 makes it impossible to start any service that uses iiod
after it, at least by numerical ordering only. Move it forward to
change that.

There are two dependencies of iiod:
1. The IIO devices that it should expose must be available.
2. Network must be up, which means firewall at least should be.

The former may be covered by loading modules, e.g. using S11modules
from package/initscripts. There are different ways to handle network
setup, but with SysV init scripts they generally run before S50.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiio/{S99iiod => S60iiod} | 0
 package/libiio/libiio.mk            | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/S99iiod b/package/libiio/S60iiod
similarity index 100%
rename from package/libiio/S99iiod
rename to package/libiio/S60iiod
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index b85bb9786a..b27532579e 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -100,8 +100,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
 define LIBIIO_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/libiio/S99iiod \
-		$(TARGET_DIR)/etc/init.d/S99iiod
+	$(INSTALL) -D -m 0755 package/libiio/S60iiod \
+		$(TARGET_DIR)/etc/init.d/S60iiod
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
