Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889EFF483EC
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5816D821D9;
	Mon, 23 Mar 2026 19:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzpP2Z2_lt51; Mon, 23 Mar 2026 19:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56881821F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295253;
	bh=mMXApZWOI48OX1TirGbBA3F3lPu2cKfiXg+DcEGHnws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KcXIztzbQ4x5G3XSeZ16MLdkO2oakfE5C4kpcwtct/bjKFxx9TTIpwy/JpvIF5tpa
	 PvimgYp15HACZp6vk03JZFopRd4rCpdDVLG/TNEscGqW7jKbLMYrDNZug5rxTGTTE2
	 fyeDFtBxGJ265fJYXi30+mExvahmdKZnZfyQT6BXzBB3CBqHWpmdOFrBz8l5mS2yVW
	 At4/jWbtxvXlTmetjoKwLfTbzBRmk//Ips2bo/Hj/CPTK2Y0sbAcpv6l/RJYb/qUTq
	 +/38mhPd1eeVFOgo2caQoRGdf4VJ/B1mPQ++bNe5ruhHsHhi9M19W9dNCFchs+mHty
	 6TLNPvq06MzVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56881821F5;
	Mon, 23 Mar 2026 19:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03715F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A79CF405A4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUo5PMn2O0rl for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 445BB406A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 445BB406A8
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DB484C28; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ac6772493597fc6c44ec8633daa016aa2ed4886f
X-Git-Newrev: 6b9796ee55b5f0db54e2068341cc8f717d1c88a3
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.82DB484C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-flask:
 bump version to 3.1.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b9796ee55b5f0db54e2068341cc8f717d1c88a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/pallets/flask/releases/tag/3.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 68eb98b6fecf50bc5a59a69a3fc9dfcee29b0b74)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 17564e8587..ec2e5d39f9 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  59dc1b0772bab098aff83e8008e97af6  flask-3.1.1.tar.gz
-sha256  284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e  flask-3.1.1.tar.gz
+md5  62ae81cf2e91a376af909a2bc8939e15  flask-3.1.2.tar.gz
+sha256  bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87  flask-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 2269b05d29..8000489366 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 3.1.1
+PYTHON_FLASK_VERSION = 3.1.2
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/c0/de/e47735752347f4128bcf354e0da07ef311a78244eba9e3dc1d4a5ab21a98
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/dc/6d/cfe3c0fcc5e477df242b98bfe186a4c34357b4847e87ecaef04507332dab
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
