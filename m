Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF5C606A32E
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G6yLN2ML;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ga7C9AUw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D8B80D9D;
	Sun,  1 Nov 2026 19:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3_ms40BwbLh; Sun,  1 Nov 2026 19:17:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B0C9680DA9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793560679;
	b=Fq3jw5hpjboxXubHvTlmkMf49KTJ1ikA8pq7xyiHWb5gbbqLqGdVQaaHuLexkZvkmtVy
	 W9jeA48sznN2TopKbvGyYKyb4RCtI2ZU5YOMPolxWfBy9aRw899/VfCoBJmNB8Pcev62U
	 XJ/JoJ9E82F76A8zqdhZjlCTqia266E7fkxb2aziBJ5RGFT8MTGrNwBd1+IiNVE6hGDCE
	 kl8dXR4gfEdcWm5hYuSVP3IJy4PL6jqE2CxyByQQ4Z2IZeRZat164mNhLgLXmNLYqprd5
	 SaiYeXpJYqjWJGpVrEpuzQnFryMTg4E4Xq28xS31r1lr+R8/kedjdwGBMgnJjOHb2fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793560679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XjLiDdtpq9IZhyXaBV5BQ2fNJD7xuaQ2uH0T9BCRZc4=;
	b=LntK8qbeWmoGFJn+okuoPFxsbp6n0u65VnuXErR1OQOnBy6kEZjr1oj1ih/YpiNbbdQt
	 uDxcDwYlxPO9xqOoF6Hm0EwYlepYJgPdglSZQR0rJkFtSBatI91PAqXgy+hWvgnvV4X4/
	 nEPFRUhlb5R9jUXJ8oswhQuWjZ1D/je7XlQ9QWGilde5PtDdUhQPXKgTWh4GPWD+qm3ME
	 m/tfQc2DiNNZlZBPvId/fgI975gVSS2nMEPFROUqD6xcF+e8jHAHi7T5sDtBUzZ9hUweF
	 SPuqrHbK6+1OAf59hqZCVimyIdNUn3nA0iihm2Jwy3/kh8WFBVK+u1WXxE9VLrkc1kA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793560679;
	bh=XjLiDdtpq9IZhyXaBV5BQ2fNJD7xuaQ2uH0T9BCRZc4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G6yLN2ML91sCDMaE+GHzdCfH6YeWIAG6iRNkS28/CDJK836onfasZtwfILh+R4Uv9
	 nUXVb6wu5aftD2OuDkE7SrWYM+kuMijuB1WhNWtC8+58FIkPrv4oezIhN9X8vb/rh9
	 Mr8wyTrTIRMDWonf8Sk5ffi6hO3kWCecFSjF4kzetmgpZf7ypy1C5s1nZCJ9tENG6S
	 6T5BiIK1OJf8XXZXru/9hd5dyv/7WCKChL7hEEP2/vcgrfjUU1SllkMygvZvbPh8xq
	 865Loed1TLh58v8xMK13FbfsOI47zN6kqiTNKja30T9f/fuwI6SCGgunLUksehyezl
	 vvbnhgxtPnY5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C9680DA9;
	Sun,  1 Nov 2026 19:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0294E323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBDBF405BF
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGojYp8rR4MZ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 19:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AB333405B8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793560677;
 b=lrnZ9+y3UW5Ismf3fFz1BVA9+85RIeAtN+44RfYpngvZ60dSqU+q1hPgZ0VYURxCEPVp
 ymEvOrhijoKsaBxQXwcqnvaD2gfYaVqC6OjPmOIyI68PF5WS0PqNgnlEKpb8TM/0N2P0y
 iKIkhQQ9rSV00DBq7Pzy6aFfJ95SqUfUP5o+LJFQczfrU9QnjNZ7ZbkKdOr/G5oONi8ys
 KsvF0eJL/Sab8S5VBmslbef8LdyAg6n+GEr/vPpQdCB3RfRBkOSRezjtjx/WfdxD2i7/0
 q5+q7+U/M0pU4dTv66rZpNtjwt5qab2jVmayCU4XK4yv9LDQCc6WzaLhg8p9N0aHOPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793560677;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=agW+nxom4wXuBK9HlqswGZsCTzx/jGI3opeCdvhutG8=;
 b=Fu9jw/kbAdy+Fh+sCfsLTGVbjnehXbACGS6TXkF2RVxspu6yyYqvYWzcQ5MEGYTn9Ox0
 DW/vKDB0NfM9w2AtcXlQqz0JaLDdkPRump5RXYQEJQslZKNdnfRdVeqBsJisgU9HxErCX
 Lp/HT3f5fZASBodSFk03G4ecfyPGKHniN4YLIZOTq+B4G/VraxtFa6wjvNWF/nWWOVHK1
 yYeWG9RmvWr+HgqiP8JreK2cMqRHPW7cCC4mgKw88Hr59bQwmeT2r0Oz58HNH7t5ezzhR
 of0hlkOxgG/kW5J0bXnBI/2OPiP5QBatfnONLkKtMQPgsmW7b7Argr5zplfdgPGCPNA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ga7C9AUw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ga7C9AUw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB333405B8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 19:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793560658;
 bh=agW+nxom4wXuBK9HlqswGZsCTzx/jGI3opeCdvhutG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ga7C9AUwfX3/GEPKbNoWl9R5iSovHarl92pYfpcEBRftkLdHOufjXufCNOmg39NWy
 KZw2m+vLkOSXRXSwGYNbmygcvGlbx4f0R7wHmF2WIeEphCj7knGypC83OivXmA6pGL
 ustzq8/cRnBBa+2g8f3LnRFsTrZMiE68xur33RLHbQNHzevdOHsbhtdh46VfXj53Zr
 vsWWml4iu4A2/wvVIU1emVMBSzm7cGCLnDV87sgKCWJecEY8JRkkY7dY5H/FZy03iM
 gF+CuwPJkoMMZ6YH2IDPwj7V1zNzzj4c3dBAv65A1UEribvutLSFtLqDysdOTLlDHj
 HCJ/7qNlUZY2Q==
