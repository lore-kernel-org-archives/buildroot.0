Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF0ACD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC595817A5;
	Sun, 31 Mar 2024 00:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPWYoPw41h_F; Sun, 31 Mar 2024 00:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A2081858
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A2081858;
	Sun, 31 Mar 2024 00:48:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40C011BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E38881858
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61fro7q0Iadd for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBA52817A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA52817A5
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBA52817A5
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:48:47 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6990014a57bso3173806d6.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711846126; x=1712450926;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZkTBflxkG6QQupDq+eBfnElb1NXEhuIigdBNzDFGv+I=;
 b=CQBDtYHCltF9M6SoIk7uH0tWNNnVqjJU42KygmbpKu7jL1PK6bGsqTGRKFLFA+Kq+d
 BDWh03Rht/3OdINXOpy69FcfNB+LDiOlQUclViYfBZwx0+jB1gN4vE9G1G9lAvl5VV+y
 mHU41ZFX1k0Y6SSmooPcLr79C8ybkwT6SDN4QaXQ1JydPjxdS9axvDt5MR/3SVah7K0z
 eTO4WIaG5D3wJxI+GBO9EZmoxUaC0+mneBepIrSgypH35INAh9ge4I9G1okpm1rmWHns
 ZJsvUhj2IBJ9Y7rqS+NG+sMwZagx7QFZX0UjNUf+XVA7cnPZi8KwxXit9f/NViPiLh2d
 1b0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6hDmYRvU2/KSxqfm69WB82LV99uwctoekYKRwXUQSgWzhxzxyRhlIvcFmu/3c23GpYgje4nEJW6qO+Ybt4btWVed27vs30Q==
X-Gm-Message-State: AOJu0YxMH70A134d88Y6kkHa5cCe4O3eNW+7Z2ATD6wEHxny+bPn+WGL
 R56iQaWH0BeHzzRFHoq/G1Gx+MIaiCSO3p1lSsJKynzu96Eo/V9AnYO7lm2n35V9BbEZtgcBNZZ
 cSYklxu9U9GIYUIw/BvyAJAtPa+BXJorirXfK+w==
X-Google-Smtp-Source: AGHT+IHgix10fdGIWjKFzLvr4HI1QfB8rpbw+0CW/F3sRzFlePoSsZrWkDp/UYibh73XT5bMI2TfpmLUo1cztm6lxkg=
X-Received: by 2002:a05:622a:13d2:b0:431:4d28:cca7 with SMTP id
 p18-20020a05622a13d200b004314d28cca7mr8731872qtk.53.1711846126156; Sat, 30
 Mar 2024 17:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-4-james.hilliard1@gmail.com>
 <7384cb6e-1b5b-4fca-ba0c-2c4d0fcd05a3@bubu1.eu>
 <CADvTj4qvJzBr4jBwj4htyAa=hKm67yo06Gn+kmAizbyGnZ=b3Q@mail.gmail.com>
 <840d4fee-8266-4115-817c-89d6d7ff0d24@mind.be>
In-Reply-To: <840d4fee-8266-4115-817c-89d6d7ff0d24@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 30 Mar 2024 18:48:34 -0600
Message-ID: <CADvTj4oUJ1JazCQL1J10QT8Qje0bACWJQPtzsX78+bGYGyeSBQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711846126; x=1712450926; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZkTBflxkG6QQupDq+eBfnElb1NXEhuIigdBNzDFGv+I=;
 b=fn2mAeKoUp3IPdZm1KW/2gTteR7ZoRiq5D67Qxvw6YjzRYT9i2TsQGJ+hsrIoMH/Ck
 RyUnT0cmta1qWFN/yB4QVfaBfVbIR/yeUrDbzen/O5zvtefBYQG69cQtGKkcELwHPmxw
 LAFUK+gNjYiV5T3B7vrVshIPdalPiqJG/0kYHIcREPw6AlgHlmRyhCG5+BtVqKo2mIXj
 Ehbar2vmn9s1xZXzo8AQpG4L80ocmxI3qAytB7S7c77TUJrNK63su7l+GTDkHrazW8Vr
 Vn73jE2ynjwVFcQIrn+MlkQ70GLqM2+U4OkReUgt4kIaj6Gjj0eqTHrIxYt0hlmsoSK1
 Ki2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fn2mAeKo
