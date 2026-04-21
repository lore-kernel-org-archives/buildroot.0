Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA1F94CB6
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 23:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DF341FE4;
	Tue, 21 Apr 2026 23:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkUommunH9jr; Tue, 21 Apr 2026 23:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BF941FDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776813174;
	bh=OGmGBRMIMjqCvezWuWl7UvE+KhlzChKJkb02+Yxn6yc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lKPIRMkZ8/j4Lt6O3GgD2F6WeapwN0YLLiInpqb7dsRFE5si4tFrotiJUOKbaWR+9
	 zfAvWlg4SCBevYhaoemPybBe2cscMHA5ggKKzohdHpAjApzRWArvJGVVBPrYn/al4m
	 Q7jFdE+NmVQbCBFKJhM4h9GBBEcTBoirTRYz1a5k50iYik3oKmLkY0M850sLwick16
	 qF7N9MpIrrB3jRbMdiI7LGQdoH4ucSzh/gv4sKEkRCiLrYlkI5MAsLhbvNkRnz+tDy
	 pXPbvl0AvVZBqswmyHRP98O+rxg8jb8CI7RQwvA6XE8z6G9uK5Fksv1Svs3b7PrxQm
	 UoKoRP+R09AyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39BF941FDC;
	Tue, 21 Apr 2026 23:12:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B820F259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B06F421B4
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MABi8K2Yk47F for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 672CB41FDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 672CB41FDC
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 185E682204; Tue, 21 Apr 2026 23:12:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 00:49:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 298390ade47965a39e6fddaada1f7128aaa6ac6b
X-Git-Newrev: 8de4776c609ec8afe1e603aa1b115d63bd377dbd
X-Patchwork-Hint: ignore
Message-Id: <20260421231251.185E682204@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: security
 bump to version 0.23.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8de4776c609ec8afe1e603aa1b115d63bd377dbd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See NEWS:
https://github.com/magic-wormhole/magic-wormhole/blob/0.23.0/NEWS.md

This commit also updates _SITE to use a stable URL which will redirect
to the package archive, to reduce future maintenance.

Fixes:
https://nvd.nist.gov/vuln/detail/CVE-2026-32116

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index b0f32e2d13..2f03594cc1 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  e57bac643bbc691e94919be496813a4c  magic_wormhole-0.22.0.tar.gz
-sha256  52a3ae2f0c56d0d4cd52188e50f10d2fe14bfd46e287dd50b72e7f7e851434ac  magic_wormhole-0.22.0.tar.gz
+md5  23f71fc6d6f78b93d419cee6d4af4d94  magic_wormhole-0.23.0.tar.gz
+sha256  4cd8f48a5c47f70578be7063f892988177681ab66845f4d6ad2d5eb03ce82acf  magic_wormhole-0.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 7b74113df1..9f3b4dfe1c 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.22.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.23.0
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813891da57999cf953e9c553193c900ff363c4cdfdd48a74f65536a883
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
