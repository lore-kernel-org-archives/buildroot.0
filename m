Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD4C7EE25
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A199C60FCB;
	Tue, 16 May 2023 13:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A199C60FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a6SUB-h-cFna; Tue, 16 May 2023 13:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEE2060A98;
	Tue, 16 May 2023 13:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEE2060A98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E37B1BF255
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75763418F3
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75763418F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xm-Hfap3klqh for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:54:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D254D415F1
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D254D415F1
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:54:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3093a7b71fbso278965f8f.2
 for <buildroot@buildroot.org>; Tue, 16 May 2023 06:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245280; x=1686837280;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7dBlqXgajPf6CR6QKr7ZNLnyMOrTdsNHTgiX7SDtgq4=;
 b=R5s05YeAmzJvgEVq0HFqWswOClsdpKqQeBGnVszTqx97zek5YPEnlupAJJRlwcC/PG
 HZjvokSFVtVM61wb3UXzeqYixmscA7XlrYD2gwS2YTahk9d6fseKyF87hruuDIb0NeB/
 IJQ1NlKFmgi1LOBywQ2XizdOJJWZqMHe2p95Z1T3NdwPookCnHN8mKA/dDkQeSkoJvNi
 qrOx7KzJ9X6kIhLiSHmmzjEOruRIFW5j0uCd2LVWAgHGxNQy5KCw0BYHR/ZpE0JgvXfv
 Z5+hzOjpZTw6umlUTX6nI+Uhbnklyh5+rpgvaXA73RKbB5IzTHtuHZs3kcSykm5DVh3I
 Eczw==
X-Gm-Message-State: AC+VfDwHTAa+x7g2f/bc+z+2/wrqd9EY5IsZ8NnxORzyiWC4cBmkbNuo
 lQMOqaeKSHLI1mM/OBHxK+ZGFA==
X-Google-Smtp-Source: ACHHUZ7NISOKPYxTPFVlJY7sDkfSSyCxzJxmI3Na0XoslxBoCIp/4gksnkDlQ9usDTCxc1/c8B7AJA==
X-Received: by 2002:adf:e448:0:b0:307:cb94:972f with SMTP id
 t8-20020adfe448000000b00307cb94972fmr14940429wrm.46.1684245279911; 
 Tue, 16 May 2023 06:54:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05600018d200b0030633152664sm2714043wrq.87.2023.05.16.06.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 06:54:39 -0700 (PDT)
Message-ID: <f4221169-a7d5-75b2-4d02-b1d09e847797@smile.fr>
Date: Tue, 16 May 2023 15:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
 <20230507214317.409305-5-bernd.kuhls@t-online.de>
 <ZGOASHQxkCfAJIl7@debian.me>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZGOASHQxkCfAJIl7@debian.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1684245280; x=1686837280;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7dBlqXgajPf6CR6QKr7ZNLnyMOrTdsNHTgiX7SDtgq4=;
 b=LYF5AYyOMRXFOUVaD6h/e2/CijImWAzYfdhl30cqg7ijCxqthWuEEpFBwR4UJP5Rar
 SeZyEZmq/nykMRtGXhLkb962kZL7rhlzQBHuWxPYX2AI8F9Oe2Mongv0VWasRP2lR8/W
 JI7rBLukjsaSOptwBjye7GFXZY6x1TCjhcPS0C3ijUy1NoO3vckIYjQaFqP+ftY/Z8lA
 a+RjCMScZChl9WTgPburaoHL487GQgaPzmQy53JxEBoqbpazc+VApzaw/SheG9VMtoUp
 KPZDV9pkH8lMvpQwIpTx1ZLYtWV5NBnUDtVtBTkCwScD3Vf6K90MJsOorHvXHqF8d86H
 C8qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=LYF5AYyO
