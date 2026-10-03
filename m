Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C13CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E83A88148F;
	Sat,  3 Oct 2026 15:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wydpP4KJMgIr; Sat,  3 Oct 2026 15:54:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2DD2E813F8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042889;
	b=PalUUMCogAhMpSgw4GN6xENyW/RH1PM7airKiGO5Q/3hucMNpceOpYp6XwHexwuQYXMA
	 m9NUPMnKZmUhXbSQXdLxjCTwM49qI0wXvczkKmWa0umyxTl90w/Y/VDfW8NnDhFNK9esm
	 nJxWI/Nd8uOEcwZHvY1GHmnJeajBuv6SgNftI0q26lT+Ml+7XYpzTX8+X1u2n+ArjafxD
	 QlY9Dn6Epbi5jbT3InfM/xZpPPtOb56un4y/8H4+Qhj/0dAPgcluFd3PeLvSfYqFFZp87
	 v82BKgbQ4TVWeNKlU87R0GVT4r+b7KvH676akep6FNeGMB5gtRIxDKXyECuXlGF7VJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042889;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rz7yCKe5dI0Om4+k+ll0PvF6gEpYffhI6TkkWN1sips=;
	b=EPaHGYMPe90yUwwQ14lZtGAKNE2iCTYBH39horOuPMZIVXsbx5SgsXOwILctdc4syJT4
	 hfjtEy/yoj1+tpLd5SLO0VsdNg4yUNWnI3ZZZVjQGwjI4u8T0gie1mZfO6CKKlrlT6Nhd
	 4PlOAvSDb/rbwK/vVw92ivuTrVem0Ck6WFZ+wAVsrFhBYOaBAZbo742vJyfCCBP7+NIOZ
	 spwKKBW2hDOolbVTHgU//02r/QQPBjD5Bk88NvQsGTzVh3A3Xa7RoPDTzgM7c78iAFeGg
	 Tjz3Yuj6pVPpgMeW5x5AIXai9cxGJhl75XnTRlnxaaEfGuVDRvzMgf/g7DQJ+KYFVkw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042889;
	bh=rz7yCKe5dI0Om4+k+ll0PvF6gEpYffhI6TkkWN1sips=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PMdnJg61V2ueaEwe+9Y0hbxken+GqDyhn6bViNBigQspy2R0ZFLpjgDfW3C/50j4Z
	 71XbKZhLdzrBplKTvhGKwhy6aDKOobksSomwd15/4Gi7cr0xpJw/XLbhbGvZbMLsmu
	 K/tkLZQ50S62njIiw0GrtRgj7YvynCjFP/3LB9+1v52TeMhb9xLY0+J9I7rvLEnWkX
	 gnR6g09Fj+jYBePjFjng/OnOpH1sGldEiVHgOVMSWAQIDJeA/ji+Z5vgPYlCNHJXIO
	 UZy+7001DbgOQHdeUyd7uSjCrlSmQPgk788HbUQbcCabK3Mi25bJd06e+KSXBRGbj7
	 Qeh2+78r6z0LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD2E813F8;
	Sat,  3 Oct 2026 15:54:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA52476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0267760628
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXB_XvDYBrH8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 380C960601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042844;
 b=JVkIK82cIqX+ice9JQ0rgZqelqiUVXFOEBhaAl9V2nzwVu/sd4w7aOfkdP8qt00zRnS3
 kDaxHL9feEf6+tLYVxFP1zAOLoZakvrv8N5Tri1V4kBdDq6QRxNd6KavWH7eCHT7LAbXZ
 Oj4Eh5ViUgfazHKft8WydYsOWZqLaiaP72n70kN9nPsGb5h3wmb89DvsHza5aUp+Gz3+t
 vhyV/gaoeUpcjjQYvRuHIyWp6ZKf8lfS115Kdt7EEyKDrX9ldx10kH1omQndM4t8RJ512
 AL1ze0Ix+usonRlWfNiRkenCYQlmp4VKxS9VbShZAG2M64Kc4zM7n+aMpQjt95Xrj2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+VaSAcvNxS1dM87kXp6s3Zg3ry9w3hrGSTDArfMXOt0=;
 b=s8vulF2SzGR1Sv1Xo1J6ZT0el/THK5JZLKY0GFprV097hciiWQWX/fMT90ofoKxcslxY
 PxDTkHgEs/AGHyA+gD1Wcn0szXkrrSMk4XNa4/qkW8dmMuvSTh+cTTgK+cerXFhG0cS4j
 pexad3/0gYlS42oeqzI1rDAHru5J4X+oxuN5tD5VJ6TD1ovWPUjtMtl+J2unYqJIY+to5
 KlhhglzQhV6Wo3E9WEDNqZrOV93oV2R0sA9L9lopSt8sUHfRk0VPTC7ipPnvrXzSNgOdV
 HHI4oJ0k7Sg5A2oeG8XZp25hEOFhXQ/TiJG44cLoEWNeUYElPCNmmUHbWEsI3QIg7IQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 380C960601
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77888886F7; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6c8ed197c1c5d037f6dccd1ff583aac2dcb8938
X-Git-Newrev: bfb1ddf2d5f139524cf2edb1c8373f429c6f7f55
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.77888886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pylibfdt: bump version to
 1.7.2.post2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bfb1ddf2d5f139524cf2edb1c8373f429c6f7f55
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pylibfdt/python-pylibfdt.hash | 4 ++--
 package/python-pylibfdt/python-pylibfdt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibfdt/python-pylibfdt.hash b/package/python-pylibfdt/python-pylibfdt.hash
index 80459b3e28..3b6d1b40ed 100644
--- a/package/python-pylibfdt/python-pylibfdt.hash
+++ b/package/python-pylibfdt/python-pylibfdt.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pylibfdt/json
-md5  206a0504f3d0f5895c00f572bc367e54  pylibfdt-1.7.2.post1.tar.gz
-sha256  08ec69755f7565dc25e4e640e0315795888d4caeb7f146de4e05bf12b03c94c8  pylibfdt-1.7.2.post1.tar.gz
+md5  d0b611ad5fe4efa6e6259e79a573381e  pylibfdt-1.7.2.post2.tar.gz
+sha256  b23d03d10ab62ad1f4e7eedde0eb8a7a8872cc08d2a5c2bba7b48bb6fd3c69f4  pylibfdt-1.7.2.post2.tar.gz
 # Locally computed sha256 checksums
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
index 483ac773c4..6aa83668f9 100644
--- a/package/python-pylibfdt/python-pylibfdt.mk
+++ b/package/python-pylibfdt/python-pylibfdt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFDT_VERSION = 1.7.2.post1
+PYTHON_PYLIBFDT_VERSION = 1.7.2.post2
 PYTHON_PYLIBFDT_SOURCE = pylibfdt-$(PYTHON_PYLIBFDT_VERSION).tar.gz
-PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/a2/b8/ef881f0e76af7727ca9c5e27a121db69667c69e4e91eceaafe97f3666a6c
+PYTHON_PYLIBFDT_SITE = https://files.pythonhosted.org/packages/0e/98/a25a6311bae8ccbdd56b3e581405c68ab49c57a1127a7c21b3da3847d4ab
 PYTHON_PYLIBFDT_SETUP_TYPE = pep517
 PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
 PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
