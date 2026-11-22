Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C1B606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cV//rywl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=RYOtQZs9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A1180D81;
	Sun, 22 Nov 2026 08:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lje4z74DN3c7; Sun, 22 Nov 2026 08:48:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A711880D29
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795337324;
	b=avtQdCobtToAMABTXfTKQTQixKZOOPIPsDNnWAJXDGBrhFKz7pU3aM1H4mySB2acLkmB
	 lP8ndwdvkZvQNxa6x5bh4k0GQBCU9+NVLISGmDkJsFyaYabKtmCScvAVdI4H3XEAOZVMN
	 tyQ4YOY1dTE+YbSMAnhj+l3cQQTryY7bXlAv7Awpad4a948VHJAtv7PFr7slMbLVlavYv
	 hRJaGOwCvFDrIi53wI6KeOo3846NiriBWEwWDdkh83GDdGzvh2RZ7HlJL31HHMpD+U/qx
	 XyIZ1hhYLBDHRNnelDS5ZmIAqw3g67Pd/5Qol8NL/tdJ/YHp9TI66FdB/1VdzWBED/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795337324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FA+pE9cwY1H5TtjvH7Gr/qCLYVweW+T+b1R8n7JIbKQ=;
	b=MX9S+GOG3or4Y/M0OPSjU9DOYEIU1FiopVnxkSe2GjuYs3YNBfhXYDyNxaGJl9O7abmw
	 B4+ormHBV1yQmRyZqrTQ99mBirZ9HmdPNVV/HS46QS7SHGI8KrtSLbARtrf9fYZeGLNdM
	 ixJ270b3sg97Lw1bZ7Q/VejgJRF1jzqO/sds8p8NXCZJaMotXPulwcivBVTP3i+uUYe6U
	 +bP1odCnwQ7ssnYaUuC8vuWzKfhTY3wiw+iQK6NJT1rEtM7zfXa1AdxjrceReaqQY/P8R
	 Mm64D4/nGi6XDthMpyKha0h51yOYNQ76K15O/IMGFBFHkj089uyDxSupayhkPDm6hqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795337324;
	bh=FA+pE9cwY1H5TtjvH7Gr/qCLYVweW+T+b1R8n7JIbKQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cV//rywl0DPidNWaq0SWL8ZOXTzlJHzGL4ipbQ3VG+P5C+iAgpAeUPbyRyFtCQI+2
	 a9OmsD6nYLPb6sLXp8T3vpn118F5kH57ZBdFSv2dBY68nzRY5Cdqs6cSwQrZrv4CCp
	 xADAMhjX1Obou0iv9y6gxg5fl6XcBKZA4F+GHfKOCV74gXMHOys4rtF6ynx18JHSPh
	 M8jyJfwrWN+gNXzofRjnBbQkjCs99jxlLfXfRWOCseq5jV8g9bwqY+tvKEixiz3A8z
	 rvhsqASFs3bqnZGBiCr6zIM6/6gtrH9DElpdm8UBafCpb3BoZFeX7flz0y4dLwK/sT
	 X4JdJVV6JXGPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A711880D29;
	Sun, 22 Nov 2026 08:48:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 936F2499
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 08:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79181406A1
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 08:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0VGT8p_Hot4 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 08:48:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2FB37406A0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RYOtQZs9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB37406A0
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795337317;
 bh=4cXHYvizfZnJAAFY2bdjBT75oNM13D8R2FhBThQ2MGU=;
 h=From:To:Cc:Subject:Date:From;
 b=RYOtQZs9hVBx4yKo6h5Gcn+36bfaHrsix52vJvXUCZ7IiMGZKgTzucQQsGVmullk4
 TwiCUTG/P6HWt9onp/UA/iV4u5LRf12qOz6XP0JLGTp32GoEi7EOGOvxljYmAnzgZS
 xpEyBjLKGVUOn9enGIS+c3tL+JutaDv0efJJSE++Zc8+L592HZ7byB/YsZykfFjtdT
 JuyY3FawXa/IkArdsiZRwEJ6KCMh9Pzl01vcah8pCf/s7zEz1z/zBTwsQ1N4EaTbO0
 hZzRiPBES3eeEYejl1tZhzZ4dSpPmyyxp/uxlWn9HTBqZ/NSsMjkhyuXYvtZ7p5fKE
 dUQgHGDqXwfcA==
