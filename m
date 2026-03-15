Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011ADF3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C020D41568;
	Sun, 15 Mar 2026 22:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFt06pZceoQ0; Sun, 15 Mar 2026 22:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C995241571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613163;
	bh=S67OVg/LWK6cRhQsOgy86hfXJALd6wxPKGNsl6+bwk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=klsCgKFovjWslChkjArS3BFl8v5DmDN0otNgCS83GZN+jinMBdgS8X4uQ3XugNU38
	 t7RdquTbK/MqolBSwe+Mx52WNfxAgfAQQs9uVJU9hlDgYt6ZO4nZsct8ElhUj7/41Q
	 8L/UagBkdJxD5yt1mz9SXY+H8k5fRlt9mskKS63tKfGKGLLQm5Tvph4q01sF+c1WV/
	 sfRU2lfITbpvzvlEBv0x9zjW3VpnTTCRMqoF34rMC+MQCuSu6DvySibH9mxkFXp0Nd
	 NyCp5pWO3JsXTZKHLFjL1KTdX60tJ8yWeirbg98rRkpVyKWexE0Q5kS5HU3APsvZCO
	 c6FCU9BlcM0iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C995241571;
	Sun, 15 Mar 2026 22:19:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 019161B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD7FA61093
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNRmuFawiEs2 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004AA61089
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 004AA61089
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42004839BB; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f17e0c2c92b58fad20f49e1fa9142ecbb87c593
X-Git-Newrev: 0d63b4cc92208c477eb82009bdb821aa675f1f19
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.42004839BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tftpy: bump version to 0.8.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d63b4cc92208c477eb82009bdb821aa675f1f19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/msoulier/tftpy/blob/master/ChangeLog.md

Upstream bumped the version without creating a version tag:
https://github.com/msoulier/tftpy/commit/fc93bae6c1852fa187a255095b99ddfaa5a4933e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tftpy/python-tftpy.hash | 4 ++--
 package/python-tftpy/python-tftpy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tftpy/python-tftpy.hash b/package/python-tftpy/python-tftpy.hash
index 93fb32621d..a8cb0ba2ec 100644
--- a/package/python-tftpy/python-tftpy.hash
+++ b/package/python-tftpy/python-tftpy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/tftpy/json
-md5  8f81c101961282c965086fc3cd123a40  tftpy-0.8.6.tar.gz
-sha256  f616f6a43a36d481c266573608597b9dd3c7c63818415d72aa04f1d1795480ea  tftpy-0.8.6.tar.gz
+md5  c7ad05458727c1acbb1898528c4a5f0d  tftpy-0.8.7.tar.gz
+sha256  e8a5aa092dab2e1cbb9b94392036827b808dc37eb6cf1b1ab33c81957b3f5fe2  tftpy-0.8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  fc1460bf698c4207a255fffb446ce21d44cb0d9a8f2ee5ad705cd40969800050  python-tftpy-0.8.5.tar.gz
 sha256  4616f0c71e62ce2e0f6cdd3aef6d3c285f8730c9304b88a9f3ce3f14c2e6f756  LICENSE
diff --git a/package/python-tftpy/python-tftpy.mk b/package/python-tftpy/python-tftpy.mk
index 5b31b4a5cf..db70a07011 100644
--- a/package/python-tftpy/python-tftpy.mk
+++ b/package/python-tftpy/python-tftpy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TFTPY_VERSION = 0.8.6
+PYTHON_TFTPY_VERSION = 0.8.7
 PYTHON_TFTPY_SOURCE = tftpy-$(PYTHON_TFTPY_VERSION).tar.gz
-PYTHON_TFTPY_SITE = https://files.pythonhosted.org/packages/68/7a/15a01d67184aa855e07eac08bfd514e008027ff198b32274f7657d8368ad
+PYTHON_TFTPY_SITE = https://files.pythonhosted.org/packages/4c/4f/92f31ab66baf5147d3c080d1a0820b68bced08a1fe5d3565868118649c81
 PYTHON_TFTPY_LICENSE = MIT
 PYTHON_TFTPY_LICENSE_FILES = LICENSE
 PYTHON_TFTPY_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
