Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D92606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rSYFDmwv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=eDEPSqCR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C03FF60640;
	Sun, 25 Oct 2026 22:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsaVXZ9kmgoQ; Sun, 25 Oct 2026 22:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0014060626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966192;
	b=WjM+yESZqN3ylDqK7PqT1UrtdNmfx+ych1jotmA+d1ecFRGU5z1LsNGhBJNpsR1vky/m
	 GSzsVuUZdblaRrQYxWFI+6RlV5M5x5Q09RWvXakvY7mroK88/Dsj3MvCWRZ9wxkHzP6PP
	 w/CQyUb2NoB1D/1hmxL0mf9xe+miZ6XwMzQbqe5VBlELrhYVL7sJxoJJTs8nxciWkvK3N
	 TBXYET00Vlf0xZGbWupVMkOKoFL8B+7b0dxEKIbgQfgf2rmaTQm7hUNwt/2wdyHtt+nCh
	 qjcOT0VsFiwetN4Zf1uPiXytPLprwfRS8e4wy1NeeNAuuxB/EeRxC/MzVtwdAS+RUaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HCQfQwsZz7EmzKnT9zy8ZQrDpxUxHxY3zopCjwCTrU=;
	b=CCXZyT9Whf3JSOOFEykBEwTvMFfwUZZCpb9Sao1glw+qAOMjt4F8FQk09HlBhanVtg9Z
	 DIZA07Wkgd/CPzt9MgpgfFX1JTyw73VOldl0ZR+SsavqniBNzkEkyvNDdbiKHadkZmy0z
	 RReY9+ny/AyT2nEUo0HTGreCSg9wO99dKgHwrAWbj8tn66auk9Us3yVdL+yiztQZIj7p+
	 A1aQYOOpgBgrIaHmZ+eEoFZr8lQVqkUUDb5zFwiQ3cPpMxCH0nAnY+41tCno0zyQYch4S
	 lhdqRraYBRJAfQH2FyklbWnoKYGLIboKjtp+4oksuMA+pi2GVcNLEYMcFwEKyZeyfAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966192;
	bh=7HCQfQwsZz7EmzKnT9zy8ZQrDpxUxHxY3zopCjwCTrU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSYFDmwvDnUZllGl3yO2ICl/kBvBkeAnqpiGqCHTTcnNzk4FUrh56tESlAWiIENcf
	 Z38dh/Ep46Q1HEPEG12L91PY3fesq2WQQZqmqGUMU/c/13LiZ4EzNl2EEPr5fBLmH6
	 oz7viAvNwnxpUp4/yPJRtIUPMupEeOjYjIS1mnnu3n7TPQtXkIqv/ydprpaZhC2++i
	 Y3D9wmWRmEBrk/8yzDId463RhIv3RffWEyyvQbVg8DBbPaL4ZDbpKyszf/b2hT8bMm
	 Yn7m2mi8hku7pu8hwpxmAnH9cRKjmtwGCMujNurw4Spfuy+57irzY5nSST5hEXzaR0
	 2d1tF3OGn4A0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0014060626;
	Sun, 25 Oct 2026 22:09:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F117B356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E378140070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPLixxi0M2ZQ for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:09:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1247540057
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966189;
 b=G/sg/UCrSJubCkKvvwRNwqGASWVDHignwz0HmOMvQmvX/qJ2GjBuioLxkO9vhjQQPrQz
 cvDBMXqwqU9xzi/27zE5zbqhm8RFOGD1uLGmTCgoyVSp3+eRcEdR6zw8dSInoVBHPEj80
 oNmnzfSECA6ZmzWB1/2MmYTVdJ2bQpAsDUj2AiRzuR5YTjGzeA2asxatPYQ0fa5FIL4DM
 y1hBwzWz4Cv7DR5+f/zUWOpFpdvGdfbjWy1SNeKJXmNKJQKS7IkmQtJQl2mPGQ9aS0yRi
 1WPDEa4dujyrjzc9x+dCT2TUOqlpsKLRQrNMESKiAIDcIvCc6tl5ISu+uB9fTRzrVYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966189;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=L3YzVYMM2kgh+aE+WiZcSSoR8p55UNFrGh1hmghg5wI=;
 b=C5/IJBzLnWsI9b/fpO1JRFvF7g3lYMiAIQj7wD99su7drx9NewCXVw5mDXIiB9OPwVFE
 9UkVzJvCigjnQdmMPWhOcvDwGWy6CAfzWnxurvDq589ec+lez3KgNYKckpAAwpYnjEPZd
 nK6QaZouPYmzI/4DtsW7p4dmDgWEgdaJ7nUWdoSlmRJSO8sZj0CMBgjSp8O/44O2VHhmv
 /0AYwgZLnQul3W5qOVWS6lsVJfM+ViyxgZE39Rnjfw4owOa/xBPwIIlAtbsGZe2F0vlKo
 OwZdG053W01/2a6YLz9ginNR3JbZDG6EghzT7YU4679PL+XIODGN2pJPa/q7wtU9qpQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eDEPSqCR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eDEPSqCR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1247540057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966083;
 bh=L3YzVYMM2kgh+aE+WiZcSSoR8p55UNFrGh1hmghg5wI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eDEPSqCRYX1c7wefhHDcAgYtESgSq6RHlY98ncRgGizZa+sX33oNeddAh3+bCvrrX
 8mTCz+6qrjZphPguYMf1iWR5Z9ygnbzzMbpnmSeBSs7XFdMSssofw8esmy/boUTIVV
 OYdqYOXOZD8A9hOv/Dg4zYzceK6Bqlt41b/5EA5VfbymX2HIMTSbadP64CU0Vz/7gm
 jKS0X4IyK0HHIKrWI9vjUxRvSnYK5HFLmwiBKoGZNeQ6HO2qtc7fVHWt9VymUFTOty
 UrNEAxcsxh81jHCdp13oIz0iFJKENjETdEiceUNxIbz1eAhmKz/nPd1c6IM73iFlYP
 utyRhdGUcagdg==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 1dEtqOIJFqoWgAZ1FFS4bjILzcXt7rd/eB68IItRkf9DA0PphcxIfljrE41AV5wROqm1gf+m1Tm
 owZdr2ZKs088Ed1XiAp2vzZdFOJc0OsYh+SrYuKrgIIWEfi3UiVN1al0YpokNI9V+8oua8kOu3C
 E2K1FN1DNlHkxNscG0YNt7VryeAQ5SvkYeN6voJ1iw5mYXgB7AfjgK7YGsS41OvzZAeWETCM+6f
 pkgZ3Qok9fEZKJXaxYWZZFLpk8tNxMOu0fxEKFEFd9hdrm+Fdjr8z3IPqwOLnrFdHeQqXl+9/v8
 xTDaj9S0Neqcv0CmmsmBm4DEQox798rjhaMi5oR2gTme0PPYeW4WS9IE+icLoS4tkxZd9urHGOy
 rEGSrHl4cOqO3x8zw2DRavLoH9h7xmuOxAgYmmWigBj2XQiJJ13J1+L4gqYguy6RSOqENehH3oF
 WwUvrfab4YvLBgjThWhdD/AXtlUN8H9FrMscrT74fA1xOEZq2Dcs3NlUwtnvPEd3eIrGYRJU/+1
 DOYnX1rPi4QqkTeiqN5iIHa6pFBzv8vQ02llHuxDVFw0IFNA9paxTn3ED1DMegOmxOrIpuowK8=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4415A4C6A4C;
 Sun, 25 Oct 2026 23:08:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-2aUd;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:00 +0100