X-KAS-Sym: v3:f51bdf72230551df:RGwBt06h4/TK+ozrwBr9iRZSMcDqPcGb9yWpn0E/i4Nzv
 3Hwcz8BfED/6Wh7YPi9p6zaEun/anJyYdHKTcgYqZoX2YH90Jtie9gwmvRMfGTsxZFd+DBSbLiB
 jl+FkHmHx667UJXi33dKcPTBeqLVsXnTbyll1mnit44ueoRezYmLojkl+/co330Bh22cbnm+gUv
 pZKIHES8MQ22D/6OgFgLEQ1IqBWBgl8prtDLRIW7kvF8c1MYe8ghtCWEmyhv35K8FWaCLMC4WRJ
 UKRNMaFWxhtYktu4C4qXxXIQONvvMbCKQU6CDSLdlRGNndjU1JOEechdfdDmUA5oxGK6+ziQ==:
 z3JwtQBBCEayKLszDNc8ZabKQDSwJuvi7uYfJIgwRQWdvQLsntCN/UlLDxzGksfEhIINLBnsqvH
 d4YzzaXBd0Q2AZipmihsTuUun9b87j31xCh8wtyi7Mej6PlZDGidJvSty9hPjPCe+dlYa8exTBJ
 0Z9t+56y0p6FE0kZRTigMIW5ZZRup1hzowuazWDTNFA0v4elOWmmyd7Xl4cnK+SoUN+4wT4oQMZ
 LrfgIIGNRPD7D4l0dY6HCnZ11typJw9GHTGZqOnk+TNeol/cGnuf7CER+T2/kfKzHP+HaoN2JHJ
 DQrEhoH7Id4JqjHBRPkVF8blSya59hL5VMXUSHsq9d4OqGFNH7kBbQEAz7GmiXJwVDSfG9aI5s2
 nAwJL+gq221RKYnBcZDiSbyXn1R2O6VyBRg9ZIpbkQYHGYi3ioXF6mNWlxuR4CK8+2XBPysQB3u
 Eqf1r20xY7lZu4R8ZrCRvysnaTfnevVszUihhvLSjhMlF9GKKfC4bWBvflRzFSqCzh1veB6Biz/
 oiSbs+2yCeNo61orX+DaqqGv8m6KmonUSEJhaMORpLer/4UbFXuVGYkZk9MG497W+jzQY9YMkhv
 KmmEcxlLOug/3kbPfmVgdn0CpUtm49SMd7my4DckbhlTE98W72M=
Received: from fli4l.lan.fli4l (p5b3a06d0.dip0.t-ipconnect.de [91.58.6.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC324A4C4FAE;
 Sun, 22 Nov 2026 09:48:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57428)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xV3FU-000000001q2-1KSw;
 Sun, 22 Nov 2026 08:48:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Nov 2026 09:48:36 +0100
Message-ID: <20261122084836.2321898-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libv4l: disable wrappers for
 uClibc-ng
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream forces -D_FILE_OFFSET_BITS=32 for the wrappers:
https://git.linuxtv.org/v4l-utils.git/commit/?id=99f245f5e2826c7ae3ac8de530bc2fbd906eb62b

The bump of uClibc-ng to version 1.0.58 by buildroot commit
c7fef3704c704e6337b4f8f6ff467c6c70991443 causes build errors due to
commit
https://github.com/wbx-github/uclibc-ng/commit/87b354252a6a8519f8b671ae23ff38ce9360b6b5

/home/autobuild/autobuild/instance-14/output-1/host/i686-buildroot-linux-uclibc/sysroot/usr/include/features.h:336:3:
 error: #error "_FILE_OFFSET_BITS != 64 is not supported by uClibc-ng"

To fix the problem we disable the build of the wrappers when uClibc-ng
is used.

Fixes:
https://autobuild.buildroot.net/results/89f/89f69f8b73c9945c1a4f159bbdf227782c3a2808/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index f2069390a3..882bbea37d 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBV4L_CONF_OPTS += -Dv4l-plugins=false -Dv4l-wrappers=false
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+LIBV4L_CONF_OPTS += -Dv4l-wrappers=false
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBV4L_DEPENDENCIES += alsa-lib
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
