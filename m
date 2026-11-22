Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29066606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 18:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GujiPXC1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A4B60602;
	Sun, 22 Nov 2026 18:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHvSpqZKyqeM; Sun, 22 Nov 2026 18:49:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 001C66060B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795373376;
	b=LrDCGqToNFldPsnJUXnjiGTv1htDeENJtySxOwkH0rrFrucHftiIfMSmKX3zeL3RxhdT
	 FJJJaUp4UvaT7/J7Zrnrr7BmJdhWKZnrDdQ0ErYBloRG8iWu9Te2VHVec9MCtBrWGBAIp
	 8NfpsmbUHLypEYJUbwi3MWCJ8Imb96GEJA55ntIhRk4NVpMXIQwRT681jQ3jQ25FTcTVP
	 si9R1Ix9oczuau13WM3/Iw9Zak6o4q6uv7jRzcqFXoM+f9y3h663s88hSgjrUjuVY50IG
	 Sot78qf03CYDlMklyQjb7ilsW+tR2Q9pLWkXK9ZgegZCCM9WT8/gVp1QOd0SPB8wJog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795373376;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:Autocrypt:In-Reply-To:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=2dheipC5npbsJvxjgZIVhlnaxHibIqx+DtedwvHNc2M=;
	b=hgkp+6oqBDiqOqmabCZfGfspbDmtqKOn1ofV61zPBeSVItVUlxxSF7na5IhIdCtDI2zj
	 YkXhIr/2LE5aASJzIb0TPz+PSKrlG+MLYI4EBYqLKfQ6+QNNT4x0hzjUlZbjSipnCZ7/c
	 wDJkvA89IWQ41mt80QI5l0Xd7nTz4S1Zx+poaOkgWC78bhjo/hxr18DcQ6IIfWJkvAsDf
	 zIICHpSCgb6CmN7+lX26d7W9WvHJrCiHYhbpc5HwFU0yj8h4IUZqd3hhaNSCM8wQSVpU2
	 6mil/0nALtZO9YAAFNDY2eNDka9z8tk/fGGz0TFFl8xMuh16xg4kGgymKK3Xr48qMAg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795373376;
	bh=2dheipC5npbsJvxjgZIVhlnaxHibIqx+DtedwvHNc2M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GujiPXC1aB2Y2Xp2G8J+h/Ivhg5vGBtwOtnNRjZU0VNhYHjY7HtyXjJRwAUGUj2yN
	 Q1AG0MnYUh6NxzXSOC8fRhU6ZOYpwbV1LStvCP1dr58Jb+uqPGZyXfNvtpvqM1hpMS
	 25UMgsVIypdbOTod2Ugs7EESICweQBsqftOtY8RJKf+CgmjS+r1EWMZDChqlwiQhPm
	 E/H3jBvYiV6v9YEamymwhZvyGUtvmMTMjkNF1u59VNNvLkfrixio2iHHczmMfNLM7V
	 mAIxg4WMx6HZhvYlwUYU09tV/Lw3VrMFbArFUHHt+IdlUsxCc6wNguQYRPzZDw1dSZ
	 9XcLKIwgFFJJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001C66060B;
	Sun, 22 Nov 2026 18:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6E981AB
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 18:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9866E40585
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 18:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tIU5Sf0Xlcl for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 18:49:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8CB7C40582
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CB7C40582
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 18:49:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso30500355e9.1
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 10:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795373370; x=1795978170;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KjZ3LzpY/W70zDy7mHJ2LpZ6N9jagGDVB63ro+UymoQ=;
 b=bbDRaBdJKkm746PZuSMMEjUINKhg4K99jbWQ2dIr6vPfeVLRGJzn1M6o7YYWy/2IXZ
 kaaPNZJzYjNTM/T7xcKJNqxfB8csLsZZT3NbNm4qWeYzt3hiW5BgTaCZTY6Lhih6D61v
 WdtGFeD3qWr/3IBNIWn36AAmIITYCLhRucNTZpw92fisQFxBUlbKC7i7cNj+532oyR7y
 wc+lc/2WFqhOs9Ze1zuvuMWLAlCHNZUbJX5v+sgIrSB2NpvztvYn8x4+Z9idd8p9aZfW
 rZcTGzdczysopwI6fsVyhJM/UFfg+yy7lqKYfuO+oglUTWkbd4jnW/Ce8PW9z3B2ZLE/
 tg4Q==
