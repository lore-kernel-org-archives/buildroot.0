Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56126C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 15:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA6D381F77;
	Tue, 15 Aug 2023 15:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA6D381F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qdghevxmp0s; Tue, 15 Aug 2023 15:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28BE881F52;
	Tue, 15 Aug 2023 15:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28BE881F52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0799D1BF475
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2D9440545
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 15:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D9440545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5q5q75XpYgK for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 15:17:14 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2252C4023D
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 15:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2252C4023D
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E901613F8AF;
 Tue, 15 Aug 2023 17:17:08 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 17:17:00 +0200
Message-ID: <20230815151700.18920-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692112631;
 bh=w9FwsCKUvN/LW4SN1c97TLlPK29wxpMlOZWbxLIzWyw=;
 h=From:To:Cc:Subject:Date:From;
 b=c/gxGat0K/UQV0sqGksMkyrGi6VRjvr5XOAn5VFWvsN+7jC9iD/58K64Ht1OXAhj6
 pnIbYlNXd4e3c11mYONMCCiwEv3AF9LVfhWUnyYoi3skOiCI+trMyBY5Ul7oWFO/eI
 rP2uHkqXkLaE9AgPzBG759Slu6qwPOPwhgNxzPv6YNuYNFC6XoGs0/r9wRW+QJ0MjU
 awKiTbIYLw9AcB7+4H38SPwE41w/J4ChZjNfxgwIdhWqPo5gFrllpnXOw0g3/BxjyE
 eTEFoQ1NhOH/e64coip/bvElEGyiHBhjZX4J/jkRdkmoKM+6tRD6oyVce1CH4dletW
 nriGyFx0j/zbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c/gxGat0
Subject: [Buildroot] [PATCH next 1/1] package/pipewire: fix typo in Kconfig
 comment
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

"NTPL" should read "NPTL" (Native POSIX Threads Library).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pipewire/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 4929e5d3d1..9d2de6c866 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -60,7 +60,7 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ dynamic library, NTPL, gcc >= 5"
+comment "pipewire needs a toolchain w/ dynamic library, NPTL, gcc >= 5"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
