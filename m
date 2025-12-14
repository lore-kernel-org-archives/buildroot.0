Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1484D5B171
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFAD860DBE;
	Sun, 14 Dec 2025 21:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf8KLG8II6rO; Sun, 14 Dec 2025 21:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E5E260DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747314;
	bh=INMCSgkPnuba0tRlqV8g8XrN2V5D3ws+TGe/YcegFTw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TbMsL3TBlk+ENz6oLfk0e3LjmUsx8bJvyWOMnDuW3AVEn13K6vxsdVhLzP7o+dBcQ
	 GC5cpIiV2lCnV0tLX6LLitGmmc5vf5WTVTB60juScqLIjW2eOMh0ALZRZVRy4j8JLp
	 peT0O/bveGmH3IGEzVFXknwAGsk4+TI2QGgQn4UIIDq2z31+K9ARcFVQ1bfFgBjpU0
	 zZbVJktSOg6OoKUChUuQlsA1DsZy2pR9qJ/8R3No06BVI+4szAOxgAiQCN34PAmjN3
	 IkY4uMqE9nm7u1jmSgIRwlh9NB0rOCDeI0+SC4ruHtRK9SMfvgiRrQ3Ado/VuYymUt
	 yT+6fgJOsFLUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E5E260DED;
	Sun, 14 Dec 2025 21:21:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15D0F2ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA08440644
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYJGtlE8Balm for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55FA40638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B55FA40638
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8434386E91; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e710ae054642cde858783d9421bfc0b634368987
X-Git-Newrev: 4a24dd62277111f5fc0fae06093574cdd96ed0a5
X-Patchwork-Hint: ignore
Message-Id: <20251214212139.8434386E91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cheroot: bump version to
 11.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a24dd62277111f5fc0fae06093574cdd96ed0a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cherrypy/cheroot/blob/v11.1.2/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cheroot/python-cheroot.hash | 4 ++--
 package/python-cheroot/python-cheroot.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cheroot/python-cheroot.hash b/package/python-cheroot/python-cheroot.hash
index cb3119def9..64d7eebb28 100644
--- a/package/python-cheroot/python-cheroot.hash
+++ b/package/python-cheroot/python-cheroot.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cheroot/json
-md5  5299bba86f892b2a8e7f1678e45b96ff  cheroot-11.0.0.tar.gz
-sha256  dd414eda6bdb15140e864bc1d1c9625030375d14cbe0b290092867368924a52f  cheroot-11.0.0.tar.gz
+md5  08ccbea749c4cd35b7371ced995d08b2  cheroot-11.1.2.tar.gz
+sha256  bfb70c49663f63b0440f2b54dbc6b0d1650e56dfe4e2641f59b2c6f727b44aca  cheroot-11.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e20feeb491a7e98084f15719349e9857aad41c4503c5e479f8815b063dbf7564  LICENSE.md
diff --git a/package/python-cheroot/python-cheroot.mk b/package/python-cheroot/python-cheroot.mk
index b0086b93df..4bd382ad65 100644
--- a/package/python-cheroot/python-cheroot.mk
+++ b/package/python-cheroot/python-cheroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHEROOT_VERSION = 11.0.0
+PYTHON_CHEROOT_VERSION = 11.1.2
 PYTHON_CHEROOT_SOURCE = cheroot-$(PYTHON_CHEROOT_VERSION).tar.gz
-PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/f4/01/5ef06df932a974d016ab9d7f93e78740b572c4020016794fd4799cdc09c6
+PYTHON_CHEROOT_SITE = https://files.pythonhosted.org/packages/68/e4/5c2020b60a55aca8d79ed55b62ad1cd7fc47ea44ad6b584e83f5f1bf58b0
 PYTHON_CHEROOT_LICENSE = BSD-3-Clause
 PYTHON_CHEROOT_LICENSE_FILES = LICENSE.md
 PYTHON_CHEROOT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
