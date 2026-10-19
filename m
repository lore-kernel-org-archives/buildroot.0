Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64043606A320
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=htmedBxu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C456075E;
	Mon, 19 Oct 2026 17:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCm6f-2RpFHL; Mon, 19 Oct 2026 17:32:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 29ADA60760
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431160;
	b=dpeXyT65GeVHbHsBORkHXhqsU9dUp19I2O1EehsuukQ7nkV3F137DIcg9Bj+btQ3VvTl
	 jrndEAdTnjyI50o4bNhUC/2jgla8/eRErig/qzl6C6xah1biT0nGrRBYdX0U6fIf24ifz
	 VH27gb4jOMNFNa0ZvO+4yTWZVke0K+iJ0pEClhKzxHVcLjUcw+2tkjlmgDgDtPCSrKPAx
	 P7OEh8lDm3T+g0zFZj1oVRBZfEH0XvTkBx8D1ts59K+VjzapnmekIQe72sBhU0lh02WMN
	 ulFbIyUgHVQJmoUeHhl4ghs1R24KDktMczJHM3UgM1hXEfa5CrhMsCAI0DDHqIacuXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ifc5H4SVHA/02PtAZ8PlOf/nlr7Dg49qN8qr8GTm0Eg=;
	b=q3NYWIqIDQrnxTH3TK8aXqb+ZKwbISLbqSEfsB2CbE77JXGj/H5/cvA4GPndOTSesZpy
	 SC5ewpPRnwjnRZFJcxMp9zn5jNh2YRsFbvrc3bFeIW6v4o+Pkjjdu+omHG5iuM7Z75Bsy
	 fYiCzgh4yr3cysW8K0gUlSEhSJvu/k7Oli3LmtFTfDmVqZJkMWg/cWjkU/EDDUF7dwX6m
	 Fucl8b5DVjvJRqCFv7vqAiamrNhD60w49OwyOaWGvI+Pm+DKPrxQRsr0U5cOsqyWtfVWu
	 wjkm8mzo3koVtj1XKwzXbIGP1Tj7Kh1Tq5DjO8jKS5olHTM6T2NmLhrVobPHODsBCdw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431160;
	bh=ifc5H4SVHA/02PtAZ8PlOf/nlr7Dg49qN8qr8GTm0Eg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=htmedBxuDWADZ/DALuImcwpoSr9Guvds2eya+QxT9mz7RZFmFKIDpF/bUbfhJXGaj
	 b6oPHBLQ3j92QA0T2nIIo3xJIGfeyOqae7FB6OOvGgwUtIPfhNZh8KbTjyHI1jqDPr
	 bwodqHSGoVSzLbYCrElq85T2GxKBfJ2e5XAQhapUtdJStwGh9h/yWJB0cyjIo44xD3
	 8Wn8CbpIYN6scH9SZxJJDdnqNFeC2P2tDq561tNUBVBEtMGm8pNZVHfpOJfc2ZqhbU
	 gwcB74i87PMPpNLsHMS4+LedoOKs7DafP9PpeJNaf0P0Xr4v+YIa30DnvEB5Ex6LlU
	 N55gc8cwZuY5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29ADA60760;
	Mon, 19 Oct 2026 17:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7133211CB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 520C180EA9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kx48uvORsG7U for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9FD4D80E4A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431155;
 b=nu6LnBnKA+kmd6iZ0tz0p9EmuGIq1TAm2+/RF26BlVtWlN/0Yzf3ffii4jMi4IR36Zxz
 D39kf9ehZOhs3+ZyQhYxo0UAOM+bZ4oDaYhBT0WyjU4UDILkEQgHpTMc9DosjFahN95SB
 hV4BIBSiQvdNRL3Nzcq2w3DkLZmHt+sSky/WcEKNqZwGBmx322Iksn7E3kabfyC0SqWd4
 gHzfBDKQt7beaAurdBe3c3IYaxZ94YmRpRmt1ckqQuW7dgSvA3TVawfUF9skBP1xJGith
 07EbkR6c54q044UsE12pglYfEX1yx838WuHT/V1UqYUvGx6hQTkhdq47K+VZmjHlNQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=94g2ck2IXA/SSFZNQZxDxaQQYeolomemczblcpDuFro=;
 b=MHf4uPK5NkbBFHTICbp3eFmRABIHRf7jw4Bvhiw2H79lDmyskTCmtctRK6H/PpNTzANC
 d3GdEbCqKtO7Prvthx/DmZ2pMfKD84uz+3bBNxTChTnsAkNOlNpBsMVm8zxWA6/1hzztz
 a4cwTecWAgCQzFnW4MqglbWWdbgZWMWcHMv87muZHj9vOh3g02ZldRa7MXqHU5i3QRunP
 mXOyD4sAnKOn4bwOQk/Al4jv86nTBflso0w91zDeUVtdPVceni9JWDSjg4AdgQ70LRh6e
 wMpfRheUg+m/3L2xd7CRtyTzLIzwNV5G7BiVnQ36Dxv8ykXkcWZiuhLNm4ttHo6WqMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FD4D80E4A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 066A795520; Mon, 19 Oct 2026 17:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:31:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 368c7c278497cd633f9b9232a204ee3f3677c8c1
X-Git-Newrev: 8e259a1b8117e01fce23b271a98210a5048a81dc
X-Patchwork-Hint: ignore
Message-Id: <20261019173113.066A795520@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 4.2.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,PDS_BTC_ID,
	SPF_HELO_NONE autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e259a1b8117e01fce23b271a98210a5048a81dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 63921db286..00df59252a 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  151e8b4a847a4098be9b1827c58de4be  filelock-4.2.2.tar.gz
-sha256  b29ff2ae9140bb17b3bc77c648dc4f010d9ac0955eccabff4f2b01dde859f787  filelock-4.2.2.tar.gz
+md5  1aa877c1879a998b938452a55215b5f8  filelock-4.2.4.tar.gz
+sha256  c6d8663535e1650ee430507b4ffbac7b464dd64b7647ea0112a9f406499d163d  filelock-4.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 8a7b59d93c..b95201a391 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.2.2
+PYTHON_FILELOCK_VERSION = 4.2.4
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d4/08/d8f81287742010e38daf3632380c8d80ede7b4df2716f8ca3d0a2b087d44
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/d8/28/3893324bcadf8f89b1616637468d766af3f625008c0735bf704fdfa86617
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
