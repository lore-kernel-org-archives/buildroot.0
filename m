Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BE3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E2C82848;
	Sun, 29 May 2022 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zUep8YSDiv9j; Sun, 29 May 2022 19:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B8CB827FA;
	Sun, 29 May 2022 19:53:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 187921BF3C3
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06AB4419D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 19:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7cOX2Tc-CZ2 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 19:53:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81ED7419D0
 for <buildroot@buildroot.org>; Sun, 29 May 2022 19:53:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p10so12126163wrg.12
 for <buildroot@buildroot.org>; Sun, 29 May 2022 12:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Tasv4RQM4cr3w6ik6P/a/tDppEo2yty0YtAWMqHIiJE=;
 b=ab9lkcdqaC0lIG1yn1b4L7MSGaNWqScERDw+7TtKFjwEjOItjlcIiUlB89t6POeqMt
 VIFP+RN7+xtTatXxpTOfRQpOoLsMWZm4SGiHRiuYQ9U360xA8CGIVPLscubWKFotW1is
 SPGt0Ka75X2lhGv9udmfCgDtX7t9HQ7Z2CxHUNsj7mvWwUiT4TLIiAvaDKdWIU7RtOeh
 hzWpq+rO7xALIw24eccMHtGJdGZovfCGOr3Zbg7WDzF+7K7sCpe7IKOV6sfp1XfTExcw
 PpcqRQs4AOAJAK5AEfbQx6JLlb06YJudQJSzr19OoW15gnpnkL912/InbtYWj8AdPcSQ
 +8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tasv4RQM4cr3w6ik6P/a/tDppEo2yty0YtAWMqHIiJE=;
 b=Rv93lmqiEFj8TtkLPiDFKiVs46Z1GIXO4UBQ0E8ubUgrvquLWkJJQlF7+0hGnvy33F
 xG+WVLgb7ZvHvTqK8TmeSGzKgbvltwMRbDRhmOwGs1xHIT8GCV8bq9pg6Z4wuaWgF5r0
 jtKh2spoinFnDKiBxwMqjnDbvEJodZtWTumHloiuJ2c5+tEyKnKcKmLDGyumStEoNcf0
 Rrj7II7JbZhtjZN5J1LKvL18K3bN3/0bqBFxCgI7GU2km9rjfH6UsBm1hv5cbqWpzqtQ
 m5POML/m/GHQ5+AkxKXJc60bqKnaZJhUzm3SP8iZURGQanclOxQ7aqc77rPrbzd/JNou
 mSiA==
X-Gm-Message-State: AOAM533fzxd0SyhDJCPgQjhJE8L065yy9Pk64wxvah8xUeq/WFQvAHxr
 3NWEoiZjlO+TBcNq6R0j0TU=
X-Google-Smtp-Source: ABdhPJylNSqZmSOw1lsbgsBSmrsjObVtM14bpA0lFAk/lvCRcXun/PFjEMFPqiyEissTzs7h+m90tA==
X-Received: by 2002:a05:6000:71b:b0:20e:ed96:e976 with SMTP id
 bs27-20020a056000071b00b0020eed96e976mr38763500wrb.500.1653853997722; 
 Sun, 29 May 2022 12:53:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 i8-20020adfefc8000000b002102af52a2csm4556541wrp.9.2022.05.29.12.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 12:53:17 -0700 (PDT)
Message-ID: <e3350a95-d9ca-8d7d-0f48-22c86289a3db@gmail.com>
Date: Sun, 29 May 2022 21:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
 <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
 <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjkvMDUvMjAyMiDDoCAyMTo0MSwgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXTCoDoKPiAKPiAK
