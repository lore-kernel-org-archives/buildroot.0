Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902D606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EXbetYRT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=D8LA5TMX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 071EB605F4;
	Sun, 25 Oct 2026 20:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7v4qyXCK0wMm; Sun, 25 Oct 2026 20:49:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DD43660604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961393;
	b=YwoVkdoYNQc56l861dLXRCQIiWWXKBzDK/Q3US1dCkhJgjDGdP7XKaE/IcGgSC2LUhE9
	 UuKoXCZHtF/OAcDKEgKLr48fwnuE061jic5KjnOycAJs3g+J4pVQdp99zmYaxofjMIWn/
	 54pwJaClB3u8nX/r4mm9c6Qqrr/gl5NjlGt1Pihalw0BOeFSUuRM/iHAORwAD7Bvl6Cy0
	 XL87AwyqHa/11/Va5lLeOEtHdEFqJZJraTg1nDCCxsY7sUBpwsvhqAmm+5km3hwPbtGzw
	 TfeOZx8OtCsfGGc22gPrUIqbmEPZVZYZgVAE8EPfpwHu6cbQJ8qtZOP0ublWDDs0uhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=udaNqijjsip3o4YvCJVxxKPUk0Aum5xe0jfWNKCEcko=;
	b=anDqIEoRoV0U0Xc+v6hF5ewCRqIrUzyXa1quRS41e4GzFvGV+DqAI0xfDzL4YjPaRBiO
	 g7JFTpM2kI82hLDz+thW8da6yWggONZd9Ml+a5INSm4l0ApE//bymS7QmhpkcdGDJ5LOF
	 L+sFmZrqXqcwcqjQlCxDm4QsXSXa5G1IWG+1e4ki1YpJbOfqycJyBcSyTLnTJu1xcTEtE
	 DB+u9q5L8w/2Q572IBViP5ZV92YGEtnamGhJPyn5u1UUHeZTb8akygKEIkKBmKsJVfFRe
	 hVJRbeeOcejeNBdnpW0LUDo/+HKanHPJ15zSCzn8QQJZoUh+VMHJZQrZPZh6v01RDJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961392;
	bh=udaNqijjsip3o4YvCJVxxKPUk0Aum5xe0jfWNKCEcko=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EXbetYRTkoZaZLEGJaSD6TfE3RnlrrgfgcKbRJ2O5hHthkheBDwvFMBvUeTLsfZN9
	 9Ija5FYq+lHYZptwFoy6leLH+v4zrZQRv6cDiZyVPuHhbPvKD2GObUuI/MgzNhYCB6
	 ZVYUIxxh2JINbwLYfpI9nTgixESobtz+K+4wyzzmTAupWZ6cpcMp94p3vDULAhANnt
	 bTNbWptoPaIPnYO6fRAfYHE93nYLayAg7+0wh+MnKM4BHuCQimojmWkn+zDPuzm/d8
	 0VRg5TmDJkKSt5dTVu96kZLQ5z0OnXaSVpmTBI3M8tTpzRr/mJxynlByx0DtAYasI9
	 qa1Y4egatCFSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD43660604;
	Sun, 25 Oct 2026 20:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0066380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A181F405F5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAzSnDRWXS75 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:49:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B7D1405F4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961390;
 b=Vm24nP5Gjd5jYYEHPg4UbXH1OvNF9Rnm7jqZDeY/m/oOXbq86DppyXSj7FyzFtzANRM8
 udRIV7FIIfsQGArxbL0uSkXHyu99rPM+LBaHxZmcIwwN7Yk+7xhgcqrfFTekpwj3IVcpG
 Cp9lvRNysY6PQTzRYrvQvoOA4bHyHP1o5ucwdfzyIttEW5kF30aKQ+MoxnCMTC6hwHYB7
 stR4Nw4DFxUPuN+8x8Yeu1xTrNnGTa+wbllcUbmnPCHGdacj+8UZ18TwQK6rtu0Jbbv/d
 HH1d3gDikSGvTbiLnJ2ZMH6yoVBH1MSOgJUuG/jKlbknl0nIEe1043O3IhMcUTtoJNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961390;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=MN9ZdIvrRUNePVlHESGTt0DFFmbTb452ex5+GgPY7eE=;
 b=klqcV0wJV8FwugBlSQf+Xou8i8DX4QC5kISNcK3g4ZKTHCMTs90x9HddNXrcTUZGlukf
 WKjpW++CE40O43Pj/oK90J6ZTAs9nFkAhtVtQHLHobWKwznVf+zwPfK68MDrtyumy7qCQ
 Kk3Dj/JN+O4pH8pCBD0EB8aFF0z3bnI24o01UGsfMhMdNWE9a+Z+cWLdbyiGR6w6WwX3K
 +WxKCwC027/VuaPxl7lXwxcO04N7F+49rrW61V7G6WiNjSAZFIVcgiOra1Y/vCk2WcQeO
 l9+PTI4mikaNnU6y72h3oFxcjf2uLJFMsecOMsgbZNS3JtnF3ZNwCIAAnsFitKkRj6A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=D8LA5TMX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=D8LA5TMX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B7D1405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792961387;
 bh=MN9ZdIvrRUNePVlHESGTt0DFFmbTb452ex5+GgPY7eE=;
 h=From:To:Cc:Subject:Date:From;
 b=D8LA5TMXhfcXTbI664eYs54Z2HSq6ZFeWguO21kamO2dEeN/mZJa7YKIcypevrUX8
 K8Chq/0T1t2TsmWMXqerR1Y5dMZ+CcG9gGlissfoH7AlDnagH8dGES1pqkP7mAFqbv
 xC4Ty+HGRuEscgsxI0RIolQG0n5umV1cAjaTRmSQXVB9TWqvcCCxT9/s0qCVlqc0he
 CdjayqvvhDCk3jghcwo4naPafhRTyEDX9VDT/kRTEs/u2PysQ/SyZwRdw8KbcT2MRQ
 dcV/R1PNN+c8wqv6bQIYYd0qHWHeKWybFUq5e0YBMT3VFv4FIt5PiqB1yv4ZcS/BBe
 YR1U/JjGqPH8g==
