Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD06606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g+4+iU2e
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC9D6074A;
	Wed,  4 Nov 2026 09:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZDQ4eOGEpgD; Wed,  4 Nov 2026 09:23:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CFBA6606E8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793784239;
	b=oN7Ko17IePtKgcyDy06nVI1eGZq0XWA95nbwLg5KLQxpLsst7PGRfyYrbAOQ7FTALCzM
	 yYUi882gqxTwQ2Gqttaut16G0Ts0ZsD8PmrAN5tPTSy/dgT3D0RRoERp0FNrM37mBMfk9
	 4Em9DhJCTqONORJoi2bh97gpsors8JoZTa+Sv10370YmBaGPmHxtA3XFMAH7v7U/2xKor
	 zkorkqcBCi5NcfaINjOPGLqeN+8sN+KahGPhP5zDYnJCZVNYO9nYPIXRXg2GebxEPx1/0
	 FoHKZlmwlAo/yoVYn0gX/8847Lr48U657wJGL0xTR50EehrVhyWqWJtImt1nzobTEgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793784239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y9dvnSHdb2CHh6RE8NxHZDF4wsmPC3tpAeX57VOExII=;
	b=sLZFGKarUvk4AtETiYqXNY3yYDst3eJWQbjCTXKB7yxIxkt2Ev5XMlxl6rO2E5CU8bT+
	 Kh8X80G/mb34ZV7aYntvQmtSH49W4kAcaoZlY2IjVeSyCRr6i2GJHwjjUpf+1+b+b4QAK
	 rPXueujiSjO4GNWt4QlHhmXqqZI8nEY6Hk7hswrQ6YM2GpR7XM66SaagqBZjLPKBhOrZB
	 q8OWOJBg9yJEBT9ccVALHu5y9AwMBRU0VOic27iPQNYovtpKgtU1hJITWkBHBlU+tzA2u
	 94lnVmvYItsBg0qCHJi+UfZnFZRuUauXsI8ARk4kOVyKa5/8dG/myf9SkpOCKnxW1JA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793784238;
	bh=y9dvnSHdb2CHh6RE8NxHZDF4wsmPC3tpAeX57VOExII=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=g+4+iU2eAoMqI636mvr+QhtopYLFNtMvZO7NMXc1Uu5dlG842+/qPuubl9dwHFlu2
	 enl1AsGJMafo7qIGDwK8VWPjS3UwqAAmWrnJSEHlLyroGn0dihyTBE0wnTxXgx2Prn
	 +Tu7hGppx4jzq8yQgOPi4IwKiG43hZx/P3+h0CvfsGfihU7iruAIxMEAWJeHGGiKXd
	 rN8z8ZedJn1yIyJSRTpjvD/EUJUxozGLFF3UEcvM1ScQzyS02uGsr3HDefCi1ft+qc
	 IfT2EWzRzBF7hhYr4aZVMCbd8jbWsW8PuQFz3x28jnwsXrG27MCXqm5ZfqTTjEl3Gu
	 MXzsF4aZB7YCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBA6606E8;
	Wed,  4 Nov 2026 09:23:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBBF3411
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 09:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD4D8402C5
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 09:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaVNgVvGUl4g for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 09:23:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BEA4A4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793784236;
 b=WEnMSB8we+3CGs79tYPSWLOwRsKtY2wWhPsmwaQvM9A4p1xuuy2koJ5bvAxpbe2RBdFN
 mkR1Z/9Py8FLTgtOIOmk8FuIHSmpHcsxW7EWqjFF/7jkfXBCJl5xWJMJUIih0QKGtLHKJ
 FyAJgqi2VlOnv0VvQU6Tq9g6n8Vpoeb5BG4U2hOQTvv846I5z5XTF9UTuRONOwYGs6kIw
 YajBXuG+2oIlEpSgvK2yIxhhIVmtaI2K9t9HYuR1GpEfoS2HBJOow9Lkx7J95JakaWWra
 i1vVfc2lvh7Bc3BV12XyNFZByva13i8rygSjDFuuh1IJmcl4yELmoJuI+B06LYE0RXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793784236;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=x25pISnrEnG92Gy/zX/32HpMzSnagzmGmdLyZ7Z/c90=;
 b=EDxRyHxGT8NUWu0h5IU0LTWNlBMG6mSePFkN/14sQQbzVPQAI6aEmfbLPRYvjKe9KtjK
 /5kIOpJ8UGWrVTLYg5k9Kl69ema5tVrMV3xPWCmxeSpGWg0IpuAU/zEcP++9c/b+VDeU3
 z2vyNOe5n+H8AolH4Cl3BQbNAYMwk5Lx+GkZpSWPwEcAEe3dw1tMC5f6djPIuygeeva6g
 35WfITFk8kRg/gnnOhLxAga+7sBoF1IF5ueO4QNdab95FkJ9ZVOE4gI7SxPBCuupEjHOh
 uphYlUkX1wc7lMTC7UzmCIZgKbej6DfBytsJqBw27jbp691adTW0JJ8OuApN0lmh7XQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=brWSaJQP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEA4A4004D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 09:23:54 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c4cb6834eaaso82168966b.2
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 01:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793784233; x=1794389033;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x25pISnrEnG92Gy/zX/32HpMzSnagzmGmdLyZ7Z/c90=;
 b=JxirhgZWnAAUsfgmYyOBsl9Cau+ECBx2CRa4r0GtskW9VtxoXjz9/tyJTApQXPPHOf
 32jd5Kjt38wHiIaWxV3l5OHODSNwp7gXJ8vrXQcufjzIL/Ua+jbVqydZmXHWbdQPGGqs
 cjLX6N0R8BOWJ3g5TSitGLxbISKVnfFhqo62lEowqzYqndmVMI2XHfUlTZuVeFlSCn9r
 +HpC1d6yr08zRy3lBQKA3WzyMgk7uPU0a1ouc7E7u+k5VKNRsTTuhhS1XYjAFWZv57YY
 W9yBkfGSK5E7gg70+6M0JloVO0SZT2CERC4TbBCP7pXI9QPaIOWs9PoSQd20h/K3ANVI
 drkg==
