Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B62FCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26AB560E90;
	Sat,  3 Oct 2026 15:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgElO2T_526I; Sat,  3 Oct 2026 15:55:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 09ADE60E39
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042921;
	b=n4/PBsOJRJlBnTrI5hfj+U9p3Z1S7bDWmk0w83fJGs7p62dbEKJvKK2Jn1e1goZuz2I6
	 feA53zGSL0KNAqZMzcLqApARC4RJCyYDehdD5gyQB5Tu1vntoC1U3L1BUgfXcpTzE0fJp
	 PVuLbV8Rn8KKyEYnep6Fb50n8j3R/bZY14PdR0k1oPzcb+mjecbNX+tMIcLecacV4rxoS
	 pTG0mqxT73FhsZqLMkItZVTTRs0k+1RyFPYsqgwWBRZvFaYRp6lTJ+jbJLvdFsD9kcHHQ
	 wOXTRM5eMApWaqv/jLFEKJcAFUdgoCsb9K0pcQbg9c+f6l16noC7znwszBpf9qkC2WQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kTBkwvFqIUGENO7ZF/9haz+rWrkFov/U05kGdAV1AtU=;
	b=JR9QWHsDtnpyFnAqilGrJDSUZG0HamfZ7vIDt6vM3g07XIRXWpScLqSu/uoIMhX4IFzd
	 fstR13nXavkiw/ONWla1v2HLPhOrKXZJHPTpNUI/FFSadi+cOwi4nDMaPUNba8X5ycRw2
	 D/Y8dQju8Dek+LVFQU6f9Yr/MtmDZkXSqrCF42+9Zj02vVXl8y9q45EJWh4YBsA8RwV4Q
	 wmfXAvKbJ8sORqg8F64dFJM9xZV0TwoYELqkYXh+CdUJvYWQgQ5t4gtCDjqH6MrRenei1
	 6xtSjTCC9dfXV8f+oFD2GywGp8aPc5Drs1o/ZHmrorYhi0odTs08Cqzq5EEZhLWoBvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042921;
	bh=kTBkwvFqIUGENO7ZF/9haz+rWrkFov/U05kGdAV1AtU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gbft6Zh4ZqzwjWruaRADliBXc1nmGWUNWbuVyHI8gWWKtUrkeJeXE5VVezn3M9RUm
	 j0tzBnLGUkJ9GDFrpa0P2TXVRo/uYk7jVroNzl3YdAreMd1g13AQZpT608ENWDjchT
	 m9Ipe7dudZC58b6uCfJT4YfD2YFRZtvoCv1OQg1fXIyLX37DuxzVw/RE8xSfgh3xNS
	 kI1r0b68YB5u0vbQRjcIk+QgxIHzj9msSuZwDT066ixt1fRb4QSOaHcv2m0SZF/58s
	 tS9bcVKyBIBtEzngFwhEOA4T4rKf8lflVKSrid1upcH8RMksgPPXlBjAqFVTuwi40a
	 5didMoODSQ/XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09ADE60E39;
	Sat,  3 Oct 2026 15:55:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0E704B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2162400CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCU_YCmoQdBB for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1098540055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=bAejGZxf0w/wilPDEQcxrNEfbD9xGYb9ZjrDgzWJJTgfbw2HC1lcnNaroCfTl9CeH7QN
 l810Lc2KCjiLraY0hyczv9cYzEw2iVh+smOg1DKLemhdq/JIkB4lBwb6G9zbPYoV616DB
 oTCX60cFa+BkhyylLjmAXrAXJ+L5ZCZm+yUulQP1JC6QTWVI/QgoyM3IpVrjzyd+kzTx7
 fPUkgwXyGk3xNNzPp+p2P0ANkrtiy76QqUjQ+qLvZK9efMY81Enrr3L4QM+5HpFiQeXVT
 bgq32uN8dC4xJFsZcioWDi5SFrjlWyf+RtR5l1chBUslqsKwpi0JY67BNLM4tMnjW/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=x3hf8WQLqXIs+xVf6+KaLSD4yYXFKVJQIvUAfrRttzY=;
 b=IcnswItlmbgIPO3BjiOHBU1hIRvxn9zPZKHP0OCVPBS5dpiHYH61k9SF48Cb4R1tqdof
 TthkFInQb/mSh9avlq1+kCYvxHdbXFRS3DHhiIhUNEPilc4wpX6d4WpcJJn2xHpUk7ZmC
 qYcTvdSDr4DjYlfhFuDHG0EknVGJ0ggKc533pbPkG8mZq5uQCmX/sZAb3Ferzc67+kBax
 XzXEuqZLMuMbqx0PTYrbG3uIIMD4lEPKnczUsoTiBITZGz5ecNgQBS0tpIgxx4bne9Oy4
 f3Bv2jjsFupELMJIrHEBDsugeW9qk6T1SUhTFGeH8VR6BXLX8YxQA+PPHbrNYiQAN4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1098540055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51F2B8A58C; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cd7abff1c43f7a3c880702d8d571606b754e99f
X-Git-Newrev: 68d3fa064f912529529bcfc054f874ae8a271e33
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.51F2B8A58C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-psutil: bump version
 to 7.2.2.20260906
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/68d3fa064f912529529bcfc054f874ae8a271e33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-types-psutil/python-types-psutil.hash | 4 ++--
 package/python-types-psutil/python-types-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-psutil/python-types-psutil.hash b/package/python-types-psutil/python-types-psutil.hash
index 0b2e5aa7c7..514f2c1eb1 100644
--- a/package/python-types-psutil/python-types-psutil.hash
+++ b/package/python-types-psutil/python-types-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-psutil/json
-md5  d4d19bc7bb21bd5ff2c909e425760f79  types_psutil-7.2.2.20260130.tar.gz
-sha256  15b0ab69c52841cf9ce3c383e8480c620a4d13d6a8e22b16978ebddac5590950  types_psutil-7.2.2.20260130.tar.gz
+md5  ab8af16b81139afcaeaf1ac4d32a650c  types_psutil-7.2.2.20260906.tar.gz
+sha256  93abf22cf9a62b915f724e433bde702995ac274865425fd4a76d1d9b5828da1a  types_psutil-7.2.2.20260906.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 4a596de1b1..0e0875345a 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260130
+PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260906
 PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
-PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/69/14/fc5fb0a6ddfadf68c27e254a02ececd4d5c7fdb0efcb7e7e917a183497fb
+PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/97/0a/f48b9b0ab5ba8599fd117309e345152bf82c756c72be2ff0f635780c2792
 PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