X-KAS-Sym: v3:f51bdf72230551df:p8cN5mSD1XLoAwLCiygHJBtUOQegECzq3C+AryhieXr+T
 pu+fNkbwJdsJ/0Bl12t4PfxAGEDgONcaHivj1XcIlr4xS6NIDrHxBEAmRGCZNjhBMnXngT8iYib
 JjexDjt+EGxGEAv7HCCLyB61IAOG7eud+tYrEelaJppgqGNYD5XHWh1IG46hYfkFdgNw1xgkJlx
 pfwwJuGfcSk4m9dKn4O3/oXUVPd92GeYmIFAzYM+6shGMROcHsRQUuK5HigJ1eaR0cmcKGBg8GR
 2yY/VtRACq2vD33rVLERVqFkmV3cpRlNBcNPcWi5kW0zM5g5GgoW+FoW8sFDVv0cH6DSF0Uw==:
 acCYyoRJoATfOVsiiM9rFtp9kGwGmnWeq/9wQMGXUisKFV7YFeUUc4se1tKL7Ze+etB/mKbWSzu
 JTilNN54KODqVLbVO2ibyjJsF1Iz3g6XfE7PPF0zOImey2KQzOdeRqHURS/np216PZ10G7eqRy6
 AhdstYYl1pyL/nY2K0jbm5TkXRR9nDIkorpoEtPCjPmhK17/fER3eO4jyKrb8aliMTRLIk3IMFe
 RdGMyJrecDhEq6aBm/VDxGPlW7A0LGz813xns5/uB4Q8SfXHP64ASubZr8/k0ybej8OToHpcP3k
 zjgaPO4qePNkjE22i+RgeQiQfktWP1aFawoSN4dJA900xW22yWZvzjScKRLESQRrKzzaEqIo3GR
 BIygNI4IHdY7Y8+r2NP5jhUOVoICa0Xdd/pWXotUZIQ1dmphqp/NpHqVB8IMgLJdkS15NjAWb7b
 L0OLW6yhxOqxuAjB+5RT0XDCctr49KRD5M/NYBXXAQFmJf6Gfcznl+Rp6Ws4/PCPcPZqibsaZVp
 9xzw+g4Vo6UKp6OtaRTF3hIFBMcwf0YiITkkx1Mg1DN8OUThbPk60JJyvg0VpBvBNNpi3aDsM0r
 u1na6oBjNY1clAjcxbASNcTYZBZTYZndoe7B+klRnpZ6QB7wEBrIHCsHxA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E377A4C6A6D;
 Sun, 25 Oct 2026 21:49:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60466)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL5A2-000000004rq-3wIB;
 Sun, 25 Oct 2026 20:49:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun, 25 Oct 2026 21:49:46 +0100
Message-ID: <20261025204946.433199-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix build on i386
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