PiBPbiBTdW4sIE1heSAyOSwgMjAyMiwgMToyOSBQTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBnbWFpbC5jb20KPiA8bWFpbHRvOnJvbWFpbi5uYW91ckBnbWFpbC5jb20+PiB3cm90ZToKPiAK
PiAgICAgSGVsbG8gSmFtZXMsCj4gCj4gICAgIExlIDE3LzA1LzIwMjIgw6AgMjI6MDksIEphbWVz
IEhpbGxpYXJkIGEgw6ljcml0wqA6Cj4gICAgID4gTGljZW5zZSBoYXNoIGNoYW5nZSBkdWUgdG8g
bGljZW5zZSB0aXRsZSBzeW50YXggY2hhbmdlOgo+ICAgICA+Cj4gICAgIGh0dHBzOi8vZ2l0aHVi
LmNvbS9wYWxsZXRzL2ZsYXNrL2NvbW1pdC85ZTdkM2E2YjY5NGIyN2Y5OTcyNjY4ODlhZTQ2M2Uw
NmRkODNhMTg5Cj4gICAgIDxodHRwczovL2dpdGh1Yi5jb20vcGFsbGV0cy9mbGFzay9jb21taXQv
OWU3ZDNhNmI2OTRiMjdmOTk3MjY2ODg5YWU0NjNlMDZkZDgzYTE4OT4KPiAKPiAgICAgVGhpcyBw
YXRjaCBhbG9uZyB3aXRoIHB5dGhvbi13ZXJremV1ZyB2ZXJzaW9uIGJ1bXAgWzFdIGZpeGVzIHRo
ZQo+ICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uX2ZsYXNrLlRlc3RQeXRob25QeTNGbGFz
ayBidWlsZCBpc3N1ZSBpbiBnaXRsYWItY2kgWzJdLgo+IAo+ICAgICBUaGlzIHRlc3QgZmFpbCBz
aW5jZSB0aGUgcHl0aG9uLWppbmphMiB2ZXJzaW9uIGJ1bXAgMy4xLjIgWzNdLgo+IAo+ICAgICBE
byB5b3Uga25vdyBpZiBidW1waW5nIHB5dGhvbi1mbGFzaCBhbmQgcHl0aG9uLXdlcmt6ZXVnIG1h
eSBpbnRyb2R1Y2Ugb3RoZXIKPiAgICAgcnVudGltZSBpc3N1ZT8gSXMgYW55IGZvbGxvd3VwIHZl
cnNpb24gYnVtcCByZXF1aXJlZD8KPiAKPiBJIHNlbnQgYSBmZXcgcHl0aG9uIHBhY2thZ2UgYnVt
cHMgdGhhdCBzaG91bGQgZml4IGl0LgoKT2ssIGJ1dCBpdCdzIG5vdCBleHBsaWNpdGx5IHN0YXRl
ZCBpZiBpdCdzIGludGVuZGVkIGZvciBtYXN0ZXIgKHVwY29taW5nCjIwMjIuMDUpIG9yIG5leHQg
YnJhbmNoLgpDYW4geW91IGxpc3Qgd2hpY2ggcGF0Y2ggbXVzdCBiZSBtZXJnZWQgaW4gbWFzdGVy
PwoKPiAKPiAgICAgSXMgcmV2ZXJ0aW5nIHB5dGhvbi1qaW5qYTIgc2FmZT8KPiAKPiBJdCdzIHVz
ZWQgYnkgc3R1ZmYgb3RoZXIgdGhhbiBmbGFzayBzbyBiZXN0IHRvIGFwcGx5IG15IHBhdGNoZXMg
YnVtcGluZyB0aGUKPiBmbGFzayBkZXBzIHRoaW5rLgoKb2ssIEknbSBhZ3JlZSBvbiB0aGUgcHJp
bmNpcGxlIGJ1dCBhcyB5b3Ugbm90aWNlZCwgYW55IHB5dGhvbiBwYWNrYWdlIHZlcnNpb24KYnVt
cCBtYXkgdHJpZ2dlciBhIHJ1bnRpbWUgaXNzdWUgaW4gYW5vdGhlciBweXRob24gcGFja2FnZS4K
ClRoaXMgc2hvdWxkIGZpeGVzIHR3byByZW1haW5pbmcgZ2l0bGFiLWNpIGlzc3VlczoKaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8yNDkxMzIxMjkyCmh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjQ5MTMyMTI5
MQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IAo+ICAgICBUZXN0ZWQtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbSA8bWFpbHRvOnJvbWFpbi5uYW91ckBnbWFpbC5j
b20+Pgo+IAo+ICAgICBbMV0KPiAgICAgaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNTE3MjAxMjQ5LjE1MTgzNTgtMS1qYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tLwo+ICAgICA8aHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjIwNTE3MjAxMjQ5LjE1MTgzNTgtMS1qYW1lcy5oaWxsaWFyZDFA
Z21haWwuY29tLz4KPiAgICAgWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2pvYnMvMjQ5MTMyMTI5MQo+ICAgICA8aHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8yNDkxMzIxMjkxPgo+ICAgICBbM10gaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1NYXkvNjQyOTQyLmh0bWwK
PiAgICAgPGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjIt
TWF5LzY0Mjk0Mi5odG1sPgo+IAo+ICAgICBCZXN0IHJlZ2FyZHMsCj4gICAgIFJvbWFpbgo+IAo+
ICAgICA+Cj4gICAgID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20KPiAgICAgPG1haWx0bzpqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPj4K
PiAgICAgPiAtLS0KPiAgICAgPsKgIHBhY2thZ2UvcHl0aG9uLWZsYXNrL3B5dGhvbi1mbGFzay5o
YXNoIHwgMTMgKysrKysrLS0tLS0tLQo+ICAgICA+wqAgcGFja2FnZS9weXRob24tZmxhc2svcHl0
aG9uLWZsYXNrLm1rIDxodHRwOi8vcHl0aG9uLWZsYXNrLm1rPsKgIMKgfMKgIDQgKystLQo+ICAg
ICA+wqAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4g
ICAgID4KPiAgICAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2svcHl0aG9uLWZs
YXNrLmhhc2gKPiAgICAgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay9weXRob24tZmxhc2suaGFzaAo+
ICAgICA+IGluZGV4IGM2Y2NkNjMzZjguLjVmMTlhNDUwYTEgMTAwNjQ0Cj4gICAgID4gLS0tIGEv
cGFja2FnZS9weXRob24tZmxhc2svcHl0aG9uLWZsYXNrLmhhc2gKPiAgICAgPiArKysgYi9wYWNr
YWdlL3B5dGhvbi1mbGFzay9weXRob24tZmxhc2suaGFzaAo+ICAgICA+IEBAIC0xLDcgKzEsNiBA
QAo+ICAgICA+IC0jIEZyb20KPiAgICAgaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L0ZsYXNrLyNj
b3B5LWhhc2gtbW9kYWwtOTExZmZiNjctZmU4NC00ZTI1LWExYTktZjRjNzQ1YTBhOTgwCj4gICAg
IDxodHRwczovL3B5cGkub3JnL3Byb2plY3QvRmxhc2svI2NvcHktaGFzaC1tb2RhbC05MTFmZmI2
Ny1mZTg0LTRlMjUtYTFhOS1mNGM3NDVhMGE5ODA+Cj4gICAgID4gLW1kNcKgIDBkYTQxNDVkMTcy
OTkzY2QyOGE2YzYxOTYzMGNjMTljwqAgRmxhc2stMS4xLjIudGFyLmd6Cj4gICAgID4gLXNoYTI1
NsKgIMKgIMKgCj4gICAgIMKgNGVmYTFhZTJkN2M5ODY1YWY0ODk4NmRlOGFlYjg1MDRiZjMyYzdm
M2Q2ZmRjOTM1M2QzNGIyMWY0YjEyNzA2MMKgCj4gICAgIEZsYXNrLTEuMS4yLnRhci5nego+ICAg
ICA+IC0KPiAgICAgPiAtIyBMaWNlbnNlIGZpbGVzCj4gICAgID4gLXNoYTI1NsKgIMKgIMKgCj4g
ICAgIMKgNDg5YThlMTEwODUwOWVkOThhMzdiYjk4M2UxMWUwZjdlMWQzMWYwYmQ4Zjk5YTc5Yzg0
NDhlN2ZmMzdkMDdlYcKgIExJQ0VOU0UucnN0Cj4gICAgID4gLXNoYTI1NsKgIMKgIMKgCj4gICAg
IMKgMGVmM2FlMDI1ZjRhMzk4NzYxMDc5ZjBkNjg3ZmYzZDY2ZjRmZWYzYTMyYWMyNjA3MzE4ZTkw
OWMwY2JhOTE1MMKgCj4gICAgIGRvY3MvbGljZW5zZS5yc3QKPiAgICAgPiArIyBtZDUsIHNoYTI1
NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9mbGFzay9qc29uCj4gICAgIDxodHRwczovL3B5
cGkub3JnL3B5cGkvZmxhc2svanNvbj4KPiAgICAgPiArbWQ1wqAgOTNmMTgzMmU1YmU3MDRlZjZm
ZjJhNDEyNDU3OWNkODXCoCBGbGFzay0yLjEuMi50YXIuZ3oKPiAgICAgPiArc2hhMjU2wqAgMzE1
ZGVkMmRkZjhhNjI4MTU2N2VkYjI3MzkzMDEwZmUzNDA2MTg4YmFmYmZlNjVhMzMzOWQ1Nzg3ZDg5
ZTQ3N8KgCj4gICAgIEZsYXNrLTIuMS4yLnRhci5nego+ICAgICA+ICsjIExvY2FsbHkgY29tcHV0
ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+ICAgICA+ICtzaGEyNTbCoCA0ODlhOGUxMTA4NTA5ZWQ5OGEz
N2JiOTgzZTExZTBmN2UxZDMxZjBiZDhmOTlhNzljODQ0OGU3ZmYzN2QwN2VhwqAKPiAgICAgTElD
RU5TRS5yc3QKPiAgICAgPiArc2hhMjU2wqAgNzUzNWVhYzUxM2VkZDEyZmI4ZTMzZjIwM2M2YTQw
MzU0OTYyOWUzNGIzNjM0MThjZGJkNmM2ZWE1NDY0NTE1ZMKgCj4gICAgIGRvY3MvbGljZW5zZS5y
c3QKPiAgICAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2svcHl0aG9uLWZsYXNr
Lm1rIDxodHRwOi8vcHl0aG9uLWZsYXNrLm1rPgo+ICAgICBiL3BhY2thZ2UvcHl0aG9uLWZsYXNr
L3B5dGhvbi1mbGFzay5tayA8aHR0cDovL3B5dGhvbi1mbGFzay5taz4KPiAgICAgPiBpbmRleCAw
NzdhYTYwMGI4Li5iNjg0YWZmNDgwIDEwMDY0NAo+ICAgICA+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LWZsYXNrL3B5dGhvbi1mbGFzay5tayA8aHR0cDovL3B5dGhvbi1mbGFzay5taz4KPiAgICAgPiAr
KysgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay9weXRob24tZmxhc2subWsgPGh0dHA6Ly9weXRob24t
Zmxhc2subWs+Cj4gICAgID4gQEAgLTQsOSArNCw5IEBACj4gICAgID7CoCAjCj4gICAgID7CoAo+
ICAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgICA+wqAKPiAgICAgPiAtUFlUSE9OX0ZM
QVNLX1ZFUlNJT04gPSAxLjEuMgo+ICAgICA+ICtQWVRIT05fRkxBU0tfVkVSU0lPTiA9IDIuMS4y
Cj4gICAgID7CoCBQWVRIT05fRkxBU0tfU09VUkNFID0gRmxhc2stJChQWVRIT05fRkxBU0tfVkVS
U0lPTikudGFyLmd6Cj4gICAgID4gLVBZVEhPTl9GTEFTS19TSVRFID0KPiAgICAgaHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzRlLzBiL2NiMDIyNjhjOTBlNjc1NDVhMGUz
YTM3ZWExY2EzZDQ1ZGUzYWNhNDNjZWI3ZGJmMTcxMmZiNTEyN2Q1ZAo+ICAgICA8aHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzRlLzBiL2NiMDIyNjhjOTBlNjc1NDVhMGUz
YTM3ZWExY2EzZDQ1ZGUzYWNhNDNjZWI3ZGJmMTcxMmZiNTEyN2Q1ZD4KPiAgICAgPiArUFlUSE9O
X0ZMQVNLX1NJVEUgPQo+ICAgICBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvZDMvM2MvOTRmMzhkNGRiOTE5YTkzMjZhNzA2YWQ1NmYwNWE3ZTZmMGM4ZjdiN2Q5M2UyOTk3
Y2NhNTRkM2JjMTRiCj4gICAgIDxodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvZDMvM2MvOTRmMzhkNGRiOTE5YTkzMjZhNzA2YWQ1NmYwNWE3ZTZmMGM4ZjdiN2Q5M2UyOTk3
Y2NhNTRkM2JjMTRiPgo+ICAgICA+wqAgUFlUSE9OX0ZMQVNLX1NFVFVQX1RZUEUgPSBzZXR1cHRv
b2xzCj4gICAgID7CoCBQWVRIT05fRkxBU0tfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ICAgICA+
wqAgUFlUSE9OX0ZMQVNLX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnJzdCBkb2NzL2xpY2Vuc2Uu
cnN0Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