X-Forwarded-Encrypted: i=1;
 AL+hErHNr1U5zB5wcOp0x8yt0gEuC2+mEN8JCsosy4GLzTxXA16EPho9eaxnXkm1VA/sIb7hZXByxE5HBmI=@buildroot.org
X-Gm-Message-State: APuU4Z9DXg4nam7I1cKa5asRrMUtu4Gbl8QDNcgYeQyzfQZg1456wBwC
 aXH/rtw+urYEScjyw/UG+EhKcFptEPYO+5d932rXAoTL5hBgYj2DkzFhi6AEKMwszyL46ARnmRR
 sq9NZyFc=
X-Gm-Gg: AZFdTZcLXGABmfD5jLXAemBSyHvv7YnMlsKPEyrIa83+ZoNHofG9HJ5pBnxg2u7BESW
 ueUTbSGzs8vv7sKSyRTkWVTqGKnLt0TSPLSPgGGMUtZxVamxfpg/+g73TPfQN8dLNfA0dLmHfzg
 r1lF4+GCQRepMJIc7EkSKBJcGQg4JgppQrv50rK1RZj0hX4+XnuUC9nFTXYChqolICeHWG2nwkf
 MXvVbOwYDspxw96nkfw3OQMNXGgQmjfTI99sGdJS9ENnEU+4e1sd9gt3ASkJiC4rTD+YxV1ktg9
 K9AjDaXzaTx4NQwj1gupmarmFJw5my9/Ixlq96jnCFV5LvhnNVxmB7ZjxUeQevQFgbbzAKOlcyh
 AMjNujQduvYAqiT+/pyzCOU2fh9iWD3e62cYbchvRmvf7T6mMN8XOjo2+nqjltTI0i25FjHEPsR
 CveF5fMKYmXJKcDl/PBTQTD0YLuRSnwFb55N11U45NRapxdEzKCDuGCnVYmKw5Hscp842mPPcXJ
 cnRb9CqLCOZnz8r/HDTzfEjhuQywFiEetg1oT6d0UDfuGo4U/HpdymmFwZ1y9D30xM7wbOY6FSG
 B3g6Z1MP6h1nWFzHRYmfJR4BKP74tFvLNgClyA==
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id
 5b1f17b1804b1-4bb8880606fmr196249955e9.12.1795373369797; 
 Sun, 22 Nov 2026 10:49:29 -0800 (PST)
Received: from [192.168.178.32] ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906c089dsm123010555e9.1.2026.11.22.10.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2026 10:49:29 -0800 (PST)
Message-ID: <8dae3bc9-d241-4a32-bb43-46339dc5889a@mind.be>
Date: Sun, 22 Nov 2026 19:49:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?= <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Thomas Perale <thomas.perale@mind.be>
References: <20261120100106.542645-1-raphael.melotte@mind.be>
 <8733svvd2w.fsf@dell.be.48ers.dk>
