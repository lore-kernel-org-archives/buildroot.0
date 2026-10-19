Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACC606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kfRsv6+Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JnS00KCX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BCE760774;
	Mon, 19 Oct 2026 22:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVlzP5DOjETP; Mon, 19 Oct 2026 22:31:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9324660788
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792449073;
	b=mXMGUAOm9ZKwdkEuEHYvVPcp6UgWGZqboGOOUwTtvzKB4x0Jg5qIaspiYz6Pfoxbuxgd
	 jg/El+L55qPqtbcKzK7WQhc4yAwN1P6yZVnW+GUCFTNkL/9Otf6xvQXNHV6At1GMNfo4J
	 /2uBPwrGKdGlWVtoxJWGq7bJiDfzSUuA99iWhdP72WvS/mA7srXXrFoN5alsKYhfC8lH5
	 u2JVyXqLVhJRNK4ci/e6eHL+gAdfH5jLBge2ade3++zcXJw0HjAHwu/VIG4DOKVc75SdG
	 xh94y8ONoLIvMjq39KWUA0pZMZyx1xyuCRtABffIr7YwFmJeLsNyM+mVijvCR9sJfGg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792449073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xpy1zSLVnIOQysZ3cOpBrehJwCj2xbt0UqLge7JONuk=;
	b=cHFdySnz5M+DVYcLxqu7X8J3wrZndWEqkyN5OapkURuZi7ItlXHTRrYCIQBiVAaSjTaC
	 4DoK+x6utOlcW0Ov7CT0Z+mxapOcNfhh31CRKbuK/K4viHShXvuBlpJ1w9IPqemgfCWR5
	 FFTgQOBevj2o1AIDp+Q7XVwURIA6Akckp7lJPcF54I1oRzHR3jgj+TnoLyrTJcENZ2qig
	 rqO+qLjT1I09aFX10pEfwEZTkSxzUhl11kI55QCtbyy8Uaw+eLWiZh0X1bq2tM4kEglPo
	 pa8wnLLEokbpPKgs5zuGSwtqllUglNV2JC6znNHjBuNdH9RfhQJxHRxNxzISm2iimJQ==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JnS00KCX;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792449073;
	bh=xpy1zSLVnIOQysZ3cOpBrehJwCj2xbt0UqLge7JONuk=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kfRsv6+YaFdKxPq2yiuzKtnT6B+xbf+4LrpfsUGejXLZySOCSEPcc3eFMYh5XVPS+
	 CGoFWCJvvYUXTwA2wE9PLry+WiQ891f8/EWn+u741MtWT2m61AG0FhLMcKJBuvx2Xr
	 60L3o9qRrK3YAJrnPEvYT76Wf236KFN61m8WL/msxpWZhwJQrbGZWkL2X53XRE4muZ
	 zY6558DgCyAMwei0TPZMMB6yfj36UiTbpnU4yfExJR3/oouXc+Hug9h9kpi9cQ452D
	 22o8BpitBv0Gy3CXh8re/lR5PCfEjEt93ooFLfnxCsk5DDxUFwQ4zj9Gtjz5PTZ2E5
	 WwylqzgxFM9dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9324660788;
	Mon, 19 Oct 2026 22:31:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FC582E0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 22:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 916C160788
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 22:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhKKgtDiaIly for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 22:31:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9BE6260774
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::a2a"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792449071;
 b=GdBwRwf+VtFfZfKQvEf5OvdNQS0FL7pVnSygkDpLsNwGb4f8Wwhg0sudbd0J+9j8jYde
 Idqa/Tp6d8xK7SlXvyeZJToYHiKLDIkunpVcwOvVrW7yb5C72YhNqfbCIiUJ4X+7zAowj
 I0tX/L6kWqk6gXKWDqHYGJX5WLsCMi00u9r0Moisy3EqqxXY7GiF6nXAVxaKlnL/E44aW
 p+NAjeTmJNrQMbFENx4et2izcUQMJMX7qT644bFlp2HJHqY49nXioIZN9AcuYCZ0tA9N6
 x7Z9XXWNMUeLcTNJuCbSZf7/cP4YmYwnInjx6F4ZmvZRpYav5HqQs+CRUNecKoiMXCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792449071;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=punnLLQT41BWwNxdyXpe4KMJHrDdiwOIzSCdXb7n/ko=;
 b=CpifkjF/CbKP2itECPvm9nGxPclqMIYUAtnE4Hd5P2wSD45bt8WNHc0qtr1U2I1VZow1
 7tmrk3lrzzdO6mSgdUjyN9mqDXt+s3DA5WidWtoc1B3bWxYUjTzQLZesG0o6gRPxXVamA
 oPlKIJBizGti+5xuj1vb61pUIO8yRtb6tIvToA5lYGvW9DppQmIg05JM5eX8cPAJJ9ImM
 zJg/W+qg/ZJGXy6/xZSd7YAMx823tlWp4x+ldhZy+Af5aFuzg42hwEvSUjxGf3MG2Wm01
 3MmZhuGvTwjfiQ34tj+vNQud5UM3BEHrpLVNEA5mQReryAyq5P775qhxV2ng6WcmTgg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JnS00KCX; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::a2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JnS00KCX
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BE6260774
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 22:31:11 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-5eac6c5f927so564835e0c.0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 15:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792449070; cv=none;
 d=google.com; s=arc-20260327;
 b=HUlclE4IXidofMcXPR3/Ok3AnilOT1uSKycqDk63Y1fJF12ltzuh7kNkYT/+1YN64n
 8IM6VFuhIfqxnyH1y1AwjjLG5Rra0VxnA2eKKumlXSpMBGuQi2mNdsfK4AdcXv55oiHx
 tjA6ePESBWpBqf7g/XaqoWeyG13g7v6ZvEqmrPs6WoauXTarJbhF4Losil3aFCMgasOS
 vozKHCGWf6IYkU0Nz+V5SQJEG/yRVNv+tGudpPckSfzgf/LV4pFWA/QBrEuvcu63J/jQ
 Zshr4ou8pNguSf3/hjFm0bPBGVmiJFRG0aKRKJr3MXRIkC9eHt35jXJc+M35UFRpqZKQ
 MJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=punnLLQT41BWwNxdyXpe4KMJHrDdiwOIzSCdXb7n/ko=;
 fh=XWYAQ0jj0O3dxAeWrM7H/vQLtEOBf1qSMNMbBZmc+2k=;
 b=dd4H7NF2VMha+LGA11YcBVZwphuvqFj1KnZY6JhpiAGx426XcIz3jaFnzoZhjDAg88
 PS77Zk1i1V1m4ewJXVGkJrsYj9Q79x2nNjvU8xHf9tnkmR+HE2iofanrzrUI1CWpxZKm
 4vcOmPoFevVgDzSqZIOrzE9znZSbDbiktwtYP5QgvwZrW8gPN30Ba15CRBWwFoKDtJao
 OO5sc1Pm5zP/j2VJcM0OnzjYpFUKDJJHXRj4HpGgH9Q+Jagm+RazeE/u/TSxT2NqqRGT
 tI9e8AKrNIFiFOHROgHoXeV31E/QX6zkLMLMuJvOKUP1MvRE1ZPx2hLTi83jvAi+vQn8
 VnAQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792449070; x=1793053870; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=punnLLQT41BWwNxdyXpe4KMJHrDdiwOIzSCdXb7n/ko=;
 b=JnS00KCX2tXQHOmmB5KL4MoRvtyfSxDcELJJ1dDX+i3IHB2WVk5hJAstK3sdhukif5
 wY4+CNUVO9y/TVsxVvLblLYOt1cXFcDF9IbHi4ymviE6YvhMAksjw5eVo4sPy5S2A8Cr
 oqCH3WweoAktgUrsp5o8bTA5a8sY0fksTtLw5C94rIGtTiWh6ZYTxF3RcT8eFzB8ceK2
 38n6RHTeZtw0Z1J5azq7TImmSbsp8A9Q+7N9gmLfo3XDcODmV8oJL85sm87Zvj+eYznF
 ci7Dgu5tbn/VFgSawqIrPql3/LAQiXYz5hZgMfHctNohGegG3wnea7/J4Zxv4UFLiMQl
 UUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792449070; x=1793053870;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=punnLLQT41BWwNxdyXpe4KMJHrDdiwOIzSCdXb7n/ko=;
 b=LTq4SE/2mLhcditDntuqKUH0lzPEoR6u9nbgXhoE2w4XZUrFPEcucE9loBqloZKljP
 lHINnQGPGN9NZR8mesZxwB6tfmPsQ2PPkWBXMT913WB0B09mulQTd46XbTaZsrfZbZZF
 pEHLoFqgWEfp64DwMUrGm+u6xP46GvxE8Nx1hZa3xPQsDWsQreHPBy/nYLKDnW7NRE93
 QgOjCE2zoBJEVeh3mnrltEBNm5bIKOlmLzXNuLDE2V/dEix/Z709nQ11VWys5OcQLoQ+
 f0aLlFlIHmyoXCGGIx2fytYKHgp+Dqsxw6nie2RZjOcxGhT1+G7AbRCOlHjf2GXWibbt
 alBA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhxrgsJZUInAhvesut8Naf/08dLJ5bVIU/pL29JP4q2/WVnQs3oQ00Dy6znQJ1SSKh5KJFt1ftjzY=@buildroot.org
