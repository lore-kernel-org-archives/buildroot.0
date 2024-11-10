Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38C3D12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 17:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F82080D18;
	Sun, 10 Nov 2024 17:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWQ-m-sJ7jZT; Sun, 10 Nov 2024 17:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B198080D14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B198080D14;
	Sun, 10 Nov 2024 17:11:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48B9D6C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 285F6402D7
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrXZ0zP2OtUf for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 17:11:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0233C401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0233C401D8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0233C401D8
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:11:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D982AB0054E;
 Sun, 10 Nov 2024 18:11:33 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Julien Olivain <ju.o@free.fr>
Date: Sun, 10 Nov 2024 18:11:29 +0100
Message-ID: <20241110171129.326957-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731258696;
 bh=/UW/bHvrItJKrOw27kClcA8eZNIlR7kxqk9rsIEPxJU=;
 h=From:To:Cc:Subject:Date:From;
 b=DxGaB0PUkGVSVxVl8+MEpNglYu/4MmDkYy7K1Zj7bwfQWQ8eS9av4Dy/MErXTrYyY
 Z1LafedD4oI6u5ViNWTrtFpszzKV/O+VUbBnPpGrEGtUI3Gextpx0hv3kV53drgoDw
 AUV2m4WMqOO5qM2n9kWzrbkYgzHK7OTyNZA4LYXbd2VcI/ZdDnrmwBKeuSZ4nX7uSc
 8DhElC+NnmTbv1/cCxjhjsVWUvXkxcL33VlEmphS3LYrwfxDv/tOnDVE+alur3IJSR
 0s6OUq2HTkBtRJQhYCcuIEQFyRzk3BP46pq5tu8sFYJJo9qXeIzXSBZwbkqrP+yfQi
 TTk/AxWZ98TcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DxGaB0PU
Subject: [Buildroot] [PATCH 1/1] package/usbredir: fix package homepage URL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current homepage URL [1] redirects to its https and ends up to
a HTTP 404 not found error. This commit fixes the issue by replacing
it with the new URL [2].

[1] http://www.spice-space.org/page/UsbRedir
[2] https://www.spice-space.org/usbredir.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/usbredir/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
index 6de6227e5c..46ccac122d 100644
--- a/package/usbredir/Config.in
+++ b/package/usbredir/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_USBREDIR
 	  Note: only the library is installed, not the utilities. Say
 	  'y' below if you want the tools too.
 
-	  http://www.spice-space.org/page/UsbRedir
+	  https://www.spice-space.org/usbredir.html
 
 if BR2_PACKAGE_USBREDIR
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
