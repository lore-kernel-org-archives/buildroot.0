Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BA6C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 22:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6DE419B6;
	Wed, 19 Oct 2022 22:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E6DE419B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KX5ewQv3tV0Z; Wed, 19 Oct 2022 22:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D14419C4;
	Wed, 19 Oct 2022 22:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81D14419C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1361BF3C3
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5476383FC2
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 22:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5476383FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvwyDQL1ijoY for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 22:12:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A342F83FC1
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A342F83FC1
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 22:12:04 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id o2so11679916qkk.10
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 15:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f87rmpYL7TH1Pn06C3K4imILem8qScGF79wBMH+/Bk8=;
 b=AfGk5OVPRQce6Iezri/XRxN00LIfEVHBlkmx780P5atVi879TcSARveHDPoVNnum0P
 /aCW8Y14TyF3TFQPvChepnk6ZTfimpt5E5CAIaV2wh5ak++8eWnERnJGJ36hDdC28ELM
 u3obF9t0Oa6yMxbG9c7KJWX+k18ByQtgnwbDA03isBu9df88GvaOiwpqIG6KjF2uBT3/
 MUBZVml+zN5+USEm6vta8Pm8dUasx7SyZFPmd2BYjVsXM2pX3snpySDwkm+pjBCpNsrZ
 p1tOLqQ+hUxA4T2VJS6x1ynEhZ5oMr8MHpz340thclIOrVVbf16A3TrY+PBbR2nwnwBR
 9m6A==
X-Gm-Message-State: ACrzQf3OqqV6O5kz6joTfEZwSkv2sNs8RQNnM9n4P6V9oJ61r1ik0RtE
 Vt4+onw/xzBIoTYFrb7/+rbSjtzcDnneLTKWekaoI5heLyjF1osmBzrZfQ==
X-Google-Smtp-Source: AMsMyM7OGct33TRH3G8LTmvoDnUI6rXYrM9TjWkjd7GfrFZzCri7A21BFm70Tn8OU0ylImMvh3/SMZ2vKxbzjRm4EsA=
X-Received: by 2002:ae9:e604:0:b0:6ec:c872:a0d5 with SMTP id
 z4-20020ae9e604000000b006ecc872a0d5mr7019371qkf.684.1666217523306; Wed, 19
 Oct 2022 15:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221019175151.1030079-1-nhed+buildroot@starry.com>
 <20221019182521.GF3666@scaer>
In-Reply-To: <20221019182521.GF3666@scaer>
From: Nevo Hed <nhed+buildroot@starry.com>
Date: Wed, 19 Oct 2022 18:11:52 -0400
Message-ID: <CABGDZCkp5eHH3+L0v_SP0T-n2ww2ZoWX503Pzh8KD0DcHf3+dA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f87rmpYL7TH1Pn06C3K4imILem8qScGF79wBMH+/Bk8=;
 b=P87CSn3QN8CjrmvkCN70KwnUi5LrgsN0OYwDv5/ke9W/yP2TgjidUWRAxHC63UURlI
 90PRhs8utCdt1fctA58CqNxgrE9X7vl6YI4+Wk8amoF80OxRpFle4QBUzNZH7PnfpSBp
 Ut77qfIzHkc5IoR+Dlp1rQwSHH+ZAEJW+42FM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=P87CSn3Q