Subject: Re: [Buildroot] [PATCH v8 04/26] package/python-setuptools: revert
 to last version with functional --build-option
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMzo1MeKAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxh
cm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTQvMDIvMjAyNCAwMDo0MywgSmFtZXMg
SGlsbGlhcmQgd3JvdGU6Cj4gPiBPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCA0OjE04oCvUE0gTWFy
Y3VzIEhvZmZtYW5uIDxidWlsZHJvb3RAYnVidTEuZXU+IHdyb3RlOgo+ID4+Cj4gPj4gSGkgSmFt
ZXMsCj4gPj4KPiA+PiBPbiAxMy4wMi4yNCAyMjoxNCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4g
Pj4+IEEgcmVjZW50IGNoYW5nZSBpbiBzZXR1cHRvb2xzIGFjY2lkZW50aWFsbHkgYnJva2UgdGhl
IGFiaWxpdHkgdG8KPiA+Pj4gcGFzcyBidWlsZF9leHQgYXJncyB2aWEgdGhlIC0tYnVpbGQtb3B0
aW9uIGNvbmZpZyBzZXR0aW5nLgo+ID4+Pgo+ID4+PiBMZXRzIGRvd25ncmFkZSB0byB0aGUgbGFz
dCB3b3JraW5nIHZlcnNpb24gZm9yIG5vdy4KPiA+Pgo+ID4+IERvIHlvdSBoYXZlIGEgbGluayB0
byBhIGlzc3VlIGhlcmU/IElzIHRoaW5nIGFja25vd2xlZGdlZCBieSB1cHN0cmVhbSwKPiA+PiBp
cyB0aGlzIHBsYW5uZWQgdG8gYmUgZml4ZWQ/Cj4gPgo+ID4gWWVhaCwgSSBoYXZlIGEgcHVsbCBy
ZXF1ZXN0IHJldmVydGluZyB0aGUgY2hhbmdlIHRoYXQgY2F1c2VkIHRoaXMgdG8gYnJlYWs6Cj4g
PiBodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL3B1bGwvNDIxOAo+ID4KPiA+IFRo
ZXJlJ3Mgc29tZSBsaW5rcy90aHJlYWRzIHRoZXJlIHdpdGggbW9yZSBpbmZvLgo+Cj4gICBJSVVD
IHRoZSBzaXR1YXRpb24gZXZvbHZlZCBhbmQgd2Ugc2hvdWxkIGFwcGx5Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL3B5cGEvc2V0dXB0b29scy9wdWxsLzQyMTcgaW5zdGVhZCBvZiBkb2luZyB0aGlzIHJl
dmVydD8KClllYWgsIEkndmUgdXBkYXRlZCBzZXR1cHRvb2xzIGluIG15IHY5LCBhbHRob3VnaCBJ
IGRpZCBoYXZlIHRvIHR3ZWFrIGhvdwpweXRob24tcHN5Y29wZzIgZ2V0cyBwYXNzZWQgdGhlIHBn
X2NvbmZpZyBwYXRoIGR1ZSB0byAtQy0tYnVpbGQtb3B0aW9uPQpub3cgb25seSBwYXNzaW5nIGNv
bmZpZyB2YXJpYWJsZXMgdG8gdGhlIGJkaXN0X3doZWVsIGJ1aWxkIHN0YWdlIHdoaWNoCmFwcGVh
cnMgdG8gYmUgc3VmZmljaWVudCBmb3IgYWxsIG90aGVyIHBhY2thZ2VzIGJ1dCBub3QgcHl0aG9u
LXBzeWNvcGcyLgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDI0MDMzMTAwNDEzMy42MzY2MTgtMTgtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bS8KCj4KPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cj4gPgo+ID4+Cj4gPj4+Cj4gPj4+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+
ID4+PiAtLS0KPiA+Pj4gICAgcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0
b29scy5oYXNoIHwgNCArKy0tCj4gPj4+ICAgIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0
aG9uLXNldHVwdG9vbHMubWsgICB8IDQgKystLQo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaCBiL3BhY2thZ2Uv
cHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+ID4+PiBpbmRleCA3ZjEz
YWMzODk2Li45Yzk3MWVlYzExIDEwMDY0NAo+ID4+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zZXR1
cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLmhhc2gKPiA+Pj4gKysrIGIvcGFja2FnZS9weXRob24t
c2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5oYXNoCj4gPj4+IEBAIC0xLDUgKzEsNSBAQAo+
ID4+PiAgICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NldHVwdG9v
bHMvanNvbgo+ID4+PiAtbWQ1ICBiODJkZTQ1YWFhNmI5YmI5MTEyMjY2NjAyMTJlYmI4MyAgc2V0
dXB0b29scy02OS4wLjMudGFyLmd6Cj4gPj4+IC1zaGEyNTYgIGJlMWFmNTdmYzQwOWY5MzY0N2Yy
ZThlNDU3M2ExNDJlZDM4NzI0YjhjZGQzODk3MDZhODY3YmI0ZWZjZjFlNzggIHNldHVwdG9vbHMt
NjkuMC4zLnRhci5nego+ID4+PiArbWQ1ICBkOTY3Y2EyYmE3ZjQ2ZGI4ODdkYWVlMmQ1YzliZDZh
MiAgc2V0dXB0b29scy02OC4yLjIudGFyLmd6Cj4gPj4+ICtzaGEyNTYgIDRhYzE0NzUyNzZkMmYx
YzQ4Njg0ODc0MDg5ZmVmY2Q4M2JkNzE2MmRkYWFmYjgxZmFjODY2YmEwZGIyODJhODcgIHNldHVw
dG9vbHMtNjguMi4yLnRhci5nego+ID4+PiAgICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNo
ZWNrc3Vtcwo+ID4+PiAgICBzaGEyNTYgIDg2ZGEwZjAxYWVhZTQ2MzQ4YTNjM2Q0NjUxOTVkYzFj
ZWNjZGU3OWY3OWU4Nzc2OWE2NGI4ZGEwNGIyYTQ3NDEgIExJQ0VOU0UKPiA+Pj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsgYi9wYWNr
YWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4gPj4+IGluZGV4IDBh
ZWEzYzZjZmEuLmYyNmY0MjdjY2MgMTAwNjQ0Cj4gPj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXNl
dHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPiA+Pj4gKysrIGIvcGFja2FnZS9weXRob24t
c2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5tawo+ID4+PiBAQCAtNCw5ICs0LDkgQEAKPiA+
Pj4gICAgIwo+ID4+PiAgICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4+Pgo+ID4+PiAtUFlU
SE9OX1NFVFVQVE9PTFNfVkVSU0lPTiA9IDY5LjAuMwo+ID4+PiArUFlUSE9OX1NFVFVQVE9PTFNf
VkVSU0lPTiA9IDY4LjIuMgo+ID4+PiAgICBQWVRIT05fU0VUVVBUT09MU19TT1VSQ0UgPSBzZXR1
cHRvb2xzLSQoUFlUSE9OX1NFVFVQVE9PTFNfVkVSU0lPTikudGFyLmd6Cj4gPj4+IC1QWVRIT05f
U0VUVVBUT09MU19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2Vz
L2ZjL2M5L2IxNDZjYTE5NTQwM2UwMTgyYTM3NGUwZWE0ZGJjNjkxMzZiYWQzY2Q1NWJjMjkzZGY0
OTZkNjI1ZDBmNwo+ID4+PiArUFlUSE9OX1NFVFVQVE9PTFNfU0lURSA9IGh0dHBzOi8vZmlsZXMu
cHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lZi9jYy85M2Y3MjEzYjJhYjVlZDM4M2Y5OGNlODAy
MGU2MzJlZjI1NmI0MDZiODU2OTYwNmMzZjE2MGVkOGUxYzkKPiA+Pj4gICAgUFlUSE9OX1NFVFVQ
VE9PTFNfTElDRU5TRSA9IE1JVAo+ID4+PiAgICBQWVRIT05fU0VUVVBUT09MU19MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRQo+ID4+PiAgICBQWVRIT05fU0VUVVBUT09MU19DUEVfSURfVkVORE9SID0g
cHl0aG9uCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
