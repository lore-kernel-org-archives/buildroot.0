Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1A606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gewnfdt/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=kea1QOob
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9B0760640;
	Sun, 25 Oct 2026 22:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFC9-92fA_J0; Sun, 25 Oct 2026 22:10:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DC7E36060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966230;
	b=QFe3sB7xFTAd/nklCXX3HB8lWiDIrf8yR75mKN0kkKfNHaTYVc2wvOczVL9OuOPXWv5r
	 tV+X7yghdM0Wh8lqP9MAkwPwycA/846l/Toy+3oYYKuZwAZzcBxzyRzgqUT/4erMoSbKC
	 AgqItgalX7oNklOU3v1fDPxww029oY0aID+Z22apVuNxHANrKOVaImb/gjcUjF84Ms+0h
	 sS/hPT3zXLsbP/k1QnfKRMeNHmPuSUdGoD/4bIHhTPLs/EMdcVf4Esgv7ZyeaACpNGKni
	 V62mJRV8ugn3t5pY0iZlABGFTqqfknNeVyXkAWLlev1HU+nGnnBhuRodWvim6f4R9vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ff8441rdUiSf5jtyP4Dexlh6995J4wbxAdsZ30Ybdtg=;
	b=ZIyfDo8F8GB6XfKxEfJJn9P9eDrGRw3dEaQgLLoMi8xWje+FE7yYIiKmsvQsiSKPX1iz
	 kS1FeoKq+Lev+GrZY32o7Fvmq3e0G+SMCTdPOol2YtJbuEcuX+dixNub4sh0x1vKawtN3
	 +E1pS42P2FuWRm8bECVWjvZlCp67OHADHmIedU3VU8FzArFTVG9rjem27DK/3LULcJLfm
	 wYX92zI+yRFsO0oCiU6muPnsEfXiYZXr0D8L+3WnAxjo6CiNxYSgxzqEraBJ55Tf9vSXD
	 9905mObcPjhE/sYJ3FXKQUTwDbrhJhYVbj28PQxhIqmhd5JEVd0IN18nyiqjJiOQFPA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966230;
	bh=ff8441rdUiSf5jtyP4Dexlh6995J4wbxAdsZ30Ybdtg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gewnfdt/+tOCeO64Bw37oPznivKYm0hDeQ4TRhifvvRVLd2LMTmtN9FoA2Plly9KT
	 qWiKo/LR2ntErFHxpvNhtNPm8xEY0eMZ0Mn6kaCG2Lhq/yvuRkZiNth2HMdgBZjYiV
	 3oZGVv88VGvllNiJYOuX3RFHjvEbk+2JE+1hreAnh+tSuVsneI8wwj4RLp4sP2+M09
	 LQb+A6FIZShPyWXThrqkNb2LwHB27qN3ub6o+ljXvLhtxxELNCCRmwrh0h62RK8CVt
	 CaXy7Dw03IyUbBbrWlUrVGW11A+gnksLhdVeyrryq36K5gMJIPtuISPBmcUMtITIMy
	 vq2tCag74pUMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC7E36060B;
	Sun, 25 Oct 2026 22:10:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C443334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DAED40070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10Cb_TRO41Rt for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:10:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 38C8F40057
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966227;
 b=sCFIrZoWHPWr4HI2Dvboi5vJiWgHhwBftFKgpfQfYvZMvHhWiD8NMkMZhQss707lyuxt
 Dhuw32k0yPbLSBzWX1OJXQwkC/U8WaaqAHMBOngM19gHDUf3Qjt1QmIsIf0Hfz594a4VT
 idpzxn8sJWTOuzK7RD4NJklyQB812hWlrZXwfWqtFMJcfUqkFRh0u5x5HiPsmKbIPX87K
 u60vbMk40vUdBOJVZKezQIRKEP6iMA8EZfjeusxXBENCzXAHjRN39xzSLyQOMA4aMjIsH
 mhZJ3MwC6DQVmO6y2g6U5YoY05AMhv+e5O3KR0bD0z8JRcC4dzO4gESJM9qCOSqr6uQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966227;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=W9CIcpetg9yypPAK3DBbt2wPyKWpfVN4VMLker5yNjE=;
 b=XXhcWQ0ebbjNxB2QpWw/WMRpTDO8+XQQxld1UnVb9cLMC47Ofu8A43bmdR2hcRAW64vX
 Psl8jjr2Vy91tqMs8dvunoV+x5MgPJMbN2NvQKlzEzcJJZTjRQ9F/QB5Vtg9d5vNbzUGT
 cTKUBZZ76SnA+Aqd8z5MKLguYuNc7vyyOVIreo5YXgBhw5AbGKccXqnWvnZd70M5Z1+48
 +AeW0WxnDirA4qx9CookBVWl8od2q2Jty7KI7HZhU5XeYPrgrT/IYuWOYf/F7/LCQmu3m
 432M0dK4hL3i9Y6JAe/eQVISzqy49RDUSjZ/ZSMVXApk6gjZu/tA3wLJGSJm8DFdBDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kea1QOob; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kea1QOob
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38C8F40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966084;
 bh=W9CIcpetg9yypPAK3DBbt2wPyKWpfVN4VMLker5yNjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kea1QOob/WEdq9AteR2zoWlUOmsBQF5oWwe3Nswccv9v765pP8oqjUpwu4OaCRPOn
 lPntKX6dcWG64/xTHfQf2di2zuWqmnTLaWAVGTDggZKkCfPgu3jjXHw9/5VBfLhxJi
 7xVTyyd/XZaqNtb/xEsJttIQEex4SUPVDUD6qdWeS33bW3bz2Af1WuZBjIC7KI4Hfq
 jOmUSbJmIhvI+cVltJh/IdnH4m15ibvmrk9Wjfai2KKHt8BrezK/d8VsAJgenmu36O
 vJuGMdwDagoDrhxO7ykSuO73OI9sAkQ8BwrteB8Zt63uv0w8hpahlwd8dq6rZCfNf2
 fL2bxLlgx71Fg==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 v3OGsoWwmrmaudm5iMbGso4C3rqeECDJEa0xnha+w2K93zsH05HStcJDLGffoFT9c3OEPECJ7bZ
 IDjCC9MpY19PvyHrekECHj8dHJtoQCahPbX0FNur1Sc1crPyrOkU7cMFGnCEgAXiUvaukGnSCl4
 JkzBsxovYPTPmlEycrNspAaMqRugemq/40oS6CmnUOkH/NVEKSq1UV2a6fdrt5KUioPjlT6jpJC
 aSC/EzMX7BNU+7k04NhjAMthmBKqJYZmodtfRPfucH04Wx1GPZGbia6qdH/IMAU+JYa03F87VbT
 Myju7E/EiXqh7p50p8En4EkfTiRc+YeQA5/76SjJ3K70aFOH+1L0B+ICts7+F7QPFUp4Zmuj1N5
 oIJzEaxzT82KNf0CmmyhgG0lLx3g+ywtvzk1Dod/9M5KwFvTT6ZUlw1J1xlCB1j6ZaGseovTcNb
 J59rQ8Qp29fg1pAn5YI16JG8TTZFIVsUpq0iHbJRkLucqDkp9kTM35vi5nEjYXRRal2ny0k+56N
 7YvlfnP5l1VRgc6hxA/SV41RtfiUT8fAtYzSb/VZJ/qNwr6IuhkdL2ysWLc6sx8mfWi+/1uyXM=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B06FA4C6A5E;
 Sun, 25 Oct 2026 23:08:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-3SjV;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:07:03 +0100
