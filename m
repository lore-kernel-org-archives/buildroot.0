Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D613606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 19:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ifPVcH0F;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=UQOdj7Ap
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEC9F405BD;
	Sun,  1 Nov 2026 19:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsLS9UB_WFc0; Sun,  1 Nov 2026 19:17:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 50400405B8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793560666;
	b=rjd1IdPQGJWGcl1TqD5sZoPTpua3bOVzEzj4E82HrimXfKLdxoodK4AYMdCom9P7QhVB
	 681MlceQqp+PrxZ5sDaXBP8HPLuSwgI03pUxoCLZUEfXXgQqEmGXDBbWOOrf5Chvt2Lbm
	 uDFT1aW78KXJkoLFuTuK6saaCTWAGrXByqfs+qRaD8ivSfbhIIG91ellMR9aHn6Vhhq6a
	 8W24GtEk80p5sjiYnbpWwDGPIWMYsSIsVQd/Zmrtf+t8EXf41jAYsMBGLy8Ai4d1AKC/W
	 HUiuKlip2cOdcoAOHaNZCeaYn9G7lNJqmn4aNxiKeOoUmnszaIgGcy4Pz0yp1E/U45w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793560666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=S54z7ZhVU5wOpZ9qzBfuZZYhMQ81KQfWq8r8fb0BOLg=;
	b=qsYYEjuZvsvhtP6LbPA8ZmiN25P0flZoIm5uw8zqSe3bQ4Hy5bIyN9Kyg8bXNx+C2teR
	 psx2O9SZQyLi2O4jO2lPiFJ0aIJb1RshhxTJAeRHwMWoVkv/2q6tW56OGv53/C2IphXeR
	 B2A1Pv3KsDlaTTqckWwObmOvfsTbeF87/ggcs7R9w3Lcc1djoM68TviW7tkH+p4+W0Ssp
	 82HwffhE+GjacviJEwp++WDYM86ZkM5HtL7xXQ0mzjwQYZmx6LTz/QRn7C864okV0+8Pi
	 hQjtPu0Dd0opVALWsZa+KNnRTzyiqhYr9ZfkqlLBP8V3qgqHXQTXMLqQHHnf1GpJ3eg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793560666;
	bh=S54z7ZhVU5wOpZ9qzBfuZZYhMQ81KQfWq8r8fb0BOLg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ifPVcH0FF6iNMKSKHum1XKiNu4rIv4M+zNx62FjZ8dnhlK4vSjzW6I2+9jxFFSKj5
	 H8I6uhl5CIlT0AaRK6e//2frpVCj215tfBRQ6s2Re67Fsr6NXY6N0qkfHO/J9VVvIQ
	 pyQyDU374AasfHjoWAC9GFB6sC/2NTXxYU9C+mMyV9Mdd8WO/RuDnGymmI1OO4hKwu
	 /x6Q098ij4WieiD6woNkNr4kufhLATY4ZUi8ggF+3kcHtxVeEGkxjWolC9nqA9hMjh
	 lTCKmKUIWmLSpAsAJH1LGUFkOhDJ+TmnjFq90ucdNapGDPcinDBZzCH5bKmAvGnQUL
	 9zI0/XubCMvOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50400405B8;
	Sun,  1 Nov 2026 19:17:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 049D2323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAC20400A8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3LfnoSXAx_BB for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 19:17:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 911AB4004D
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793560663;
 b=heflYJjopyiWwROgP1W8MXv15ehO0XB+LUMGvszv/CsWcM3KM6GSCNcf5Gz1MC4Bx11Q
 FsoqigXh+0Va+0u386aNguFb4N2RMZKfLVgb9FfCpDMgyDgDDEGHSFy1j+PPCnnSWqIGJ
 neCGDWy22uUjwG9Rw5AHP4NW0Dph97z+LvqXHVQlYZH3uRZDaVGzx7rNPMkcOg5EQoSkZ
 O0p7sH4Ow4/pOdXu5+TI04rmb8Eu7mT17/b5ftsgRekCpf7rvKgDlzITZt2ME8O6CATdf
 etVipAlDw3ESca6KgBA7NA9jxZxH7eJz4dKVL4kIZQ0VJ5/7xR5NkE7jFRBYXNJ1m7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793560663;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=S1DX7dI456V7PIZlMwtSYPlQ6D6HwKtadK7n0Cd3+gw=;
 b=Ns1uW1kt+SAQETpyc1zM5/Bikp3Jq1/9tSvDXKzqaFMVz9dICo6yDF1C55FlWrpNaeWN
 zfprF6ljXOVSwr5ymout/eVl8HKtZE+lCIwbBq96o0fG1TA3YJ0DEMycPtQT3nH9lGPXy
 eqohaumsfxtzZwUwKaiAsEcvysCE0IEd16o3gbmpOOWHkJJ+sM54g6+1HHXFboNmahke9
 ckR6K4xfdXJl0XeGJAsHeNGVDTj+6wf6KpWWlMLCxxTa2K4IabzUCXk/OQyD7xARR3rld
 seHtWBw7M9brUX3VUQCMk+KJYVZH5Gegp7exTeMQR1dohqI+32zT5+Y95B72qHBuhNQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UQOdj7Ap; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UQOdj7Ap
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 911AB4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793560658;
 bh=S1DX7dI456V7PIZlMwtSYPlQ6D6HwKtadK7n0Cd3+gw=;
 h=From:To:Cc:Subject:Date:From;
 b=UQOdj7ApIACuxXr37/gULy+fXmjSXJrtzh3u/llmZHUbRB2R+C4/R37bDE9wEZ9ZQ
 ksv3y7D9IPfOBBQoUW6i+LSSjidOp11YjNBTv4QFZX/CA5vHpC3omeG/sYovX/nWUl
 7w3esIIsOpl5LNS3tNbBz9IAF2/eeLPCfqU7xVxHiUNuoFPSc70+WF2SOtnrE4ABKc
 K4bVL0qjuYaAvRHO1P1BOIJyxxIM6Mam5rNkchh36hVTcDW98UsxQbehiIaDH5Sqez
 dkeYEkn8mgJ0mRuhkHLAlWc9DGKS/g2cU9/9gnoU9mCC11B7RrxFbZa7kwdrPV2c/q
 u7Zm7WqM7mZMg==