Message-ID: <20261025220723.1332924-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 11/34] package/containerd: bump version to v2.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKQ2hhbmdlbG9nOgoqIGh0dHBz
Oi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQvcmVsZWFzZXMvdGFnL3YyLjIuMQoK
U2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvY29udGFpbmVy
ZC9jb250YWluZXJkLmhhc2ggfCAyICstCiBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5t
ayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaCBiL3Bh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKaW5kZXggYWExYjJkYTcyYi4uYTZmNDM5
MGRjYSAxMDA2NDQKLS0tIGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAorKysg
Yi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBD
b21wdXRlZCBsb2NhbGx5Ci1zaGEyNTYgIDg2ZTdhMjY4ZmM3M2Y1MzMyNTIyYmFlZjg2MDgyYzFk
NmMxNzk4NmUyOTU3YTlhZDg0MmVhZDM1ZDEwODBmY2EgIGNvbnRhaW5lcmQtMi4yLjAtZ28yLnRh
ci5negorc2hhMjU2ICBhZjU3MDdhMjY4OTE0ODYzMzIxNDJjYzBhZGU0ZjBjNTQzZjcwN2QzOTU0
ODM4ZjVjZWNlZTczYjgzM2NmOWI0ICBjb250YWluZXJkLTIuMi4xLWdvMi50YXIuZ3oKIHNoYTI1
NiAgNGJiZTNiODg1ZThjZDE5MDdhYjRjZjlhNDFlODYyZTc0ZTI0YjU0MjIyOTdhNGYyZmU1MjRl
NmEzMGFkYTJiNCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRh
aW5lcmQubWsgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawppbmRleCAwZDIxM2E2
MzEzLi42YWE5Zjg5ZTVlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVy
ZC5taworKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUNPTlRBSU5FUkRfVkVSU0lPTiA9IDIu
Mi4wCitDT05UQUlORVJEX1ZFUlNJT04gPSAyLjIuMQogQ09OVEFJTkVSRF9TSVRFID0gJChjYWxs
IGdpdGh1Yixjb250YWluZXJkLGNvbnRhaW5lcmQsdiQoQ09OVEFJTkVSRF9WRVJTSU9OKSkKIENP
TlRBSU5FUkRfTElDRU5TRSA9IEFwYWNoZS0yLjAKIENPTlRBSU5FUkRfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
