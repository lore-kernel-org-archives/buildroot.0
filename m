Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3475FFD0047
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 18:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB21783EFB;
	Sun,  1 Mar 2026 18:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbTuKxs4sFAU; Sun,  1 Mar 2026 18:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC61783ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772390878;
	bh=nkWz9sFXqy4wCsa1X7vns2/sCBm7BEYgTMZWv+oCzDM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZvebUXaT0cpM+GjQ56+YTNxCo5FcwTkgkyVFauAq4cUo2P+05cVUJ9B6F0N4BIyo9
	 hDWZ6sAR3WEoxkBorMXXTzyUYrL7j4/h7/UzIvBdsGnqKqy2RWXmAt8XUfDWcitgo5
	 fgEHlu/8rP9bnB9INjHB1oZQ35gqFqmfUEwPzv8cUiJy9tl1oFhVJ6uZySmPmzh978
	 0WxIBBLZmpdx85tb5KrUcUJXkUnUzEaykvCCu4mCIqlSJfOS6ZV2j7c3xepJeAXfQd
	 ehDCr8DBfwSZ+TYFxp9vtPV4p9ML326QTG6T3Y02xXMnTXQ2Cb6HUZnGT+awoJbv/S
	 DIT594tz5sMmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC61783ED4;
	Sun,  1 Mar 2026 18:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA5F231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A54C0417A1
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgdVN4xXDVsC for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 18:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D864041229
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D864041229
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:47:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA24985DCC; Sun,  1 Mar 2026 18:47:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 19:44:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49cabda8fb09c665f80cc45b505923b7a4a3bd60
X-Git-Newrev: 7756b39d64f97b386dc993080e1ec4c90f18eddc
X-Patchwork-Hint: ignore
Message-Id: <20260301184756.DA24985DCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multipart: security bump to
 version 0.0.22
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7756b39d64f97b386dc993080e1ec4c90f18eddc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/Kludex/python-multipart/releases/tag/0.0.22

Fixes:
https://www.cve.org/CVERecord?id=CVE-2026-24486

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
[Julien: reword commit log to mark the commit as a security bump]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index ed01763cd7..a5bc988b02 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python_multipart/json
-md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
-sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
+md5  0debb97a2b5d68f8dd5119bd200f4010  python_multipart-0.0.22.tar.gz
+sha256  7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58  python_multipart-0.0.22.tar.gz
 # Locally computed sha256 checksums
 sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 6921d935eb..cdaae6ef67 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.21
+PYTHON_MULTIPART_VERSION = 0.0.22
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
