Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EB4CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E76B260748;
	Mon, 19 Oct 2026 08:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jr4xItQX3qae; Mon, 19 Oct 2026 08:37:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E488260722
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399068;
	b=GTBCz1lNRjAI/UmjlYEbzT7mI9JJxRa08HhtDYvudyrxFdowA9v3oJp2xVRZh00S734Q
	 9S6UCj1XndQWi8JtrJNCjFDHY+xIjAkoABrSDXPYEQazFjQb2+DAspy7spotsEV+q0xkC
	 1UDavMP6LWwk2mY4mD3ZCPd9dTCt5YU3WJ8aCh26DMllwYpiwiPM/QyEF2t3segya5Twd
	 PY9OiVOFDxeTaqm4gZTJSbOqunhTX63dDp3bEFgvqYz8AvNJqbSwDJg7M9ciizuRha2lC
	 LhljYUWZE+a319w+qqpfZtvzVhur+Q6bk9+5vbl59KQhpGmf9iJenpiYgNCSm8W2P1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YV1S85kBHLGIfRsSRBHROCavJ5eSd90kcjGZ69Hky1A=;
	b=jLf4f+Sj40XKRrbrQdB0x5f46KN8g5YO5gDuG7iJqCVFOGIzDSMKbPel+myAJpOpGj0M
	 K1oacS0m5bXMx8aT/SB9QDEAXcVRjAsk1rYNCyQY1cWvNtx629TI5ekBVRpKZquAfpRDg
	 hAZ7f82Ndgb9aDmpcMf9qlBGBm4wCF9pIWuTye14soTlDJPvVfKmyCxuUbagZQtFV6XmR
	 jMKBRvr8hrgAA23Ibl0i+ip1k0dLrHa4DsoL7JUHB47ehoJibn+bzRfga38I+ZGDb+M6I
	 skoQGDY1/BR1gLGJ3yqBLJ4qh21cacwLzq2PtA9Vl3Ony1NFFUFQS8yTLwjSdgj6u4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399068;
	bh=YV1S85kBHLGIfRsSRBHROCavJ5eSd90kcjGZ69Hky1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hljemor0ZLOtiYtSlPs5arxuUtvQLFcta3O0PNZL2T8d6Vg5I6tcPEjU6mTMqvb+r
	 YlpESAJiUAtYGVT1qm18GIypNWEGTQvT8njojjosbU0A0JsttyE1CKYmQxfPyGJE2e
	 cSnNrS/tT13XJsmDOmQwR7toqWofPQcRM2Yv6Vs6Q+6kqdbgpv8o2LCFDXN/Ibyamf
	 TI6rUD35BOBHeKOGF6ZE4g19z49e7fAMuFQVdtTx0hTp9tKBkQFO7EkK8/i9MS2e3O
	 U7AbrzL1I9TPwJ+UBaE+A2uAXwMghhH7HjlZAan4aWJkza4CUK/K6cV2JvzXDoN9qB
	 izlSXp+r5orCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E488260722;
	Mon, 19 Oct 2026 08:37:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA23DC9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFDCB60722
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbMUm6LHrYD7 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E51986069B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399051;
 b=KFB7HcsOuAXk7E3ZAfcJqqTOV45IfEIrpsgCvHedrJP+BoOGdpCrVxWgQaQ3/sMx3NGR
 Sris4oUIzTkuvmFzDKkoXwQtNUmLDf/cO4ycUcv6OvtUXmoToTO+DNWTnqjKR7jiee0Kx
 g1ONrElDUw6ljeJ0EPygFgp0Yi1YHp/g5AYhQygEGWeNhnUi4ClICENdV2CetskefeE6B
 Y3mn2E7BSjrJ4z8MwjFMfr1xOa0hT9LvwyzNBIoWdbral9DMUQV/6UTKgIS8JjRMoGsVi
 Ij3QE9t5/tWy5l1yWLj6XuVPFnLH/8HQo8zN7A37eJ//C1XwmgTIeRctyMkzFLp24Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399051;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9TqkvC/CXfAdDAHu6c7P5gjEMqE0Qix1dwC1NvJuolI=;
 b=TBpJIWaW3ILa3M7wIjRnQMBMZWPoTky7lRTfgg39NWClOjoiYwxZZq8EtDW01cC+JVkY
 cBF8lm44a3WGOkNVQDOBBbAJtJIOkYQJiMdbts/QNzBF6tIb9t4NBVvpNyCfOtRjGHAUR
 YyONBr5+IPTHHBcfI12uNCBW9UAnkmTF4Z/rBPuTtk0/jPkxVIr9xzCchlOsCqNT55ZiU
 p17MlYJV14CU9tdlSk2tkB3sLgSeEI/TsoS0w5451vjiQqFgC/h4twS0v1UMSyYteLV1T
 pus1MUim3JHXEKndUQ9JtUA6MF2q9ciYcRrADy2+xXoQuNRBabqfG04QTTarvltNraQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E51986069B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D77298499; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7462a6a7536f4cff74d4280ddeaf623245a66a4e
X-Git-Newrev: 52fc29ad9256db1bd5a71c50b09fe1d0b6f3e5c3
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.6D77298499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpx2: bump to version
 2.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52fc29ad9256db1bd5a71c50b09fe1d0b6f3e5c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httpx2/python-httpx2.hash | 4 ++--
 package/python-httpx2/python-httpx2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httpx2/python-httpx2.hash b/package/python-httpx2/python-httpx2.hash
index 2570c6df1d..3c14598c5a 100644
--- a/package/python-httpx2/python-httpx2.hash
+++ b/package/python-httpx2/python-httpx2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx2/json
-md5  29186979393f62d61718c3a525f8163a  httpx2-2.13.1.tar.gz
-sha256  e48744a19e3af5ee48313d0ce5fe941d5422fae5705ea922a4aabf94d7800dfa  httpx2-2.13.1.tar.gz
+md5  3efc94e9a67ec11572873e2f32d50cb7  httpx2-2.14.0.tar.gz
+sha256  47ad61a3c40282cd8d0dc96311531f00f5bfc71a066c6fe3b36d8f63fb9e4f6e  httpx2-2.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7e7d6dbaf7fe160d39fd6e84fd02c33cab96bcbea34d36998d545bceb4a19c30  LICENSE.md
diff --git a/package/python-httpx2/python-httpx2.mk b/package/python-httpx2/python-httpx2.mk
index dfd6bd04de..b75a36f26e 100644
--- a/package/python-httpx2/python-httpx2.mk
+++ b/package/python-httpx2/python-httpx2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX2_VERSION = 2.13.1
+PYTHON_HTTPX2_VERSION = 2.14.0
 PYTHON_HTTPX2_SOURCE = httpx2-$(PYTHON_HTTPX2_VERSION).tar.gz
-PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/d5/44/474bef2a0e9d90f1715d32cb98b0738695ca17ba324095fb2497ed7fbd59
+PYTHON_HTTPX2_SITE = https://files.pythonhosted.org/packages/e8/67/58353f1848b4ba568e1ec22ea1e0d8e039f0bca5fde7e2d1f07739fd83e7
 PYTHON_HTTPX2_SETUP_TYPE = hatch
 PYTHON_HTTPX2_LICENSE = BSD-3-Clause
 PYTHON_HTTPX2_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