X-KAS-Sym: v3:f51bdf72230551df:mTCa8HbtN+8dJGXA6NU0yi3OXWxdzRavSEyygsnm2wRBD
 uihpmfBBGjcR0Y+S2PO5AYTE0rwDsoruGH2iF0mXF0IB8y6hb8urEFrM1Pu/YrjqveDA439cFVJ
 ZcfY7GD0+zcNVYHXaJH9nR3p1uQOK4tpAHjpsQs/bfIAAaSlUNXT/yEOZ6WyoSWW6m1tWpFr9NA
 /IjT40qp4IL1Z2oo16mSQspjop2ZpvVhnFld2Con3pcMkr9eu0aLoEC+SeKdwtftQ+ysp+JI/Vd
 Bs4AYrtSJpclB82kq8QRQi4jU3I0VcihQsPMao+L65xLjDBwbbPTau3ySRMdT0mob09K1pYw==:
 DEN7fNm6FDez0ZrA7OLECd3JXMpuwrE6tjX3RKuqVfm/x4fWPme+tpW36QyQO2rllwJkkbxeQh+
 ZcOYz9QIC1Wwbb4CzaWfyuk8kLJEm7y82XhxrMjbhjBNrybrGwe6oG3+G5vETANUe/OfHkw4PdM
 f9oRWosn7rtHwmrhj/M0DkKHAWE0KHGeT0CszWoNS4CntjU7dz4/7UyXJHBpsZcHIvD98QF5s0s
 E6/uOZgKPC5EqAi8YJtYUYGGYhFX+14LP/pk84V+Bn7NGR0jIqkHynvdv8+T3a66cfQhVZwXTZw
 ymi7JRN2zKPVjHJs6m3yU1Va31B3QSl4g8BQdb6h7qBuyVNl8HZ10tXljNV9cg9sGJuiAavJ8Vo
 jyTr10j/7bGTPeJK47Dlx1o2wgWeXE5q/QWHGWveNztf1wtcZ40S3foO+rwLAFW0XI6FF67Tj0p
 4ZL/Bnm2HbjBICNeuYfdtp5Bllu7YiaZP95z+CJzlFEHboponF+l+k2bWJudn6VUblMgNYTGmVj
 pQU6t0BIvOcEhiOxCF7PrLB7Dx9MGijjblZWHKhpXDsf+G1WHUwxpz4CI91Pcx+4DT/IbyYiUAZ
 X3dzUrVSOdJA/HO/y7u8L/jnPWnCZUC9MAlLCoNQhjhpk2qp1Kji8rjge70=
Received: from fli4l.lan.fli4l (p54a1b5d2.dip0.t-ipconnect.de [84.161.181.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AEECDA4C2D76;
 Sun,  1 Nov 2026 20:17:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40192)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNb3i-000000001Un-0vi1;
 Sun, 01 Nov 2026 19:17:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun,  1 Nov 2026 20:17:34 +0100
Message-ID: <20261101191738.2091630-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/4] package/ffmpeg: fix build on i386
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
