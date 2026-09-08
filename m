Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5987DC79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 08:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D238380906;
	Tue,  8 Sep 2026 08:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4c0GEFpBl6D; Tue,  8 Sep 2026 08:07:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BFD93808D1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788854822;
	b=rRSIWG6KJi1Udw0QSFQ4YeG7/SDKvmdSQkugbOQCfYvF2tSfX5TUsyVDmStJzCdTWJvq
	 KKetmeoMKmPifEDvNzoax6Ey0w7dTnxFOr9mNksuqtnbVPHdCIR0htkM024ORJ6Qwl+fH
	 +GNfVvXlHvcdAIxKkYMv049WarWXOeFEn3F/2mZ9YjESaiAossDDIvEKByJWEf98KixJe
	 J9YQL+uinug0AOOxg49cKnJI6Da7Exa+Rb1xlUkXhNmxXznCt+LONyWWCwa8u9kgDmIz9
	 M48ePe8nDsO0oaDMI7urDbXql/eOKMZMa42nhPY52NBOJiT7ICvFkYothYn8Co6U7DQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788854822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Fnl/R3xYS5OzAeAF/hqK4nh3KeMs0kJCA1Vk35NwviY=;
	b=gf8OFduI7IJKDRRvEluhtVYt9VKBdkh6KSle7I8hFUvj2BIOO/mtHJWRPIXYJX6/fSq9
	 uppXtM0Kdq8r2MtoIhClSitwHyDvwPgHIRjyR2s+OgqSF3G+rQvWaz6wTKfWqHsoI/o5v
	 RYIJd9dD5Y7lDyh1XhDd6ierrrOxKy6nQ1xeCTOUSvZNeVs0IbgwMfH54tyveQaN9JunP
	 d++HwW5u9Vl5kpzT8VMcwrHHP7ymE5O7pHz+PkbgsXvhxkG7B/JXK9XITT/57Z2R9Dtzx
	 bVE8oEhbDzopVD4A/bBU8krlvNcc7gOgcVeKWLyM1U3ThuJmf46I0asjuFFBpkW1sOw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788854822;
	bh=Fnl/R3xYS5OzAeAF/hqK4nh3KeMs0kJCA1Vk35NwviY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HbX5mwX71800D38QpRRb7f3w9fBGpVq1l7XU3S+cQp8i6fmjieaEaQdCADkPx09fL
	 wYw0mG6Qid0ACYr6u2y0U98zJ1Df8XgtbitSHEfzE6dmJASlGo5oQByN1hJISSSqEc
	 /NcxcsrxJbdI32xLGt9GEgk4Zk06ky5H3uJp1QrCdW2lfLsbcepXZUHr76pcd0/XBi
	 9zXfwFOufekTMosKz/k0RK6hjMEE084KjQXtlib161e32B0DZ6P2pIXQwwDRawhLLn
	 Q7QFg1FKdP2MPuPwQBDxMuC+xGP6eFfbTJ9cpGUiFV7bFf982M/jz1WU0sqPVO5o5O
	 MROeTRtmt1gCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFD93808D1;
	Tue,  8 Sep 2026 08:07:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CF0F49D
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E550605D7
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmgAl1Xv8xKC for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 08:06:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A03FF606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788854817;
 b=GkDDuexl1DaxjknOg2NV8wbAvMa71HfcLT1WP8zKpQEznr9VlJfxgA+F64+dBfpJDgqY
 O/YrnKGJzHEGhKoIfBP6pCEh36EmhZRSN1gBt+7VeexcpTpXblhwdQ/TiSNIQ7aRZye42
 6OG1iLWcdR0fHPcN/M8OvNtGk6jjDvnCs7ufbBASdcauxoTKvkrFVyz+taHE2kaxnwKfR
 ILPWTfkCcCtalDqCZjbxgu3/VGxo/SE8+QIZyV4XHbUq/jqlPkmEXah+MAzbkL1q7CDS4
 h1qkPht0Tjkt1+Qgc0cX2dHfs1GDtZzPXSDEb8COUhM+IPXWAyMSZZrnAIQUaQe81sA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788854817;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=FnfdKETqeBJiLk1sYiwe6OalZpSBm3c3UaSDV9Rh6cs=;
 b=BERGA2Jgch8vWiHBlyL451giYKOf0upo+X8RQOnaEbfp/pPjqqlvmxs2alSKKbGwaX+h
 h6PMML3NPAMAOUlRACnmaF1NLAsDeYiNNWWr1zkASRS3jXZYQrJijqTtT1SqoQ6ZrbVl9
 qM6POm4wzWUXlhMndFVNTf5i9D/QJ/08OcnUcyHJfNGRaKz8kzY+f7dDSV0NpL9eYitSG
 1BOsrRM7+z3JCYD6kMQtcHvbAxFgnFPcqezbbWT1bOQY/kRto3HFXXaFDUFL1tJD0CpFR
 eoCkRdj0ofeKCYGQv6ZrI7DgUj4uB2eoTXKg000WVThjDxN+84S0bTQcSkdMqKokK/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="sbY/D9bM"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sbY/D9bM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A03FF606A3
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788854812;
 bh=FnfdKETqeBJiLk1sYiwe6OalZpSBm3c3UaSDV9Rh6cs=;
 h=From:To:Cc:Subject:Date:From;
 b=sbY/D9bM/+EfCPv7iX2RJzCHR63Sd3vAnuq2/74tAIccc5jnWEx96qnDwhk16o6mM
 wZ22QFzWGPW1VFCEw9F7Uz8gxdvcsyT3MDC1boI/9dATgWE2K5vc8aEMbgrq7uoD1V
 8/YTe5z6Z2o80tOC20qoGvxywS3+5isyIjm5rcoXWM3C8xN4HtSg4qD6f8pPL9UQUp
 9BWNxj7G0pONHJCvkWKyzGevULAaxggUepg2XnnGnr/zlxjXIKcVihqk2CVgzqs22o
 ANmAOQVoANpO9Nc55TWVtWzq2tuF8XlKJoeAzk6DDV+IJ9yRDSuUG61DPacy1HS6j9
 l5HNzORjx3myw==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E75D9A4C37EC;
 Tue,  8 Sep 2026 10:06:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44370)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3qqx-000000006iL-3Fw3;
 Tue, 08 Sep 2026 08:06:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>
