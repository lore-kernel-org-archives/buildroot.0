Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7DEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436946108E
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 436946108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784D1400C1;
	Sat, 16 Oct 2021 21:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 455DTsSHOHwa; Sat, 16 Oct 2021 21:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61704402BF;
	Sat, 16 Oct 2021 21:54:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 652BA1BF2B1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4284440243
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uNmEXtcETTP for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 21:54:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 543A1400C1
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634421241;
 bh=fDzLYYQFrpJhgRv6I99wNZweqKuhq3yBDENv+vqDRZQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=eSD8f6Z+B/aA0KX1OXRRNggw8mXFMTt2o14TxI07jDMy3ZJczP0E0AKs3p4L3b+F0
 xH+b0mhY37WBBiotMkeYzatDtkPqtg4D/p7bUVHalxxCVfZfptt3kMZdlWJJYL+uab
 S5LfSwUTXt04uUsAeDUgAbJ1umyo3T3fHLutJnyA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M89Gj-1mfSOJ3itf-005LSN; Sat, 16 Oct 2021 23:54:00 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 23:53:56 +0200
Message-Id: <20211016215400.31415-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oFhnVnXROUEcgs5SRXjHTmwuMtt66iJYC0Ot04DUKM5srf5rHFT
 m4kPT/B7tsARiyEohWuVWfSmYJbXflQLQRjF6yV1ZP9SwW51DNJ7kzOL+K1k0i/nUXAXq+p
 Ez0D8ozzrDl5YAC7x63yy6XRLIwgw4q8SoyZdYn7JslpEagUQh4iV7JMNStNEPZ6qtnKtNO
 jC91VFgztguSE4y8j9b0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KqVKAJ9l3po=:Gp01vvfv484tIQCxJCYQU7
 d/kVMWDDR6pbvyWxmykhlisCRwxkpW8JHdQDbT9tNFoqcaj0d6RdkaeMdbFx758sUg/SE3aTs
 umX6JhmZbr44agUl+3LQ4Y/aBt0avzCWBGGta4PVB2MUY4VyfAbCxm/Yp18hFMoMymMjr007T
 WmcvrgeSEg4q2Y6kdbn2fDRuR9M1rfE4ZdkC+DeMeUnGNmius/S2LHeraQ5jjonRDzhtbhukt
 TtgwHPzjxQb358nbHcx/YULcg7knQsYSEmAixbRNHg8+SKZNckhbQWSEai6oyPnMggTN9lZ+K
 NhmIDnzs81U07K/7UJeoEVyXvB05ijV3+m2XR9gtuL1fnSyWm0wqwTUYmxQH0g9ieWIVnovni
 nw7s92auy+tsShrxmUbNRn2koxikvG5GrrBsbII8jyacqUzaRINT3fInUpV5PvEi7nVcyy9iD
 LgZ5ECyrMaKjaXkyY9M3TsFOerYtZPvwf5lGH/eOAvZQ9kCPMTxtk4cWxgSdUyQcVReBVwidZ
 eco/YexDnz/RuzHDaEfHoUJhTy4LF0tAPic/8WrYV93iBJriB95coIvkuWnn6d6M2AGSfYAgq
 AEbK3zJBQIkphMlU9GPdgFlfeh5L7PKiGTNH9ANwAglgStxvKm1E51HeiE6h1ZqgyHd6ALO+l
 IaYwUDnO0iM+klnaEtRQUAkZZ+ZTPFhadktaAOerNk6DQmAgyxx9p/oldHfeu9Y5zZDosGwDN
 GMHIDmXUHv7/LD5DhuDhRTsR/2uQPsoRue5+9tZeruYaSmZylUGHvZme2WYQfeiKvAAYh3R1M
 MbqHqUG/fb5gH/iteWjUNN/5Ww1X/6yJrJ7A5hVirBMKGkOs0VhQf1bCAtwobAWCuKDBETH66
 QxmmnZjpquN+2nAOMQ757hYz4EGjAkPwM1aG+skt1j+oxk+8ApQxkHc4Zr/LLZZrKXn013qNn
 40if/LtcBCDbX0q8oFeUqa4Xljsd4K9xs0qh+AhisMnrHWn5ZD17okrF1tiprxzTGAnmAKBVV
 EuZzaC0bTFaqWEYJn1zoBtLScp3iZw6ojnn7A6/5cK9VRC0xGWNr4NYPaVj/YVY+J5zIjstha
 W4Db8qsI1BVx9M=
Subject: [Buildroot] [PATCH v1 1/5] package/libubox: bump version to d716ac4
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  - a0dbcf8 tests: add blob-buffer overflow test
  - b36a3a9 blob: fix exceeding maximum buffer length
  - b8abed7 utils.h: add fallthrough macro
  - b14c468 json_script: fix unannotated fall-through warning
  - d716ac4 list.h: add a few missing iterator macros

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 94a071d80d..2775427485 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c6bac8baa7525b2d35eb22edeb5722c098370794d00e8859ef1a0bdfd8716151  libubox-551d75b5662cccd0466b990d58136bdf799a804d-br1.tar.gz
+sha256  54f65299439dab4be8f203588bcefd9b60052ae87d12c6d012f6278a2a111b4e  libubox-d716ac4bc4236031d4c3cc1ed362b502e20e3787-br1.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 20da5c2ec2..90ba57a883 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 551d75b5662cccd0466b990d58136bdf799a804d
+LIBUBOX_VERSION = d716ac4bc4236031d4c3cc1ed362b502e20e3787
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
