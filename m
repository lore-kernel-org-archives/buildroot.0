Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE4D606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nMgkKv/r;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=C7T4PknV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E92608FD;
	Thu, 22 Oct 2026 21:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4lZcGAHGPbY; Thu, 22 Oct 2026 21:37:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 46DC8608CB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792705045;
	b=YVXuwRNZNmUD87M/XbkHef59omw1JByiUNSpIF26vQNInsdex7rGBWQMZV2FIDQPp3oW
	 Yjrwab/MRqbfN3reaURXIrBO8ZibmSErdTtPQFKZF9ZR33QXUanpy0dckU3+afO11gFv+
	 hczPgQJn/mgjt05kV6eQlDMjvazaeqEGr86QgELCzQRwiJE/as1zJcNNBEdf6u9vJtlVU
	 wPDlUjkeFdwZ3kpn0raTJQlfIkXYAd6w6CqUCuyWiF8eBQJuvoFl6VxkC5wyft8RGWFeX
	 QBmt0KYSIddehoU9qwYG+uCcO+mGTFKXUAhmZh7NubaOvCe4ocu8+BXZ8d1ilZIqBAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mhcT9GxMXjRnP66T20g04oPJNC/Iu4DO/r331jXZPAA=;
	b=WCGnnWyD4GsWEyhQwdqissWoxlRBE3ZBCAxoN23/jnuecjYXJgAs5PwuZGlFnwppbyy7
	 EvGcQhS5LBlxhHwraZbK9ZoKvNxsoCuaonhz47Fvwl1KXERAFmJPMmFAH3NJ3ZQnXf7po
	 99pr7ZBWt1ClNcvWuGR4vw6WMAuBaTfCUCHkQ4EYhm7ssCjN0O36c/PL/0MyinWxeiuk/
	 pR8lUtHTR/lUpt/7e0I8RoPt71SqsLpC18Cjq/3QddPSK0z68EoBfxbC460Zor5E1qsa4
	 4k+oiEsWNiRNNn38EoNSMlYoI0tK2RvdLEjg9Jyt+/k0/sj8CPe5gMAwi4DuTY/5+DA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792705045;
	bh=mhcT9GxMXjRnP66T20g04oPJNC/Iu4DO/r331jXZPAA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nMgkKv/rrCyhEGtNy1/CV0XNSVUn6WP1bWCKXJDM6uFZ6N3wJL15AtP4vOusHoSN4
	 r55DHN2cRMjilikQgNhXENCAIi9omycACUnaPpNxW5rabidOQQDO4qLbZOiOrtJH4Z
	 DOmchK5ZOADgqb2V+FAAjVvcgQJ5uRrO6MkcD5xt4gXVdvPuzQp2AwJjtevfCaT0Iw
	 XQrcKY0X60JajC5nAVp4ZvdZlXNyMW+Q+VHpgPtItOz7xgwMWZsBjvavf6OTUttqY6
	 wtFXhd0yF0PCgOcnz5OThnXmE45NqBQaJ3Aeu4ZESH/z4HSchWYapLEO6C09ZQHilX
	 FqdkXLZXj+76w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46DC8608CB;
	Thu, 22 Oct 2026 21:37:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1789A3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1BC94053D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8D9KRVqDMyd for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:37:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1E32940552
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792705042;
 b=LMW0J649Cq/sGeW7mPpLNWwasYVjPgt+9bEThgz58+EgN2Ang0IO+ITCETW77vkzNIXJ
 KeZ704yYYcwg6facn/6zc+XL56F512F+js704ZeyHgOQUNMEzkomZgf/7Fc4eUiUXqaJw
 9F1OgGW78h3olYiaeLVGMv6shnkt8NCSdvTxEgirNqua45A33knIcNnIyTscA5DC4KFDn
 4mnS2Hw1gPh/saieMxAJFn9UcxPoRvN0g+0RUgrSsrf5AthmpSCMwzWE44rUBpQDdMfjj
 JXxgiNuUsLS5LXnAuLbEzIqQJBi65muVMk8y2LRqz7wrkEnbgr5RgjJU/1S2srXixxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792705042;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=d3KMS+cIq7nvBpe5pTkHC+mpeMMSOMeoRumNvnnrKxA=;
 b=G2VWNhax+Rc+/SpTo5/yQjyJNBzKgvZLR9TDzcdMJoFF2F8z16XX6yOstnzLH4oXDKBO
 fwRcb7bUpITGgMtvUIGriX3uBH3n3txeWSgkiXKrXSbWUSbEd3TbAWqjqVuHLkMHkZFfA
 i9N1RKv7t93LM9zovEXmmBf0Z8Wwy+bRdI8mD6gHFqrx8bptI1jki8o0KpojflFD5xw+2
 zmctFod853/IK4NkOYzZbjhiN9E+TOvXUWTtXn5esJa8DOMORRvwtS6SNpAEAE0dDhYpc
 gEQX43xWaRP7v2JzI6SkPe/oUBvRe0M7H8N+kfyuQ9jGxlmu+TCFbO0xnM78cBWe0Jg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=C7T4PknV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=C7T4PknV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E32940552
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792705039;
 bh=d3KMS+cIq7nvBpe5pTkHC+mpeMMSOMeoRumNvnnrKxA=;
 h=From:To:Cc:Subject:Date:From;
 b=C7T4PknVyhZvMlh+aqDfLjDhPsXKY8/IY5EngYI/WMdvhaqAp/BqLoQ56K0yNJ4Qv
 0+YjlKXkA65DNV642H7XYMxYA7fYFespVwRwp3eyzuG9tYrjWogzn7XT/QCuc3SVp3
 g+dGZMIBDFDABG3Bc2ZgSt9Ac5v7HZNbTBQ4oc5Sq0stlbM1xA807cuQ5LwO2VeiQz
 VhffFZO5bSSEYxXATt+BXDczCKHhLR2BWOhlcBumlOlHuNwyKW4zuAYrbKZVGBrgRj
 VvGOr7S7xXb/eQvfj58FCdM06hxG+ww8ylvD7NAt5PfU45wXm+bYqIGkuCPMYUpZWe
 6ADpS0mbzMT2g==
