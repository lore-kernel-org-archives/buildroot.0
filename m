Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFE7D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A3DA40565;
	Sun, 28 Dec 2025 22:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdf9w3_OJikd; Sun, 28 Dec 2025 22:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7993404D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959607;
	bh=UvvTE1ivTxjA53Zi/E0UsuwZXgx43CCEF5mvJ7rkGA8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a2YgZC+0bh5Eazz2Gru0MNCSojMsSLPLnDcSz0xvPqGm8TxV68uM9xx371zOS4k6m
	 pCOw37Ecrxsg3DtFE6Sb+kCFVBl2yONKHya2YY16qK2UIZf68eV4e8V0UqRJlBg0ni
	 c0i5oWSfdQV6vC4HflqX2TGrFZWQKdkiANMtzewm54Vknwp15oOUWeozY6QilGT89W
	 jhX1SQp5id/28OZml5co05xpMEUXpgIi3OdXPiv3Ys9hHz/MR8T3biD2J6GW6rR38E
	 egZR2sv6oi72QhLbMqK+0aqjcGI3NRzDHkqWRNWW3MX4JXs4Httgla1pQanEtU0Miw
	 VqJ1fwC5MiQAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7993404D7;
	Sun, 28 Dec 2025 22:06:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4FF1D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C773140558
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW-K7GE3nfQC for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F234404A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F234404A1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D42384898; Sun, 28 Dec 2025 22:06:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 23:01:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c8c8e01fa4ea1eb0fc1370e1e52f8dcec12e1f5
X-Git-Newrev: 39a123b9ec3392a16304f270210714841c91cd0b
X-Patchwork-Hint: ignore
Message-Id: <20251228220645.0D42384898@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-characteristic: add md5
 hash, update SITE
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39a123b9ec3392a16304f270210714841c91cd0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-characteristic/python-characteristic.hash | 4 ++--
 package/python-characteristic/python-characteristic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
index c91017d707..84304818c6 100644
--- a/package/python-characteristic/python-characteristic.hash
+++ b/package/python-characteristic/python-characteristic.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b249368dd021fde1c06b4802867c0913
+# md5, sha256 from https://pypi.org/pypi/characteristic/json
 md5  b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
-# Locally computed
 sha256  ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
+# Locally computed sha256 checksums
 sha256  0af91b662f8428b28f5e517b049a0bb9feeb59b1adaa5c9418c1579f9485107c  LICENSE
diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
index 7ea8d95cd4..dd081eacef 100644
--- a/package/python-characteristic/python-characteristic.mk
+++ b/package/python-characteristic/python-characteristic.mk
@@ -6,7 +6,7 @@
 
 PYTHON_CHARACTERISTIC_VERSION = 14.3.0
 PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
-PYTHON_CHARACTERISTIC_SITE = https://pypi.python.org/packages/source/c/characteristic
+PYTHON_CHARACTERISTIC_SITE = https://files.pythonhosted.org/packages/dc/66/54b7a4758ea44fbc93895c7745060005272560fb2c356f2a6f7448ef9a80
 PYTHON_CHARACTERISTIC_LICENSE = MIT
 PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
 PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