X-Gm-Message-State: AFq9FYIlxuAaJMIbYHYSYIKn+zPyFI/VWBK7+mgbSGZMUT1JijisY7eI
 XgzjXhskfYwjyuDNZbuHMkb01MZ4a1z5ASumNEZLJJSyTnmZNxct4nHpbeVs7K5WrkaHd3MtZ1J
 7Kj275ASYVZPr7g8pVorfSten9/YUWmk=
X-Gm-Gg: AYBFou0UCGLt2E2n1N7CcQytK87I6IAQZ4sDQadqjMBi9OARJW6Os6TPBN78AFFJ6je
 skAxjeL2ReCsj1ermITXEBkgTlvU8YPy3YQvfxMpmsyZYRiFwKe7MirZjEjwz3CugHq9bEntabO
 Chfd8jhypmJDEKmSB7st7LCMgCK8xPbySxR5OGXu7IzBiekaQr79pivIdb5O7rcZcz4hy6r/wSe
 anSv5GGuR8m/hh7I34bJCuBVTyIwSA7GG1wHKkmuLHXe11o8O0iH+xpQg2E4cssUOgEqUxdJtHR
 CKtPP2WFhuNpsaRST/1aCmcUkiLSlnwQ8eR7ycrLAAaF05MZjA1LjpMKnn0+q9rYOcOhGWAuLXB
 oO+WAG+e9lJWmLTpxANMFkm5E3XrbJAVyQ8Ns5ifxsN6XoYA99LQ4RjDJLBVOZOg6c4JvAOOFVr
 9DLUWL6LGfi57yXu1c0J4/DSzh5ugmvnPa1HgJ7EjJjVxq
