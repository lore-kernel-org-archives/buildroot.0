Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O2O7yjcD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fmzxgKIF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD8A6061F;
	Sun, 25 Oct 2026 20:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66ijvgzrXUFe; Sun, 25 Oct 2026 20:53:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 632F56060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961591;
	b=TRkwXz/P1QzcxWYZWSoLjU6qn4RaWVunv2k9XnUA+X6ywCdup+KEzcm7zsi8mV85toyi
	 IQrVR7thZbLm66ccpzW98uxLBrQDyEj09qQnz0063VcJMyDZJ/cafszX20xOtEm641OrV
	 CjcViSd9UYfTjQEUAGEhjNrNDNUJSFIFH6Xuiw/a0a3SvQ3WODBVK9uBo0b+a5hrwPoUB
	 EkjGeEigH0oI2LonmCpLhtzRRUSYUOeW8Bxj4mYY5858wzPIim4PTgnxI5dz0G3f0xdRb
	 KxcC/1I4ylGFthvDMf3FIU4+WhTHabhmFNyEulhWMRgmPmYbocG43jpXwhtk5VBBvtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xwMAR1NnfWHwSJP7TXxlnBP1AdC6PiPOA+XmeANPAac=;
	b=MeORF002XcXEOsia0GaP6WCI6AsssfqrChiVVxy6hyrvE+uh5Cx4y0U/yC8JQwutnL9O
	 1avVKwa9YQ17Aizatqr+KF4r7zk2Cj4lJkHwHVBVCD5XkdPSv9Zv/00/IXDEH+LA0XBu1
	 JnhgY5K7JI72L2ggU+7+kiGMtEERHLqfKIe67zMqi0rG9ehLUzxVTYHbrBGNfMkez3sf1
	 Bedix9tXgTk1obT829m5v2zBTxAD43nbE4UZft7au0/NUaLn1zHjpcny35lrGq8wdlbFH
	 jwudKrRmcgZ94i8KWDfN41SVaD5g6vwBptLdvwxMAJYfAywTIV9jYJ7zDOdZz4hGstg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fmzxgKIF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961591;
	bh=xwMAR1NnfWHwSJP7TXxlnBP1AdC6PiPOA+XmeANPAac=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O2O7yjcDgPapdPnXyS7PXQLjoqqEygi/1SLI6DMCmPFiiz+DOO1JVJDcsfEkzgNny
	 w4zx5SZIylHw1Os7H0G5xNqjOZmiYWPiSTyOYTB7QRaecJGcqIviKww+UDfKGGy1Q8
	 ZCZdPk9A+HBIkmYlngamg5g1MXuN1b3QhBt/ML0s0qCk3qhxjWbRf2tVCQd4DyUCDe
	 KYCY6DNlc8bCRjU0RBTmvi1i6STeSRI3oAKMkauWg5Xs/D0YyetiSmSPm+Ggp+YGzI
	 g4TtAL/cvQfBsGsoOLneA+2+1jGC8Jtg9TyoFZNE+zdzaTSMNIXCXKXZEL6jAQ92sT
	 vZzdQcX6QVqqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632F56060E;
	Sun, 25 Oct 2026 20:53:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76E1B380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68D8460618
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q41Ud8cTu-S3 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:53:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 84DFB60619
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961588;
 b=Xy9FhJTJlkDc1k4RwFmyA+ir12YvX/ioLvnoyyq56NamjjAXXdD+LQU8oU304boHwKI+
 hVNBSvqNOwJl4pI9ZodMiWTSKZ/b5VlVeDbj2NNM9Khq6HSBOMy8HVDd/GTkf4PoeTn8m
 +E2pJg9PufmIdeUY6SdZQUT423oY1WgFSqUsmE3gVQSDDUg1xveIp3uRJs9M+dODFZiHL
 rP1fcdVOa/6aXVCpoUuQAILWwe6DwkAJijt9nvwXNCMqsfCmUTI0L1VcPgAZn854XMTNf
 FH56o0H+ViT6dEHkBhHr5c1NDsMNEZGM7vwejwlHgC8nkMDxu3URvqt998KhQd6wdKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961588;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hnDDadCVGNxj7WdCVLIOtTzS2+GO2Yu5WQBcv/sUdhU=;
 b=eQWo0eWbbimjlshhTdPbFsysvpM4m02d/mVvsuadiXODM/EB+mPR+RnQK9JPPgEqX6m2
 UULgm474kSV78R5TzZrqJz+DZeIh2uBwaIQIPSXP4KXpWgauSdhqhCcJM11DAhpYMk1V/
 SUcdZClA0sOfSAsiKSe2baoEHHoO5tw7yr5LQDPqwLqj8YKxmFrXcCi5/BK7M/NPSZsqk
 fYYxNXQS2I7Ot25d4d+E0RrRvfAF1E4P1Ih1KC7yPeF0sXUXRX36hsB+4nVsuac2UJE3A
 37u+1ir7o4htVtYizAy3iYc+sX4y+wNr4Hi6YwM2FwF4aAVpS0I/oyprtY4MqynEczA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fmzxgKIF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fmzxgKIF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84DFB60619
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792961586;
 bh=hnDDadCVGNxj7WdCVLIOtTzS2+GO2Yu5WQBcv/sUdhU=;
 h=From:To:Cc:Subject:Date:From;
 b=fmzxgKIFhfODI67JIDCHRfpy1wAeKjUBpdZrxKKh2fmOtq7KU5Ntaw8+kaTXEd8m/
 CJtxMGCdvzF/xHTnIcFXbZjdT0IUzihLcNxGQ+4j7bBtMan/9QIqYCwDgLRXnpBOI8
 rOLxByDSR4c1BC5yQbcrKGYwe/s2kSOecgndyFQkPrZ8wyJByKwldVGyaXu12R8i9E
 ag/3WK8NKZU5TXKAjjvKleUcuSOnDZAsbXvAJ/5UliYkeKosFTh6cCIlWpu3GVoz/1
 lOX+2eQkNwFEEK04v9eEyozxJt1aZyRyEDV1dgnWBLZQhW05SiiKdHEuHQ3VdqvfC+
 /nmHg0ZtmY0EA==
