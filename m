Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE9DC3ABC3
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 13:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC05540804;
	Sun, 11 May 2025 13:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwJobj-bpH1u; Sun, 11 May 2025 13:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55878407B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55878407B5;
	Sun, 11 May 2025 13:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A159517D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 13:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92BD680FF8
 for <buildroot@buildroot.org>; Sun, 11 May 2025 13:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuFOONExt7CL for <buildroot@buildroot.org>;
 Sun, 11 May 2025 13:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E5A480FF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E5A480FF2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E5A480FF2
 for <buildroot@buildroot.org>; Sun, 11 May 2025 13:46:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D19C1B00576;
 Sun, 11 May 2025 15:46:49 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 11 May 2025 15:46:45 +0200
Message-ID: <20250511134645.1291069-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746971212;
 bh=YW0JSMnHp5eIPJQ/FbyPqjcUaTE3zIfiNaIZ8SBeXmU=;
 h=From:To:Cc:Subject:Date:From;
 b=GegzJcfwbB0t/lpGOl14G5inUb3IJpR05h7ue5GamUbJdq/0hB1u91mqG3aMG6a4T
 4eBPgQqLKBPlNdrQlrQvchq+/Dd0eTdQiHS0zDzuaw5kwmrhNx1xY7P7B9iv55aMJ7
 y1OXYNlloF3+w6L9LCcp7/ocfG5h2vLZWo6STq4x83jlYqlvpCa3dWyyVMrzK6fPpR
 a+cLsdakobaZhosc3MfYfDuAjnTbD/QzgDzJKDutH0PTDuapqyZBlYKVDNzim1u+qJ
 8+yZYbQw/45grhR8KIPEt+wMQ1bdLP1oj8bP1fMy9hclGsy93PJhQfhzpDI3mkOdKT
 /XQx1699YkKag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GegzJcfw
Subject: [Buildroot] [PATCH 1/1] package/flac: bump to version 1.5.0
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

For change log, see:
https://github.com/xiph/flac/releases/tag/1.5.0

The license file COPYING.Xiph hash is updated, after a year update in:
https://github.com/xiph/flac/commit/6974998fd499d65d23e8d42a9c12b6ca04d2e10b

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
compilation: https://gitlab.com/jolivain/buildroot/-/pipelines/1811599253
runtime: https://gitlab.com/jolivain/buildroot/-/jobs/9999119809
---
 package/flac/flac.hash | 4 ++--
 package/flac/flac.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index 0013a7485a..9ac2d4799e 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,6 +1,6 @@
 # From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA256SUMS.txt
-sha256  6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70  flac-1.4.3.tar.xz
+sha256  f2c1c76592a82ffff8413ba3c4a1299b6c7ab06c734dee03fd88630485c2b920  flac-1.5.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
-sha256  12600ea1a7affcbf469bd0d8b2cd725e4167114a2ee834b88f5d2857bfd7ddbf  COPYING.Xiph
+sha256  7866ee98760fc1f0156b4fe6bf530257e02be487ab3fd94e2b63799dd32d6b2c  COPYING.Xiph
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 6bac9ef8a7..e3c3da5375 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.4.3
+FLAC_VERSION = 1.5.0
 FLAC_SITE = https://ftp.osuosl.org/pub/xiph/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