Content-Language: en-US
Autocrypt: addr=raphael.melotte@mind.be; keydata=
 xsBNBF9jhjsBCACmkrLRBR22D1FiSlmQGKiSPPLY0lAYe6/DnBT7OsgiGIOWqmQL1ryGJmxI
 9PDMDGEBngJ6RyrsVlREt7ugoBEg75CrtYwXdTCB40fEPweceHtWwAQoOS3MDgFhdvd6uZvl
 YWenR6RcbCo/LZaV/novslE1eCnADNChMOkp8jTAA0K2jIlEYexrzO+G3CcrKmo6naVxn56r
 dn0kLnff4f/wvj+1l+J7m6GVL/8ckQ8fVQagLxQ5LHoxhIcOxKH1IEzf+gri/e+16gka7bWE
 4QUCEeGo/pBYysLinUP/6ArAmWoZXfGH3S0HiLBc/Yf4klnJ1nd6vZmxYKppOmy814+tABEB
 AAHNK1JhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT7CwJQEEwEI
 AD4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUC
 ak+EAAUJDM0xRQAKCRDDTCsxdUfmrAq+B/9jCJC+OUOxt3t4W/Iorf6qbMWf2LyX9fnhCwfJ
 j4D2n9sZZZQzhQWvbgadZdfRigt6G0CXbQeomPRpSqjiI03ZK949++CXnaOY8eUkyO9a+LcK
 ldAg0Tnn6b8Ctzmz26Ad92fgjXHGApyWlA8eOdlJq7v2QitsETy2WfW/W+OUU83eDpdE6x9k
 xQKWiCoxYEpRqBYrKY5gFS7gMC2SzjBoscuY2XZHpdWeTWjgJkPyJrsAsgL1m2Tqr1YFp0Sr
 A5oZDtUbL1pr/ds7s4t/hpnjFlFaVFmOsb43MeXV8fb8SVYEzKzYKY5Tf6oRgwiWVR6QphOl
 V0oUMxLmLT+TifE0zjgEak+FQBIKKwYBBAGXVQEFAQEHQBGpVdJ784oGuZ9UHdNMBh+D3Wxx
 Tuhm2m4PM12o6UluAwEIB8LAfAQYAQgAJhYhBKMBkG8efCQckSPnasNMKzF1R+asBQJqT4VA
 AhsMBQkB4TOAAAoJEMNMKzF1R+as9sAH/0u4E/aKnSsc2k82/mWbgEVhVtPuKHxF5vwbWEz2
 CcPluDN2VruhYXaEMhn6iIGHaiajq4/6vytdJowQZ4s1vlP4Jea5/iuIJOvQo9pKI1V2/l3S
 Ji1o934tEkF6F4wV2tLiPW19Iq0Rtgi0hlrdQfw9Iqx4Y1L8zH7iXNHdHQdEkzdg9f6o6Vn+
 e8MaeJfN31TxQEJWyJjRYa0mlWOLwmlUz14EYNgnXhv/hKHdBdyJ/9f6HWn6ZBRHQiS3+Tx6
 kt2XcCDBF9w5QI2xoVTyCUchbN7vSiEx8H5vhl5Pwjf9Jzw5ts5XsCZnWZEAVCyNjTb+UwfO
 37Y2HGJAe9GA0kM=
