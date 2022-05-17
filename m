Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A066C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 22:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 203F840377;
	Tue, 17 May 2022 22:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtN26IprWnOm; Tue, 17 May 2022 22:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C26B40191;
	Tue, 17 May 2022 22:06:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66F911BF4E7
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 22:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5320240191
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 22:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3X6i6rzDPbf for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 22:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C0C1400FB
 for <buildroot@buildroot.org>; Tue, 17 May 2022 22:06:17 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n24so483993oie.12
 for <buildroot@buildroot.org>; Tue, 17 May 2022 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U7/38j5/IHS5V+WeAbrdlXNcvXx++G1qbhCHtaXqdfU=;
 b=XeNm6tkMeWfKzqtnDiSd9ubGu7/bi3XjGjmua8jMh6RL6hCaAfGwRwzfhfSeeRfrdM
 5dI8HL3hj6XQsq6uedkCChADixUu0dMmT3NNVlpvtjiBfMEizOMBFvAtwVnycNs8XS93
 3K3g5gPj+kfHaM+kDz9DXaHn2JXt8fXnLTzn56OJbGueQAQzxAmfEOB5LVad3PJqNdNd
 /UPXC1q4cQYFLqbYJ0lbbeg5vitBzfuvfVKYJfXIhLUo8QgTjdJMo6jJWaadC9zhDr1w
 OL4KkM2bqkZ7EmezEMlXwv1ZeL/JBRsN6GRtKJoECkJUmfcXyBa5hqDTmzeIAhRQkDQn
 o2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U7/38j5/IHS5V+WeAbrdlXNcvXx++G1qbhCHtaXqdfU=;
 b=hiVcD+181r7CEF1JmTArc15fdyBY7j/u8xRL4dsE05pr3RhgXocjXuUNx8+MOGTtoA
 2ifIcJv+2yJcSgpawSk1X4+BpD/H2zxSTz+NJRW1GPvHyvdaiOMLkSNgswjrIu7f1xxz
 g0WVS4kuhKP8LOClZuPP93YnznifxLlYz6xe0dGhpGERns1evX006akZClyzaAzDk040
 M2T7NzedrQRjd1xmuybS71fMbyBHLlZZb8uCCDKH+ghYeA1R6tf3WjKu8+m/KrObdUCK
 Y5A2cdxpfdUJMF7R3BrrbqPzRQL7LuUzASPk3xq36R2E2f9G6GCjzwzuzGhUSoNmXRsQ
 jZxQ==
X-Gm-Message-State: AOAM533qe/71i1A/QJglAqHLNsNkqrrv4ZmY/l6mmuU2X3Qidh6Od65a
 tca1NEoo+YScPJzwATgu64Yc0cliEGG0UfycOnk=
X-Google-Smtp-Source: ABdhPJzOQMgbSv0XCz5l0BJe41UhTQRcB7maf20v3E4anEWmQS4AMs27jWSBvb7GLlI8ZjU+Ri6poQaNgjmnJK0G+oI=
X-Received: by 2002:a05:6808:178d:b0:326:3fe9:7f03 with SMTP id
 bg13-20020a056808178d00b003263fe97f03mr16350266oib.200.1652825176994; Tue, 17
 May 2022 15:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220509013830.1862343-1-james.hilliard1@gmail.com>
 <cc30e61a-025f-5a1f-8b3f-e95fc4d86355@mind.be>
 <9adbb119-67f3-3131-7894-61858ab0574d@gmail.com>
In-Reply-To: <9adbb119-67f3-3131-7894-61858ab0574d@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 May 2022 16:06:05 -0600
Message-ID: <CADvTj4qEmBfdU7Q8UYwZOwq3db+eBCrcbsOSdW6JDMj4nc6+Bw@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version
 3.1.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBNYXkgMTcsIDIwMjIgYXQgMTozNiBQTSBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBMZSAxMy8wNS8yMDIyIMOgIDIzOjU4
LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBhIMOpY3JpdCA6Cj4gPgo+ID4KPiA+IE9uIDA5LzA1LzIw
MjIgMDM6MzgsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Cj4gVGhpcyB2ZXJzaW9uIGJ1
bXAgc2VlbXMgaW50cm9kdWNlIGEgcmVncmVzc2lvbiBvbiBweXRob24tZmxhc2sgcGFja2FnZToK
Pgo+IChUZXN0UHl0aG9uUHkzRmxhc2spCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vam9icy8yNDU5ODQxMDcxCgpZZWFoLCBweXRob24tZmxhc2sgaXMgb24g
YW4gb2xkIHZlcnNpb24sIHVwZGF0ZWQgaXQ6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA1MTcyMDA5MjMuMTUxNjY5NS0xLWphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20vCgo+Cj4gQ2FuIHlvdSBoYXZlIGEgbG9vay4KPiBUaGFua3MhCj4K
PiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+ID4KPiA+ICBBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgo+ID4KPiA+ICBSZWdhcmRzLAo+ID4gIEFybm91dAo+ID4KPiA+PiAtLS0KPiA+PiAg
IHBhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLmhhc2ggfCA0ICsrLS0KPiA+PiAg
IHBhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLm1rICAgfCA0ICsrLS0KPiA+PiAg
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4+Cj4g
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLmhhc2gK
PiA+PiBiL3BhY2thZ2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLmhhc2gKPiA+PiBpbmRl
eCBlYTdmZTcxYTM1Li4yYWIzNDNjY2U2IDEwMDY0NAo+ID4+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LWppbmphMi9weXRob24tamluamEyLmhhc2gKPiA+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1qaW5q
YTIvcHl0aG9uLWppbmphMi5oYXNoCj4gPj4gQEAgLTEsNSArMSw1IEBACj4gPj4gICAjIG1kNSwg
c2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2ppbmphMi9qc29uCj4gPj4gLW1kNSAg
Yjc2YWUyZjA2NDdhYmViYzgxZTdjMDNmNWZiN2IwMGYgIEppbmphMi0zLjAuMy50YXIuZ3oKPiA+
PiAtc2hhMjU2ICA2MTFiYjI3M2NkNjhmM2I5OTNmYWJkYzQwNjRmYzg1OGM1YjQ3YTk3M2NiNWFh
Nzk5OWVjMWJhNDA1Yzg3Y2Q3Cj4gPj4gSmluamEyLTMuMC4zLnRhci5nego+ID4+ICttZDUgIGQz
MTE0OGFiZDg5YzFkZjFjZGIwNzdhNTVkYjI3ZDAyICBKaW5qYTItMy4xLjIudGFyLmd6Cj4gPj4g
K3NoYTI1NiAgMzEzNTFhNzAyYTQwOGE5ZTc1OTVhOGZjNjE1MGZjM2Y0M2JiNmJmN2UzMTk3NzBj
YmMwZGI5ZGY5NDM3ZTg1Mgo+ID4+IEppbmphMi0zLjEuMi50YXIuZ3oKPiA+PiAgICMgTG9jYWxs
eSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gPj4gICBzaGEyNTYgIDNiNDlkY2VlNDEwNWVi
MzdiYWMxMGZhZjFiZTI2MDQwOGZlODVkMjUyYjhlOWRmMmUwOTc5ZmMxZTA5NDQzN2IKPiA+PiBM
SUNFTlNFLnJzdAo+ID4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1qaW5qYTIvcHl0aG9u
LWppbmphMi5tawo+ID4+IGIvcGFja2FnZS9weXRob24tamluamEyL3B5dGhvbi1qaW5qYTIubWsK
PiA+PiBpbmRleCAwNTAzOTg0YmVmLi4yMDljYTJlMjVhIDEwMDY0NAo+ID4+IC0tLSBhL3BhY2th
Z2UvcHl0aG9uLWppbmphMi9weXRob24tamluamEyLm1rCj4gPj4gKysrIGIvcGFja2FnZS9weXRo
b24tamluamEyL3B5dGhvbi1qaW5qYTIubWsKPiA+PiBAQCAtNCw5ICs0LDkgQEAKPiA+PiAgICMK
PiA+Pgo+ID4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPj4gICAtUFlUSE9OX0pJTkpBMl9W
RVJTSU9OID0gMy4wLjMKPiA+PiArUFlUSE9OX0pJTkpBMl9WRVJTSU9OID0gMy4xLjIKPiA+PiAg
IFBZVEhPTl9KSU5KQTJfU09VUkNFID0gSmluamEyLSQoUFlUSE9OX0pJTkpBMl9WRVJTSU9OKS50
YXIuZ3oKPiA+PiAtUFlUSE9OX0pJTkpBMl9TSVRFID0KPiA+PiBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvOTEvYTUvNDI5ZWZjNjI0NjExOWUxZTNmYmY1NjJjMDAxODdk
MDRlODNlNTQ2MTkyNDllYjczMmJiNDIzZWZhNmM2Cj4gPj4KPiA+PiArUFlUSE9OX0pJTkpBMl9T
SVRFID0KPiA+PiBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvN2EvZmYv
NzVjMjg1NzZhMWQ5MDBlODdlYjYzMzViMDYzZmFiNDdhOGVmM2M4YjRkODg1MjRjNGJmNzhmNjcw
Y2NlCj4gPj4KPiA+PiAgIFBZVEhPTl9KSU5KQTJfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiA+
PiAgIFBZVEhPTl9KSU5KQTJfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ID4+ICAgUFlUSE9OX0pJ
TkpBMl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS5yc3QKPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
