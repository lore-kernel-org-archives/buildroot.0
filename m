Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98912C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB3360DBF;
	Mon, 29 Jun 2026 21:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O31Gvk4Rbk_L; Mon, 29 Jun 2026 21:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E52060E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782766988;
	bh=/LvAwZQR0+uY4NgieQuBk52+VdoIUFhZmEpRTxTFBgw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Ohy+WCnQpDpVi8hFF/1NZWXUY/diuIQE87nwHRwoV5t4Z1u6Pu3lYAwB8iFIWCepF
	 suSDArDd/e2e4+Vo2P1BIEncFBpgXhpN+iNM11i7+n6a9IV90WuvJ+WQ8qN2jzle6q
	 oOkG94ZG/86ErROw24U11vUlW8k1ZZfm9kEb+dSKu39xpGksGzRDJuDDaC/HrArmru
	 W1kwOApxg9Q5cSkth7lchqRu2yLn0OvAgKPMMWbrhKsCR8bz7gla9ft1EYeSYLdl8X
	 02uWnFwHXKIYFnTiDZuDceb51MkXO/YxsQoAbVioYgwwI6vi27la1yaIDjjIAHnDNc
	 0lN3jmweaxDYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E52060E68;
	Mon, 29 Jun 2026 21:03:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CE1D149
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31676821E9
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0tzS9vcw0dq for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4600A8217B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4600A8217B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4600A8217B
 for <buildroot@uclibc.org>; Mon, 29 Jun 2026 21:03:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493ba701891so94765e9.3
 for <buildroot@uclibc.org>; Mon, 29 Jun 2026 14:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782766984; x=1783371784;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3hUw0YICWIJV3lznMtvKvnO33YHoRo+1+eB9NjtQLtE=;
 b=f5d/HD66teXuHvHhGHk2vow+YLZGk4ex5n9zMsNhPu+brXsPj2X24j3WryPqOGcbph
 VNvtXFshn/bED55yqcuvVKuftxDriwn4CdI3SJkqUIXSyssvXT061nHBZTabL+v8/SDo
 h7PmOVXxqxxbptCnS1jhcVicFFZDy3JTlE7vFowAVPwXHPlSZegsRBBCTcmnmYQnQwYP
 7d53aZANqqq+nxOX9ba9MaH8a1+QngG0Os7MG50t/sBclBJIbIg3ZBIq8PwK4PaWEo3b
 s+INFBrRO/NygUY0gqYG0Eq/pNKf6YfPt20eUrsuqU5FbWyL1KO55mx8JdXjf5KhkY9o
 VqvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+TYwD75ADMz33AvgDejw0foExLMxnNMHId78C5LgbK8/msFQCJ5XR4CL0NCxYOq4VgGof9wgz2MAA=@uclibc.org
X-Gm-Message-State: AOJu0YxWmjvvVDjL7ho3pyadPWwYQQ2z2JVH1pSKeb0/O28eAL6TMrJK
 0LPWJLPDFlD+/V5Z0h0KTDbWFNxMf981QZp92r26zAWeW174F1uvM8KJONzgcV/Ncw8=
X-Gm-Gg: AfdE7cknDo3q7L3QRz82tHP3DIDJ9gpe+YLNdcYrdRPxdHempl1XT4XuxKGmUns+QHm
 skvMlqidg4vj+VQSpd2k3d3dkqUbK0GXg/eRuWlmlYXLFVMLvTCv9ghP0Q8whPJ8wauFv4wcnz2
 PrBVpcz5V9w32tX4z3v+rk8p0MhdKtx2lzLP4+1PI5OCfBrQh5aJware+Gx3nv6+sWuE9+0aFJd
 zy65iaZI6XUowVGYnJFUvXNP7pLvjmlwbsJrzSfI8ziBlGzIKTc5Fq5OXFjgZZRkYKl66WMncze
 xLRk+iNTHouEK8oJQ9LPGXrdsF/gk03buciMLBz6D+q4KsCpAkEgfmdpUsQrh1qAKSAhHXClGAe
 mruzfQNs/ITMLR+NKe2qxOegpk3Xz7745k9b+tEPRC5xUnwTp5Q3U2g7Wh1MvreojQ1lCjkc6T4
 pfjlakEGeIuyzP0zUQ1ZozNJcomNlKeHX7luEdzUV+r1u3d6i4RofXlJbMruZbrfNtjjGsSeqL6
 toLmbxCWba2ggH8G/lcPRHD9U4yio6UZpS8S/sKtcnSdxTSZvLC9TQ=
X-Received: by 2002:a05:600c:4e50:b0:492:6fea:969c with SMTP id
 5b1f17b1804b1-493b8148442mr17341885e9.0.1782766984188; 
 Mon, 29 Jun 2026 14:03:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4756636cf1asm1032181f8f.18.2026.06.29.14.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 14:03:02 -0700 (PDT)
Message-ID: <382a70ee-a73f-485c-95ed-822f04135349@smile.fr>
Date: Mon, 29 Jun 2026 23:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org
References: <20260627064155.1938273-1-bernd@kuhls.net>
 <c145e709-580f-447e-99c3-03bab062cf7f__16883.8836414338$1782762233$gmane$org@smile.fr>
 <pan$490ec$abd6358e$72d9a434$58d2a609@ID-313208.user.individual.net>
