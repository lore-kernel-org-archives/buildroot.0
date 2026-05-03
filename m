Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F652CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1918B84233;
	Sun,  3 May 2026 14:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9re10O572u2E; Sun,  3 May 2026 14:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467E0842ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819901;
	bh=6bJC5SWoF2P6/dN58gOGeFhEOXVxbBcraNGeT6j/wJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I5/BdX2IbQvKDUEyxRppjgLRJXupJqY6YcSEnKveKC758yvkqpOsTyQK1LHW0uclr
	 azT30eCgP9pobnvNotvvhqItmpPrlfv1V1lWY7+wGKDXwnlrUH3Vnn+BH073/qSYA2
	 yeIGUPcmALa/Sd+KbPr7l2yzpcRoHnnUUeq9UX1T7ICHkOYSxLjjFDaUN0f1WAx7n5
	 yXit+ibkr5tXnJf677RzF1RLpdt1i4KD/zvNXQRbs/9/CvO5e04wPfm1o063x5p1Gv
	 yC3OI40UaBnjUqMrbjQzuc4xNl7ROFzCHzDYTx1iV/qE7X0dsw8IOlxLKPfpJKASDb
	 Ze4ugi6oBPONA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 467E0842ED;
	Sun,  3 May 2026 14:51:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11701392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6698884269
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3lu22YZa-Cq for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B86884267
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B86884267
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 046EA83FAE; Sun,  3 May 2026 14:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e204b6b73df6e59358f561d7dd9e84a5707dbb6d
X-Git-Newrev: ddfaea33a84f3569d63bca600e8a332e9dc08b2d
X-Patchwork-Hint: ignore
Message-Id: <20260503145051.046EA83FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-werkzeug: bump version to
 3.1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ddfaea33a84f3569d63bca600e8a332e9dc08b2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pallets/werkzeug/blob/3.1.8/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index e7900fa734..4cbeb14e23 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  4ce9c948613b9b823226c98e28b9004b  werkzeug-3.1.6.tar.gz
-sha256  210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25  werkzeug-3.1.6.tar.gz
+md5  5b3063a0bfc95d46cb35258b03b9f30e  werkzeug-3.1.8.tar.gz
+sha256  9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44  werkzeug-3.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index c3b8a2c099..745e93f443 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.6
+PYTHON_WERKZEUG_VERSION = 3.1.8
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/61/f1/ee81806690a87dab5f5653c1f146c92bc066d7f4cebc603ef88eb9e13957
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/dd/b2/381be8cfdee792dd117872481b6e378f85c957dd7c5bca38897b08f765fd
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
