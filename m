Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197C1E77374
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAB5183DF9;
	Sat, 30 Sep 2023 14:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAB5183DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyD5UzrbLswJ; Sat, 30 Sep 2023 14:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7855182157;
	Sat, 30 Sep 2023 14:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7855182157
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5798A1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB7060E27
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB7060E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97HJIvdmcAE8 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:13:50 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E36A060DFC
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36A060DFC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DE792B00579;
 Sat, 30 Sep 2023 16:13:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 16:13:45 +0200
Date: Sat, 30 Sep 2023 16:13:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230930141345.GD2579@scaer>
References: <20230930092150.526483-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930092150.526483-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696083228;
 bh=ydojx8bQH/HpDxMxRxKHA9YISNQSLiUCJ4ipABsMHcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WO7tMPRg6C/GPQHqYWaBVYPsjeC4lzPMSxhhOstKqBp4jWSu8bRnUXkHx+UZM4hGJ
 CCgglUyH2QofFNf/CxYl/fb/rJBpd7224toEWyOB9nNbljqflJtDqIItL2qKRnnLeE
 zkYr9jHRWg1V/q2vws0vC4lNe2gh67o2PyImSY2mvWpuGPyJxpNWPNyQuWIpDMsLZ7
 bHDjtvqVZqO6/2j0GaaE+/XFicuviUYbnXt0MD3kfNygf9U61rzEIjQLtrRJkU7REM
 kbm9cHNT3xHG7aRUGTivd4ev47YLdy0iFS1DIQdfSQf49qXhYSEgfoIzpjqz9cIsrh
 oHvYrtT1QB/XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WO7tMPRg
Subject: Re: [Buildroot] [PATCH] docs/website/association.html: move
 buildroot-association to Gitlab
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

