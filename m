Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DE606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j3Ha1Zgg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aFlu5awS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D24C60710;
	Thu, 29 Oct 2026 17:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pqh7AIvwfPiw; Thu, 29 Oct 2026 17:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C912560A6F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793295199;
	b=QUsMjpBhTwmjBaYKNpHlu0OWS/FzOYEnPBjd5vOueuNNGBle5utfieR/LdUUmnZ0ZskJ
	 hiuoPHEQ2akg78fQUJaj41gFzr5otjgkXuE9LjfOuXloKkd7xJmDSbmBuuje1Sd1zZGzA
	 ukY+GnuAxUye+2TA48jDzU4YURKr1gysqCyvr7PSfmmZZKUV9wnosJYaW7Um+wP4CO6z4
	 neTgW3Nt8N7XgbBblcL6aZNZ/PKLbJlUYnOEF9UnpJxNc3LZfxkGf062UNfX3wb0utPMo
	 WlXx4Z6sbAjRPtCkS1n+q3uCVTcTficR67rox7WLU9B5fBwReh6wDfDzzR+YmeMIv4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793295199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bTfgj6ChebMylOAuWgfWkr8sz/eiIW/KRfxFuQnK770=;
	b=jLLD2m4GbPIZYhYqoI+oBezOHZCcA4elC4624kGCTPgeATgTES4csjKrWqo7bBA5/9Df
	 1CuxS/dyBijMPGTtC4EdTaWx/ZO63fHVfo+3LhSUFtkbUDmDGv5i2hjvBtJk0sKiRkda9
	 kWTVqdCHOKsChWJqgkjpV06e3Bms+KivPCWTbN9GXvYt4cPerZWJfzo3zFXNZiyNhgaxd
	 i6Bh7hvRRvaCO+fFWgyXRBhLR5y8LlAXpApPLyMvup6Ya6Kan0bI5M9cyNkG7DHypQuqB
	 jPTHzosFiERxVp0DyScD922v5R0UKutWmEzOrism0KJU1HtfDNLH2QXI4qRV0Dwf2Cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aFlu5awS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793295199;
	bh=bTfgj6ChebMylOAuWgfWkr8sz/eiIW/KRfxFuQnK770=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=j3Ha1ZggeGqfbgPATjESMIAI0GZZQgX5r2ZGlo28DZdPzd/4PpxtlHMo/UNibXLaH
	 E0IYsl+YnYf54L1NcLP6p8MsFCBIgK/jS2YVQ95yg+hHnyGNf6dIB+GV4VAyL3HNFo
	 4JeyG+00A467O4qiDLydM6JA6SfU3uLuvS2xhlMMCkWXn9NIRyzTsvfvuFv2VEmnab
	 paJ7jYnzwBqybazsgu4jw3Zel6xeNWt6ZxMMkRuXL7E8nhKTIuO5zxzu4k6HfRoH2j
	 fN5zJ2Bzy8sPrc+34uQEpNLWXNAh3TOVyM/J4ZlT/AtRt7TQ+S1nmp9VVagZW/Ft89
	 LM3P/geB1goNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C912560A6F;
	Thu, 29 Oct 2026 17:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92C54712
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 17:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 787A660A6F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 17:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ktRGU3CINyW for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 17:33:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3CF0260710
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793295195;
 b=mxpMh71iur3xKUernbfEkbUz40+s4l/g192mlMBAZSEUjRAR3r6kStWFvX/eHgpcpnJX
 mDiJJ6TAG6TaG7TR6sx62va8hqAHw1nhWgC4c/s9BjMcs33zpHyx5EWF7Ho39B1YhVBTA
 W47GjUcwHsbTI7EIMPjHNdWpDexNNz6i2dWyUPd/TR1d+DDA/ClnioGYSQx51RHhZu1pq
 lissm1LMhReLZTwsMS8GqREhdlGctOzuRipEpTNm61+rKUBcHbVMXhfc4vPzYJsAnYIMV
 AlUyLPxxbqp3cpA9VbcDWZM0d1nlP67H3fKhr0oIufcXRikrjtDPdty3A9q/joAZUNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793295195;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=a6Rf57QYcEU1R44BYUuMwowxU7v7UxTJuO7qScfR7Ts=;
 b=ev0aCdav+L8bjjlk0QD+rF1YrbMhGIJ82GP0OO7uT0jcwkzk3bGjBmt8C/HrIMu0XOed
 dCHwYWD7DisnktVYfwz5rNB+BL7f+gZCktHWr2qMfF2T4gApcu60XvSUceh3mvkRkobll
 +R7cxDCciThQKIWBR+l9u3/oYvXTdNnrNeKisD+wIEFQDRuYSsV9qbjIDKsbhEFGTG6pW
 qGB/80S+ULbs/ACo+oxa1SVQArZWEaRGmMFYjoAucyVZlK6H/A1Ft4l+L1YIWNYzG7XXr
 II7qG6YMuKlAWyMHJD5iMWb27PcBe/+/WANuSGN2DREV5sQFBKUH9dl5uWYFczBcEkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aFlu5awS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aFlu5awS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CF0260710
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793295190;
 bh=a6Rf57QYcEU1R44BYUuMwowxU7v7UxTJuO7qScfR7Ts=;
 h=From:To:Cc:Subject:Date:From;
 b=aFlu5awS4wycMM+kdJH7/EPmnMMfsfS2wklwY6MPM82A/ZOFeUmqSb7GjFjHkdf0P
 995AFYh1QKIgoZhYUPLD6BpgtVg2I5ae9Vjolof0GTQSq3b5wsX4S6bvQIBQwySPP3
 tGI+wxt0RnCJfy5ljxJEwnvWjGEkx4LMFGmSQFCIlGwws/h0vIl1zgHrVV/FUNk7Oa
 +EJOLUxrgc1uzSUPETeMq6MZvAL+bORRBXOhBBMVVMsNIBWFaMosXUYf/YzN3aDHr8
 3Frkz2h+beZAG0ENrRolcX2XguNC4kTGZLzgw0OTeZYC8rbqTV0D2McZWE8A9s47F8
 AUVxRMLIhanWw==
