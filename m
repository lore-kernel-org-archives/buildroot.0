Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09E3C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 19:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A43060E64;
	Sun, 29 May 2022 19:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GT7sRT1e0JJK; Sun, 29 May 2022 19:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775EC60DB7;
	Sun, 29 May 2022 19:29:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3196C1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F5BA60DB7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ybdc7Tkxff-S for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 19:29:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3602760D66
 for <buildroot@buildroot.org>; Sun, 29 May 2022 19:29:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q7so1147024wrg.5
 for <buildroot@buildroot.org>; Sun, 29 May 2022 12:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4cfaVBWOb0jamMmQqHFbvc7GsQ1xOhN0/NNe/DYwgd0=;
 b=bNAHqjwSlxD/3OxoxVinPgAshTQZ9PVJVcs/U0AwlooEeizFobvUS4DdUmbYbopVkF
 t59AtoqvET5+JQ3Ma5l62xQ+GmjRKkduGXSOiFAXpYewPOpEj5Icqs/lrIA/wAwtZtLA
 oR0zd3w9Pnfjf4Tli8IhMOec8EpQUK9CvHBF/FP6yIEGGijSwufI7KcB1vQX3RxKsg6P
 QQkuEqVe1w+NeAya9gmrqspM9EydgGZqrZLGowoztHKcxQYp6ChbPFziU0IEPQ5Er8Ly
 77LUhFu9eNqahxGiPlcn1wstjtRMbQKIYSA8+8NpXvlaNjapyUgHubY1OtoJAYLhCXPP
 dzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4cfaVBWOb0jamMmQqHFbvc7GsQ1xOhN0/NNe/DYwgd0=;
 b=SqRXn9z+t/Atq0xYM6b8sT2daDXD9blK3EgA7GcMn8ej26T6tsgXmnvhOvmQLNSDy2
 cSwdIm/0QxXNI6WqqeV8UcIexqKkzIExf59fKFpo1Omie3pV6NuGwbctX21A2sDdq4ID
 ksRFyorBHlkvzWHsYtnIDdoxexgal6rX37vad2ij9ezLhjOP8d7xK4lhzD31wzSd9Gkr
 naXt3tI6jPyAGkv4U1mbbGoSAumBsMQVuFtlsswyWTomGYW1x+f9UzBHVE96M65jFt+w
 ZD7xNMjRvnvn01tcZ/uGkelSuMbhaUMExesQcGFgkep0XjXIIJ/Q/HcJs2tLJ+nSlnod
 0VUg==
X-Gm-Message-State: AOAM532DziHdz3oWwpjKjSsoiGDcSeDbgMl3KGo/ok7BOSfj0Xv4QZyP
 JoLl9A9IfgdqMmyKjqulPHA=
X-Google-Smtp-Source: ABdhPJzPMriCpWjACXqaiPeOr1JfTXqZCp7KyvUnDjpcdV+F2d14vRsnWjiwrr0GIf0xznLH2lU5yQ==
X-Received: by 2002:a5d:5642:0:b0:210:ca:cd9 with SMTP id
 j2-20020a5d5642000000b0021000ca0cd9mr18186526wrw.63.1653852575206; 
 Sun, 29 May 2022 12:29:35 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003973ea7e725sm10869407wmq.0.2022.05.29.12.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 12:29:34 -0700 (PDT)