Subject: Re: [Buildroot] [PATCH 5/5] package/gcc: add support for gcc 13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsCgpMZSAxNi8wNS8yMDIzIMOgIDE1OjA4LCBCYWdhcyBTYW5qYXlhIGEgw6lj
cml0wqA6Cj4gT24gU3VuLCBNYXkgMDcsIDIwMjMgYXQgMTE6NDM6MTdQTSArMDIwMCwgQmVybmQg
S3VobHMgd3JvdGU6Cj4+IGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTEzL2NoYW5nZXMuaHRtbAo+
PiBodHRwczovL2djYy5nbnUub3JnL2djYy0xMy9wb3J0aW5nX3RvLmh0bWwKPj4KPj4gUGF0Y2gg
MDAwMiB3YXMgbm90IHBvcnRlZCBmcm9tIGdjYy0xMiBiZWNhdXNlIGl0IGlzIGluY2x1ZGVkIGlu
IHRoaXMKPj4gdmVyc2lvbjoKPj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQvP3A9Z2NjLmdpdDth
PWNvbW1pdGRpZmY7aD1lZTRhZjJlZDBiNzMyMjg4NGVjNGZmNTM3NTY0NjgzYzM3NDliODEzCj4+
Cj4gCj4gVGhhbmtzIGZvciB0aGUgYnVtcCEgRm9yIGNvbXBsZXRlbmVzcywgZXNwZWNpYWxseSBm
b3IgcGVvcGxlIHVzaW5nCj4gQnVpbGRyb290LWdlbmVyYXRlZCB0b29sY2hhaW4gYXMgZXh0ZXJu
YWwgb25lLCB5b3UgbmVlZCB0byBhbHNvIGFsbG93Cj4gZXh0ZXJuYWwgR0NDIDEzIHRvb2xjaGFp
bnMgKGFzIHNlcGFyYXRlIHBhdGNoIG9mIGNvdXJzZSk6CgpJIGhhZCBhIHBlbmRpbmcgcGF0Y2gg
c2VyaWVzIGZvciBnY2MgMTMuMSBidW1wIHdpdGggc3BsaXRlZCBjb21taXRzLgpBbHNvIEkgZm91
bmQgYW4gaXNzdWUgb24gUklTQ1YgSSBmaXhlZC4KCk5vdGU6IHRoZSBlbGYyZmx0IGlzIGJyb2tl
biBhbmQgSSBkb24ndCBoYXZlIHRoZSB0aW1lIHRvIGxvb2sgYXQgdGhlIGlzc3VlLgoKSSBob3Bl
IHRoaXMgaGVscC4KCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL3Rvb2xjaGFpbnMt
YnVpbGRlci8tL3BpcGVsaW5lcy84NTI5NTA5MTEKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAK
PiAtLS0tID44IC0tLS0KPiBGcm9tIDBmMTJlYTE1MzZkOGYxYzA4MTIwM2JlZTY0YjljODQxM2Nj
ZTM4MDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gRnJvbTogQmFnYXMgU2FuamF5YSA8YmFn
YXNkb3RtZUBnbWFpbC5jb20+Cj4gRGF0ZTogVHVlLCAxNiBNYXkgMjAyMyAyMDowMzo1OCArMDcw
MAo+IFN1YmplY3Q6IFtQQVRDSF0gdG9vbGNoYWluLWV4dGVybmFsOiBTdXBwb3J0IEdDQyAxMwo+
IAo+IFN1cHBvcnQgZXh0ZXJuYWwgdG9vbGNoYWlucyB1c2luZyBHQ0MgMTMueC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdtYWlsLmNvbT4KPiAtLS0KPiAg
Li4uL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20vQ29uZmlnLmluLm9wdGlvbnMgICAgICAgICAg
ICAgICB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvdG9vbGNoYWluLWV4dGVybmFs
LWN1c3RvbS9Db25maWcuaW4ub3B0aW9ucyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwv
dG9vbGNoYWluLWV4dGVybmFsLWN1c3RvbS9Db25maWcuaW4ub3B0aW9ucwo+IGluZGV4IDBmZDg4
NDFlNWIuLjRkYTA3NTY2ZDggMTAwNjQ0Cj4gLS0tIGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRl
cm5hbC90b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9tL0NvbmZpZy5pbi5vcHRpb25zCj4gKysrIGIv
dG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC90b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9tL0Nv
bmZpZy5pbi5vcHRpb25zCj4gQEAgLTMxLDYgKzMxLDEwIEBAIGNob2ljZQo+ICAJICBTZXQgdG8g
dGhlIGdjYyB2ZXJzaW9uIHRoYXQgaXMgdXNlZCBieSB5b3VyIGV4dGVybmFsCj4gIAkgIHRvb2xj
aGFpbi4KPiAgCj4gK2NvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0dDQ18xMwo+ICsJYm9v
bCAiMTMueCIKPiArCXNlbGVjdCBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMwo+ICsKPiAg
Y29uZmlnIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfR0NDXzEyCj4gIAlib29sICIxMi54Igo+ICAJ
c2VsZWN0IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