X-KAS-Sym: v3:f51bdf72230551df:nQhJQDYoqOyB4dVoZj/uksNUesJgYlvvtiprTW4GsNZxj
 gc5g6zaKSFoIxBUUw3kQiSsMI55IhU0V27DLgEA5ovtUN4fsdhYm5Hv0FecR79TTJJ5BZK2VFJ3
 BQzrxk/bCn4wTZWf8KWXDQ2mcXgfSWuKSX+mvgv7Yggz8zA6nPsMxDQMaZwYlTKeX1gD1Qx0Ard
 b/Q0kSvaRManU+se9SP1Df0wPsCsVv4ddYAtQ7Mie7Fj1mh09EHn2YzhWzYGl8w6rRgDbRLsnv/
 5CoriLgiSi4dTXEdypLj8rkIJSzRhtdh302aQXdbE2bvqIo1WScN6WRR2lrY1lJRXrImAMhw==:
 Xxj5rFrEyjvBBUKBKijgia0IUnLOQEKyf2QKRFU0JqIWtY0Kl+WrJKUo/KcaHaYaL1W4BQbm63+
 X5BtaVKQDfxNENPeRokYdQlfeqM4ZIF0WANbzZBmAdGy3aj4IL7nhlNxwyz+E0ZXGMChKoL7jMH
 XQv/JOA+VkJbX6b+wDzCDVI7HNQdX+G/Zblhsok5Cd4ATqWESg6q3lRJjKSepNni9maPJz1AOwH
 0jQnJKM6aRo7HjGA6lV7ufrZClD/R5Tdrw0xUJGNEjabYUmyuv4UcyEqwyn1cZGEMxOnCW05u+v
 QspHFJn8kFxxBcYUhADAhnHd7haoRdMltWwHUJYicGsoaC5+JFYjjLf+dF2DHp0lsEMPkb2aCk/
 KMHmDTCjXD7BOdIWkS3c4VFOp7fpD931ZvDXme50emWTvwR6abMUAz3+HZeWEaQWJ9mWRD5NXZC
 L6EbDn5vz7UU2CIHGpD0PubwmgxRhwxRWL57bgFk/3WOyDGMHDcsqJKZbczXcnmhldo7ZS36NrR
 +oawW14eBEiNmrAoCp/BfMY1SNNGwnEZTisVv5kKV7HTWYAN61H/xtn4OWYaF9U0iStD0WqR317
 hV/3KaiFPM8m4lSwTJh1bHqlbjh67+f7D893p657VUNHiTdH6feY6fHMPCLJw8ve4ljhCZMo/1p
 Anx+P3N3+1y8x51uoZw==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02F3BA4C6B08;
 Thu, 29 Oct 2026 18:33:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34570)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMTzx-000000001WY-3e0w;
 Thu, 29 Oct 2026 17:33:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 18:33:09 +0100
Message-ID: <20261029173309.1785913-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/python3: fix non-NPTL build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Upstream commit
https://github.com/python/cpython/commit/1bcc0d165ae66f5d88db5c5bcab82908d9a49537
first included in version 3.14.10 added the usage of
__builtin_thread_pointer which is only available with NPTL and causes
build error with linuxthreads:

./Include/internal/mimalloc/mimalloc/prim.h: In function '_mi_prim_thread_id':
./Include/internal/mimalloc/mimalloc/prim.h:312:21: error: implicit
 declaration of function '__builtin_thread_pointer'; did you mean
 '__builtin_extend_pointer'? [-Wimplicit-function-declaration]

Buildroot commit 3736eda341337a2ddd824111a5f065c84d44c584 bumped the
package to 3.14.10.

Upstream offers an user override
https://github.com/python/cpython/blob/v3.14.10/Include/internal/mimalloc/mimalloc/prim.h#L270
with the define MI_USE_BUILTIN_THREAD_POINTER. To fix the problem we
disable MI_USE_BUILTIN_THREAD_POINTER when NPTL is not available.

Fixes:
https://autobuild.buildroot.net/results/ca6/ca64f93e85191779d0ef4daf44f1519ad75be6db/

Fixes: 3736eda341337a2ddd824111a5f065c84d44c584

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c24020af9b..a892cdad3b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -186,6 +186,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_81426),y)
 PYTHON3_CFLAGS += -O0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
+PYTHON3_CFLAGS += -DMI_USE_BUILTIN_THREAD_POINTER=0
+endif
+
 PYTHON3_CONF_ENV += \
 	CFLAGS="$(PYTHON3_CFLAGS)"
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