In-Reply-To: <8733svvd2w.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: test_grub: fix test by
 selecting BR2_i386=y
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUGV0ZXIsCgpPbiAxMS8yMC8yNiAyOjM3IFBNLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4+
Pj4+PiAiUmFwaGHDq2wiID09IFJhcGhhw6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3QgPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6Cj4gCj4gICA+IEluIHJlcGx5IG9mOgo+ICAgPj4g
QnVpbGRyb290IGNvbW1pdCBbMV0gY2hhbmdlZCB0aGUgZGVmYXVsdCBDUFUgYXJjaGl0ZWN0dXJl
IGZyb20gaTM4Ngo+ICAgPj4gdG8gQXJtIEFBcmNoNjQuIFRoZSB0ZXN0IGNvbmZpZ3VyYXRpb25z
IHdoaWNoIHdlcmUgcmVseWluZyBvbiB0aGUKPiAgID4+IGRlZmF1bHQgaTM4NiBhcmNoaXRlY3R1
cmUgYXJlIG5vdyBmYWlsaW5nLgo+ICAgPj4KPiAgID4+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBp
c3N1ZSBieSBhZGRpbmcgQlIyX2kzODY9eSB0byB0aGUgdGVzdAo+ICAgPj4gY29uZmlndXJhdGlv
bi4KPiAgID4+Cj4gICA+PiBGaXhlczoKPiAgID4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTgwMzMxNTgwNjAKPiAgID4+Cj4gICA+PiBbMV0gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0Lzg2MjQwZmE0
NWQxMWUzMzg4OTY4NTIwYjRhMzVmMGE0MDk1NGMxMzIKPiAgID4+Cj4gICA+PiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IAo+ICAgPiBBcHBsaWVkIHRvIDIw
MjUuMDIueCwgMjAyNi4wOC54LiBUaGFua3MKPiAKPiBXaHk/IFRob3NlIGJyYW5jaGVzIGRvIG5v
dCAoYW5kIHNob3VsZCBub3QpIGluY2x1ZGUgdGhlIGNoYW5nZSB0byB0aGUKPiBkZWZhdWx0IGFy
Y2hpdGVjdHVyZS4KPiAKCkluZGVlZCwgdGhlIGNvbW1pdCB0aGF0IGNoYW5nZXMgdGhlIGRlZmF1
bHQgYXJjaGl0ZWN0dXJlIGlzIG5vdCBpbmNsdWRlZCAKaW4gdGhlIExUUyBicmFuY2hlcy4KCklu
IHRoaXMgY2FzZSB0aGVyZSB3YXMgbm8gc2luZ2xlIHN0cm9uZyByZWFzb24gdG8gY2hlcnJ5LXBp
Y2sgdGhlIGNoYW5nZSAKYnV0IEkgc2F3IHRoZSBmb2xsb3dpbmcgc21hbGwgb25lczoKCi0gVGhl
IHRlc3Qgbm93IHN0YXRlcyBpdHMgYXJjaGl0ZWN0dXJlIGV4cGxpY2l0bHksIHNvIGEgcmVhZGVy
IGRvZXMgbm90IApoYXZlIHRvIGtub3cgdGhlIGRlZmF1bHQgdG8gc2VlIHdoaWNoIGFyY2hpdGVj
dHVyZSBpdCB1c2VzLgotIEl0IHJlZHVjZXMgdGhlIGNoYW5jZSBvZiBjb25mbGljdHMgaWYgd2Ug
YmFja3BvcnQgb3RoZXIgY2hhbmdlcyB0byAKdGhlc2UgdGVzdHMgbGF0ZXIsIGFuZCBrZWVwcyBz
dXBwb3J0L3Rlc3RpbmcgY2xvc2VyIHRvIG1hc3Rlci4KLSBBcGFydCBmcm9tIHRoZSBjb21taXQg
bWVzc2FnZSwgd2hpY2ggaXMgY29uZnVzaW5nIGluIHRoZSBMVFMgY29udGV4dCwgCml0IGRvZXMg
bm90IGNoYW5nZSB0aGUgdGVzdCBhcyBCUjJfaTM4Nj15IGlzIGFscmVhZHkgdGhlIGRlZmF1bHQg
dGhlcmUuCi0gT24gbWFzdGVyLCBBRkFJQ1QgZXZlcnkgcnVudGltZSB0ZXN0IG5vdyBzZXRzIGl0
cyBhcmNoaXRlY3R1cmUgCmV4cGxpY2l0bHkuIENoZXJyeS1waWNraW5nIHRoaXMgb25lIChhbmQg
dGhlIG90aGVyIHNpbWlsYXIgb25lcykga2VlcHMgCnRoZSBMVFMgdGVzdHMgY29uc2lzdGVudCB3
aXRoIHRoYXQuCgpOb25lIG9mIHRob3NlIHJlYXNvbnMgcmVhbGx5IHJlcXVpcmUgaXQgdG8gYmUg
Y2hlcnJ5LXBpY2tlZCBidXQgCmNvbnNpZGVyZWQgdG9nZXRoZXIgSSBhZ3JlZWQgd2l0aCBUaG9t
YXMgUGVyYWxlJ3MgY29tbWl0IGFubm90YXRpb24gCigiTm90IG5lZWRlZCBidXQgZ29vZCB0byBo
YXZlIikgdGhhdCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaW5jbHVkZSBpdC4KCgpLaW5kIHJlZ2Fy
ZHMsCgpSYXBoYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
