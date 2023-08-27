Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD77C83F11
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 07:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5100960FE1;
	Sun, 27 Aug 2023 07:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5100960FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXTB3HQ1sbkA; Sun, 27 Aug 2023 07:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 762C360E43;
	Sun, 27 Aug 2023 07:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 762C360E43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 960271BF616
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 07:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D2BD81DE1
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 07:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D2BD81DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBYfEQoh-47Y for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 07:03:45 +0000 (UTC)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74D4C81D5A
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 07:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D4C81D5A
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4122129390eso1931881cf.0
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 00:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693119824; x=1693724624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tuxtBrjYcrIGlTEl//8TEnvbzH26SJLcLJL2JpPFmgs=;
 b=WYXOBnKSnQEMMav5I3KmkNKSgP+sxKMIYKfJqqheduZiZRH8/uIOBpgjNrLzauHcHb
 ekdS9B0OG8Z4crNMlD6xuWP8R52nWZRGMBVP/wIUC29hOpPI/cSsNC2CgJ3bJ1WjlTrM
 m3b6DJXmN7z214tW0XxhBgqPXK+SAX+iLbQY2EM2aZDUtneciAKej7l7VnvG6LlaEPgm
 VSV1eg+CXnfp9dmsAJdtHbS6VkUVXSrOxQT6MymirGsaUzSjzKLP0nnOQGjQzFgeYnut
 gDRwYqwX2TsyDaWdfI5kh5yL4o6DhhfqzsxcPbo6O4GBabI53En/YPsogwfXCpar3fSN
 UaQg==
X-Gm-Message-State: AOJu0YzjNaLeOrE5wMKCoD5emGEgcSU5wR99xTWoIZAlwBYGylcDObWQ
 uuEgjqaa09iHQTvaN5BJMQ3wv4ijgSDyHljFUo0=
X-Google-Smtp-Source: AGHT+IFMAO+b86raL3wulEARh1oFiq4Gkj83R1cX9xJGhKPzGOmNu8AD0B//v/2RjM5Vfsh9GxMUfgfRVVZDjf24A7w=
X-Received: by 2002:ac8:7f4f:0:b0:410:497b:fe19 with SMTP id
 g15-20020ac87f4f000000b00410497bfe19mr26010109qtk.46.1693119824170; Sun, 27
 Aug 2023 00:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHfxMJ6M-R8oHY-8ChxdhanpcL2_04mYARHSxW=YS_gw7Npctg@mail.gmail.com>
 <20230826233915.2e1a535a@windsurf>
