Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B4CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3603760DEF;
	Sat,  3 Oct 2026 15:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdkVZPfcPrpw; Sat,  3 Oct 2026 15:55:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 50F5E60E10
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042910;
	b=gJFtexrQWQdM1pivyjfJ0zHLwHNFWPTwWS9rWgLzKbVkUOMGXv+cMOEOmBZIa3yjj0Bw
	 li7Xj2q3pmyuzefhF2fJukJeV6wOMakYj8pJ7SCb9IyUX+5Grjfrgxwp7PjmjYhrNlNs/
	 uTCX3JJVuyJyeboEgQpS1VHx2EX6KMv5z++WtFg+fahpaZlaxt3mkYgPIkbW1b/owswB4
	 +GkmatxjPvM4lAP8iYvLZgAJ5n0Jr1W7xQRBG74gV/iRoWOh1FC6lPMctyjh/doUWyzy9
	 QPq35uGZOJ7jXHu0/Vbp08xR8zkcWdq0j4y8ZEaO/KbEmTrT0g+ocmA2vT9846xFv+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8IkHaxAIm4zm+yDo3keqQtiDWwoJKB7XlBIAaviJQ1I=;
	b=Yt8DvN5Ucja+Umaj1T93vqBqF6E9m9VpQAJjIElY/FVbHb2lbiezZej/LY8EHMq++/+J
	 kK+3569sObXt9vPj5MrM9piQFRYPm8NpjJ04wLnQ21vmtVMk+F+h9OXLhRPX4qcj6X11a
	 UF398fuKq813LrVVDR2KkE5igxKzYw6ycOtOAs1VO4DT+yGAtEx5rNKy15OL10XhFmxo9
	 72dL+Zv/PcU48qcRAKi0iGx5Zqtb1RM4jOVbgZiAw/p6obMD0weprX717mWByCp4h3n7P
	 xEKS/zuGLWDberRfds289WW9FDlej357JYuP+KxFwjreEnFtgFPcit7QU7qYvYi9gJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042910;
	bh=8IkHaxAIm4zm+yDo3keqQtiDWwoJKB7XlBIAaviJQ1I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O04Q0KdWoizlHf/e7FvMK47tM/GlIV0PDbexd/c2G5lDQzu1pv6PU8NdZplmwUmW0
	 KbFUBj7/iYRy/iP9iAvgMsI4ZybhtJElnfb8lboqRAzuDP7OAjfGOLVMQ+vERQOcTB
	 /QQ/5cHntdlNrwInTPoDDe1een0H1i/LCaQp3qyOJfZfOpksClEc+VMOvNXUG3dI9c
	 L1UH4EInoTjkDzThNKkOv6j4cBkmUYFbEDS6wJKF7Kim0nLDiTeKtdoQx4XwpZ80zo
	 hQLbNdFjyyua97wB5XqZDR4p1UNQIfI8jmq0aps5csRddfZke9PsvVTqF9gaIX2/Xo
	 LlwG7Ms9T8OmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50F5E60E10;
	Sat,  3 Oct 2026 15:55:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E01A476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C77560680
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goTDivdtfmE0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A62E56068A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=OybDenAS2G0SaQ6X0s1y/SsvJ0F6qsMPEq625uwGYzRD8zuIcTNSsVLmi8WCfuWC9lSb
 oQB90NYZrEPiuwOYxOlSYGVtuthr267Pxr4JU6kkIO8ZqCurjNyTiGCC7puVPyvByJ6kZ
 baJ5f2gOWXll8Sd3bhq93k5MNeFoSuhkBxyLIYLXEw+h657YmOvohU1JW7Vxjs+CzaKr+
 td1brnjmEyvgowxxHwwnewJ9qEQFT7ot9+qDTw3kdw0EZ0nQKzlE5f+fJloyVcnPiLBZK
 rHI5MnbECnmrgtzicHteQOk7jFUkGOFR5G+cWI7jsiCLN2SMM/GBE5bbJvTFKPuCScg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yW6qvn7k5lxSFRyp4UouQBLLVcqkbDBCPd+xAzmM/PQ=;
 b=iqirTCFwYsRLAXMS7sC9ELuKGH6se5v7kCkwrwWTsQYqs1QEC8x1pTlRXQR3fqWChOOY
 Jb5uKfKZPgcgbKBmrg/BfB+hDzyApfLByeMPylUNPvJWZRCvkzD8KJU6EDWRlRD+PNIcP
 d14VbCPbP+62K7yVWv6a//PD6A7RBQXrgLj1ZS6sWnCeIIs1uGRE8LTbxp44RCBdNkzxT
 Z7CecuBlPMRXrAEQcfA7js4RV0PyjjGzpRlCIgOxWakrudGL6uCt7MXI26vHav1a7rRZW
 k7v2nIKpcTc7a1d2+JSSy3eegoJqZRP/sI27cessxZqW2YUibzcgUAgOYSckksErMyw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A62E56068A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E71328A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a22cfe30c4cf6c1eaa35382a9bd36aa6615c090d
X-Git-Newrev: f98095598699e4fe35897159c74c1b6ea57ffb2e
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.E71328A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pytest-asyncio: bump
 version to 1.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f98095598699e4fe35897159c74c1b6ea57ffb2e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index fbd141d76c..3df3a36190 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  f9bf0eed023c7b6bb1d68ebea82d0398  pytest_asyncio-1.3.0.tar.gz
-sha256  d7f52f36d231b80ee124cd216ffb19369aa168fc10095013c6b014a34d3ee9e5  pytest_asyncio-1.3.0.tar.gz
+md5  2495e68fa8e724cb6c69460d35a8f177  pytest_asyncio-1.4.0.tar.gz
+sha256  c6c0d2259945122819f171a32ecea2c349ead889ee28176caaf492143424be42  pytest_asyncio-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index da0bbfeb81..54f719f21a 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.3.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/90/2c/8af215c0f776415f3590cac4f9086ccefd6fd463befeae41cd4d3f193e5a
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/43/7c/d36d04db312ecf4298932ef77e6e4a9e8ad017906e24e34f0b0c361a2473
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
