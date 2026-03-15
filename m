Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEE2F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D8E3414C1;
	Sun, 15 Mar 2026 22:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfESK33NdqGd; Sun, 15 Mar 2026 22:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70F4414C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613141;
	bh=UFniDsbVN7GUmchc1/wdslynfaIDd3D3KBiWe/t9qdA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YqwbYGNVKp4fhtIJMm9rQgmglM+RKBYFF1zoM3n7rxNsWvBN7NTER+18l4y+9mw0a
	 5RSy1AtGhQJJfQR8NjcMk4lRfbGX2ZJTPuCNy1vwFu+PRJ0rrZn1lEaK78i6B8xyhl
	 SzO4D8LyVoYf1UBhyXj23WBGlvXrwADC3gc52tA3e4ha+xILp0Pj/2a/fjyC3iAxfV
	 pHE2NO4McCJ+pCCxjd/wfoNpEeYJ0FDwvwseApH3XsoPvuM0Ftxw04AA1nUjBDfqC9
	 GpkuUbt6xM1OOatDInaRyg0vsBmwaQIFYuG/9vWTvf+tt6aM7EyFHHRY6dSGa8360c
	 zaGVurRDq6YVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70F4414C2;
	Sun, 15 Mar 2026 22:19:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EBD71B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1993D40910
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciL4NtHb0qz3 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D16A40919
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D16A40919
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFF4485BFF; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:33:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5d17fc404bc04a0f4af5d217412bac740193efa
X-Git-Newrev: b2990809a2062f5b4a640ed1ffd1f6269b2cf495
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.DFF4485BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iterable-io: bump version
 to 1.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2990809a2062f5b4a640ed1ffd1f6269b2cf495
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pR0Ps/iterable-io/blob/v1.0.1/CHANGELOG.md

Updated license hash due to upstream typo fix:
https://github.com/pR0Ps/iterable-io/commit/b9e785c76399612bfa13e69f0aa7167c803a915d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-iterable-io/python-iterable-io.hash | 6 +++---
 package/python-iterable-io/python-iterable-io.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-iterable-io/python-iterable-io.hash b/package/python-iterable-io/python-iterable-io.hash
index aae6ad547e..1407153935 100644
--- a/package/python-iterable-io/python-iterable-io.hash
+++ b/package/python-iterable-io/python-iterable-io.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iterable-io/json
-md5  d6027af37f8e15edd346bdff6d5c5e3c  iterable-io-1.0.0.tar.gz
-sha256  fb9e1b739587a9ba0d5c60a3e1eb71246761583bc9f18b3c35bb112b44b18c3c  iterable-io-1.0.0.tar.gz
+md5  242753419dc0cfbf09bd0fc0fa09e322  iterable_io-1.0.1.tar.gz
+sha256  55db222c5914097a8508dc722f8db6112f636a04a8acb94ee6589d9b14bd4bb7  iterable_io-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  5de72116ec3738168bbaea5bd3405d161246ac542456470dc074f23d336252c0  README.md
+sha256  1965c87639963d053bce1b662b86e04ce22f53d2c39f39ee416745b1fa9e6b2f  README.md
diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
index e59c7d6455..485dcc9231 100644
--- a/package/python-iterable-io/python-iterable-io.mk
+++ b/package/python-iterable-io/python-iterable-io.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ITERABLE_IO_VERSION = 1.0.0
-PYTHON_ITERABLE_IO_SOURCE = iterable-io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
-PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/40/be/27d59b5c1d74ecbd26c1142f84b61d6cb04f0d0337697149645f34406b2d
+PYTHON_ITERABLE_IO_VERSION = 1.0.1
+PYTHON_ITERABLE_IO_SOURCE = iterable_io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
+PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/9e/ad/cc53869e3357520033e3ab9a7d6043045bcdd666da427583678efdbb446e
 PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
 PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
 PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