Message-ID: <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
Date: Sun, 29 May 2022 21:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220517200923.1516695-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAxNy8wNS8yMDIyIMOgIDIyOjA5LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IExpY2Vuc2UgaGFzaCBjaGFuZ2UgZHVlIHRvIGxpY2Vuc2UgdGl0bGUgc3ludGF4
IGNoYW5nZToKPiBodHRwczovL2dpdGh1Yi5jb20vcGFsbGV0cy9mbGFzay9jb21taXQvOWU3ZDNh
NmI2OTRiMjdmOTk3MjY2ODg5YWU0NjNlMDZkZDgzYTE4OQoKVGhpcyBwYXRjaCBhbG9uZyB3aXRo
IHB5dGhvbi13ZXJremV1ZyB2ZXJzaW9uIGJ1bXAgWzFdIGZpeGVzIHRoZQp0ZXN0cy5wYWNrYWdl
LnRlc3RfcHl0aG9uX2ZsYXNrLlRlc3RQeXRob25QeTNGbGFzayBidWlsZCBpc3N1ZSBpbiBnaXRs
YWItY2kgWzJdLgoKVGhpcyB0ZXN0IGZhaWwgc2luY2UgdGhlIHB5dGhvbi1qaW5qYTIgdmVyc2lv
biBidW1wIDMuMS4yIFszXS4KCkRvIHlvdSBrbm93IGlmIGJ1bXBpbmcgcHl0aG9uLWZsYXNoIGFu
ZCBweXRob24td2Vya3pldWcgbWF5IGludHJvZHVjZSBvdGhlcgpydW50aW1lIGlzc3VlPyBJcyBh
bnkgZm9sbG93dXAgdmVyc2lvbiBidW1wIHJlcXVpcmVkPwpJcyByZXZlcnRpbmcgcHl0aG9uLWpp
bmphMiBzYWZlPwoKVGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5j
b20+CgpbMV0KaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3Bh
dGNoLzIwMjIwNTE3MjAxMjQ5LjE1MTgzNTgtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwpb
Ml0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8yNDkx
MzIxMjkxClszXSBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8y
MDIyLU1heS82NDI5NDIuaHRtbAoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4g
IHBhY2thZ2UvcHl0aG9uLWZsYXNrL3B5dGhvbi1mbGFzay5oYXNoIHwgMTMgKysrKysrLS0tLS0t
LQo+ICBwYWNrYWdlL3B5dGhvbi1mbGFzay9weXRob24tZmxhc2subWsgICB8ICA0ICsrLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZsYXNrL3B5dGhvbi1mbGFzay5oYXNoIGIvcGFja2Fn
ZS9weXRob24tZmxhc2svcHl0aG9uLWZsYXNrLmhhc2gKPiBpbmRleCBjNmNjZDYzM2Y4Li41ZjE5
YTQ1MGExIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWZsYXNrL3B5dGhvbi1mbGFzay5o
YXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tZmxhc2svcHl0aG9uLWZsYXNrLmhhc2gKPiBAQCAt
MSw3ICsxLDYgQEAKPiAtIyBGcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9GbGFzay8jY29w
eS1oYXNoLW1vZGFsLTkxMWZmYjY3LWZlODQtNGUyNS1hMWE5LWY0Yzc0NWEwYTk4MAo+IC1tZDUg
IDBkYTQxNDVkMTcyOTkzY2QyOGE2YzYxOTYzMGNjMTljICBGbGFzay0xLjEuMi50YXIuZ3oKPiAt
c2hhMjU2CTRlZmExYWUyZDdjOTg2NWFmNDg5ODZkZThhZWI4NTA0YmYzMmM3ZjNkNmZkYzkzNTNk
MzRiMjFmNGIxMjcwNjAgIEZsYXNrLTEuMS4yLnRhci5nego+IC0KPiAtIyBMaWNlbnNlIGZpbGVz
Cj4gLXNoYTI1Ngk0ODlhOGUxMTA4NTA5ZWQ5OGEzN2JiOTgzZTExZTBmN2UxZDMxZjBiZDhmOTlh
NzljODQ0OGU3ZmYzN2QwN2VhICBMSUNFTlNFLnJzdAo+IC1zaGEyNTYJMGVmM2FlMDI1ZjRhMzk4
NzYxMDc5ZjBkNjg3ZmYzZDY2ZjRmZWYzYTMyYWMyNjA3MzE4ZTkwOWMwY2JhOTE1MCAgZG9jcy9s
aWNlbnNlLnJzdAo+ICsjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2Zs
YXNrL2pzb24KPiArbWQ1ICA5M2YxODMyZTViZTcwNGVmNmZmMmE0MTI0NTc5Y2Q4NSAgRmxhc2st
Mi4xLjIudGFyLmd6Cj4gK3NoYTI1NiAgMzE1ZGVkMmRkZjhhNjI4MTU2N2VkYjI3MzkzMDEwZmUz
NDA2MTg4YmFmYmZlNjVhMzMzOWQ1Nzg3ZDg5ZTQ3NyAgRmxhc2stMi4xLjIudGFyLmd6Cj4gKyMg
TG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gK3NoYTI1NiAgNDg5YThlMTEwODUw
OWVkOThhMzdiYjk4M2UxMWUwZjdlMWQzMWYwYmQ4Zjk5YTc5Yzg0NDhlN2ZmMzdkMDdlYSAgTElD
RU5TRS5yc3QKPiArc2hhMjU2ICA3NTM1ZWFjNTEzZWRkMTJmYjhlMzNmMjAzYzZhNDAzNTQ5NjI5
ZTM0YjM2MzQxOGNkYmQ2YzZlYTU0NjQ1MTVkICBkb2NzL2xpY2Vuc2UucnN0Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLWZsYXNrL3B5dGhvbi1mbGFzay5tayBiL3BhY2thZ2UvcHl0aG9u
LWZsYXNrL3B5dGhvbi1mbGFzay5tawo+IGluZGV4IDA3N2FhNjAwYjguLmI2ODRhZmY0ODAgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tZmxhc2svcHl0aG9uLWZsYXNrLm1rCj4gKysrIGIv
cGFja2FnZS9weXRob24tZmxhc2svcHl0aG9uLWZsYXNrLm1rCj4gQEAgLTQsOSArNCw5IEBACj4g
ICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVBZVEhPTl9GTEFTS19WRVJTSU9O
ID0gMS4xLjIKPiArUFlUSE9OX0ZMQVNLX1ZFUlNJT04gPSAyLjEuMgo+ICBQWVRIT05fRkxBU0tf
U09VUkNFID0gRmxhc2stJChQWVRIT05fRkxBU0tfVkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9G
TEFTS19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzRlLzBi
L2NiMDIyNjhjOTBlNjc1NDVhMGUzYTM3ZWExY2EzZDQ1ZGUzYWNhNDNjZWI3ZGJmMTcxMmZiNTEy
N2Q1ZAo+ICtQWVRIT05fRkxBU0tfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9y
Zy9wYWNrYWdlcy9kMy8zYy85NGYzOGQ0ZGI5MTlhOTMyNmE3MDZhZDU2ZjA1YTdlNmYwYzhmN2I3
ZDkzZTI5OTdjY2E1NGQzYmMxNGIKPiAgUFlUSE9OX0ZMQVNLX1NFVFVQX1RZUEUgPSBzZXR1cHRv
b2xzCj4gIFBZVEhPTl9GTEFTS19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gIFBZVEhPTl9GTEFT
S19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5yc3QgZG9jcy9saWNlbnNlLnJzdAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