VGhvbWFzLCBBbGwsCgpPbiAyMDIzLTA5LTMwIDExOjIxICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFRoZSBidWlsZHJvb3QtYXNzb2NpYXRpb24g
cmVwb3NpdG9yeSB1c2VkIHRvIGJlIGhvc3RlZCBvbiBHaXRodWIsIHRoZW4KPiB3YXMgY2xvc2Vk
IGZvciBzb21lIGJhbmtpbmcgaXNzdWVzLiBXZSdyZSBub3cgbWFraW5nIGl0IHB1YmxpYyBhZ2Fp
biwKPiBidXQgb24gR2l0bGFiIGxpa2UgdGhlIHJlc3Qgb2YgQnVpbGRyb290Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
CgpBcHBsaWVkIHRvIG1hc3RlciwgYWZ0ZXIgZml4aW5nIHRoZSByZW1haW5pbmcgR2l0aHViIGlu
c3RhbmNlIGFzIG5vdGljZWQKYnkgRGFuaWVsLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKPiAtLS0KPiAgZG9jcy93ZWJzaXRlL2Fzc29jaWF0aW9uLmh0bWwgfCAxMiArKysrKyst
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZG9jcy93ZWJzaXRlL2Fzc29jaWF0aW9uLmh0bWwgYi9kb2NzL3dl
YnNpdGUvYXNzb2NpYXRpb24uaHRtbAo+IGluZGV4IDAyMTVmODU4NzQuLmRhNzMzYzUwMTMgMTAw
NjQ0Cj4gLS0tIGEvZG9jcy93ZWJzaXRlL2Fzc29jaWF0aW9uLmh0bWwKPiArKysgYi9kb2NzL3dl
YnNpdGUvYXNzb2NpYXRpb24uaHRtbAo+IEBAIC0zMiwyMSArMzIsMjEgQEAKPiAgCSAgPC91bD4K
PiAgCj4gIAkgIDxwPlRoZSBieWxhd3Mgb2YgdGhlIGFzc29jaWF0aW9uIGFyZSBhdmFpbGFibGUK
PiAtCSAgaW4gPGEgaHJlZj0iaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2J1aWxk
cm9vdC9idWlsZHJvb3QtYXNzb2NpYXRpb24vbWFzdGVyL3N0YXR1dHNfZnIudHh0Ij5GcmVuY2g8
L2E+Cj4gKwkgIGluIDxhIGhyZWY9Imh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC1hc3NvY2lhdGlvbi8tL3Jhdy9tYXN0ZXIvc3RhdHV0c19mci50eHQiPkZyZW5jaDwv
YT4KPiAgCSAgKG9mZmljaWFsKSBhbmQKPiAtCSAgaW4gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL2J1aWxkcm9vdC9idWlsZHJvb3QtYXNzb2NpYXRpb24vYmxvYi9tYXN0ZXIvc3RhdHV0ZXNf
ZW4udHh0Ij5FbmdsaXNoPC9hPgo+ICsJICBpbiA8YSBocmVmPSJodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QtYXNzb2NpYXRpb24vLS9yYXcvbWFzdGVyL3N0YXR1dGVz
X2VuLnR4dCI+RW5nbGlzaDwvYT4KPiAgCSAgKHVub2ZmaWNpYWwgdHJhbnNsYXRpb24pLiBUaGUg
YXNzb2NpYXRpb24gd2FzIGRlY2xhcmVkIG9uCj4gIAkgIE1hcmNoIDE0LCAyMDE2IHRvIHRoZSA8
ZW0+UHLDqWZlY3R1cmUgZGUgSGF1dGUtR2Fyb25uZTwvZW0+Cj4gIAkgIChGcmFuY2UpIGFuZCBp
cyByZWdpc3RlcmVkIHVuZGVyIHRoZSBuwrBXMzEzMDI0Mjc4LiBTZWUgdGhpcwo+IC0JICBvZmZp
Y2lhbCA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vYnVpbGRyb290L2J1aWxkcm9vdC1hc3Nv
Y2lhdGlvbi9ibG9iL21hc3Rlci9wZGYvUmVjZXBpc3NlX0NSLnBkZiI+cmVjZWlwdDwvYT4KPiAr
CSAgb2ZmaWNpYWwgPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290LWFzc29jaWF0aW9uLy0vcmF3L21hc3Rlci9wZGYvUmVjZXBpc3NlX0NSLnBkZiI+cmVj
ZWlwdDwvYT4KPiAgCSAgZnJvbSB0aGUgRnJlbmNoIGF1dGhvcml0aWVzLjwvcD4KPiAgCj4gIAkg
IDxwPk91ciBhY2NvdW50aW5nIGlzIGZ1bGx5IHB1YmxpYywgaW5jbHVkaW5nIHRoZSBiYW5rCj4g
IAkgIGFjY291bnQgc3VtbWFyaWVzLAo+IC0JICBzZWUgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL2J1aWxkcm9vdC9idWlsZHJvb3QtYXNzb2NpYXRpb24vdHJlZS9tYXN0ZXIvYWNjb3VudGlu
ZyI+YWNjb3VudGluZzwvYT4uIE51bWVyb3VzCj4gKwkgIHNlZSA8YSBocmVmPSJodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QtYXNzb2NpYXRpb24vLS90cmVlL21hc3Rl
ci9hY2NvdW50aW5nIj5hY2NvdW50aW5nPC9hPi4gTnVtZXJvdXMKPiAgCSAgb3RoZXIgYWRtaW5p
c3RyYXRpdmUgZG9jdW1lbnRzIHJlbGF0ZWQgdG8gdGhlIGFzc29jaWF0aW9uCj4gIAkgIGFyZSBh
dmFpbGFibGUgb24KPiAtCSAgaXRzIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJv
b3QvYnVpbGRyb290LWFzc29jaWF0aW9uLyI+R2l0aHViCj4gKwkgIGl0cyA8YSBocmVmPSJodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QtYXNzb2NpYXRpb24vIj5HaXRo
dWIKPiAgCSAgcmVwb3NpdG9yeTwvYT48L3A+Cj4gIAk8L2Rpdj4KPiAgICAgICAgPC9kaXY+Cj4g
QEAgLTY4LDcgKzY4LDcgQEAKPiAgCj4gIAkgIDxwPk9uY2UgdGhlIG1lbWJlcnNoaXAgZmVlIGlz
IHJlY2VpdmVkLCBpdCB3aWxsIGJlIGxpc3RlZCBpbgo+ICAJICB0aGUKPiAtCSAgYXNzb2NpYXRp
b24gPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QtYXNzb2Np
YXRpb24vdHJlZS9tYXN0ZXIvYWNjb3VudGluZyI+YWNjb3VudGluZzwvYT4KPiArCSAgYXNzb2Np
YXRpb24gPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
LWFzc29jaWF0aW9uLy0vdHJlZS9tYXN0ZXIvYWNjb3VudGluZyI+YWNjb3VudGluZzwvYT4KPiAg
CSAgZmlsZXMsIHdoaWNoIHNlcnZlIGFzIHRoZSBvZmZpY2lhbCBsaXN0IG9mCj4gIAkgIG1lbWJl
cnMuIFRoZXJlZm9yZSwgbWVtYmVycyBhY2NlcHQgdGhhdCB0aGVpciBuYW1lIGFuZCB0aGUKPiAg
CSAgYW1vdW50IG9mIHRoZWlyIG1lbWJlcnNoaXAgZmVlIGlzIG1hZGUgcHVibGljLjwvcD4KPiAt
LSAKPiAyLjQxLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