Subject: Re: [Buildroot] [PATCH] core: Use of percent_defconfig seems to
 impact performance
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsCgpPbiBXZWQsIE9jdCAxOSwgMjAyMiBhdCAyOjI1IFBNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IE5ldm8sIEFsbCwKPgo+IE9uIDIw
MjItMTAtMTkgMTM6NTEgLTA0MDAsIE5ldm8gSGVkIHNwYWtlIHRodXNseToKPiA+IE5vdGljZWQg
YSBzaWduaWZpY2FudCBzbG93ZG93biB3aXRoIHJpc2Ugb2YgbnVtYmVyIG9mIGV4dGVybmFsIHRy
ZWVzCj4gPiBpbiBvdXIgZW52LiAgVGhpcyBzbG93ZG93biBzZWVtZWQgdG8gYmUgcmVsYXRlZCB0
byBpbnZvY2F0aW9ucyBpZiB0aGUKPiA+IHBlcmNlbnRfZGVmY29uZmlnIGZ1bmN0aW9uIChHTlUg
TWFrZSA0LjMpLgo+Cj4gV2UgYWxyZWFkeSBoYXZlIGEgcGVuZGluZyBwYXRjaCB0byBhZGRyZXNz
IHRoaXMgaXNzdWU6Cj4gICAgICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjIwOTIwMTk0NjQ1LjY3MDQzMi0xLXlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyLwoKU29ycnksIEkgZm9yZ290IHRvIGxvb2sgaW4gcGF0Y2h3b3JrIGFuZCBqdXN0IHNh
dyB0aGF0IGl0IGlzIHN0aWxsIG5vdAphZGRyZXNzZWQgaW4gbWFzdGVyIChteSBhY3R1YWwgcHJv
amVjdCB1c2VzIHRoZSAyMDIyLjAyIHRhZykKCj4gPiBUaGlzIHBhdGNoIG1ha2VzICVfZGVmY29u
ZmlnIGEgc2luZ2xlIHJ1bGUgd2hpY2ggY29tYmluZXMgdXNlcyB0aGUKPiA+IGZpcnN0IHJldHVy
biBvZiBhIHdpbGRjYXJkIGV4cHJlc3Npb24uCj4KPiBJIGNhbiBjZXJ0YWlubHkgc2VlIHRoYXQg
dGhpcyBsb29rcyBhIGJpdCBzaW1wbGVyIHRoYW4gbXkgcHJvcG9zYWwuCj4KPiBIb2V2ZXIsIEkg
YW0gbm90IHRvbyBmb25kIG9mIGl0LCBiZWNhdXNlIGl0IGRlZmVycyB0aGUgdGVzdCB0aGF0IHRo
ZQo+IGRlZmNvbmZpZyBleGlzdHMgaW50byB0aGUgc2hlbGwgcmF0aGVyIHRoYW4gdGhlIE1ha2Vm
aWxlLiBJIGRvbid0IGtub3csCj4gbWF5YmUgaXQgaXMgaW4gZmFjdCBiZXR0ZXIgYmVjYXVzZSB3
ZSBjYW4gcHJpbnQgYSBtb3JlIHVzZXItZnJpZW5kbHkKPiBlcnJvciBtZXNzYWdlLi4uCgpBZ3Jl
ZWQgb24gdGhhdCBmcm9udCAtIEkgd2FzIGV2ZW4gdG95aW5nIHVzaW5nIGB2cGF0aGAgYnV0IGl0
IGRpZG4ndCBwYW4gb3V0Cihwcm9iYWJseSBiZWNhdXNlIEkgaGF2ZSBub3QgdXNlZCB0aGF0IGZl
YXR1cmUgaW4gYSBsb25nIHRpbWUpLgoKPiA+IFRpbWluZyAoc2Vjb25kcykgb2YgYG1ha2UgcGNf
eDg2XzY0X2Jpb3NfZGVmY29uZmlnYCB3aXRoIDEtOCBleHRlcm5hbAo+ID4gdHJlZXM6Cj4gPgo+
ID4gICAgICNUcmVlcyAgICBCZWZvcmUgICAgQWZ0ZXIKPiA+ICAgICAgICAgIDEgICAgICAwLjM4
ICAgICAwLjM3Cj4gPiAgICAgICAgICAyICAgICAgMC4zMiAgICAgMC4zMQo+ID4gICAgICAgICAg
MyAgICAgIDAuMzEgICAgIDAuMzMKPiA+ICAgICAgICAgIDQgICAgICAwLjM2ICAgICAwLjMyCj4g
PiAgICAgICAgICA1ICAgICAgMC40NSAgICAgMC4zNQo+ID4gICAgICAgICAgNiAgICAgIDEuMjYg
ICAgIDAuMzYKPiA+ICAgICAgICAgIDcgICAgICA5LjEwICAgICAwLjM2Cj4gPiAgICAgICAgICA4
ICAgICA4NS45MyAgICAgMC40Mgo+Cj4gV2VpcmQuIEZvciBtZSwgc3RhcnRpbmcgYXQgNiBleHRl
cm5hbCB0cmVlcywgdGhlIHRpbWUgdG8gY29tcGxldGlvbgo+IGRpcmVjdGx5IGV4cGxvZGVkIGFi
b3ZlIHRoZSBob3VyLgo+Cj4gT25lIGludGVyZXN0aW5nIHBvaW50LCB0aG91Z2ggaXMgdGhhdCB0
aGUgZHVyYXRpb24gZG9lcyBub3Qgc2VlbSB0byBiZQo+IG11Y2ggaW1wYWN0ZWQgYnkgdGhlIG51
bWJlciBvZiBicsOpZXh0ZXJuYWwgdHJlZXMuIENvdWxkIHlvdSB0ZXN0IHdpdGggdXAKPiB0byAx
MDAwIHRyZWVzLCBsaWtlIEkgZGlkPwoKRm9yIDEwMDAsIEkgZ290IDE1LjY4IC0gc28gdGhlIHNh
bWUgbmVpZ2hib3Job29kIGFzIHlvdXJzLgpNYXliZSBkZWx0YXMgaW4gdGhlIDYtNyB0cmVlcyBt
aWdodCBiZSBoYXJkd2FyZSByZWxhdGVkIChjYWNoZSBzaXplcywKRlMgdHlwZXMgZXRjIC0gc3Ry
YWNlLWluZyB0aGUgbWFrZSBpbiB0aGUgbWFueS10cmVlcyBjYXNlIGlzIGEgd2lsZApzcGFtIHN0
b3JtKQoKQWRkZW5kdW06Ckkgb3JpZ2luYWxseSBwcmVwYXJlZCBhIGNvdmVyIGxldHRlciBidXQg
YW0gbm90IGEgZnJlcXVlbnQgdXNlciBvZgpnaXQtc2VuZC1lbWFpbCBhbmQgaXQgZGlkbid0IHNl
bmQuICBJJ2xsIHBhc3RlIGl0IGJlbG93IC0gcGxlYXNlIG5vdGUKdGhlIG9wdGlvbiBvZiBzb21l
IGltcGxpY2l0IHJ1bGUgcmVzZXRzLgoKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CgpGcm9tIDZhMmZhNzRlZGY1YmQzYjI1NGZjN2M0
OWViZTQ2NTI4MGU4ZTg5MDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IE5ldm8gSGVk
IDxuaGVkK2J1aWxkcm9vdEBzdGFycnkuY29tPgpEYXRlOiBXZWQsIDE5IE9jdCAyMDIyIDEzOjMy
OjE0IC0wNDAwClN1YmplY3Q6IFtQQVRDSCAwLzFdIGNvcmU6IFVzZSBvZiBwZXJjZW50X2RlZmNv
bmZpZyBzZWVtcyB0byBpbXBhY3QgcGVyZm9ybWFuY2UKCgpOb3RpY2luZyBzZXJpb3VzIHBlcmZv
cmF0ZSBpc3N1ZXMgb24gYG1ha2UgWF9kZWZjb25maWdgIHdpdGggZ3Jvd3RoIG9mCm51bWJlciBv
ZiBleHRlcm5hbCB0cmVlcy4gIEF0IDcgdHJlZXMgaXQgaXMgc29tZXdoYXQgdG9sZXJhYmxlIGJ1
dCBhdCA4CnRyZWVzIHdlIGhhdmUgc2VlbiBpdCB0YWtlIDgwLTExMCBzZWNvbmRzLgoKTnVtYmVy
cyBmb3IgYmVmb3JlIGFuZCBhZnRlciB0aGUgY2hhbmdlIGluIGNvbW1pdCBpdHNlbGYuCgpJIGRv
IG5vdCBrbm93IGZvciBzdXJlIHdoYXQgdGhlIHVuZGVybHlpbmcgaXNzdWUgaXMgYnV0IGxvb2tp
bmcgYXQgc29tZQpgc3RyYWNlYCBhbmQgYG1ha2UgLWRgIG91dHB1dCBpdCBmZWVscyBsaWtlIGFu
IGltcGxvc2lvbiBvZiBpbXBsaWNpdCBydWxlcwpiZWluZyBldmFsdWF0ZWQuCgpBZGRpbmcgdGhl
IHJlc2V0cyBhcyBzdWdnZXN0ZWQgaGVyZQpodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9o
dG1sL2hlbHAtbWFrZS8yMDAyLTExL21zZzAwMDYyLmh0bWwgc2VlbXMgdG8KaGVscCBhIGxvdCBi
dXQgbm90IGFzIG11Y2ggYXMgdGhlIGF0dGFjaGVkIHBhdGNoLgoKLS04PC0tLS0tLS0tLS0tLQol
OiAlLHYKJTogUkNTLyUsdgolOiBSQ1MvJQolOiBzLiUKJTogU0NDUy9zLiUKLS04PC0tLS0tLS0t
LS0tLQoKSW5saW5lZCBiZWxvdyBhIHNjcmlwdCB0byByZXBybyB0aGlzIGlzc3VlLCBub3Qgc3Vy
ZSBpZiB0aGlzIGZ1bmN0aW9uYWxpdHkKc2hvdWxkIGJlIGludGVncmF0ZWQgYW55d2hlcmUgb3Ig
anVzdCBsZWZ0IGluIHRoZSBtYWlsaW5nIGxpc3QuICBCeQpkZWZhdWx0IHRoZSBzY3JpcHQgcnVu
cyB0aGUgc2NlbmFyaW8gZnJvbSAxIHRyZWUgdG8gOCB0cmVlcy4gIFJ1bm5pbmcgd2l0aApwYXJh
bSAoMS0xMCkgd2lsbCBhbGxvdyBhIHNpbmdsZSBydW4gd2l0aCB0aGF0IG1hbnkgdHJlZXMuCgoK
LS04PC0tLS0tLS0tLS0tLQojIS91c3IvYmluL2VudiBiYXNoCgpkZWNsYXJlIHRyZWVkaXJzPSgp
CgpkZWNsYXJlIC1yIGNmZz0icGNfeDg2XzY0X2Jpb3NfZGVmY29uZmlnIgoKZnVuY3Rpb24gc2V0
dXBfZGlyIHsKICAgIGZvciB0cmVlIGluIHRyZWV7MS4uMTB9OyBkbwogICAgICAgIGxvY2FsIHRy
ZWVkaXI9ImRlZmNvbmZfdGVzdC8ke3RyZWV9IgoKICAgICAgICBta2RpciAtcCAiJHt0cmVlZGly
fS9jb25maWdzIgogICAgICAgIHRvdWNoICIke3RyZWVkaXJ9L0NvbmZpZy5pbiIKICAgICAgICB0
b3VjaCAiJHt0cmVlZGlyfS9leHRlcm5hbC5tayIKICAgICAgICBlY2hvIC1lICJuYW1lOiAke3Ry
ZWVeXn1cbmRlc2M6ICR7dHJlZV59IiA+ICIke3RyZWVkaXJ9L2V4dGVybmFsLmRlc2MiCgogICAg
ICAgIGNwICIuL2NvbmZpZ3MvJHtjZmd9IiAiJHt0cmVlZGlyfS9jb25maWdzLyR7dHJlZX1fJHtj
Zmd9IgoKICAgICAgICB0cmVlZGlycys9KCAiJHt0cmVlZGlyfSIgKQogICAgZG9uZQp9CgpmdW5j
dGlvbiBydW5fb25lIHsKICAgIGxvY2FsIGNvdW50PSIkezF9IgogICAgbG9jYWwgYnIyX2V4dGVy
bmFsPSQoSUZTPSc6JzsgZWNobyAiJHt0cmVlZGlyc1sqXTowOmNvdW50fSIpCiAgICBlY2hvICJE
ZWZjb25maWcgd2l0aCAke2NvdW50fSB0cmVlcyAoQlIyX0VYVEVSTkFMPVwiJHticjJfZXh0ZXJu
YWx9XCIpIgogICAgL3Vzci9iaW4vdGltZSAtZiAiJHtjb3VudH0sJWUiIC9iaW4vbWFrZQpCUjJf
RVhURVJOQUw9IiR7YnIyX2V4dGVybmFsfSIgIiR7Y2ZnfSIKfQoKIyBNYWluCnNldHVwX2Rpcgpp
ZiBbIC1uICIkezF9IiBdOyB0aGVuCiAgICBydW5fb25lICIkezF9IgplbHNlCiAgICBmb3IgaSBp
biB7MS4uOH07IGRvCiAgICAgICAgcnVuX29uZSAkaQogICAgZG9uZQpmaQotLTg8LS0tLS0tLS0t
LS0tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
