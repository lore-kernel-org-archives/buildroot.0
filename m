Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE84ED68BC3
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8677361174;
	Wed, 17 Dec 2025 21:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV12LHwlqEpw; Wed, 17 Dec 2025 21:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A825A61177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007905;
	bh=yJZyhCLF/em29JhOABx7EZ4Jr1bofNHvt0Ckhsxd+gA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZHShD0cQvznefClKAMr+jjdg+OrSYO6OSCO+Ut9hM7x/eZ4O8cXegFwn7r8e8dD2Y
	 5JPTBgOJICwswQVBT9nCee9JsS07Fb9DvIoMfS/FzjUg5Ml5vrUvqymw5v1/ZS59hK
	 NmX44tJqgio9S7MM0GUwokGEElZKo3PWHuBMdAFJ8XUrVL7mC4OQplgC1Jb3UEgit8
	 +/Lu2BABInUYLd1y2tM1wgbuW5H3WOYIYqAa7/whl1tC9HdyBPcqj5/NrZ3Q3FRZop
	 5MMiteDJd9zLqCo1KQBZ41zc3w/qtCRanVC2bH8OPnNTWv1tFJ02ZZ5Hl75kP9sVAm
	 4fSfkAaNwdzkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A825A61177;
	Wed, 17 Dec 2025 21:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37FC737A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C503E83AAA
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVCtac8dclIF for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B23C83AD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B23C83AD3
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F161E8713D; Wed, 17 Dec 2025 21:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4cf03b6af84be3cfac3783e1e7fd118bc437628
X-Git-Newrev: 564a8ca359836f63cae1e8a69eddc935a1050780
X-Patchwork-Hint: ignore
Message-Id: <20251217214457.F161E8713D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio: bump version to 0.32.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=564a8ca359836f63cae1e8a69eddc935a1050780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/python-trio/trio/blob/v0.32.0/docs/source/history.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 35f582311a..bd722a2367 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  26bb7f0669385e47347e4d8177552653  trio-0.31.0.tar.gz
-sha256  f71d551ccaa79d0cb73017a33ef3264fde8335728eb4c6391451fe5d253a9d5b  trio-0.31.0.tar.gz
+md5  8bc9dbdc265c291c93006f5e0f1d3918  trio-0.32.0.tar.gz
+sha256  150f29ec923bcd51231e1d4c71c7006e65247d68759dd1c19af4ea815a25806b  trio-0.32.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 8d8720be36..73c1ecb461 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.31.0
+PYTHON_TRIO_VERSION = 0.32.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/76/8f/c6e36dd11201e2a565977d8b13f0b027ba4593c1a80bed5185489178e257
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/d8/ce/0041ddd9160aac0031bcf5ab786c7640d795c797e67c438e15cfedf815c8
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