Message-ID: <20261025220723.1332924-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 14/34] package/containerd: bump version to v2.2.2
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
Oi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQvcmVsZWFzZXMvdGFnL3YyLjIuMgoK
U2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0KIHBhY2thZ2UvY29udGFpbmVy
ZC9jb250YWluZXJkLmhhc2ggfCAyICstCiBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5t
ayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaCBiL3Bh
Y2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2gKaW5kZXggYTZmNDM5MGRjYS4uM2ExZGZm
NGRhOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaAorKysg
Yi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBD
b21wdXRlZCBsb2NhbGx5Ci1zaGEyNTYgIGFmNTcwN2EyNjg5MTQ4NjMzMjE0MmNjMGFkZTRmMGM1
NDNmNzA3ZDM5NTQ4MzhmNWNlY2VlNzNiODMzY2Y5YjQgIGNvbnRhaW5lcmQtMi4yLjEtZ28yLnRh
ci5negorc2hhMjU2ICBkNmU4ZTY0MjRjNTQ0Y2RhYjliNTFjYWUzMjBjM2E5YWE1NTkwZThlMWZm
YmQxZjg2MmViMzk1ZmQ4YzViYzI4ICBjb250YWluZXJkLTIuMi4yLWdvMi50YXIuZ3oKIHNoYTI1
NiAgNGJiZTNiODg1ZThjZDE5MDdhYjRjZjlhNDFlODYyZTc0ZTI0YjU0MjIyOTdhNGYyZmU1MjRl
NmEzMGFkYTJiNCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRh
aW5lcmQubWsgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawppbmRleCA2YWE5Zjg5
ZTVlLi5mZGE0NTUwMjQxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVy
ZC5taworKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUNPTlRBSU5FUkRfVkVSU0lPTiA9IDIu
Mi4xCitDT05UQUlORVJEX1ZFUlNJT04gPSAyLjIuMgogQ09OVEFJTkVSRF9TSVRFID0gJChjYWxs
IGdpdGh1Yixjb250YWluZXJkLGNvbnRhaW5lcmQsdiQoQ09OVEFJTkVSRF9WRVJTSU9OKSkKIENP
TlRBSU5FUkRfTElDRU5TRSA9IEFwYWNoZS0yLjAKIENPTlRBSU5FUkRfTElDRU5TRV9GSUxFUyA9
IExJQ0VOU0UKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
