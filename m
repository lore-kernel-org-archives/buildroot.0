Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA7606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l38qTimr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=D31Y1gGF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5020080D35;
	Sat, 24 Oct 2026 21:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YklpeuCDHt0C; Sat, 24 Oct 2026 21:07:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 556AD80E28
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876053;
	b=oh/3ZT5fzSYiscRUCgnw8H/XwAUKiafx6RsyIu5fh5WocnvGqbF09fNhxsNuSNh+FOiu
	 XJmsJW8rIqrEpgJRvAanJr3qJu6a5t49yn0x31vvCT4aA7FwF2aQEDji5pBZ/hOR3sNMf
	 dZAi09WrZJBraRNsfKqW9y+X00IPeHuOXAAtC0+09t5YqZK4WjMZTjqOi4DPdbzM1Jugq
	 BhzjMjpl/KZXeSF16Sfrrmk21BBXEChJoT+qSKU7bG+8sQERHg+T6f3p3iwtI9lh7RsY8
	 v/Mo1KEh793NUIpCda7iNtqROkmd1UOFV3DN74gh1rr5HebjVSg1Q6Sdjyn+fFFLJww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8PWinVsqCjRiB/9hto/JTXwGdN3eTBbY6SJYwLNm3PE=;
	b=UE+sI0EE68e+pabtsWgzGTSRKvJcrHyfasPvM9l8kJ1ErW1tApi/v8JtDnCu03oAtoYr
	 egozqvulu4Evoe6qjY7kAN1mRcVdzAPd6zyeijyCHWWus0rxVW/bLklSgZ+cEBSeNfRWF
	 Wqov+auma8xIxeObfuaUeOyZB/3PyyJ8a6xqntsA1HtMdcSqVA98dEFD51vX81U8o0Qkm
	 t7OUaQz3/sBmVYhxPygUjctOgjvkmyzF6OZ06yPYc31ptGPkMH4WDOXLLj8MQzWcYim8a
	 74aiiMyGOUEUW0wht9T8plS+lZu+myHXhBsNQVDJ8W3y9WK3mviaGGnsCPwYJBG6uSA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=D31Y1gGF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876053;
	bh=8PWinVsqCjRiB/9hto/JTXwGdN3eTBbY6SJYwLNm3PE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l38qTimrtfmDCCVWPemZIBC/Tt0fBYu+3ENLO0XZFRQjVR8P+D1So68GT68XsDv/f
	 iMiI+9EITDy7O7afaXGam/LKaaGdh9QDIJ5nUngfOcYlWe7Nct1z8YdeGJUDjb4Dt7
	 OOhg3o1BmdS4iTvaFpRRafE1AWDyGAtG8i4jwkfIVUUDjPr5RsAlQOW3/6C28G9r3u
	 VSMHjSNpynFKRCU7BfF6glYRYQpxSQGmTLYKW74ghrU0MKguXKkTnVKFZY9FF65VF5
	 imlYUXdxSFGJneYKXpgl2rm8lk7GXeGaEcJ9n7cdHt3URMVLhxdR3JVgSbxJsdtfyc
	 OJvRlvxEKGv8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556AD80E28;
	Sat, 24 Oct 2026 21:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3177F3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F09980E28
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lew7lFSyILA for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:07:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3B15380D35
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876051;
 b=ht+Z0H94dKvDKxS1SRVsVl25Zr3NbxH+WAY4ECATlkPxN1cZRhEioqat3blqr9cWn+XV
 Zyz8pd7cdW+lXLtA5lysrx/gLsveViPAJz5JHkvBEBlCMuIa+VszGx8pLzEy4/vnQd42e
 odJpPPMyqX1VzBBLhfY88QBVAO0sFrt3cTzB1WqMDyJRUr6YNo+oyh3Eezm6j4UL/mzl3
 6jbqeV9Ndi6nQLbRLoJisRGssPq2kgtUXy/TjScqbVubG1RCfUvQZ3nxMtPdoaC4rNfsh
 DCNXUqyzmW4+MK39nl/lChCwCaAVAEH24B67WB0km1E2Tq/XXOl4mH1vB5FdTlZ0Nag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876051;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=E4hsBGUbto6pcrXkJKPemJSDTT5vY+6J4TT0k8Xjxc4=;
 b=PGbpAcr4A4d7ynzFFsttqpy7ryL8JFbwlc5DENuhaCFbgIxCMDwy3cThruxytpAnhC/B
 +MwhCNJqs0SKaDU47tmsLLJMWTpyIpjbKNoNmRwQr1KYA0kG03jjVl2f7EVQjoaNYf/f3
 ALltksogp5WQk1YK4eB8HETXN/QcqA18Yvs7gnXNgBzzBMq3Mx7VAu8Zdb6TrFVwzXUik
 AygRxpM2J8/Zqtzk9U2U4x4WIDFmyxaAeNCIcei+y9DbdCv8yfHuXfyN+w0LjseOo9f0s
 Dm83Qf0qy6FvtME7gkVvV9Xbcd1BcSKtrF5WW0412u7AxiWPAOCgI35CBEc11Boxr5Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=D31Y1gGF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=D31Y1gGF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B15380D35
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792876048;
 bh=E4hsBGUbto6pcrXkJKPemJSDTT5vY+6J4TT0k8Xjxc4=;
 h=From:To:Subject:Date:From;
 b=D31Y1gGFOumubZ2yVxlg+ZN0S6d659P++TnRk3bO4i29UZIgAdDkHWEI6ouIdpWM7
 XqcPFEBif6XWplMSySa8l2Mwig3U8uby0YPUDjkQcCVtMAjO+cQI1h093bkMQ9ASYO
 LfarkTs+wufoaxreIN9JqzZT1YtLVUzVxVomgw3smpDvJ9K34wJKLyz9S+z2Q2SZGS
 12j4/L1/NYa6Eqm8gpwnr2SVjLS9hFMockU84f0rQlrZDPOp4ePdks83pT5fyP45OY
 +F6m8PDhDRymSqAYgl50RXsfOiJTxr4nL4pPLxhUwbaMwKXlFj5O51IKIpq0XuAaeT
 DBkGAt/lww/HQ==