Date: Tue,  8 Sep 2026 10:06:51 +0200
Message-ID: <20260908080651.35258-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/sdl3: fix X11 dependencies
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

Add handling for optional X11 dependencies to fix configure errors:

CMake Error at cmake/macros.cmake:433 (message):
  Couldn't find dependency package for XCURSOR.  Please install the needed
  packages or configure with -DSDL_X11_XCURSOR=OFF

CMake Error at cmake/macros.cmake:433 (message):
  Couldn't find dependency package for XINPUT.  Please install the needed
  packages or configure with -DSDL_X11_XINPUT=OFF

CMake Error at cmake/macros.cmake:433 (message):
  Couldn't find dependency package for XSCRNSAVER.  Please install the needed
  packages or configure with -DSDL_X11_XSCRNSAVER=OFF

CMake Error at cmake/macros.cmake:433 (message):
  Couldn't find dependency package for XTEST.  Please install the needed
  packages or configure with -DSDL_X11_XTEST=OFF

Please note that SDL3 only checks for these dependencies when X11
support is enabled so we do not need to add =OFF options to the else-
clause -DSDL_X11=OFF:
https://github.com/libsdl-org/SDL/blob/release-3.4.12/cmake/sdlchecks.cmake#L325

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sdl3/sdl3.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
index ecbcbf4bc2..83c28b1b04 100644
--- a/package/sdl3/sdl3.mk
+++ b/package/sdl3/sdl3.mk
@@ -59,6 +59,30 @@ endif
 ifeq ($(BR2_PACKAGE_SDL3_X11),y)
 SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext
 SDL3_CONF_OPTS += -DSDL_X11=ON
+ifeq ($(BR2_PACKAGE_XAPP_XINPUT),y)
+SDL3_DEPENDENCIES += xapp_xinput
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XINPUT=OFF
+endif
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+SDL3_DEPENDENCIES += xlib_libXcursor
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=OFF
+endif
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
+SDL3_DEPENDENCIES += xlib_libXScrnSaver
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=OFF
+endif
+ifeq ($(BR2_PACKAGE_XLIB_LIBXTST),y)
+SDL3_DEPENDENCIES += xlib_libXtst
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=ON
+else
+SDL3_CONF_OPTS += -DSDL_X11_XTEST=OFF
+endif
 else
 SDL3_CONF_OPTS += -DSDL_X11=OFF
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
