Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27E9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8ACB401D8;
	Sun, 21 Nov 2021 20:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqztugfY3UyG; Sun, 21 Nov 2021 20:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF35140194;
	Sun, 21 Nov 2021 20:02:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235D61BF870
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D15980F29
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZcOrdszX94s for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:02:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A36A380F27
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:02:49 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w29so28666693wra.12
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 12:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G0XbCemyBvWbHbCRzz0FVOyrdJG2biukfHW/+xQapq0=;
 b=ipE72jAzx3qSVX/DJFOxHwM7pk41cOZcPM8LxUPZXY/CbGPINlufqMaB2UIoOZE/XV
 RN86OpV5A1PXbh1eE7VXKi1lzksYlJ72uv1GcCyoKOPYOKOcTlA244VjWjpa0nsu9WXS
 NS1JOXacJNedgF8ECeGRO0FmGoHQKWhVxzsUkTVxl0cJ4RA0vZZOq580XbGq460QRmTN
 i0ftrv6gxzbQ1bd//i8VR0BAZTUVrNG8bvUUA3YsAhWVGfha4m+i4QEuNQ9JRxKbo9Ei
 KKrhhnz2YKaHTVE3LDMd706awTvd5zE4jVfyTbZl/Mw24RDRkhxUo2PqigITxFeeCG1Q
 UpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G0XbCemyBvWbHbCRzz0FVOyrdJG2biukfHW/+xQapq0=;
 b=bLADbUu/z/OgUNcnH6sRPY/Bdm2CmjEvfKfa/K+LIs89+yCZx6DaEKwCedQdrngnIe
 RilXCNlPT4yAmkBJJzbs9ArsDoHrJgrFH5Erh3Wi4OahSpTHRgQY7EjBy5t0nXSBoal7
 DqrLETGMb0MaFfB7Do9WUWvG+LxdATV+O71hJGQHPm5C/v72e2pUCj5RLtrEtDZX6Jwn
 i2F3gqJO1PEAJiLMTxeR4YlU5MlvqfjLXDJJq+FcBgx6Myn8Yyovw9H1wFip6jBX5Gej
 M7uRdJrjRTdV9ME+9L2ThUn5/FGG4B4DCPP/eELkWfS2F0YEpRNgaBgr0tHesGDDbOY4
 jMvQ==
X-Gm-Message-State: AOAM5325YfdqnY3J2XARJ962OA+z/vMdKICrpdzevTie1EDGY9/MTgBG
 /HWYT/ZXI5uGza168NvjRrw=
X-Google-Smtp-Source: ABdhPJzRhuBUN73VKuDaO8jNyFXxFfXoPRHN97wMyJCZb0dJxTioklPIf8XpSB7qKkvQFrWj79IaiA==
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr30943589wrf.15.1637524967599; 
 Sun, 21 Nov 2021 12:02:47 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 38sm6876462wrc.1.2021.11.21.12.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 12:02:47 -0800 (PST)
Message-ID: <66122ac8-f802-d8e6-eae5-6288edaedc11@gmail.com>
Date: Sun, 21 Nov 2021 21:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20211120231007.1944130-1-yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211120231007.1944130-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH:LTS] gitlab-ci: update the image version
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDIxLzExLzIwMjEgw6AgMDA6MTAsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBXZSBnZXQgbmV3ZXIgQ0EgY2VydGlmaWNhdGVzLCB0byBnZXQgcmlkIG9mIHRoZSBh
bm5veWluZyBpc3N1ZXMgd2l0aCB0aGUKPiBub3ctZXhwaXJlZCBMZXQncyBFbmNyeXB0IHJvb3Qg
Y2VydGlmaWNhdGUuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtv
cnNnYWFyZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+Cj4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4K
PiAKPiAtLS0KPiBCZWZvcmUgYXBwbHlpbmcgdGhpcyBwYXRjaCwgZmlyc3QgY2hlY2sgdGhhdCB0
aGUgaW1hZ2UgaXMgYXZhaWxhYmxlCj4gb24gdGhlIERvY2tlciBodWIsIGFzIHB1c2hpbmcgNjUw
K01pQiB0YWtlcyBxdWl0ZSBzb21lIHRpbWUgb24gbXkKPiBEU0wgbGluZS4uLgoKVGVzdGVkLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+CgpodHRwczovL2dpdGxhYi5j
b20va3VidTkzL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy80MTMzNTA5NjEvZmFpbHVyZXMKCk1heWJl
IHdlIGNhbiBhbHNvIGJhY2twb3J0IHRoZSBwYXRjaCBzd2l0Y2hpbmcgdG8gdGhlIGdpdGxhYiBy
ZWdpc3RyeT8KaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAy
MS1Ob3ZlbWJlci82Mjg1MDIuaHRtbAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICAu
Z2l0bGFiLWNpLnltbCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdpdGxhYi1j
aS55bWwKPiBpbmRleCBlODVhYzMyMDMzLi42MTE5NGQ0YTU0IDEwMDY0NAo+IC0tLSBhLy5naXRs
YWItY2kueW1sCj4gKysrIGIvLmdpdGxhYi1jaS55bWwKPiBAQCAtMSw3ICsxLDcgQEAKPiAgIyBD
b25maWd1cmF0aW9uIGZvciBHaXRsYWItQ0kuCj4gICMgQnVpbGRzIGFwcGVhciBvbiBodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvcGlwZWxpbmVzCj4gIAo+IC1pbWFn
ZTogYnVpbGRyb290L2Jhc2U6MjAyMDA4MTQuMjIyOAo+ICtpbWFnZTogYnVpbGRyb290L2Jhc2U6
MjAyMTExMjAuMTkyNQo+ICAKPiAgc3RhZ2VzOgo+ICAgIC0gZ2VuZXJhdGUtZ2l0bGFiLWNpCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
