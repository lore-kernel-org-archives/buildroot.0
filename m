Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4A4E8FDB5
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A9B5407A3;
	Fri, 26 Dec 2025 20:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PShol1Etilfz; Fri, 26 Dec 2025 20:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33DA74076F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766782071;
	bh=FxvMxbVhWgOmK2LJ8aEdXV2nNNer04MpcOQd0oWFmVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JHS4WD0mTxt5hqjcaRPv73LMdQwxzlFBPaff+kdSn2+alSnoi51gyHtqBt36+FijD
	 IVlJhuHqykYwy9LKrF37mjbebHxtIFC6brlJPQfiIFLaR2QJC0SOK0Gg5TD28pZLan
	 W1n4q6sb/v7enE1McM95ElJilDIxwVRaUDVRDR1Vx25sIPCbU3u3nzWpQ8vnu0A8Eq
	 mzSM5kEwGPHtaxQJYCZ35eC5z1qxNSQL/aEgCQEnAdRwVGYNhHTMsQRtayzgmuUXes
	 beQpnF2l+DzzNQ1gLxbN9rT2mnk0tpR1Zp6IMxMLklaL2SyXg4D/NELKytzxl8sZPj
	 l41Jmk0Z0JzBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DA74076F;
	Fri, 26 Dec 2025 20:47:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3D9EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2550404B6
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cm3ziqLxnNdT for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5794037B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA5794037B
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A42C287714; Fri, 26 Dec 2025 20:47:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 21:31:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba24ae14bd7b642d60196f55f364c9b10363f0b1
X-Git-Newrev: 3b7f9adda2562e4dde73402f6691d39c76b4e284
X-Patchwork-Hint: ignore
Message-Id: <20251226204748.A42C287714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apscheduler: bump to 3.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b7f9adda2562e4dde73402f6691d39c76b4e284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/agronholm/apscheduler/releases/tag/3.11.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-apscheduler/python-apscheduler.hash | 4 ++--
 package/python-apscheduler/python-apscheduler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
index 55026aec7b..c29064c590 100644
--- a/package/python-apscheduler/python-apscheduler.hash
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apscheduler/json
-md5  ff8d1731e31d88e2e1fd0794099c920f  apscheduler-3.11.1.tar.gz
-sha256  0db77af6400c84d1747fe98a04b8b58f0080c77d11d338c4f507a9752880f221  apscheduler-3.11.1.tar.gz
+md5  22f9437792d120a17dc4154b5ebd1594  apscheduler-3.11.2.tar.gz
+sha256  2a9966b052ec805f020c8c4c3ae6e6a06e24b1bf19f2e11d91d8cca0473eef41  apscheduler-3.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
index b03022149f..0b66bb83c2 100644
--- a/package/python-apscheduler/python-apscheduler.mk
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APSCHEDULER_VERSION = 3.11.1
+PYTHON_APSCHEDULER_VERSION = 3.11.2
 PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
-PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/d0/81/192db4f8471de5bc1f0d098783decffb1e6e69c4f8b4bc6711094691950b
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/07/12/3e4389e5920b4c1763390c6d371162f3784f86f85cd6d6c1bfe68eef14e2
 PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
 PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_APSCHEDULER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
