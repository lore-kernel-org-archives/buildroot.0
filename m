Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3267DCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0023B40787;
	Sun, 11 Oct 2026 13:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4H2b9iylUoS; Sun, 11 Oct 2026 13:11:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 21D954076A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724304;
	b=reghseJRtRv5bWSDFkbUA9HCyQzoMJcL/IgZ1HGzpJ+SI1l+B8+UZIun+AQZNDmsBfUR
	 VPNjmqdb6AzNyiTiHMAC69aOKmBxrlQ2J0e2blZZ/5nQT3xZcRXWOOqQEXE9To6akigFm
	 QvTuCmRixO2barIi0fQFxMkuLhvpo0tC0Y+EL+sigj5Kgi9hXytKEK4m0MsJEYn1klcGg
	 vX6/BMtG/FsS1AlPGt4DzXP0f0jcyZaodovyRT/nfh6pfpRikWqOw//Gao7W37wb4kvbA
	 hGhR+jAgLfZcxukUBrkMiCafAbRSGLlBXzD5feeUIR21hynCudnbWjSpcxt1HTTgQ0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724304;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O8KA8J3yJGdhc8PrH0IRwnqLFCcD/3gWIO/VvWu+c3o=;
	b=YZP1l4mNKn0BsKEgqok341ETUtFcHNBoRu/AXYFsrlQQDsuqcgrVpMaAfTb+SX3cYbZe
	 Pattvofha96XAu2hO4KdTmzg5RV+QHDaBgkwIzhD2WbATCO2pfQHBVwnsrLECGEY4s9gf
	 JI4+exGeZONhT9PdbQsO/TPGxiuOJmhFRNxL+NhwG57fPE8v7QDRY4QTqAuJflwjNW5q/
	 eyAT05f+cFrDEmC+v/91lTMWBhGE52XZ7i9mtILsOinaLbgfbQHmA/19CZDPusk1xMev7
	 uemiUFyi07E/ffv3NL7j30pM1GAEY9W6lPk2fTQLWZ971hwCo6kbaoMxaNhBPgYf8Bw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724304;
	bh=O8KA8J3yJGdhc8PrH0IRwnqLFCcD/3gWIO/VvWu+c3o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nnCPgy2RQunwf565w+rupDCLcj1cOagBuYsJ0fWvKd+qUnum2ybwCr0y/y8eYoXFT
	 9hH6WPKgpzatyFpH9ixYfQ1kD+kxjjhG0VRRFOtvca3TMEHZhdbZ5DLFAcVXHKzbWI
	 9WrsN4do122hVWI8d3TbDNuJG6x85FXHBlTsGONLlUftdXGN3Op5IWvoKP4dep+KSs
	 9U/Ku5ErgeL/ta4/5KF7xVzy3R2OCYzMPEwMq0nOQtBUdwBY0BMHzlIqPQlqbfn5aW
	 43t9mG0rZaWQMk8GnWRTdzHZ40qHc8jbhXEgWgQaDFTJ+VkQKoe0cBRrATWwRVpPmY
	 ANTQl3F/PPb5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21D954076A;
	Sun, 11 Oct 2026 13:11:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF5C1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BFB24008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4qZiF04F1T9 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:11:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4141B4002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724302;
 b=Yb70q8qB7cBbTMSnTRKjisWy1EVGxHTag4RtZ5ZNDkJy4JWreylIweJfkTMfLjAjAAxE
 1nGDPr0FDSa9GCiYIKaEFI+0kxD3JbvpzWl/QAMiD7sBJco7mo3gEa6yhS88Jd+ShVPfW
 26++j4hTNimXdOBekceNNjh2vIYjBbNO85dsJhLpfET/oz1Cl1KyHEr7XYPq0N3ujMECo
 nrmbeQKTFSjgPDe1LNoL27HHVExq/oyyJwIDe6lXgIwjRcIMgxU/A/QD583YPiB3RLDMh
 NIt5NVqEheId5kw0eEehBDswITXXhsOwOm8bfUUwbPHTObPcRFysiGwH4womQUayuGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724302;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tA12vUjgLhH+247+JnUkEPIg7kXdKELKOyHAhs6GfT4=;
 b=LXMpBA7wpS4mpfIkgsGGq+dUzveH9TQPIQd70pVGqH5SdGMZ64lpDFnXDLMjgUTwBB/b
 8lLT1Axpez3OEJZ9EC4Gx3Wp7W7vQYvdTBkZOLXsnePc0+SuFCi7RcSc+Jb9jvG301X1N
 lFLSKDFaCwRkqTdfEls5eIsOusu2Y+4SToAe+CbWU2Rtmqyuwy0/FVOjZlBKG7lbnCveD
 Umw2j5Og2oeHlkvnjwpwWpEzlnw0/QvfXsHEnwi5V4uDxqjYz9VTsbfKmVmk6xyCbDlfi
 OczA3IAHbOB7VzLaIJLyUu0MlzEx0ilZPtxVNCLscu0XhI1H+/h16z07rIlK8sQ+gHA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="l+uo+5/+"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=l+uo+5/+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4141B4002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791724144;
 bh=tA12vUjgLhH+247+JnUkEPIg7kXdKELKOyHAhs6GfT4=;
 h=From:To:Cc:Subject:Date:From;
 b=l+uo+5/+6DqlGtwc7rMwubkIhh0vWKt2nVzC4aEQIYvuNQJUnrv7VYAQNee/3gt8A
 XPiVbGDXzwB+tX2sUnjXGMyBrIXZtVOftH9YjbqOcBtT3wpMleHWRNj6QfpD5gQ0R7
 ISZqRj0knA/nCfQMN2aM+zUy9txcItZgJoYCQhvut5xeVR0h4tlz9rtBe+yt1GVr9m
 JSEhXXQHbsr0HsaaRt4l0U0mJpq9kBNU55aKUBzNcsyeSPnMn+0J8LTPTqUM1wHqNJ
 +nVTuBY9kpnthc9M4J1WHY/hUXlmdjyTmcxoCPSxlRLp4YuBaGdwlpj16A8vT7mCIG
 jyXOgvkf3KCbA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 MfioXxSp1nD1oPU9UebRWiHmcc4qO8I/71vpp2A06ZaOJUMArvI1WC0nRZKLcQUP7JBavamT7YL
 mzQSddUVURBF0e+YZ/wUOZuaJXOjJ0pzhI8ClDISjCF2bmMDHhfXjJYn7MaQyhvReXxsKmzwXJ7
 xglyIGS/938UbAZ4+nvZqXQ5+ChMEEB3tDn4ldAHowkDkU+evyx5jOwbm+B/U+pwPn7lu5ciAav
 h3wiNwKS9NjGl6hf0exxGJXKkOjHQHj9bBDgITiUiZtxu30AvTnbEctbPVrRapgkhTlJLgNcB56
 V/qS92p9A0K01/Tqzyvxolt1RnwH6dLNMytdoj+XsEjsL9e5vDX4m5747J4s8WqD33bPcgYgc84
 /P4XPzkqeFS3hnTtG3csCk3xI5s6bkudjPJSpvSAJaUKJ3fkKnTJb4O3rLUDqNT2lQrdEUDgAYr
 /+fatfXUSO1tqumOj3Oy0w25jhi3unIW3qVfXzjVl+7o2uwSsAp3953MviT6/pNaP3d3I8qTbSu
 bwEIF3mh2xbAvah5AQWnOMQEDTkUee8w0tAQOx1/PMsxKA5OOYEi72Gz4bt9Z8U9MFvxcLtSdLF
 T60T
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69E93A4C5645;
 Sun, 11 Oct 2026 15:09:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42858)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtIW-000000000Ei-1IuW;
 Sun, 11 Oct 2026 13:09:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Oct 2026 15:09:04 +0200
Message-ID: <20261011130904.3449631-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://cmake.org/cmake/help/latest/release/4.4.html#id4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 5f151221a4..44256efdb9 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.4/cmake-4.4.3-SHA-256.txt
-sha256  c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0  cmake-4.4.3.tar.gz
+# From https://cmake.org/files/v4.4/cmake-4.4.4-SHA-256.txt
+sha256  bd24c30d80a7744ae84b845ff080cc8453b06c622ef01066564108e9cefc44cf  cmake-4.4.4.tar.gz
 
 # Locally calculated
 sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 098f6e9158..48d32ddc4a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.4
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
