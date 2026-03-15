Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B88DF3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAAA61183;
	Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJ0_Sdl8NO5g; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EF39610AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613082;
	bh=plGn0QuSJorLblq2hawce0ORdhr6ggP8tM21qUXoZYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S08iF92UJ5Pbjvlx17XMQeIfyNvLatHFc4P+MmiN3b4K6G+jMyn7GycGsLBINJVIt
	 YQQezmb0J/sviPFkjSAcluw3chqpkx4njsaR1uQ/9dh2/YsAGrYpzktcxXVtoVo5U3
	 ETJTfFPa3NQmH0WIY2yuyqDdeqsQppPhR6tFTJTuvD2hb18thu9DlGgoYX5PYpQ4w2
	 pvaYT07fWrC8Ak9Oo7UnXe0TrxCIWL8mQ8Rg4bLyOzETIdiSClifjwrtaiRkXnnLEi
	 tYnN3FiSITdObVAOhnnJcNs03AABn9wadmCnkAhq/ShjjUMLeKoaLjBU+ILwaz6ifB
	 3T/IgcUFS1vmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EF39610AB;
	Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE001B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D51061095
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-HpZ7o8n5YH for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9005E6108A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9005E6108A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2B2B83F4D; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69b36ebac9b83991739e7ece34fc029cb8cd9434
X-Git-Newrev: 09299bc5511d23432729fd33e72291609e106d65
X-Patchwork-Hint: ignore
Message-Id: <20260315221800.D2B2B83F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitstring: bump version to
 4.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09299bc5511d23432729fd33e72291609e106d65
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/scott-griffiths/bitstring/blob/4.4.0/release_notes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bitstring/python-bitstring.hash | 4 ++--
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index 517db883fb..a0a13a20e3 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  83984560794188b0f1183e115890dd91  bitstring-4.3.1.tar.gz
-sha256  a08bc09d3857216d4c0f412a1611056f1cc2b64fd254fb1e8a0afba7cfa1a95a  bitstring-4.3.1.tar.gz
+md5  3a7e512ad3977f4c0ceb3beef0794b29  bitstring-4.4.0.tar.gz
+sha256  e682ac522bb63e041d16cbc9d0ca86a4f00194db16d0847c7efe066f836b2e37  bitstring-4.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4110041ff5b99a3b0f64d4aa0c426fb9bb4fb3de69cd4c847e634f8e99b2c6f0  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index dc3796a829..0642d6d6ec 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 4.3.1
+PYTHON_BITSTRING_VERSION = 4.4.0
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/15/a8/a80c890db75d5bdd5314b5de02c4144c7de94fd0cefcae51acaeb14c6a3f
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/36/d3/de6fe4e7065df8c2f1ac1766f5fdccbe75bc18af2cf2dbeecd34d68e1518
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
