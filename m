Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711C4F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2775361195;
	Sun, 15 Mar 2026 22:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0n22JU94B4M; Sun, 15 Mar 2026 22:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B317611E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613092;
	bh=Cws0mvAskNFd5O0DYiClO1CTC2RYevbAgwVQKYqHLNw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wa2wbkbWgJyR3kn1YVBeDSg0mVwO3QIi7QObvBF5vdRDcYkfxiRNDC8YLDTyCcHjm
	 Usumpss3PyeOoBfytblAuiUQGZvON5DYWxVxuOnHHfm3APSCDlDiXxlUuLlZFGMPdh
	 1SRLByZ3+m3WnDzhmR6hsOARkFm50lBvGwd5zz+M8FkIuSwIPs6Py1HXGOnLhxd/jS
	 4ZkLfOJy/hUZSycfdlz33lqza4JZe2YG4Nl/7J1bLMfYZAuQ356ItEHEnzb2tHqO8g
	 tzP92N3Zys608nfTVUu3B0mTYGIDdL+hp4K65yOGSbCwJTeJX5dDEGQfs32fywHQKj
	 1U77Z36KIHZVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B317611E1;
	Sun, 15 Mar 2026 22:18:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE0F71B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6582D40721
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Vw2XIubzzYp for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B07C040711
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B07C040711
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F35D683F4D; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd1a38e994ea9eb3ca937581d1cb403e11aab232
X-Git-Newrev: 348d65c7260f3b6205e1fe39de1d9a3430ac4cb9
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.F35D683F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonmodels: bump version to
 2.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/348d65c7260f3b6205e1fe39de1d9a3430ac4cb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jazzband/jsonmodels/blob/2.8.0/HISTORY.rst

Upstream switched to hatch:
https://github.com/jazzband/jsonmodels/commit/1c4dab695a6187ff19e5a8e0aced313af6de28a5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-jsonmodels/python-jsonmodels.hash | 4 ++--
 package/python-jsonmodels/python-jsonmodels.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jsonmodels/python-jsonmodels.hash b/package/python-jsonmodels/python-jsonmodels.hash
index 1b0548fd25..f7cde97b4d 100644
--- a/package/python-jsonmodels/python-jsonmodels.hash
+++ b/package/python-jsonmodels/python-jsonmodels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonmodels/json
-md5  96132e252887f840d23792c03fad2039  jsonmodels-2.4.tar.gz
-sha256  abc8dc334a1794513e511a75639f77c271ef6a2992b6793f3753c7335dd18775  jsonmodels-2.4.tar.gz
+md5  8fe7bda2a40b92e5d3fcdb7e676fd8ad  jsonmodels-2.8.0.tar.gz
+sha256  9c37ae58f0417252b743ee1fa85fc937d9696e16520824f6b221f19f62f08f9c  jsonmodels-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
diff --git a/package/python-jsonmodels/python-jsonmodels.mk b/package/python-jsonmodels/python-jsonmodels.mk
index 4e4eecf233..faf40cfcde 100644
--- a/package/python-jsonmodels/python-jsonmodels.mk
+++ b/package/python-jsonmodels/python-jsonmodels.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_JSONMODELS_VERSION = 2.4
+PYTHON_JSONMODELS_VERSION = 2.8.0
 PYTHON_JSONMODELS_SOURCE = jsonmodels-$(PYTHON_JSONMODELS_VERSION).tar.gz
-PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/68/00/524668dc751f9ef91e73c795b2073bf2ddb79728a474d1bcab9c6dc426d8
-PYTHON_JSONMODELS_SETUP_TYPE = setuptools
+PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/04/85/0e02cbc656ef7f0f5d3db13be5b622c231bf55bbad6a8c4612ce95fcb8cf
+PYTHON_JSONMODELS_SETUP_TYPE = hatch
 PYTHON_JSONMODELS_LICENSE = BSD-3-Clause
 PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
