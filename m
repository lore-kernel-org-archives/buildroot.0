Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E923D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A2940AB6;
	Mon, 15 Dec 2025 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OTHHin6q-MO; Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 617B040ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833004;
	bh=ZkdRaQDvKkMZ9gJU9Lj/UuQRdQRO/JLXX3zq0APIiik=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UALoXk347/HY5993ouxtJHhe+ct4eWzp5K1q7wfLB+Jn0Upk2D7mKCHTZkcY/UKKI
	 HXIRJZDIY1/s0NAdvGMlRzwQ/YIK9n8ic7nNJFiW7OGEeFPI+PKz/rqx9aP359bXBW
	 H8FRy5bH8D5PDIoLrvApDnek4k7/SRkCSpxeqswDpxzfeoZLW8pG9wol5fCqGP2DhE
	 UVHxt6rd7g9trSP5vdkZyfNOV1YchyZrGvfqINnVf51ca284focOf8GsUX1oaobHkz
	 q5IiTne0WGJGp8EPWkDm7l6cbZ81Zg2JiRuEPgq3Sp0bHJaufozbzANdY0N/eLU9I+
	 qjwK8aOxJk8JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617B040ABE;
	Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A369B25A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86FE640AC4
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRNR0nxVxao2 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB25B40AC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB25B40AC1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DF9E86FB2; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:41:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f0bfb455934433e1c7062de25d512d8ac8d7246
X-Git-Newrev: a1c17bb81c6f21fb89e6838264f26047380efc3e
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.9DF9E86FB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow: bump version
 to 4.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1c17bb81c6f21fb89e6838264f26047380efc3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/marshmallow-code/marshmallow/blob/4.1.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 0f5db0e2ef..0df05df3ea 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  3a8decf54fd2a6a10352b9de70b70136  marshmallow-3.26.0.tar.gz
-sha256  eb36762a1cc76d7abf831e18a3a1b26d3d481bbc74581b8e532a3d3a8115e1cb  marshmallow-3.26.0.tar.gz
+md5  952ff36b25ca99d60f7e0d79bb90188a  marshmallow-4.1.1.tar.gz
+sha256  550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d  marshmallow-4.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 6e84ca039e..2a5a8f6f90 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.26.0
+PYTHON_MARSHMALLOW_VERSION = 4.1.1
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/ed/3a/b392ca6582ce5c2e515a8ca365f89b6e631d864a80ecdc72e0bc1bf3aec6
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/4f/81/edb105b3296712a282680bc1ae02b8c1bb45d8f1edad3ff9fab1d41e9507
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