X-KAS-Sym: v3:f51bdf72230551df:p8cN5mSD1XLoAwLCiygHJBtUOQegECzq3C+AryhieXr+T
 pu+fNkbwJdsJ/0Bl12t4PfxAGEDgONcaHivj1XcIlr4xS6NIDrHxBEAmRGCZNjhBMnXngT8iYib
 JjexDjt+EGxGEAv7HCCLyB61IAOG7eud+tYrEelaJppgqGNYD5XHWh1IG46hYfkFdgNw1xgkJlx
 pfwwJuGfcSk4m9dKn4O3/oXUVPd92GeYmIFAzYM+6shGMROcHsRQUuK5HigJ1eaR0cmcKGBg8GR
 2yY/VtRACq2vD33rVLERVqFkmV3cpRlNBcNPcWi5kW0zM5g5GgoW+FoW8sFDVv0cH6DSF0Uw==:
 MmioyXNG5y/oXhiSDKa0wEoxdHlhHWlT8XChPTxA56lPsz6JLpco2hK2vEpScjS1UpAvhgRJG1C
 wzQ/bHLm2q825jZf+lVRM3cvREbVsrwzG5f9o0rXMwQHVDfe14kPqSf7ZmAUps0a0yd23BqfmEP
 zhA2S3IyPlvJfx2+9Pmx1a1zTkSi0lOjN3mZC4T93QAQJlYWVKXTQ8VTYgJ3JLV0RIxweAa0qJZ
 u/cna1klVsNcj/Ysi7Uo/wjqVs4dyCJh8qVdx73ZdzvDloc6gqlXzs0T8L7mRgEhQDqwKPgqKTw
 ULNlh8P02h38+8pn2oFYa2zphkA7m6tfQ3Iz6BS6kgwSBcdE+eKQqvgCjwRtxMkHDqals1S+Xvx
 WVWDhT8d/HDa2S8MtHe4VSFMAU3nmCq/kXSUbLGqCeOykTQzVzwQ4a93hqBptEvYu0b6B6lvMg1
 y4GyPxGS7OJYh4/lxTbEAQNiqSAijmbtG5lgok1OEEDknfrpKa8jEOsdwip+2cORwMJPhRnwolJ
 y/Q+pPemDQ7gZLfHAHKOqOxRsB+4w3niNxWFpavfv2Odbsn1rQWgSGJ0MVnj1ZFiiZOOcm7jEL4
 cKZ2T8oTR8THus8/A9kbvF+AcGB59FEBA7F6t2ttPy/aztG9Wg==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F1ABA4C6A77;
 Sun, 25 Oct 2026 21:53:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54826)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL5DG-000000005Tw-1SLh;
 Sun, 25 Oct 2026 20:53:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun, 25 Oct 2026 21:53:06 +0100
Message-ID: <20261025205306.433770-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: fix build on i386
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes build error:

/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 libavutil/x86/tx_float.o: warning:
 relocation in read-only section `.text'
/home/thomas/autobuild/instance-0/output-1/host/lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

For details see:
https://bugzilla.redhat.com/show_bug.cgi?id=2428281
https://src.fedoraproject.org/rpms/ffmpeg/c/786464f23944a2a6e082404b589d1ec7ac568d00?branch=rawhide

Fixes:
https://autobuild.buildroot.net/results/c3a/c3ae9a6e6f6c4060feaa1d62dbc2b08da2437f38/

The oldest build error of this kind dates back to 2024:
https://autobuild.buildroot.net/results/e66/e665577347857b548f34f9b4fc86f2c573f27282/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added infos about oldest build error

 package/ffmpeg/ffmpeg.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4ce129132d..6eb3afe277 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -584,6 +584,7 @@ FFMPEG_CONF_OPTS += --cpu="$(GCC_TARGET_ARCH)"
 endif
 
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
+FFMPEG_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 FFMPEG_CONF_OPTS += --disable-optimizations
@@ -599,7 +600,11 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 FFMPEG_CFLAGS += -marm
 endif
 
-FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)"
+ifeq ($(BR2_i386),y)
+FFMPEG_LDFLAGS += -Wl,-z,notext
+endif
+
+FFMPEG_CONF_ENV += CFLAGS="$(FFMPEG_CFLAGS)" LDFLAGS="$(FFMPEG_LDFLAGS)"
 FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
