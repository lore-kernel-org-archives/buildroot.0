Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD74C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 171A6409CF;
	Sun, 28 Jan 2024 21:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171A6409CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SCu2DHAN7nj; Sun, 28 Jan 2024 21:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29759409E7;
	Sun, 28 Jan 2024 21:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29759409E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 366CF1BF3CB
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EBC2409E7
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 21:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBC2409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NTmo0QsRlmO for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 21:35:47 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D31CA409CF
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 21:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D31CA409CF
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf0390eddbso23225021fa.3
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706477744; x=1707082544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=glOLh04tbXzG7+XcuVfXXJkirA63qmSJcD6uMwolF5I=;
 b=dqKY+PJKXKPhB4CBQQS6ylK3nznqq/qsGSKvei7NQ1bYVRIZne78vdsulZzIxHkGYN
 fn5Ggj2Gmp0FASyYbFGogik8MlSMxWxtN18Kl0BVHsNWBtp0KnsVDjfVO0bbwdNCl/Za
 P7YR9FKo/T9dB9Hng0nFC/o+0BVyQwCUZHaPY9YVWDUwtiP7LdbXwyIALGUkOgbx2Y5X
 SaTpS9vbIziLrLhj8EZVoRXJtwh+wVrAXjWFyvVrQYNdgwzY8ERVvrEz116c1ExCu+Ci
 MRSg9Qi6kif2CHSSbg0qTJyoFbm6Y+wrdUDgH9seWp2uhvMPIwBFx2+RClF+jEuDAhlo
 8Xpw==
X-Gm-Message-State: AOJu0Yzoac+yO4e+U5WwVjrX8tq+rcIFYMzwReGt4QA0ZE6qvfjkj6PE
 cjU8F69pHJlmpnFK08j47Yhqp7nHQxOU/SaAeomfDOEkPUXxGEowqe7kiwibfKb1a0/jGitlobs
 g/vI2AW+HBmdCp+UC9qf6scTSTVQ2DQBW
X-Google-Smtp-Source: AGHT+IFGDTUd24pXtg0oQ6lW+KyfqwDuJV1QjRv5uFUJyT/62EjLEFodyXRKC39paM58ULUPltD2G5sEVP7NZUMeDwg=
X-Received: by 2002:a05:651c:1423:b0:2cd:8f26:a1e9 with SMTP id
 u35-20020a05651c142300b002cd8f26a1e9mr2147105lje.37.1706477743658; Sun, 28
 Jan 2024 13:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20231011072701.1014328-1-yegorslists@googlemail.com>
In-Reply-To: <20231011072701.1014328-1-yegorslists@googlemail.com>
Date: Sun, 28 Jan 2024 22:35:30 +0100
Message-ID: <CAGm1_kt1Y+vKVtdu_BMP_zu9a=+uS4wogzy3pC4i9=fV8-3YJA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1706477744; x=1707082544; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=glOLh04tbXzG7+XcuVfXXJkirA63qmSJcD6uMwolF5I=;
 b=RBF9sd5tQ0NBAT/ATCq3knC45yt1SDLTi74Q0OYzp8LrRlfB/vAfsuamH+qIG/AD9H
 qGkGc5npyfNJPTUM1HdRlCjspUWoNQg67YZ/iXCfSQlw5CfjLDOPzyUgwSbcQlrb/Mh1
 yWa499ENI850vbzLqCbb+O0t/wlkXNprELgKKkWekiNixszm95rZbTjddj+ZrbKoxPJ2
 LYYPPnFsGxUNXFFmjJGUwQuQ03AmomZNfZ71GJ7Gw0I1cGS7K6LPWakY6Fg7e6+BuLgu
 MZa17HQSIREqAXzxELCd4dFxW0O8AI/3IwilI8hlD3cG/tn0UDt6CAmGAkKyWFUJ7HXj
 5mnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RBF9sd5t