X-KAS-Sym: v3:f51bdf72230551df:f3ii2Pf5IBRYwwGLthLtXGJkLTPgqoxACYgD4IiVycvrS
 j1M1vDTU10u+vyvQfnBS31K0As89NHyFbLiR+XiJk5aiWEBBuitRKXoIwtDHN6pi21hrer0SYvn
 V+A39ndZNMxDfB6h2HiKW4QJ+HFssPiFff7IDlISCt35mL4IA02XCNl7xw5tRmPeGgCe2OIkxkA
 o8/26gATmafNvXKBKRiIdDbXVe7tGtvSqSVp6N/kWcptGQ9a2HqylIQIz3kgWaj1FzvcNIGfNL6
 ZOPh61N5WGe9ntIE9OuLxgcV67cMbbNeciDQcUonkXq1kmovRP5q4HrnSdujUGEhtd9v6VGA==:
 M2Z+8zTASm7z1qaJKtlU+sHoU/ZbPLqSbgSUivsYgnmESN7HUuWGFOkSDv+3JSbLH2j+fq1ciPE
 ZuVbQdZoawgNjSRR/9B4grTQb88Jg7Uz7rFiTgZ16Yh0s295PDdEvL7MnLsvpJQq+C08xSC6MIF
 yPJWE6q+8vo8fmI0XDt1wdThvyrpi4xwnIVHtD2dQu3Ng+UunkHgzKylv5B1q3AZYAkyAsACTj1
 4eZ/rYZIzsk0nK5a2i2/AWCBMhiOzkw1rX17sKY27N+chSkdCOYIteQWzhoAzZHaOOHdkC3O1Eq
 rKsTyofqIwWB5hZs72OpHBt41tRT2r2Vlh1KtgyflycAoGQMvEc4L+sJPlBEsgBt7sQct2zJbIX
 yB/iOr5CqmWj5p1ZzshtnsfguVCguHWNcJAIw843WZEhMkNlCchN9AMeTxo8J0h1zaT8a1jYb8b
 2eh+2tkrzSK+Ya2XTO3jLiSOIigyv54kG8UBqnqKnB12mSjznCvUdpnsDDQtvuAed+zTLhs8uBH
 KbAiiIoQZ4qPlCVi36MS1H49YRu3nrloGCy+1mk1f0GPLjqxo6bXWC7WBPzojUdYtNVAkI6HJts
 7MfzAHHhATShB6Tq7ZKTIAy8pIOPPpWPlVEkXhBXzsvMsQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D323DA4C61EC
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 23:07:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45030)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKixc-000000006qx-3JEf
 for buildroot@buildroot.org; Sat, 24 Oct 2026 21:07:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 23:07:28 +0200
Message-ID: <20261024210728.2817095-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/transmission: bump version to 4.1.4
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

https://github.com/transmission/transmission/releases/tag/4.1.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/245feeab21fbecb986e3c9f95e8b75d5a1dc6ea4

with the exception of an ICE for target
bootlin-m68k-68040-uclibc/build/transmission-4.1.4/.stamp_built:
https://gitlab.com/bkuhls/buildroot/-/jobs/17441421766

 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 0e81ec8ec1..7d207e28b1 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  ce7d2d8b101f7eb54bc3cf0bc55f52f7ebd4a25fa48e00bdca9a7e0fc02617da  transmission-4.1.3.tar.xz
+sha256  86e7aa020cdf64826447034bc85f4d3b7c848d8c0891d9dc9b9fddfb2c805d22  transmission-4.1.4.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 0f5ee5d6ac..94221d5f71 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.3
+TRANSMISSION_VERSION = 4.1.4
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
