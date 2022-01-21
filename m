Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D39AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 16:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E2FA402EB;
	Fri, 21 Jan 2022 16:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yt9Rtt3FrSTP; Fri, 21 Jan 2022 16:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB51409D5;
	Fri, 21 Jan 2022 16:44:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB6391BF2CB
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 16:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D78C2408A1
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 16:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnJo5Yuiho27 for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 16:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB8BD40897
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 16:44:02 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id f21so1008224ljc.2
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 08:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=VIb6G4xqNaIfSQQ0as1KZiJde23u7hLzmeIda3uYp0w=;
 b=eit8aNsnVDWvgrpsRKghsGIARWnyn5f0AH7WDGb49gA74VgihoQKuAhhiYDwF3fGaK
 yKyEEofuWhvUAaPRq/EWNRwhJyrXRnuUkdXpgJaonzS6tO+siMiwY8PBS1x5F+l2aRiT
 Xcv7iHRVy69ekmqC4B9SWu6atwMDujadGArU9ML8I/qsQTYHtffrbLTGwp4s/EZEAKf8
 c81g0JI6WD/ZN2tQMBMBRj0DQNwmz/zBztLQpLgyKQizSD5kaoOWmNuuqnyUAhxebSA6
 Dbyi621l45F0L2zl6aoFwNitMHPDBM3Ic3o7RndOus0Z8gS5b2p8rF1/INXZQ05Pb0SS
 3UtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VIb6G4xqNaIfSQQ0as1KZiJde23u7hLzmeIda3uYp0w=;
 b=7WN8at6yTQDrR44mPEaygd+me0atwtt6W9rkSFhXx1qJfn1lofIw/oEqZqnLDaFlUy
 JQO9Y09OpL0APQoos78ugd/MCCHWoCzxE56AlvrBY0JtvI2s1zzXO13R4J6FsSX0Aicu
 OIAzBX+df9iNm4iUi84evFHigweNcgw6KxIsNpCoZuL27WxCiVibDLAnXk5YjL4qKwKw
 IKgpC1bguAtNntq/nB5rEY1NPQvI7CmSmTzBgaQtob+9816QfI4E2FqA/CHdTGRihnsC
 qTjH9lmzP4jCZDxLXXJduyfxSlyO7Yj4dqrYLqdLo7eaP5WWH4mj+vm+8GBOBMx6m32Y
 A1LQ==
X-Gm-Message-State: AOAM531RwHJMC9ANspl6kXZNd887BKShVGxHmz0CnaMX7mrYSc0QJzt/
 v3S17sy93mLGuHpdmxbcDNo2uXMmIVY=
X-Google-Smtp-Source: ABdhPJydKI5cX1gMH89ccX92dAO9V5gqanRfWoLxUoV+1EAgR8+45ezYM6Pw5qmQDQ8PmqQizhGitQ==
X-Received: by 2002:a2e:9787:: with SMTP id y7mr3667743lji.213.1642783440765; 
 Fri, 21 Jan 2022 08:44:00 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id q5sm305384lfg.77.2022.01.21.08.44.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 08:44:00 -0800 (PST)
