Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5921FC43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 19:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1393F606CE;
	Mon,  6 Jul 2026 19:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VClzBh9z0mvs; Mon,  6 Jul 2026 19:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1B026068D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783367547;
	bh=becENFFZuLEiuzVmjph5lIXAIlpE7d22u6Aot8sL+3M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ejoQwzLym6rXM8won5rcnHl6b5HfwMh2lHPJETvlJvbjpXvI6HTQUrduoRMaHru96
	 otzeBVtnTLjl3bfKBbo4XOaYecNDNmD3beYlZd06suHX4wS12bDwCNpTkW6oUjclHZ
	 3qyRiSovzp30LMUg3/ftKxSzcDJAHPrkRMdm06NRawPjzotPAshe8sFvBn2MdYKlE1
	 L4i1ljUS6EI3T/L45ATxTXM18S4No0jlwF3nTZnoAPnmwLyN9tgEHzkNur5MAT5i73
	 0iI6IgBKOcfNtTrBNAEvqjXE2UzaM/zvfgQp5vkPtIP3KxVnIwqkySRE3//OhgexWC
	 0btL/q6wPCh6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B026068D;
	Mon,  6 Jul 2026 19:52:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA734F2
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1697400FF
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGp46SG3uYHM for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 19:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21FD04007E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21FD04007E
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AB6988549; Mon,  6 Jul 2026 19:51:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Jul 2026 21:44:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90add0c09e18e1f7d500f06feb9c9d02d723f8e6
X-Git-Newrev: 6854ee9aa3826d5036a7d3cc19056d43c0452320
X-Patchwork-Hint: ignore
Message-Id: <20260706195155.1AB6988549@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2026.05.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6854ee9aa3826d5036a7d3cc19056d43c0452320
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://github.com/sbabic/swupdate/releases/tag/2026.05.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 06583ade35..6a32b38c95 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fd70cdfc7224b4209f5f657c3d6052688412325ea5d4e9e792575fa22eb65cef  swupdate-2026.05.tar.gz
+sha256  26236a354e8cf21806d20a76728b3805ae49c23cfb2eb794fe91d1f0b280298e  swupdate-2026.05.1.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 983cd6eccc..2384dea33a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2026.05
+SWUPDATE_VERSION = 2026.05.1
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
