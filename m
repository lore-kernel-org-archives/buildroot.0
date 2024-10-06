Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6E6CFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 11:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B33C40378;
	Sun,  6 Oct 2024 11:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lW82V8IdkI1i; Sun,  6 Oct 2024 11:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15DDB40237
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15DDB40237;
	Sun,  6 Oct 2024 11:17:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C4E561BF40A
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 11:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4AD54023D
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 11:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7UewUbCQgku for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 11:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A00B401BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A00B401BF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A00B401BF
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 11:17:06 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3B0E7B00548;
 Sun,  6 Oct 2024 13:17:03 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 13:16:58 +0200
Message-ID: <20241006111658.1513395-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728213424;
 bh=8/K7ZfugjUwhLte6YBjWJEOgTHfTLhBvVg7PiHwwbic=;
 h=From:To:Cc:Subject:Date:From;
 b=WPI+xn1VhHbWbwCbzM/9TYXr8Bw/lB9IQpSk+4R83pCpg0QjDaBQBnahh/HKij5gB
 BApOCvY75FZs/VrzIhydteqibHDECEqAEcI/RhlyyuuJy9ABk/RuyeydXh5YgcFTCD
 Nd84khFANsxgWU72/ZKjsKeqIOjcodZ9Gd8v2dZD/QM+NfjJLaC5AglrSLkutOUubD
 cE2mpEji37gf+Jmc1MrypxxvnauNbzZAnrLU6G8BWl2vIhb+2c+QZxiKJC/imIHQHB
 WAIBuJwgQkqJHJBZmTktcuBOWGJj36Olkr6tD6Smu9kaVzTUKy3QaIdpP1XbyOmNU/
 v3KPIgxRzzczA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WPI+xn1V
Subject: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.8.14
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

For release note, see:
https://codeberg.org/a-j-wood/pv/src/tag/v1.8.14/docs/NEWS.md

This commit also adds a comment in the hash file, with the pgp key ID
and the URL where it can be retrieved.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8004176828
---
 package/pv/pv.hash | 4 +++-
 package/pv/pv.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index cac506a83f..e6b1b9bd69 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  e2bde058d0d3bfe03e60a6eedef6a179991f5cc698d1bac01b64a86f5a8c17af  pv-1.8.13.tar.gz
+# using key: 4267B4F90F2678A112169BD61D1EF7581B45E9A0
+# from: https://codeberg.org/a-j-wood.gpg
+sha256  0cc18811a4809a587d4b11d47691bbc0ad83a5d95d2c2606af74ea7b4a674756  pv-1.8.14.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 1434f8a88b..0c0fc55fab 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.8.13
+PV_VERSION = 1.8.14
 PV_SITE = http://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