Message-ID: <1a005bda-86ec-be3d-72b8-153566669f14@gmail.com>
Date: Fri, 21 Jan 2022 19:43:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: buildroot@buildroot.org
References: <2ba595af-2fe2-bcfd-5c3f-f3b7b77cbef9@benettiengineering.com>
 <20220121103302.1488436-1-giulio.benetti@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20220121103302.1488436-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to latest
 version to fix Linux >= 5.13 building
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MjEuMDEuMjAyMiAxMzozMywgR2l1bGlvIEJlbmV0dGkg0L/QuNGI0LXRgjoKPiBQZW5kaW5nIFBS
IGlzIG5vdyBtZXJnZWRbMV0gYW5kIGl0IGZpeGVzIExpbnV4ID49IDUuMTMgYnVpbGRpbmcuIFNv
IGxldCdzCj4gYnVtcCB4cjgxOS14cmFkaW8gdmVyc2lvbi4KPiAKPiBbMV06IGh0dHBzOi8vZ2l0
aHViLmNvbS9maWZ0ZWVuaGV4L3hyYWRpby9wdWxsLzE1Cj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0t
Cj4gICBwYWNrYWdlL3hyODE5LXhyYWRpby94cjgxOS14cmFkaW8uaGFzaCB8IDQgKystLQo+ICAg
cGFja2FnZS94cjgxOS14cmFkaW8veHI4MTkteHJhZGlvLm1rICAgfCAyICstCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS94cjgxOS14cmFkaW8veHI4MTkteHJhZGlvLmhhc2ggYi9wYWNrYWdlL3hyODE5
LXhyYWRpby94cjgxOS14cmFkaW8uaGFzaAo+IGluZGV4IGVmZmY5MmFiN2QuLjRhNzdkYjBkMWEg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94cjgxOS14cmFkaW8veHI4MTkteHJhZGlvLmhhc2gKPiAr
KysgYi9wYWNrYWdlL3hyODE5LXhyYWRpby94cjgxOS14cmFkaW8uaGFzaAo+IEBAIC0xLDQgKzEs
NCBAQAo+ICAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiA1OTAwODIxYTc3N2I5MDA4ZDdj
ZjliODEyOGUwY2I3NWE0NjIzZWNiNjA4YjQ1NDM4ZTE3YzdhMDU2Y2RlMWJmIHhyODE5LXhyYWRp
by02YmYwZTJlMjFjODA0NTZlMmEzZDRhZDEyNjdjYWVjZGU3MTY1ODcxLnRhci5nego+ICtzaGEy
NTYgIDA2YjkxYjFmY2Y5OGEyNjExMjViNGQ1OTlmZmNjZTI0NThmYjlkMGMxZjM4YTRiZDQzMmE2
MjJiNDQ2ZjBmNTEgIHhyODE5LXhyYWRpby0xNjE4MGI2MzA4ZTNjNWRjNDJhOTJhNjYzYWRmNjY5
MDI4MDg3ZmY3LnRhci5nego+ICAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1NiBkYjI5NmYy
ZjdmMzViY2EzYTE3NGVmYjBlYjM5MmIzYjE3YmQ5NGIzNDE4NTE0MjlhM2RmZjQxMWIxYzJmYzcz
IExJQ0VOU0UKPiArc2hhMjU2ICBkYjI5NmYyZjdmMzViY2EzYTE3NGVmYjBlYjM5MmIzYjE3YmQ5
NGIzNDE4NTE0MjlhM2RmZjQxMWIxYzJmYzczICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UveHI4MTkteHJhZGlvL3hyODE5LXhyYWRpby5tayBiL3BhY2thZ2UveHI4MTkteHJhZGlvL3hy
ODE5LXhyYWRpby5tawo+IGluZGV4IGMxZmUzMjk1YjYuLjVmNjBiZTg4N2MgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS94cjgxOS14cmFkaW8veHI4MTkteHJhZGlvLm1rCj4gKysrIGIvcGFja2FnZS94
cjgxOS14cmFkaW8veHI4MTkteHJhZGlvLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLVhSODE5X1hSQURJT19WRVJTSU9OID0gNmJm
MGUyZTIxYzgwNDU2ZTJhM2Q0YWQxMjY3Y2FlY2RlNzE2NTg3MQo+ICtYUjgxOV9YUkFESU9fVkVS
U0lPTiA9IDE2MTgwYjYzMDhlM2M1ZGM0MmE5MmE2NjNhZGY2NjkwMjgwODdmZjcKPiAgIFhSODE5
X1hSQURJT19TSVRFID0gJChjYWxsIGdpdGh1YixmaWZ0ZWVuaGV4LHhyYWRpbywkKFhSODE5X1hS
QURJT19WRVJTSU9OKSkKPiAgIFhSODE5X1hSQURJT19MSUNFTlNFID0gR1BMLTIuMAo+ICAgWFI4
MTlfWFJBRElPX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCgpUZXN0ZWQtYnk6IFNlcmdleSBLdXpt
aW5vdiA8a3V6bWlub3Yuc2VyZ2V5ODFAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
