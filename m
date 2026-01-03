Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0E4FC617F
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D67E40756;
	Sat,  3 Jan 2026 11:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtuK-P9bKOzz; Sat,  3 Jan 2026 11:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D6F40399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440461;
	bh=1OKToaGoZpPNw7ShxuFC1tSkkR698MStQ3GfbFWtyqo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mDDT7UwkfOZCgD6bj0lsmX0piLnLYZyAHqXEagGJxB8sn+bmctXBa9lFl2ePGGnjS
	 1ZkWTqU3d0E0kWN3HeWVhNy8Uf/BmUEDlP8jAxOXUdLvSsPfJXgpnRtnTLjA5XIqG1
	 3TuPNX5t0l/D3wTk42cbhnfR41PKX7p01405vWLwCIAsKkY8aGX+Gg5Tj7sW3i8FyR
	 O7r+W8lwVo5hLq/yHsZkMHqBirxj0SISSmesk1DvCBLKzubAm5f7c563BuQCUx5Dib
	 XM+jsLmYxklXC72YWOWe+O2yy+DbVraTvPb85JpfVUgcQbs2Z+xUyM4h6UlqhdkPdx
	 Ik8n5gubBl1Gw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D6F40399;
	Sat,  3 Jan 2026 11:41:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4C8A21
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5192880A75
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yc8yTEeXwKbd for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9307080997
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9307080997
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BB398810F; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:31:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67d83670c72d895ff7806f4b31f0f3e7a20dd0bf
X-Git-Newrev: 77e19aa8a2d38c32f99ad0a2a9eb096d75df9e8d
X-Patchwork-Hint: ignore
Message-Id: <20260103114057.7BB398810F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 4.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=77e19aa8a2d38c32f99ad0a2a9eb096d75df9e8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 764da93f83..05e222dc4f 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  3ef6c195d98209d6d0daf0fe728c98ec  python_engineio-4.11.2.tar.gz
-sha256  145bb0daceb904b4bb2d3eb2d93f7dbb7bb87a6a0c4f20a94cc8654dec977129  python_engineio-4.11.2.tar.gz
+md5  724a0e786c6eb7ba9c1a03fd58b719ec  python_engineio-4.13.0.tar.gz
+sha256  f9c51a8754d2742ba832c24b46ed425fdd3064356914edd5a1e8ffde76ab7709  python_engineio-4.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 5bc9906ec5..76ae166970 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.11.2
+PYTHON_ENGINEIO_VERSION = 4.13.0
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/52/e0/a9e0fe427ce7f1b7dbf9531fa00ffe4b557c4a7bc8e71891c115af123170
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/42/5a/349caac055e03ef9e56ed29fa304846063b1771ee54ab8132bf98b29491e
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