X-KAS-Sym: v3:f51bdf72230551df:MMrsznoJYbhkb7ta3OrL5bwnZCIqfzZt2juhRV6aQtNx5
 F6lPPRZciSARv77FHfXwkKL/e12RszL2iRF7ubH0N6g71oYoTb0yxmOgffySzZzds6U8fYO/iz/
 dqxb9tmKh0pvRubNO0RGHo4a/tYtG49qBtTE9Ok0C10xMF4WCMap/RALArelLShAqllivUbMIIG
 QrT9fTef7BI1sY2d45YKEE228LHEx3cWXcNaHRKAklkNuDHtFwOyFUFzoQTmMN/EryVkAw43B2Z
 y3nqXlfNgIm39vFOvbZF/B4H0NOzvQ6utJDKHF3MwbZhIBYMLajYViF+rcvHcYAgvSQUjbAg==:
 9kI2ARoEP/EBFwnRWsToGTN3cfbUOYqYpODsl1Vn0lq0uHr0fKxS+VW37vuMiRTQy+f2V5MTZN4
 op7BqaIMfWIDbJECokm1Y1OL+7jDj0XqjjaZKAWJZiU3H+uQE9tF40MzipMPmjaiJzDHBJ66DUy
 qh7BLkL2gEotvqBls0lLOSNM9VIf1wlDa+U2Mhv9E3/ZCd5gfSfTPM372MpiYy6K3Hp6Q9LrsS9
 Sfg3fBHI2ZCo9w0K4l0mySOog209hcVxs/mlwU1Vl5XdrYn2yB274GQ6YY3BY6Qa8f9d++nj0AA
 ARksQ/HwSFRVnhfMw+gZUWEEdb7BbKCi2CwmaLzmJk76R8dLtMUifrl3183BWZLVrmTYncTlLew
 S2jp4mHZS3NT2xtFJJXCxvjTIRp29yxk4TCwoKz8JZ84Exol9uMo8CWeWqUa0wKquUOkExF7us6
 ITk/6NMlRT9Y9s7m3kOm9KeZeXqHbUi9GYrbyDBmxMB9h7FFM8B8611bIXyfvlWrO1KdnxB8vbu
 QqtfTNHguOsOKUIssJEuoT88ICtqf3csZ6UL/QA/DLZIm5YEy+I84TtkN/pMGV5u4FzrEGYKy4b
 IBirKriNOJD/i7lJgT0iu+CqC7HbLFr5cI10OvKKWjInBJT+amgp1XUw8SRhWQI2W1JclJMUFXT
 qSpWVRCePxg==
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5BF03A4C0C92;
 Thu, 22 Oct 2026 23:37:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50324)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xK0TO-000000000mg-2dUm;
 Thu, 22 Oct 2026 21:37:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Thu, 22 Oct 2026 23:37:19 +0200
Message-ID: <20261022213719.2452014-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 23.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://discourse.llvm.org/t/llvm-23-1-4-released/92564

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index 7df2f28873..2327c20408 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.3
-sha256  c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34  llvm-project-23.1.3.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.4
+sha256  819ecf7351f1a66f76b2d701d8942faaf5faeb324cb90c9d5b090de142434bb2  llvm-project-23.1.4.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index fa141fe8ff..f0020b4804 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.3
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
