Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F692C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 14:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7D840AC8;
	Sat,  5 Sep 2026 14:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INxcVlVNV5K1; Sat,  5 Sep 2026 14:12:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2EAA640AB4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788617570;
	b=T3755rufyVTmbdyDVYY4w3QNzMj0jufenRCk6scuxo8c1yKZfy6dGUprEIboBbae7R+I
	 iwBs5eg5dCfh1ATKDLE3RoL7NxtfvtpavO/8fWp6lwje2qCgrp4R/tjCSXgoENsMW1un+
	 are4gROcWS+bYlCS+8QiQGpdBy4kwNrECbMRrYjcFM2cL4apBVEIDNo4N8RY1cjuAIeWr
	 VOh8iZ1OQ5uy9WMW7oFTzlCGULLKJQ7+5kAEPqzU0UnA7XSXCHwvQP2Gx4k5pANPZHELp
	 68lf0ntKFN/sPFiMpkgZVmaEmrZKCy7yVH9j1BFTK7QxLpDZprzc9bs9iDE4lUJIeug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788617570;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=noQlZQJVuZFNNFtPRVfCcEeQWTbwxu85LModIU/p8RA=;
	b=qfCeEsd161i1L04pCS3+NXYB0bw3UlgJcv2hch1Gyab4e/i2TYQAK2RXS+98M+zNMOPi
	 sLYkAW1vfkEYgAQBfqrzBerP4ydxLzKqJaGTfhcwIDHcXI6fB2UCjDhpIDYYXTI8uMevf
	 k/uqOSmJg3OHEXXBDohjOVqMifvQtMw0Sg1JEKZlEU+Q08tWGpSHcc7+FinotBxxO5uXn
	 ZFwvKxqm0/HZvCg7nVQnyUtI5yrbSOSvrj3iqdriSlwB+uSo3b8v3kNDPPc6li0sIrb4X
	 hXP/NFti/U5YFbEubAvwTJocXhUZQHjycjSZNj/LVOhdKA28Wtd2lGHrF+o9L6UlIJQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788617570;
	bh=noQlZQJVuZFNNFtPRVfCcEeQWTbwxu85LModIU/p8RA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=guCAe95VNpC8dFMHC9BRJdQ/DzeE+yd6x2qOq0uyYYto3r1fxTVi9QFLCV3gQKs1W
	 ZGFEeu36/7F3oTYJADUCVfi5YulDxazcOxfJNRWbiSJ014GiDzlkMmm/XGwmyBmqNZ
	 NtdfCWi9eyQSq7fof9hhNkxZsEKistDHGISzaMnosZ1/4zjWYwoVZiDJiThm3TI6b4
	 h8KNf0a7aU+6Lmh1Q0QivPtZUmJwPVl8wrKdVzWN7zGYZh3CQu1dVvBb1lHAPByXR/
	 nnKq8yISIRw/sf39FKPyf4pYC+5SHjOiZQ3bIWFBbB4q1UDvJ2FqLSWTQhdXPnoc0g
	 3742vW+fJ4EJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EAA640AB4;
	Sat,  5 Sep 2026 14:12:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6159849D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 541EF40051
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTL3Cf4OvHlV for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 14:12:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7D99D4004C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788617565;
 b=YTWi72NrQmt4OpAraos7SDhbETXYf1XNjhN8jpwXmvz5cUN93qkTZe3C3MhORp0Rlx0V
 JnRUwTDyqLcyxbvRjDKswif1zFH57za+zVfkBk7fc7tPhXbHV37Gc0pFwxREC5Sc9N1lA
 ERv+A0r5tCAUzrrWlskMI76ERwt2y/JkqSXcXphai/F4BEXgCkXLZxN24+bQlTpE7LeZK
 ff9GLGoa362bQ0oAPzSEBhT3VCzYiYZYfLI9JYRbYQzbUWE6cBehK8j2ac/e9p2SvsPTi
 iTfTKdB2+fyN7FKfHBjIv06lSqVXyMGA+OD5Km6PShXCJvxY0smKURp5BFxnIIJUpkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788617565;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XXi31AKl935reTfunoz1/KHcxrDZ5p2nqTp7mljowrc=;
 b=sh45uwcDl1GgkC+IzzWmHeiw0UV3vDucXZm1sWtpJpK8Rfub9+f576SoACHHiykFzq+K
 V2OogB0CeKQtxssSqP1nlfBqvv1pGFnL0bVmkAY7s03pwQ1ggwnIiYHr+2woYUEuHn2CN
 Ao3WuovCW9tHE6KlmjCGqiLYNaNz+RVXXKpIuMek08hXfZcwnYljR3BqzuA0czw4KwQqM
 4u/LPMhwmgeebTmIHhgHqLYvPgeq4Zlqaa5A9d6XbjtjCnN6JQamk1V1LPbgTD+7XhI0z
 diz9jNgfZGuaukkqeIvtb0wjIxj40eRwS8VfB9mHYMCbGYd0IcNBnsU+WILBG2CWVTA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D99D4004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:12:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B98B934A8; Sat,  5 Sep 2026 14:11:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 16:06:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99529edaef897844c3cb20a107ab0bc26f4ea9d2
X-Git-Newrev: 967380b3166d67e749335ce31a1af071390c3a75
X-Patchwork-Hint: ignore
Message-Id: <20260905141144.5B98B934A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nano: bump to version 9.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/967380b3166d67e749335ce31a1af071390c3a75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://www.nano-editor.org/dist/v9/ChangeLog
Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 62692d81cc..08fc6c115d 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
 # https://www.nano-editor.org/dist/v9/nano-9.0.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  9f384374b496110a25b73ad5a5febb384783c6e3188b37063f677ac908013fde  nano-9.0.tar.xz
+sha256  05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9  nano-9.2.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a3e019d5e5..0a12b528cb 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 9
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
