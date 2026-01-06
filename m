Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5B9D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6521F415AF;
	Wed,  7 Jan 2026 18:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRq0rPik8FJI; Wed,  7 Jan 2026 18:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09D7841588
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808988;
	bh=l9va5k5PU25Pnsbw/OfviPSFnN2oWHGQBH+hqVzXKLU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mUlJef3ksyA6my6qFHKP1rXsuaz+Fd3+NgVE/xJe77rgEuwe6QfM+T+Xf64d/zsvi
	 LYitIchdUfZX88m6g0u4JHruPkuSFmv26AdXNnwnsAJbkmxRsrdXSXXDkAWmKYKefE
	 nBsGfZ7ZLyMkEpcfk2olIyq+/Nj+aT2INprYpY+VZ9F+1GHxKPQOA5DLfLkKVEcE7A
	 uuGGGOueyowx0M+lONTJ/mwzxrw7XESFtrY6FNciqmi6hyxqrWZkJqwNxlWvYD9rj7
	 1w47pI06E+gxkB5WtTXPbfXuepaF8jiNRaPU/dCK2ZpmWBlPD7R4tjTK7q4ZH86XLd
	 Jh+HZUmrmiptQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09D7841588;
	Wed,  7 Jan 2026 18:03:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05AE19ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B489B8145A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mT4AFXcFd4X for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF5E980E98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF5E980E98
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDE4586E66; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:00:20 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9461acbe5d753c241e3de06a66b31c8f24cf4ca0
X-Git-Newrev: 3611cdc451a662077aec60f1271295c899d7eb4f
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.CDE4586E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/python-pyasynchat: update tarball URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=3611cdc451a662077aec60f1271295c899d7eb4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 424a55cffd663fcc281d6391d21bcbd09fa40ce7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pyasynchat/python-pyasynchat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
index 6fb460cee1..2c503ea71b 100644
--- a/package/python-pyasynchat/python-pyasynchat.mk
+++ b/package/python-pyasynchat/python-pyasynchat.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYASYNCHAT_VERSION = 1.0.4
 PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
-PYTHON_PYASYNCHAT_SITE = https://github.com/simonrob/pyasynchat/releases/download/v$(PYTHON_PYASYNCHAT_VERSION)
+PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/8a/fd/aacc6309abcc5a388c66915829cd8175daccac583828fde40a1eea5768e4
 PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
 PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
 PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