X-Gm-Message-State: APuU4Z9Uyn4xk48MzJe5Ux8o7UAsC1OQW0YlNW/LCTLali/QBicuSWso
 651N5oYw1OW9kIiS0yHwd5ct05l25IxKJX1hYpmUy2Ry4XQXH8k63IrdB1zINw==
X-Gm-Gg: AYBFou0i/Ij7bLjimbe7FoVbwv2w3Ib+fZQ8cuxzmpLwTM+cd5oaVSOatF5AxvISv+I
 xewB1EPJBJBcyEMks90ySivHsF0yvEu20hBBku8AnCQPZ44A8/IYZhWLglM/Ze1MiTeQhylVQYf
 V34wwqOtkOJomA2q/LDouyxI7d+8uuPQrn1JzdshTKa1u6vO06NjhGi09c3O+Mx9DH4bK3e7OXP
 EDysRr8Vh+kcY6dijkKpV6x2029QHiXGR/vSgHL4C9ErK9u5kMPclZ6+UzBZicF+VESelc34Axu
 op78k52qlGQtj+Ur1vfoYyULv4YoMeOVGpKpLTxndfA7DH4Cog9dw74/z2AnsdlZqBszGX9dIpF
 5SjxHaBNUqcL74Xvs0aZgscF22c+4SeTIyYUb+1jyv9OOpLZ0jqsZ7nMJbaDSVPqrsGLf1Qm3g2
 R57xnfqNYNvA7/pY365ERDun309QyReHfMx7R13tnd/zTkJ4/87oUx85kWCdhKSzi5I+LrpSYFE
 AKmrV+mmHidKULSbCIM8H0s8q5xiVdLY7lnFtevYrXPrAqfLArN4fe3uLpLSLltM52lsyWv83Jl
 BXxoCM5/yK8NKjHOnuJORV/UEtvg9yLn9dBQaLNam+yGew4HRW1XDy1lfxobpcsYnkpVIR7muNR
 YsovQ8yBn7x64u6dukuQ75pEGv9G6cA==
X-Received: by 2002:a17:906:c142:b0:c42:2f4e:522a with SMTP id
 a640c23a62f3a-c4ca7a5077emr1301194266b.25.1793784232708; 
 Wed, 04 Nov 2026 01:23:52 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e46814dsm49530166b.56.2026.11.04.01.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 01:23:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Nov 2026 10:23:50 +0100
Message-Id: <20261104092351.1669074-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/openocd: fix build with jimtcl 0.84
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

