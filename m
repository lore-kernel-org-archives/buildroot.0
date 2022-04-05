Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F07EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 16:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E3D402C6;
	Tue,  5 Apr 2022 16:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxUQnIYxNZs9; Tue,  5 Apr 2022 16:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0920740321;
	Tue,  5 Apr 2022 16:18:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF01C1BF3AF
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 16:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EDFA82AC3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 16:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KhIIkAeslxei for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 16:18:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9F7F8254D
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649175497;
 bh=hAX8FG8YNAFCnXsm3uNZ9PWaCVHINmAmhLp6HArsk7E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=k0B4q8O+T6Zt8GxBZCIx/mBeEXbsqyGqpCPpxs0wSW99TZbklFbZ+bEHOTYV/i8wS
 lwq25NW+ObL/0JvrFxoiNcSQ8Xhybs5HRAmd4y73rxQN7eViwRxDqdwRDrcHF7+9IR
 p2zFvKj8co5NJVlgjf+L+AUZEagFuzgGSNrpOKNo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.249]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lY1-1ncapX3hxb-000pc2; Tue, 05
 Apr 2022 18:18:17 +0200
Date: Tue, 5 Apr 2022 18:18:15 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Tim Hammer <Tim.Hammer@orolia.com>
Message-ID: <20220405181815.5dd6d85e@gmx.net>
In-Reply-To: <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
 <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:ssNJpwgv0OhSay1ksF9YgykNtyQg92Nlo9jCRv0D3cmfzCW0qI7
 Blm8jzGcHXTqV7CHyjzF6sTLaFDfQt7g7sTw3MzZd1ix3m6bTqXQ0czWnHfZD2GUbH6d/v+
 ZUYuqSP7zHuVbeUY1BygUcF0xT6fGXRYHiXZ91AF1r38BT+qC7zRVU1mvgU16O/1TzUNCJb
 9m7zKaoN5LIUQrFhwpyQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j3+uy0m+YU8=:fOsRE8QlwP+7qyEfAfUChq
 Tcu51QcldIwhfcUH9Wpbwadh/kH7FhJcruq+hov6uCoKUGOfmQ008P+s8vT67Siruw0c9Mm6Q
 b0xIa/apSmOqNgh4T2GivKZ1Ow47wyG90fgkztQMJlPSA99qfvIiQvuN8QYu72elopVs7ueQp
 XxFYhj17NLM3Z6Aydsv3AF9E5mLmnHYxlkAZ8+RQXIKRrdQp9D+1jCtH9u1ecZ8gmcgu4rjTl
 QWhhd0DyKY7u1xmWARVNEr8Kav6myjcsQMFTvXuGw3rzea/nNzmPjTSRLedZ60JYst3iqZ9u1
 cpjSBraf5mEBrw2aJI1ZdJUb1y1AqIXPw9UVGE+pWNg9T0PGWg3Re+bkUrnrOg6FET66u2pha
 fr2sLZCO/1OQDHpgnhyOK/bUig0kx7LhqFaAn+TNeXoUs7/dqBPn6Zm8jF5gee60AFuxJwC2F
 l/TIljpjLrTAh+oB7zTuDK4dfxKoQzz3K3BnELvTkxTsUCMAkeEUKOdUKISSLLKYLjmuBquMS
 Ujevw7CgPfL/m1KSr8xtWgNz4XttKDnlJJ69nJDB8XjX9lD38g8xS+OZ2TKzTdKmHFwJ4ao5A
 f9SNjCAaQk4+Cy2eQXqfkhqKpnjCx/jt1CbdJrPxRh1Z3qdQepUujrg58kQ2+eM+TAUS0M85j
 UAGnr2iyMlatDjbU2ra9O7IpL62upxaQ6T2MR08/q7j7Yng14ULqHilE2asIqd9arPa3k2vo+
 q58TsAUv0AyEK4zM5E3J2lf9w+6uwLWSkbaHjFq8jXqU0fjHFsrHQl2gBY1KHk9PqAlC7gg1G
 dhr5p/AjMHss1e7TK6uFlHgC63EmSvomDh9upVfdlRNBx/G85QNT1gYLJZy9GH2lJ2fiVl8Pi
 pEtiS1i99+PR8UFABPtUs13RNXqYavrb++FjBeMLhHpwPzCwrKqzEr0U0bUbhcN+C+x7qwGKR
 0gKkoDts5zgMelDGXsfw3riBYdn7cpefW5JaV+pos2EM07hj58cfaXoY/4p7HD+oNzkN9Qugq
 2zCJXDRIVA8Uw5umXr1+P+wR0Mj1LrOu8J9353+ECixzdKh+D4oOkJmxS3qWX+yGM6/k7m6A6
 k+8DTsdMO0j6ls=
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGltLAoKT24gVHVlLCA1IEFwciAyMDIyIDEyOjE1OjE0ICswMDAwLCBUaW0gSGFtbWVy
IDxUaW0uSGFtbWVyQG9yb2xpYS5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIEFwciAwNSwgMjAyMiBh
dCAwODoxOTowOEFNICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gRGVhciBUaW0s
Cj4gPiAKPiA+IExlIG1hci4gNSBhdnIuIDIwMjIgw6AgMDU6NTQsIFRpbSBIYW1tZXIgPFRpbS5I
YW1tZXJAb3JvbGlhLmNvbT4gYSDDqWNyaXQgOiAgCj4gPiA+Cj4gPiA+IE9uIFN1biwgQXByIDAz
LCAyMDIyIGF0IDEyOjAzOjE4UE0gKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6ICAKPiA+
ID4gPiBVc2UgaW50ZXJuYWwgYmluZCBhcyBkaGNwIGRvZXNuJ3QgYnVpbGQgc2luY2UgYnVtcCBv
ZiBiaW5kIHRvIHZlcnNpb24KPiA+ID4gPiA5LjE2LjI2IGluIGNvbW1pdCA4YWRlYWVjOGFmYWNi
YzY4MGVkZWJhZTkxNTI0ZjYxNDQ5MjZhYzkyIGFuZCB1cHN0cmVhbQo+ID4gPiA+IGRvZXNuJ3Qg
cGxhbiB0byBmaXggaXQgYW55IHRpbWUgc29vbjoKPiA+ID4gPiBodHRwczovL2dpdGxhYi5pc2Mu
b3JnL2lzYy1wcm9qZWN0cy9kaGNwLy0vaXNzdWVzLzIzMyNub3RlXzI3Njg4Mwo+ID4gPiA+Cj4g
PiA+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2luY2x1ZGVzL2RoY3BkLmg6OTEsCj4gPiA+
ID4gICAgICAgICAgICAgICAgICBmcm9tIGN0cmFjZS5jOjI5Ogo+ID4gPiA+IC4uL2luY2x1ZGVz
L29tYXBpcC9pc2NsaWIuaDo1MToxMDogZmF0YWwgZXJyb3I6IGlzYy9ib29sZWFuLmg6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiA+ID4gPiAgICA1MSB8ICNpbmNsdWRlIDxpc2MvYm9vbGVh
bi5oPgo+ID4gPiA+ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+Cj4gPiA+ID4KPiA+
ID4gPiAgIC4uLgo+ID4gPiA+Cj4gPiA+ID4gICMgdXNlIGxpYnRvb2wtZW5hYmxlZCBjb25maWd1
cmUuYWMKPiA+ID4gPiAgZGVmaW5lIERIQ1BfTElCVE9PTF9BVVRPUkVDT05GCj4gPiA+ID4gQEAg
LTIxLDExICsyMywxMiBAQCBESENQX0NPTkZfRU5WID0gXAo+ID4gPiA+ICAgICAgIENQUEZMQUdT
PSctRF9QQVRIX0RIQ1BEX0NPTkY9XCIvZXRjL2RoY3AvZGhjcGQuY29uZlwiIFwKPiA+ID4gPiAg
ICAgICAgICAgICAgIC1EX1BBVEhfREhDTElFTlRfQ09ORj1cIi9ldGMvZGhjcC9kaGNsaWVudC5j
b25mXCInIFwKPiA+ID4gPiAgICAgICBDRkxBR1M9JyQoVEFSR0VUX0NGTEFHUykgLURJU0NfQ0hF
Q0tfTk9ORT0xJwo+ID4gPiA+ICtESENQX0JJTkRfRVhUUkFfQ09ORklHID0gQlVJTERfQ0M9JyQo
VEFSR0VUX0NDKScKPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IFRoZSBvbmx5IHBsYWNlIEJVSUxEX0ND
IGlzIHVzZWQgaW4gdGhlIGJ1bmRsZWQgYmluZC05LjExIGlzIHRvIGJ1aWxkIGxpYi9kbnMvZ2Vu
LCB3aGljaCBuZWVkcyB0byBydW4gb24gdGhlIGhvc3QuCj4gPiA+IFNvIHRoaXMgc2hvdWxkIGJl
IHRoZSBob3N0IGNvbXBpbGVyLCBub3QgdGhlIHRhcmdldC4KPiA+ID4gSSBkbyBub3Qga25vdyB0
aGUgYmVzdC9jb3JyZWN0IHdheSB0byBpbmRpY2F0ZSB0aGlzLiBUbyBnZXQgcGFzdCB0aGUgaXNz
dWUgSSBjaGFuZ2VkIGl0IHRvICcvdXNyL2Jpbi9nY2MnLi4uICAKPiA+IAo+ID4gVGhhbmtzIGZv
ciBzcG90dGluZyB0aGlzLCBJIGJhc2ljYWxseSBjb3B5L3Bhc3RlZCB3aGF0IHdhcyBkb25lIGlu
IGJpbmQubWsuCj4gPiBUaGUgY29ycmVjdCB3YXkgdG8gZG8gdGhpcyBpcyB0byB1c2UgJChIT1NU
X0NDKSBpbnN0ZWFkIG9mICQoVEFSR0VUX0NDKS4KPiA+ICAgCj4gCj4gVGhpcyBpcyB3aHkgSSBz
YWlkIEkgZG8gbm90IGtub3cgdGhlIGNvcnJlY3Qgd2F5LSB3aGVuIEkgdXNlICQoSE9TVF9DQyks
IEkgZ2V0Cj4gICAgICA+Pj4gZGhjcCA0LjQuMi1QMSBCdWlsZGluZyAgCj4gICAgICBQQVRIPSIv
aG9tZS90aGFtbWVyL1B1YmxpYy9idWlsZHJvb3QvVEVTVC9ob3N0L2JpbjovaG9tZS90aGFtbWVy
L1B1YmxpYy9idWlsZHJvb3QvVEVTVC9ob3N0L3NiaW46L2hvbWUvdGhhbW1lci8ubG9jYWwvYmlu
Oi9ob21lL3RoYW1tZXIvYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2xvY2FsL2JpbjovdXNyL3Ni
aW46L3Vzci9iaW46L3NiaW46L2JpbjovdXNyL2dhbWVzOi91c3IvbG9jYWwvZ2FtZXM6L3NuYXAv
YmluOi9vcHQvYWx0ZXJhL25pb3MyZWRzL2Jpbi9nbnUvSC14ODZfNjQtcGMtbGludXgtZ251L2Jp
bjovb3B0L2FsdGVyYS9uaW9zMmVkcy9zZGsyL2Jpbjovb3B0L2FsdGVyYS9uaW9zMmVkcy9iaW46
L29wdC9hbHRlcmEvcXVhcnR1cy9iaW46L29wdC9hbHRlcmEvcXVhcnR1cy9zb3BjX2J1aWxkZXIv
YmluIiAgL3Vzci9iaW4vbWFrZSAtajEgIC1DIC9ob21lL3RoYW1tZXIvUHVibGljL2J1aWxkcm9v
dC9URVNUL2J1aWxkL2RoY3AtNC40LjItUDEvCj4gICAgICBNYWtpbmcgYWxsIGluIC4vYmluZAo+
ICAgICAgQ29uZmlndXJpbmcgQklORCBsaWJyYXJpZXMgZm9yIERIQ1AuCj4gICAgICBjb25maWd1
cmU6IFdBUk5JTkc6IHVzaW5nIGNyb3NzIHRvb2xzIG5vdCBwcmVmaXhlZCB3aXRoIGhvc3QgdHJp
cGxldAo+ICAgICAgY29uZmlndXJlOiBlcnJvcjogQlVJTERfQ0Mgbm90IHNldAo+ICAgICAgbWFr
ZVszXTogKioqIFtNYWtlZmlsZTo0MjogYmluZDFdIEVycm9yIDEKPiAKPiAKPiA+IEhvd2V2ZXIs
IEkgYXNzdW1lIHRoYXQgQlVJTERfQ0MgYW5kIEJVSUxEX0NGTEFHUyBpbiBiaW5kLm1rIHNob3Vs
ZAo+ID4gYWxzbyBiZSB1cGRhdGVkPyAgCj4gCj4gSSBkbyBub3QgaGF2ZSB0aGUgaXNzdWUgYnVp
bGRpbmcgYmluZCAoOS4xNi4yNiksIHRoZXJlIGxpYi9kbnMvTWFrZWZpbGUuaW4gc2VlbXMgdG8g
YmUgYmV0dGVyIHdyaXR0ZW46Cj4gCj4gICAgICBnZW46IGdlbi5jCj4gCSR7SE9TVENDfSAke0hP
U1RfQ0ZMQUdTfSAtSSR7dG9wX3NyY2Rpcn0vbGliL2lzYy9pbmNsdWRlIFwKPiAJJHtIT1NUX0xE
RkxBR1N9IC1vICRAICR7c3JjZGlyfS9nZW4uYwo+IAo+IFBlcmhhcHMgd2Ugc2hvdWxkIGJlIHBh
dGNoaW5nIHRoYXQgZmlsZSBpbnN0ZWFkIG9mIHRoZSBjb25maWc/CgpTZWUgaHR0cHM6Ly9naXQu
YnVpbGRyb290Lm5ldC9idWlsZHJvb3QvdHJlZS9wYWNrYWdlL2JpbmQvMDAwMS1jcm9zcy5wYXRj
aAoKUmVnYXJkcywKUGV0ZXIKCgo+IAo+ID4gCj4gPiBDb3VsZCB5b3Ugc2VuZCB0aG9zZSB0d28g
cGF0Y2hlcyAoZGhjcCBhbmQgYmluZCkgdG8gdGhlIGJ1aWxkcm9vdAo+ID4gbWFpbGluZyBvciBk
byB5b3UgcHJlZmVyIHRoYXQgSSBzZW5kIHRoZW0/Cj4gPiAgIAo+IAo+IEkgY2FuIHRyeSBvdXQg
bXkgb3RoZXIgdGhvdWdodCBhbmQgc2VuZCB0aGF0IGluIGEgd2hpbGUgKGlmIGl0IHNlZW1zIHRv
IHdvcmspLgo+IAo+ID4gPiAuLi4KPiA+ID4gIAo+ID4gCj4gPiBCZXN0IFJlZ2FyZHMsCj4gPiBG
YWJyaWNlICAKPiAKPiAuVGltCj4gVGltIEQuIEhhbW1lcgo+IHRpbS5oYW1tZXJAb3JvbGlhLmNv
bQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
