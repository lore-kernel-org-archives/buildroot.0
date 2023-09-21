Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3DEC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B875B417EA;
	Mon,  5 Feb 2024 10:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B875B417EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyXRyFe-2J85; Mon,  5 Feb 2024 10:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D4C1417F9;
	Mon,  5 Feb 2024 10:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D4C1417F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13FF31BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB6214177D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB6214177D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJmtCdt7qp7V for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:32:13 +0000 (UTC)
X-Greylist: delayed 596 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 05 Feb 2024 10:32:13 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E5BB41862
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E5BB41862
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:32:13 +0000 (UTC)
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id B648E20066;
 Mon,  5 Feb 2024 10:22:24 +0000 (UTC)
From: ~bubu <bubu@git.sr.ht>
Date: Thu, 21 Sep 2023 22:39:44 +0200
Message-ID: <170712853287.18164.6368517214119629150-0@git.sr.ht>
X-Mailer: git.sr.ht
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=5zjNqG2/fT53Es+CVquuKQRrneZxNrA2ZvGAKuk/5EQ=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To:Cc;
 q=dns/txt; s=20240113; t=1707128544; v=1;
 b=m3wgn80bRWjrIaEawT3qzlVXXMBj/DPRrG3Aqy+BSKol2cHN3DY/bi1HutyjyJDQ5b7S1yWC
 wYIiRU7yk36FC34ZDYwYuIqGx95oe/BfP76ejsgU0s2lhSOCFTkzd4wNt8jbbdnhBzvNv2pdzkE
 se/eBJCfSECs+bVqOrKm3PXeWbADuWj1dMEXBZ2BaONEVHxkaUzT6iX6BUJ5D3ZSIHYlzDWmMLZ
 1uUKqRa5WhLWZkvQ2qDpCQfabkrPjDEhpGbm+I1OS52lk/i58GRRcvl9ZUnKliQYHmK4Kir0Y1Q
 nLjhtpFGl8bFMv/dQ95gvxajYe4MEUMVZIo2muxwFO9gg==
Subject: [Buildroot] [PATCH buildroot] package/python-minimalmodbus: fix
 empty package
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
Reply-To: ~bubu <bubu@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <marcus.hoffmann@othermo.de>

Calling `setup.py` build builds and installs  an empty package
after upstream changed their packaging. Calling setuptools via
`python -m build` builds the package correctly.
---
 package/python-minimalmodbus/python-minimalmodbus.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-minimalmodbus/python-minimalmodbus.mk b/package/python-minimalmodbus/python-minimalmodbus.mk
index 5a6e7733be..cb8a0d8cc9 100644
--- a/package/python-minimalmodbus/python-minimalmodbus.mk
+++ b/package/python-minimalmodbus/python-minimalmodbus.mk
@@ -7,7 +7,8 @@
 PYTHON_MINIMALMODBUS_VERSION = 2.1.1
 PYTHON_MINIMALMODBUS_SOURCE = minimalmodbus-$(PYTHON_MINIMALMODBUS_VERSION).tar.gz
 PYTHON_MINIMALMODBUS_SITE = https://files.pythonhosted.org/packages/37/fc/8a58f7bcdece751f16a4a9aac780acd1288aa8ac6adbffdd764c88fb71c6
-PYTHON_MINIMALMODBUS_SETUP_TYPE = setuptools
+PYTHON_MINIMALMODBUS_DEPENDENCIES = host-python-setuptools
+PYTHON_MINIMALMODBUS_SETUP_TYPE = pep517
 PYTHON_MINIMALMODBUS_LICENSE = Apache-2.0
 PYTHON_MINIMALMODBUS_LICENSE_FILES = LICENSE
 
-- 
2.38.5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