Content-Language: fr, en-US
In-Reply-To: <pan$490ec$abd6358e$72d9a434$58d2a609@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782766984; x=1783371784; darn=uclibc.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3hUw0YICWIJV3lznMtvKvnO33YHoRo+1+eB9NjtQLtE=;
 b=ZxB9xmNIvqSbiI2eEB/IgpURYU/AKKYNcSkgIDhoQwmOtAuXXy42IEzVu97doOMmdY
 CwsLta2r6ESvalmB/0ZNuPpITgAPeMEwP+XCZcqBwT/Wo4wkwNgIQANdeu6Efn41trZs
 PQN1N+doELhLrqMey4yNaH5Ubd088cqxxdS4w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ZxB9xmNI
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: bump 15.x series to 15.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsIEFsbCwKCkxlIDI5LzA2LzIwMjYgw6AgMjI6NDQsIEJlcm5kIEt1aGxzIGEg
w6ljcml0wqA6Cj4gQW0gTW9uLCAyOSBKdW4gMjAyNiAyMTo0MzoxMyArMDIwMCBzY2hyaWViIFJv
bWFpbiBOYW91ciB2aWEgYnVpbGRyb290Ogo+IAo+Pj4gUmVtb3ZlZCBwYXRjaGVzIHdoaWNoIGFy
ZSBpbmNsdWRlZCBpbiB0aGlzIHJlbGVhc2UsCj4+PiByZW51bWJlcmVkIHBhdGNoIDAwMDMuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPj4KPj4g
U2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLiBUaGFua3MuCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4g
Um9tYWluCj4gCj4gSGkgUm9tYWluLAo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvCj4gMjAyNjA2MjcwNjQxNTUuMTkzODI3My0xLWJlcm5k
QGt1aGxzLm5ldC8KPiAKPiBjb250YWlucyB0d28gcmVuYW1lczoKPiAKPiAgcmVuYW1lIHBhY2th
Z2UvZ2NjL3sxNS4yLjAgPT4gMTUuMy4wfS8wMDAxLWRpc2FibGUtc3BsaXQtc3RhY2stZm9yLW5v
bi0KPiB0aHJlYWQtYnVpbGRzLnBhdGNoICgxMDAlKQo+IAo+ICByZW5hbWUgcGFja2FnZS9nY2Mv
ezE1LjIuMC8wMDAzLWdjYy1jb25maWctbWljcm9ibGF6ZS1maXgtaXJhLWZvci0KPiBHQ0MxNS5w
YXRjaCA9PiAxNS4zLjAvMDAwMi1nY2MtY29uZmlnLW1pY3JvYmxhemUtZml4LWlyYS1mb3ItR0ND
MTUucGF0Y2h9IAo+ICgxMDAlKQo+IAo+IEJvdGggb2YgdGhlbSB3ZXJlIG5vdCBhcHBsaWVkIHdp
dGggeW91ciBjb21taXQ6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vY29tbWl0Lwo+IGY4ZjZiY2VjMGY1MjM1MTBhMjI4ODJlNDM5MTk5OWJlODFkYzBlOTQK
PiAKPiBUaGUgZGlyZWN0b3J5IHBhY2thZ2UvZ2NjLzE1LjMuMC8gZG9lcyBub3QgZXZlbiBleGlz
dCBhbmQgdGhlIGJ1aWxkcm9vdCAKPiBwaXBlbGluZXMgYXJlIGZhaWxpbmc6Cj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNTA5MDgxNjU3MAo+IAo+
IC5jaGVja3BhY2thZ2VpZ25vcmU6MzUzOiBpZ25vcmVkIGZpbGUgcGFja2FnZS9nY2MvMTUuMy4w
LzAwMDEtZGlzYWJsZS0KPiBzcGxpdC1zdGFjay1mb3Itbm9uLXRocmVhZC1idWlsZHMucGF0Y2gg
aXMgbWlzc2luZwoKSSBoYWQgYW4gaXNzdWUgd2hpbGUgYXBwbHlpbmcgeW91ciBwYXRjaCBmcm9t
IHBhdGNod29yaywgeW91ciBwYXRjaCBnb3QKY29ycnVwdGVkIGJ5IHBhdGNod29yayBzb21laG93
LgpJIGFwcGxpZWQgbWFudWFsbHkgdGhlIHBhdGNoIGZpeGluZyB0aGUgZ2l0IGFtIGlzc3VlLgoK
QnV0IGluZGVlZCB0aGUgdHdvIHBhdGNoZXMgZm9yIDE1LjMuMCBpcyBzdGlsbCBpbiBteSB3b3Jr
IGRpcmVjdG9yeToKMDAwMS1kaXNhYmxlLXNwbGl0LXN0YWNrLWZvci1ub24tdGhyZWFkLWJ1aWxk
cy5wYXRjaAowMDAyLWdjYy1jb25maWctbWljcm9ibGF6ZS1maXgtaXJhLWZvci1HQ0MxNS5wYXRj
aAoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gUmVnYXJkcywgQmVybmQKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