amltdGNsIDAuODQgcmVwbGFjZWQgdGhlIGlzcHJvYyBtZW1iZXIgb2YgSmltX0NtZCB3aXRoIGEg
ZmxhZ3MgZmllbGQsCnNvIG9wZW5vY2QgMC4xMi4wIGZhaWxzIHRvIGJ1aWxkIGFnYWluc3QgaXQ6
CgpzcmMvaGVscGVyL2NvbW1hbmQuYzo1MToxOTogZXJyb3I6ICdKaW1fQ21kJyBoYXMgbm8gbWVt
YmVyIG5hbWVkICdpc3Byb2MnCgpCYWNrcG9ydCB0aGUgdXBzdHJlYW0gZml4LCB3aGljaCBjaGVj
a3MgSklNX0NNRF9JU1BST0MgYXQgY29tcGlsZSB0aW1lCmFuZCB0aHVzIGFsc28ga2VlcHMgd29y
a2luZyB3aXRoIGppbXRjbCAwLjgzLiBJdHMgY29udGV4dCBoYWQgdG8gYmUKcmVmcmVzaGVkIGZv
ciAwLjEyLjAuCgpBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQpTaWduZWQtb2Zm
LWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Ci0tLQogLi4u
LWZpeC1idWlsZC13aXRoLWppbXRjbC1tYXN0ZXItYnJhbmNoLnBhdGNoIHwgNjQgKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL29wZW5vY2QvMDAwNS1qaW10Y2wtZml4LWJ1aWxkLXdpdGgtamltdGNs
LW1hc3Rlci1icmFuY2gucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5vY2QvMDAwNS1q
aW10Y2wtZml4LWJ1aWxkLXdpdGgtamltdGNsLW1hc3Rlci1icmFuY2gucGF0Y2ggYi9wYWNrYWdl
L29wZW5vY2QvMDAwNS1qaW10Y2wtZml4LWJ1aWxkLXdpdGgtamltdGNsLW1hc3Rlci1icmFuY2gu
cGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNGIwYzlkOGRhNQot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvb3Blbm9jZC8wMDA1LWppbXRjbC1maXgtYnVpbGQt
d2l0aC1qaW10Y2wtbWFzdGVyLWJyYW5jaC5wYXRjaApAQCAtMCwwICsxLDY0IEBACitGcm9tIGZl
MDA4MDQ3OGI5ZTc2YTRiNmI2NDE4NmI3YjcwNTcyNmFjNTU4NDggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBBbnRvbmlvIEJvcm5lbyA8Ym9ybmVvLmFudG9uaW9AZ21haWwuY29tPgor
RGF0ZTogU2F0LCAyOCBTZXAgMjAyNCAxNzo1ODo1MSArMDIwMAorU3ViamVjdDogW1BBVENIXSBq
aW10Y2w6IGZpeCBidWlsZCB3aXRoIGppbXRjbCBtYXN0ZXIgYnJhbmNoCitNSU1FLVZlcnNpb246
IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0N1cnJlbnQgamltdGNsIHJlbGVhc2UgMC44MyBoYXMg
YmVlbiB0YWdnZWQgb24gMjAyNC0wOC0yOCBhbmQgdGhlCituZXcgMC44NCBpcyBvbiB0aGUgd2F5
LgorCitUaGUgY2hhbmdlIFsxXSBtZXJnZWQgaW4gamltdGNsIGJyYW5jaCAnbWFzdGVyJyBmb3Ig
MC44NCBicmVha3MKK3RoZSBidWlsZCBvZiBPcGVuT0NELgorT3Blbk9DRCByZWxlYXNlcyBhcmUg
bm90IGZyZXF1ZW50IGFuZCBqaW10Y2wgaXMgbm93IGJ5IGRlZmF1bHQgYW4KK2V4dGVybmFsIGJ1
aWxkIGRlcGVuZGVuY3kuIFRoZSByZWxlYXNlIG9mIGppbXRjbCAwLjg0IGNvdWxkIGZvcmNlCitP
cGVuT0NEIHRvIGRlbGl2ZXIgYSBmaXggcmVsZWFzZSB0byBzdXBwb3J0IGl0LgorCitBbnRpY2lw
YXRlIHRoZSBjaGFuZ2UgWzFdIGJ5IGRldGVjdGluZyBpdCBhdCBjb21waWxlIHRpbWUsIHdpdGhv
dXQKK3JlbHlpbmcgb24gamltdGNsIHZlcnNpb24sIGFuZCBwcm92aWRpbmcgYW4gYWx0ZXJuYXRp
dmUgY29kZS4KKworTGluazogaHR0cHM6Ly9naXRodWIuY29tL21zdGV2ZWIvamltdGNsL2NvbW1p
dC81NjY5ZTg0YWFkMjIgWzFdCitDaGFuZ2UtSWQ6IEk2MWJmMTAwZDQ0NzA4MzI1OGFlYTIyMmFh
ZjE1NjA4YjdjYmUyZTU3CitTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8Ym9ybmVvLmFu
dG9uaW9AZ21haWwuY29tPgorUmV2aWV3ZWQtb246IGh0dHBzOi8vcmV2aWV3Lm9wZW5vY2Qub3Jn
L2Mvb3Blbm9jZC8rLzg5NTYKK1Rlc3RlZC1ieTogamVua2lucworUmV2aWV3ZWQtYnk6IEFuZHJ6
ZWogU2llcsW8xJlnYSA8YXNpZXI3MEBnbWFpbC5jb20+CisKK1Vwc3RyZWFtOiBodHRwczovL2dp
dGh1Yi5jb20vb3Blbm9jZC1vcmcvb3Blbm9jZC9jb21taXQvZmUwMDgwNDc4YjllNzZhNGI2YjY0
MTg2YjdiNzA1NzI2YWM1NTg0OAorCitbWWVnb3I6IHJlZnJlc2ggY29udGV4dCBmb3IgMC4xMi4w
XQorU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwu
Y29tPgorLS0tCisgc3JjL2hlbHBlci9jb21tYW5kLmMgfCA5ICsrKysrKystLQorIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9z
cmMvaGVscGVyL2NvbW1hbmQuYyBiL3NyYy9oZWxwZXIvY29tbWFuZC5jCitpbmRleCBjYTY2Y2Y3
Li4zMTk2NGQ1IDEwMDY0NAorLS0tIGEvc3JjL2hlbHBlci9jb21tYW5kLmMKKysrKyBiL3NyYy9o
ZWxwZXIvY29tbWFuZC5jCitAQCAtNDgsMTcgKzQ4LDIyIEBAIHN0YXRpYyBpbnQgaGVscF9kZWxf
Y29tbWFuZChzdHJ1Y3QgY29tbWFuZF9jb250ZXh0ICpjbWRfY3R4LCBjb25zdCBjaGFyICpjbWRf
bmFtCisgLyogc2V0IG9mIGZ1bmN0aW9ucyB0byB3cmFwIGppbXRjbCBpbnRlcm5hbCBkYXRhICov
Cisgc3RhdGljIGlubGluZSBib29sIGppbWNtZF9pc19wcm9jKEppbV9DbWQgKmNtZCkKKyB7Cisr
I2lmIGRlZmluZWQoSklNX0NNRF9JU1BST0MpCisrCS8vIEpJTV9WRVJTSU9OID49IDg0CisrCXJl
dHVybiBjbWQtPmZsYWdzICYgSklNX0NNRF9JU1BST0M7CisrI2Vsc2UKKyAJcmV0dXJuIGNtZC0+
aXNwcm9jOworKyNlbmRpZgorIH0KKyAKKyBib29sIGppbWNtZF9pc19vb2NkX2NvbW1hbmQoSmlt
X0NtZCAqY21kKQorIHsKKy0JcmV0dXJuICFjbWQtPmlzcHJvYyAmJiBjbWQtPnUubmF0aXZlLmNt
ZFByb2MgPT0gamltX2NvbW1hbmRfZGlzcGF0Y2g7CisrCXJldHVybiAhamltY21kX2lzX3Byb2Mo
Y21kKSAmJiBjbWQtPnUubmF0aXZlLmNtZFByb2MgPT0gamltX2NvbW1hbmRfZGlzcGF0Y2g7Cisg
fQorIAorIHZvaWQgKmppbWNtZF9wcml2ZGF0YShKaW1fQ21kICpjbWQpCisgeworLQlyZXR1cm4g
Y21kLT5pc3Byb2MgPyBOVUxMIDogY21kLT51Lm5hdGl2ZS5wcml2RGF0YTsKKysJcmV0dXJuIGpp
bWNtZF9pc19wcm9jKGNtZCkgPyBOVUxMIDogY21kLT51Lm5hdGl2ZS5wcml2RGF0YTsKKyB9Cisg
Cisgc3RhdGljIHZvaWQgdGNsX291dHB1dCh2b2lkICpwcml2RGF0YSwgY29uc3QgY2hhciAqZmls
ZSwgdW5zaWduZWQgbGluZSwKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
