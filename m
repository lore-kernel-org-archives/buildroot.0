Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E09C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDBAC60AED;
	Mon,  1 Jul 2024 19:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKEXvG_UKHoC; Mon,  1 Jul 2024 19:39:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC14A60AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC14A60AD1;
	Mon,  1 Jul 2024 19:39:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1111BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC99280DA3
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPKSoCUCNUtN for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:39:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CD3F80D6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD3F80D6F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CD3F80D6F
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:39:48 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EBC9FB0037C;
 Mon,  1 Jul 2024 21:39:44 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 21:39:24 +0200
Message-ID: <20240701193924.799937-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719862786;
 bh=ptMpijx9sf3Au2Q0il8kbLSPUIQSiUNHsnKySXkVWI4=;
 h=From:To:Cc:Subject:Date:From;
 b=ui0QP8Laq42NvPWd6pFleAwdBH8Bq9POa7o3Vs8Jo73rdj7Gj6PyFa8Xt7A3kI++Q
 4bklVB3qmjZNIwcCwmyFc5SkSpKzqnezpaJVrrZSHTqrdchgZJPqWta+63oo/epdcL
 nsHc7YUEpiRew1qnVnrO6D7uslrnvlyY6rAM/jvvpqqeOknjUR/AXpMYfU7NC9BTwn
 rCh6Oj2akqLPBQCruMSWRdCxhnmE4P2RNkerUZ3B6NWGP1GwTH/oMgot5iYc256sDX
 nRukeypkxW+WbZ4pu6woZYDukzk4N6I6mnFXONJwyFEsMyYsVx2irHQnq2R+JdY34A
 wrdODv4xdHtgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ui0QP8La
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: update Kconfig package
 homepage URL
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old xfs homepage URL [1] seems defunct at the time of this commit.
The http URL redirects to https, the certificate expired on
2024-01-26. If the certificate expiration date is ignored, the site
shows a "502 Bad Gateway" error.

The package README [2] advertise the homepage as [3].

This commit updates the URL to the new one.

[1] http://xfs.org
[2] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/README?h=v6.4.0#n12
[3] https://xfs.wiki.kernel.org

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xfsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index d14c3d46986..1a29579d8b8 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -18,4 +18,4 @@ config BR2_PACKAGE_XFSPROGS
 	help
 	  The XFS file system utilities and libraries
 
-	  http://xfs.org
+	  https://xfs.wiki.kernel.org
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