In-Reply-To: <20230826233915.2e1a535a@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Aug 2023 03:03:32 -0400
Message-ID: <CADvTj4qGzkEf4u2Lu_EpcTcun3LxjHKDT-pVVizRzni-6QXb5w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693119824; x=1693724624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tuxtBrjYcrIGlTEl//8TEnvbzH26SJLcLJL2JpPFmgs=;
 b=MCi7//C2BgbdtIa0URP+4fPSYU5Htoq71bRFUTE6WJYaiITbekmRRDw3XK3fap0RMu
 S9mR1r4BfqNRNBI3PBItk52W2XfuS8Rtl9oJZA1NJQu9LPnze89UJd2qDK678efdZBwD
 Ii4u66lStNh5Yw+WiEj87MGe8A3x4HiI5lMdfyAP0tfkXhATP5Jq8y/S1FEyve81Hdc+
 T8yj2F8K8e42w5T+Z7JxVlCkaGPDyXfjmvpjJc95s3bzdLbqEcVmQH9MSUwd3HiKwUJ9
 KAF/AQLV8hwU12mPwf2QmD/D2AkLfd+qZ6e4cBxWFR8yOSaM7tVkCQPL/vhNot4xC72d
 yNGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MCi7//C2
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: supply package name to
 setup() when not provided
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
Cc: erichiggins@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgNTozOeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gRXJpYywKPgo+ICtKYW1l
cyBpbiBDYy4KPgo+IFNvcnJ5IGZvciB0aGUgc3VwZXIgbG9uZyBsYWcuCj4KPiBPbiBTdW4sIDE4
IFNlcCAyMDIyIDEyOjQ4OjMxIC0wNzAwCj4gZXJpY2hpZ2dpbnNAZ21haWwuY29tIHdyb3RlOgo+
Cj4gPiBJc3N1ZSBkZXNjcmlwdGlvbjoKPiA+IFRoZSBgdXRpbHMvc2NhbnB5cGlgIHNjcmlwdCBt
YWtlcyBhbiBlcnJvbmVvdXMgYXNzdW1wdGlvbiB0aGF0IFB5dGhvbgo+ID4gcGFja2FnZXMgd2ls
bCBjYWxsIGBzZXR1cCgpYCB3aXRoIHRoZSBgbmFtZWAgYXJndW1lbnQuIEl0J3Mgbm90Cj4gPiBy
ZXF1aXJlZCBhbmQgbm90IG9mdGVuIHVzZWQuIFRoaXMgY2F1c2VzIHRoZSBzY3JpcHQgdG8gZmFp
bCB0byBsb2FkCj4gPiBtYW55IHBhY2thZ2VzIGZyb20gUHlwaS4KPiA+ICBGb3IgZXhhbXBsZSwg
IGAuL3V0aWxzL3NjYW5weXBpIHdoZWVsYCByZXR1cm5zIHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4g
PiA+IGBFcnJvcjogQ291bGQgbm90IGluc3RhbGwgcGFja2FnZSB3aGVlbDogJ25hbWUnYAo+Cj4g
RG8geW91IGhhdmUgYSBjdXJyZW50IGV4YW1wbGUgdGhhdCBmYWlscyBkdWUgdG8gdGhpcz8gVGhl
IHdoZWVsIHBhY2thZ2UKPiBkb2VzIHBhc3MgYSBuYW1lPSBhdHRyaWJ1dGUgdG8gaXRzIHNldHVw
KCkgZnVuY3Rpb24sIGFuZCBpdCBoYXMgYmVlbgo+IGRvaW5nIHRoaXMgZm9yIG1hbnkgeWVhcnMu
IExvb2tpbmcgYXQgdGhlIGluaXRpYWwgY29tbWl0IG9mCj4gaHR0cHM6Ly9naXRodWIuY29tL3B5
cGEvd2hlZWw6Cj4KPiBkaWZmIC0tZ2l0IGEvc2V0dXAucHkgYi9zZXR1cC5weQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uMDlhMTM4ZQo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9zZXR1cC5weQo+IEBAIC0wLDAgKzEsMzMgQEAKPiAraW1wb3J0IG9zCj4gKwo+ICtmcm9t
IHNldHVwdG9vbHMgaW1wb3J0IHNldHVwCj4gKwo+ICtoZXJlID0gb3MucGF0aC5hYnNwYXRoKG9z
LnBhdGguZGlybmFtZShfX2ZpbGVfXykpCj4gK1JFQURNRSA9IG9wZW4ob3MucGF0aC5qb2luKGhl
cmUsICdSRUFETUUudHh0JykpLnJlYWQoKQo+ICtDSEFOR0VTID0gb3Blbihvcy5wYXRoLmpvaW4o
aGVyZSwgJ0NIQU5HRVMudHh0JykpLnJlYWQoKQo+ICsKPiArc2V0dXAobmFtZT0nd2hlZWwnLAo+
ICsgICAgICB2ZXJzaW9uPScwLjEnLAo+ICsgICAgICBkZXNjcmlwdGlvbj0nQSBidWlsdC1wYWNr
YWdlIGluc3RhbGxlciBmb3IgUHl0aG9uLicsCj4gKyAgICAgIGxvbmdfZGVzY3JpcHRpb249UkVB
RE1FICsgJ1xuXG4nICsgIENIQU5HRVMsCj4gKyAgICAgIGNsYXNzaWZpZXJzPVsKPiArICAgICAg
ICAiRGV2ZWxvcG1lbnQgU3RhdHVzIDo6IDEgLSAiLAo+ICsgICAgICAgICJJbnRlbmRlZCBBdWRp
ZW5jZSA6OiBEZXZlbG9wZXJzIiwKPgo+IFNvIEknbSBhIGJpdCBwdXp6bGVkIGF0IGhvdyB5b3Ug
Zm91bmQgYSB3aGVlbCBwYWNrYWdlIHRoYXQgZG9lc24ndCBwYXNzCj4gIm5hbWUiIGluIGl0cyBz
ZXR1cCgpIGFyZ3VtZW50cy4KClRoZXJlJ3MgYmVlbiBhIGxvdCBvZiBicm9rZW5uZXNzIHdpdGgg
aG93IHNldHVwdG9vbHMgaXMgaGFuZGxlZCBpbiBnZW5lcmFsCmJ5IHNjYW5weXBpIGZvciBhIHdo
aWxlIGhlcmUsIEkgd2FzIHBsYW5uaW5nIHRvIGRvIHNvbWUgcmVmYWN0b3JpbmcKYWZ0ZXIgaW5p
dGlhbApwZXA1MTcvZmxpdCBzdXBwb3J0IHdhcyBtZXJnZWQgYnkgYXR0ZW1wdGluZyB0byBtYWtl
IHVzZSBvZiBwZXA1MTcgaG9va3M6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyMjExMjgxODMyMzAuMTkxNTU5Mi0xLWphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20vCgo+Cj4gPiBkaWZmIC0tZ2l0IGEvdXRpbHMvc2NhbnB5cGkgYi91dGlscy9z
Y2FucHlwaQo+ID4gaW5kZXggNDUyYjRhM2ZjMy4uYTU1MjJhODc5ZSAxMDA3NTUKPiA+IC0tLSBh
L3V0aWxzL3NjYW5weXBpCj4gPiArKysgYi91dGlscy9zY2FucHlwaQo+ID4gQEAgLTU4LDggKzU4
LDkgQEAgZGVmIHNldHVwX2RlY29yYXRvcihmdW5jLCBtZXRob2QpOgo+ID4gICAgICBkZWYgY2xv
c3VyZSgqYXJncywgKiprd2FyZ3MpOgo+ID4gICAgICAgICAgIyBBbnkgcHl0aG9uIHBhY2thZ2Vz
IGNhbGxzIGl0cyBzZXR1cCBmdW5jdGlvbiB0byBiZSBpbnN0YWxsZWQuCj4gPiAgICAgICAgICAj
IEFyZ3VtZW50ICduYW1lJyBvZiB0aGlzIHNldHVwIGZ1bmN0aW9uIGlzIHRoZSBwYWNrYWdlJ3Mg
bmFtZQo+ID4gLSAgICAgICAgQnVpbGRyb290UGFja2FnZS5zZXR1cF9hcmdzW2t3YXJnc1snbmFt
ZSddXSA9IGt3YXJncwo+ID4gLSAgICAgICAgQnVpbGRyb290UGFja2FnZS5zZXR1cF9hcmdzW2t3
YXJnc1snbmFtZSddXVsnbWV0aG9kJ10gPSBtZXRob2QKPiA+ICsgICAgICAgIG5hbWUgPSBrd2Fy
Z3MuZ2V0KCduYW1lJywgQnVpbGRyb290UGFja2FnZS5zZXR1cF9hcmdzWyduYW1lJ10pCj4gPiAr
ICAgICAgICBCdWlsZHJvb3RQYWNrYWdlLnNldHVwX2FyZ3NbbmFtZV0gPSBrd2FyZ3MKPiA+ICsg
ICAgICAgIEJ1aWxkcm9vdFBhY2thZ2Uuc2V0dXBfYXJnc1tuYW1lXVsnbWV0aG9kJ10gPSBtZXRo
b2QKPiA+ICAgICAgcmV0dXJuIGNsb3N1cmUKPiA+Cj4gPiAgIyBtb25rZXkgcGF0Y2gKPiA+IEBA
IC0xNDcsNiArMTQ4LDcgQEAgY2xhc3MgQnVpbGRyb290UGFja2FnZSgpOgo+ID4gICAgICAgICAg
c2VsZi51cmwgPSBOb25lCj4gPiAgICAgICAgICBzZWxmLnZlcnNpb24gPSBOb25lCj4gPiAgICAg
ICAgICBzZWxmLmxpY2Vuc2VfZmlsZXMgPSBbXQo+ID4gKyAgICAgICAgc2VsZi5zZXR1cF9hcmdz
WyduYW1lJ10gPSBzZWxmLnJlYWxfbmFtZQo+Cj4gSSdtIG5vdCBhIGJpZyBmYW4gb2Ygc2hvZWhv
cm5pbmcgJ25hbWUnIGluIHNldHVwX2FyZ3MsIHdoaWNoIGFzIEkKPiB1bmRlcnN0YW5kIGl0IGlz
IGEgZGljdCB0aGF0IHNob3VsZCBjb250YWluIGEgc2luZ2xlIGtleSBuYW1lZCBhZnRlcgo+IHRo
ZSBwYWNrYWdlLiBQZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBtYWtlICJzZWxmLnJlYWxf
bmFtZSIgYQo+IGNsYXNzIHZhcmlhYmxlIHJhdGhlciB0aGFuIGFuIGluc3RhbmNlIHZhcmlhYmxl
LCBqdXN0IGxpa2Ugc2V0dXBfYXJncwo+IGlzIGFscmVhZHksIHNvIHRoYXQgc2V0dXBfZGVjb3Jh
dG9yIGNhbiBhY2Nlc3MgaXQuIElmIEkgdW5kZXJzdGFuZCB0aGUKPiBjdXJyZW50IGltcGxlbWVu
dGF0aW9uIGNvcnJlY3RseSwgaXQgYW55d2F5IGV4cGVjdHMgdGhlCj4gQnVpbGRyb290UGFja2Fn
ZSgpIGNsYXNzIHRvIGhhdmUgb25seSBvbmUgaW5zdGFuY2UuCj4KPiBXaGF0IGRvIHlvdSB0aGlu
az8KPgo+IEJlc3QgcmVnYXJkcywKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