X-KAS-Sym: v3:f51bdf72230551df:mTCa8HbtN+8dJGXA6NU0yi3OXWxdzRavSEyygsnm2wRBD
 uihpmfBBGjcR0Y+S2PO5AYTE0rwDsoruGH2iF0mXF0IB8y6hb8urEFrM1Pu/YrjqveDA439cFVJ
 ZcfY7GD0+zcNVYHXaJH9nR3p1uQOK4tpAHjpsQs/bfIAAaSlUNXT/yEOZ6WyoSWW6m1tWpFr9NA
 /IjT40qp4IL1Z2oo16mSQspjop2ZpvVhnFld2Con3pcMkr9eu0aLoEC+SeKdwtftQ+ysp+JI/Vd
 Bs4AYrtSJpclB82kq8QRQi4jU3I0VcihQsPMao+L65xLjDBwbbPTau3ySRMdT0mob09K1pYw==:
 Wacyqq9tS7WfCMkCZbSR0P2+Q10uMMvd48Htjdmjf+JYVVN6w41bvISK/PCH8tqYdqIKTVVU+gp
 DuqwFVkJJskm7mp5MLnZq2P6ZBTE9l5CBmMgvdUZaGCB8V2wq2Oizd3rYPtT58BdUe2gkbG6EGD
 52LpiC3JgTRn9a/QGVkELfkVfywxOucHHJ5AM7mV/4pyirV5iA5vSqx8MHFwScIEZEcfT94sc4+
 DFa7qra6pWmuyOuqI672tK7I0XescgX1c4q/oxUM8TqGxJb5tNB5H/r4OAjTuGX5DBTb5DWK4U8
 C2NNqsMpnF+RFzNt5Pn0OYhbSpE5mqn6EjkYyF06buYUBnNFnfH5SXtxM3xfo+M6QumZjd3ylKe
 3d4imWc6Y4YaWBOOpPBl+/+1nhjW+zzRLQrFvs6nrUKurJf43SNCuMDkib+LMlDN5Y0rtZm7FrT
 sh0l6OITkIE4uCDa8B1m/6POnGj/Lx8v50Ri/bSA1bGAMGKxgitDF5VwGH+dv8ktY/BndFMq8ap
 XLA1Q3ZePFWXFTqp1qaJXnL5KmtkDThtqg9qe7PsBnpef4D4jOC7DOs71IMUpLPLFs7lFTX3dr1
 Ja+Wk2kgrlIjlDIkGFUJObNQj0hVc0STejwOvn2X/bO73eleiBBGYgcdNVs=
Received: from fli4l.lan.fli4l (p54a1b5d2.dip0.t-ipconnect.de [84.161.181.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BEB50A4C2E63;
 Sun,  1 Nov 2026 20:17:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40192)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNb3i-000000001Un-1Cpd;
 Sun, 01 Nov 2026 19:17:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun,  1 Nov 2026 20:17:35 +0100
Message-ID: <20261101191738.2091630-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101191738.2091630-1-bernd@kuhls.net>
References: <20261101191738.2091630-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 2/4] package/ffmpeg: fix build with uclibc-ng <
 1.0.42
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

Build error was detected by the Gitlab pipelines:

  Compiler lacks support for C11 static assertions

while testing the defconfig br-arm-basic.

The build error is caused by upstream commit
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/0d43adcbef9a061c95db60eb351937c27e2a0609
which was first released in version 7.0 and included in buildroot since
commit b68bde564339e96397929b45c04d137bb65df43e.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6eb3afe277..47cf560b16 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -586,6 +586,9 @@ endif
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
 FFMPEG_LDFLAGS = $(TARGET_LDFLAGS)
 
+# workaround for static_assert on uclibc-ng < 1.0.42
+FFMPEG_CFLAGS += -Dstatic_assert=_Static_assert
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 FFMPEG_CONF_OPTS += --disable-optimizations
 FFMPEG_CFLAGS += -O0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
