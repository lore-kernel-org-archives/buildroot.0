Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAECC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 19:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D878342DBB;
	Fri, 25 Apr 2025 19:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jifFa01g7jOg; Fri, 25 Apr 2025 19:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 166F842DBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 166F842DBD;
	Fri, 25 Apr 2025 19:25:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43D8F31
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 415D06086A
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JY8wFGBkgvCZ for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 19:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C89461043
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C89461043
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C89461043
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 19:25:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 85B81B005AB;
 Fri, 25 Apr 2025 21:25:06 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 25 Apr 2025 21:24:57 +0200
Message-ID: <20250425192458.2276762-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745609108;
 bh=5WJ4szPZZKg10brgdbNB9ij7xgUfoyJSfHIEqvc0iHw=;
 h=From:To:Cc:Subject:Date:From;
 b=G2IqJdWCz8lsfdPUgIAK0cdYWs7acE91X+9WjqMdDvbRwpjPLyBicSOpcNOmq8ZlU
 HreVJ60dObtJ/3plG6Kd4fGAU8bUkSlDhB/af5ohmQAlXng99xyVZLA/8YDBEd0Ytt
 blZVJiZZEJvqehL0yhE0aRcwNCjQqlTKOwogA28NSzCO8H689F/so/xFicusZK/lCf
 7K3FBrYWW87ER42fvpm+G2dz7a4lDekDDjYfP73smtKy3aNBpK1CRcIJNYVRV6x2b7
 pPY9IoiBDVPq9luqtBniMdO42YGDUb+lRPPsugKQGSVIWEs2q48uAvgsK/0FwYsWUR
 mlgaaGnT0YSzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G2IqJdWC
Subject: [Buildroot] [PATCH 1/2] package/libqrencode: update Config.in
 homepage url
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

The old home page url [1] redirects to https, and points to the
japanese version of the site.

The commit updates this url to the https english version of the
site [2].

[1] http://fukuchi.org/works/qrencode/index.html
[2] https://fukuchi.org/en/works/qrencode/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libqrencode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
index b86662621e..7c3d9e4df6 100644
--- a/package/libqrencode/Config.in
+++ b/package/libqrencode/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBQRENCODE
 	  QR Code is up to 7000 digits or 4000 characters, and is
 	  highly robust.
 
-	  http://fukuchi.org/works/qrencode/index.html
+	  https://fukuchi.org/en/works/qrencode/
 
 if BR2_PACKAGE_LIBQRENCODE
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