Subject: Re: [Buildroot] [PATCH] python-configobj: new package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxsLAoKT24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgOToyN+KAr0FNIDx5ZWdvcnNsaXN0c0Bn
b29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlz
dHNAZ29vZ2xlbWFpbC5jb20+Cj4KPiBweXRob24tY29uZmlnb2JqIHBhY2thZ2Ugd2FzIHJlbW92
ZWQgaW4KPiA4ZDI2NGE5NjE3MmNmYTFjMWY1MTVkMTE2MGI5MjFjMDEzZmEzYmQ3IGJlY2F1c2Ug
b2YgdGhlIG1pc3Npbmcgc3VwcG9ydAo+IGZvciBQeXRob24gMy54Lgo+Cj4gTWVhbndoaWxlLCB0
aGlzIHByb2JsZW0gd2FzIGZpeGVkLCBoZW5jZSByZWFkZCB0aGUgcGFja2FnZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAt
LS0KPiAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2
IC0tLS0tLQo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwo+ICBwYWNrYWdlL3B5dGhvbi1jb25maWdvYmovQ29uZmlnLmluICAgICAgICAgICAg
IHwgIDcgKysrKysrKwo+ICBwYWNrYWdlL3B5dGhvbi1jb25maWdvYmovcHl0aG9uLWNvbmZpZ29i
ai5oYXNoIHwgIDUgKysrKysKPiAgcGFja2FnZS9weXRob24tY29uZmlnb2JqL3B5dGhvbi1jb25m
aWdvYmoubWsgICB8IDE0ICsrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cHl0aG9uLWNvbmZpZ29iai9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cHl0aG9uLWNvbmZpZ29iai9weXRob24tY29uZmlnb2JqLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcHl0aG9uLWNvbmZpZ29iai9weXRob24tY29uZmlnb2JqLm1rCj4KPiBkaWZm
IC0tZ2l0IGEvQ29uZmlnLmluLmxlZ2FjeSBiL0NvbmZpZy5pbi5sZWdhY3kKPiBpbmRleCBjYTgw
Mjc5MjEyLi5iODE3ZTgwZTU1IDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbi5sZWdhY3kKPiArKysg
Yi9Db25maWcuaW4ubGVnYWN5Cj4gQEAgLTcyNCwxMiArNzI0LDYgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX1BZVEhPTl9ESUFMT0cKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgUGFja2FnZSB3YXMg
cmVtb3ZlZCB0b2dldGhlciB3aXRoIHB5dGhvbiAyLjcgc3VwcG9ydC4KPgo+IC1jb25maWcgQlIy
X1BBQ0tBR0VfUFlUSE9OX0NPTkZJR09CSgo+IC0gICAgICAgYm9vbCAicHl0aG9uLWNvbmZpZ29i
aiByZW1vdmVkIgo+IC0gICAgICAgc2VsZWN0IEJSMl9MRUdBQ1kKPiAtICAgICAgIGhlbHAKPiAt
ICAgICAgICAgUGFja2FnZSB3YXMgcmVtb3ZlZCB0b2dldGhlciB3aXRoIHB5dGhvbiAyLjcgc3Vw
cG9ydC4KPiAtCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fWUlFTERGUk9NCj4gICAgICAg
ICBib29sICJweXRob24teWllbGRmcm9tIHJlbW92ZWQiCj4gICAgICAgICBzZWxlY3QgQlIyX0xF
R0FDWQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmlu
Cj4gaW5kZXggMDA5ZjdiYTE4Ni4uMTMyN2ExM2Y0ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTEwMjYsNiArMTAyNiw3IEBA
IG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdl
L3B5dGhvbi1jb2xvcmFtYS9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWNvbG9ybG9nL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24t
Y29sb3J6ZXJvL0NvbmZpZy5pbiIKPiArICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tY29u
Zmlnb2JqL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tY29uZmln
c2hlbGwtZmIvQ29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1jb25z
dGFudGx5L0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tY29uc3Ry
dWN0L0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tY29uZmlnb2JqL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLWNvbmZpZ29iai9Db25maWcuaW4KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjM2NWFhMTdmY2IKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS9weXRob24tY29uZmlnb2JqL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEs
NyBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0NPTkZJR09CSgo+ICsgICAgICAgYm9v
bCAicHl0aG9uLWNvbmZpZ29iaiIKPiArICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05f
U0lYICMgcnVudGltZQo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBDb25maWcgZmlsZSByZWFk
aW5nLCB3cml0aW5nIGFuZCB2YWxpZGF0aW9uLgo+ICsKPiArICAgICAgICAgaHR0cHM6Ly9naXRo
dWIuY29tL0RpZmZTSy9jb25maWdvYmoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tY29u
Zmlnb2JqL3B5dGhvbi1jb25maWdvYmouaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWNvbmZpZ29iai9w
eXRob24tY29uZmlnb2JqLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjY4MmRjOTg3ZjEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24t
Y29uZmlnb2JqL3B5dGhvbi1jb25maWdvYmouaGFzaAo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIG1k
NSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2NvbmZpZ29iai9qc29uCj4gK21k
NSAgOGRkYTdiMzFiYjNhZWE4N2VjZmUzYjdhODc4MTJiMTcgIGNvbmZpZ29iai01LjAuOC50YXIu
Z3oKPiArc2hhMjU2ICA2ZjcwNDQzNGEwN2RjNGY0ZGM3YzlhNzQ1MTcyYzFjYWQ0NDlmZWI1NDhm
ZWJkOWY3ZmUzNjI2MjljNjI3YTk3ICBjb25maWdvYmotNS4wLjgudGFyLmd6Cj4gKyMgTG9jYWxs
eSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gK3NoYTI1NiAgMGQ5NWU2NDg0NjlhNzExZjVl
YzFlNTllNmQ0NDkyMTUwZWM2NWQ5NjhjMWVhNmM2ZDk2MTU0YTkyODc5OTk3YSAgTElDRU5TRQo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1jb25maWdvYmovcHl0aG9uLWNvbmZpZ29iai5t
ayBiL3BhY2thZ2UvcHl0aG9uLWNvbmZpZ29iai9weXRob24tY29uZmlnb2JqLm1rCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mZTE3NzZmNzlmCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWNvbmZpZ29iai9weXRob24tY29uZmlnb2JqLm1r
Cj4gQEAgLTAsMCArMSwxNCBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMg
cHl0aG9uLWNvbmZpZ29iago+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtQ
WVRIT05fQ09ORklHT0JKX1ZFUlNJT04gPSA1LjAuOAo+ICtQWVRIT05fQ09ORklHT0JKX1NPVVJD
RSA9IGNvbmZpZ29iai0kKFBZVEhPTl9DT05GSUdPQkpfVkVSU0lPTikudGFyLmd6Cj4gK1BZVEhP
Tl9DT05GSUdPQkpfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdl
cy9jYi84Ny8xN2Q0YzZkNjM0YzA0NGFiMDhiMTFjMGNkMmE4YTEzNmQxMDM3MTNkNDM4Zjg3OTJk
N2JlMmM1MTQ4ZmIKPiArUFlUSE9OX0NPTkZJR09CSl9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+
ICtQWVRIT05fQ09ORklHT0JKX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiArUFlUSE9OX0NPTkZJ
R09CSl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICsKPiArJChldmFsICQocHl0aG9uLXBhY2th
Z2UpKQo+IC0tCj4gMi4zNC4xCgpHZW50bGUgcGluZy4KClllZ29yCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