X-Received: by 2002:a05:6102:26c2:b0:7a6:85d6:8ae0 with SMTP id
 ada2fe7eead31-7cc36727131mr2277850137.1.1792449070194; Mon, 19 Oct 2026
 15:31:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <atEsbxorNgbUC57M@windsurf>
 <CADvTj4rd4ovmg07R6ux2b1LyDmkRhq79yJVVmHm74_THX6OPtQ@mail.gmail.com>
 <b6a61602-59ca-441d-8d52-7ae45d27b235@gmx.de>
In-Reply-To: <b6a61602-59ca-441d-8d52-7ae45d27b235@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 19 Oct 2026 16:30:59 -0600
X-Gm-Features: AclHuK9EfigYdSDmlqIpo2LdwrnqLcND92bGCJ7HmdAahaoCxcRvhIKY1NP4P1U
Message-ID: <CADvTj4oRTNJXMM8WpPAcAuVi57utvwfUJb4Vhpne3-Civf2TUA@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH v2 1/9] package/python-setuptools: bump to
 version 84.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMTksIDIwMjYgYXQgNDoyMOKAr1BNIEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0
ZUBnbXguZGU+IHdyb3RlOgo+Cj4gQW0gMTUuMTAuMjYgdW0gMjE6NTggc2NocmllYiBKYW1lcyBI
aWxsaWFyZDoKPiA+IE9uIFRodSwgT2N0IDE1LCAyMDI2IGF0IDE6NTXigK9QTSBUaG9tYXMgUGV0
YXp6b25pCj4gPiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gPj4KPiA+
PiBPbiBUaHUsIE9jdCAxNSwgMjAyNiBhdCAwMTozMjozNVBNIC0wNjAwLCBKYW1lcyBIaWxsaWFy
ZCB3cm90ZToKPiA+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9v
bHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaCB8IDQgKystLQo+ID4+PiAgIHBhY2thZ2UvcHl0aG9u
LXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsgICB8IDQgKystLQo+ID4+PiAgIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gVGhh
bmtzIGZvciB5b3VyIHdvcmsgb24gdGhpcyB0b3BpYyEgU2hvdWxkbid0IHRoaXMgcGF0Y2ggY29t
ZSBsYXN0IGluCj4gPj4gdGhlIHNlcmllcz8gSW5kZWVkLCBpZiB5b3UgYnVtcCBzZXR1cHRvb2xz
LCB5b3UgYnJlYWsgdGhlIFUtQm9vdAo+ID4+IGJ1aWxkLCBhbmQgdGhlIHdob2xlIHJlYXNvbiBv
ZiB0aGUgc2VyaWVzIGlzIHRvIGZpZ3VyZSBvdXQgYSBzb2x1dGlvbgo+ID4+IHRvIHRoaXMgcHJv
YmxlbSBiZWZvcmUgYnVtcGluZyBzZXR1cHRvb2xzLCBubz8KPiA+Cj4gPiBTbyBJIGRpZCBpdCB0
aGlzIHdheSBpbnRlbnRpb25hbGx5IGJlY2F1c2Ugb2xkZXIgc2V0dXB0b29scyBidW5kbGVzCj4g
PiBwa2dfcmVzb3VyY2VzIGFuZCBJIGRpZG4ndCB3YW50IHRvIGhhdmUgYSBwb3RlbnRpYWwgc2l0
dWF0aW9uIHdoZXJlCj4gPiB3ZSBlc3NlbnRpYWxseSBoYXZlIHR3byBkaWZmZXJlbnQgYnVpbGRy
b290IHBhY2thZ2UgaW5zdGFsbGluZyBjb2RlCj4gPiB0aGF0IGhhcyB0aGUgc2FtZSBwa2dfcmVz
b3VyY2VzIG5hbWVzcGFjZS4KPiBUaGF0IHNlZW1zIHJlYXNvbmFibGUgdG8gbWUsIHRoZSBvbmx5
IHRoaW5nIHRoYXQgaXMgZXhwZWN0ZWQgdG8gYnJlYWsKPiBhcmUgYnVpbGRzIHdpdGggb2xkIFUt
Qm9vdCAoc29tZSBkZWZjb25maWdzKS4gUHJvYmFibHkgbGVzcyBvZiBhIHJpc2sKPiBmb3IgYmlz
ZWN0IHRoYW4gcG9zc2libHkgYnJlYWtpbmcgc2V0dXB0b29scyBiZWNhdXNlIGZpbGVzIGdvdCBv
dmVyd3JpdHRlbi4KPgo+IE9mIGNvdXJzZSwgaG9zdC1weXRob24tcGtnLXJlc291cmNlcyB3b24n
dCBhY3R1YWxseSBiZSBidWlsdCB1bnRpbAo+IFUtQm9vdCBkZXBlbmRzIG9uIGl0ICh1bmxlc3Mg
c29tZW9uZSBidWlsZHMgaXQgbWFudWFsbHkpLCBzbwo+IHRoZW9yZXRpY2FsbHkgd2UgY291bGQg
cHV0IHRoZSBzZXR1cHRvb2xzIGJ1bXAgYmV0d2VlbiBhZGRpbmcKPiBwa2dfcmVzb3VyY2VzIGFu
ZCBhZGRpbmcgdGhlIFUtQm9vdCBkZXBlbmRlbmN5LCBidXQgd2Ugd291bGRuJ3QgcmVhbGx5Cj4g
Z2FpbiBhbnl0aGluZyBmcm9tIHRoYXQuIFVubGVzcyB5b3UnZCByYXRoZXIgc3F1YXNoIHRoZSBz
ZXR1cHRvb2xzIGJ1bXAKPiBhbmQgVS1Cb290IGRlcGVuZGVuY3kgb24gaG9zdC1weXRob24tcGtn
LXJlc291cmNlcz8KCkkgdGhpbmsgaXQncyBmaW5lIHRvIHNlcGFyYXRlIGl0IG91dC4gTm90IGEg
YmlnIGRlYWwgZWl0aGVyIHdheS4KCj4gSXQgbWlnaHQgbWFrZSBzZW5zZSB0byBtb3ZlIHRoZSBz
ZXR1cHRvb2xzIHVwZGF0ZSByaWdodCBiZWZvcmUgdGhlCj4gcGtnX3Jlc291cmNlcyBhZGRpdGlv
biB0aG91Z2ggKGJ1dCB0aGF0J3MgZWFzeSB0byBkbyB3aGlsZSBtZXJnaW5nKS4gT3IKPiB3ZSBj
b3VsZCBqdXN0IG1lcmdlIGFsbCB0aGUgImFkZCBob3N0IHZhcmlhbnQiIHBhdGNoZXMgYWxyZWFk
eSB0byBnZXQKPiB0aGVtIG91dCBvZiB0aGUgd2F5LiA7LSkKCkRvZXNuJ3QgcmVhbGx5IG1hdHRl
ciBtdWNoIHRvIG1lLCBlaXRoZXIgYXBwcm9hY2ggc2hvdWxkIGJlIGZpbmUuCgo+Cj4gQmVzdCBy
ZWdhcmRzLAo+IEZpb25hCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
