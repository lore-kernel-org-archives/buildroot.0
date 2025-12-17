Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C0D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 657D56111E;
	Wed, 17 Dec 2025 21:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5NiFxA5NZz4; Wed, 17 Dec 2025 21:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E356B610F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007887;
	bh=jkEK5VURZgLIyVqTciiosYdEEOFoq9P8lmstg7a3zKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D9WU9myAFfQSVPyV/B/8CZ7uQSk6vusXF0hrwmx3RP+vnC4y1Dq40/YtiBDDufu/h
	 G62XhMcsuNqOVOUCfr34TUzOqq3+2lU2podFqVHMm0f7aTMgHMZcejXteRJXwhglsy
	 9xizr3Gh4X8yPDSQTPahSL/8v+KN1uuZ3gw6gMxjgFThmk8FSgGXNUjxyQNrFH5syW
	 nxnM+ZGgPaYzwcZ0SQudso9NtVbrrBr3yfnG/8FMApDmrT/qyTVteqmmH69sFPQzll
	 lMZz3ZyKxt+pvWLFgP3BcxOj1lDji2mZZwdmvGIHCvDr5/I4KjubQxJY3LgcpsH6Hq
	 uuwyRqXToA03g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E356B610F4;
	Wed, 17 Dec 2025 21:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B21A9361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990644054E
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seLkZuS6hhMs for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4FD54050C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4FD54050C
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E25A384679; Wed, 17 Dec 2025 21:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:04:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3f62fca6a9c1aeeb80d1bcd794da6ac99b79280
X-Git-Newrev: edac93a6c6cb0c2efeff35f907dd7e9f14ed7dbc
X-Patchwork-Hint: ignore
Message-Id: <20251217214443.E25A384679@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-rust: bump
 version to 1.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=edac93a6c6cb0c2efeff35f907dd7e9f14ed7dbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/PyO3/setuptools-rust/blob/v1.12.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index daba4fb28e..ac254fdf76 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  cc5c2cf6828af473951295d9f33bcf33  setuptools_rust-1.11.1.tar.gz
-sha256  7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0  setuptools_rust-1.11.1.tar.gz
+md5  6ecee3d9f3ac646a52d60155022fd0d0  setuptools_rust-1.12.0.tar.gz
+sha256  d94a93f0c97751c17014565f07bdc324bee45d396cd1bba83d8e7af92b945f0c  setuptools_rust-1.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 01cd04867a..862b1c853a 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.11.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.12.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/e0/92/bf8589b1a2b6107cf9ec8daa9954c0b7620643fe1f37d31d75e572d995f5
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/bc/c4/8d3d282cee60d3ea0369fa15ce27387810040360adb4133e31990a7a2aba
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
