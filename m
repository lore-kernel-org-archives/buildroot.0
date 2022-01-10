Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2A2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 10:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B17B40541;
	Mon, 10 Jan 2022 10:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fQlEylcnFKL; Mon, 10 Jan 2022 10:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F192404BE;
	Mon, 10 Jan 2022 10:03:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D50D1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 10:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 135DF404BE
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 10:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKLKxg2NH4Lo for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 10:02:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6F35400A6
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 10:02:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (29)
Received: from zm (pub-91.183.29.194.multiplay.pl [194.29.183.91])
 by server220076.nazwa.pl (Postfix) with ESMTP id 88E3D8834D;
 Mon, 10 Jan 2022 11:02:55 +0100 (CET)
References: <20220106123449.344837-1-romain.naour@smile.fr>
User-agent: mu4e 1.6.10; emacs 27.2
From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
To: Romain Naour <romain.naour@smile.fr>
Date: Mon, 10 Jan 2022 11:01:16 +0100
In-reply-to: <20220106123449.344837-1-romain.naour@smile.fr>
Message-ID: <87mtk3vrg6.fsf@grinn-global.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4] package/gitlab-runner: new package
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
Cc: =?utf-8?B?SsOpcsOpbXk=?= Rosen <jeremy.rosen@smile.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ClJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cml0ZXM6Cgo+IEZyb206IE1h
cmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBncmlubi1nbG9iYWwuY29tPgo+Cj4gV2UgcmVseSBv
biBjb25maWcudG9tbCB0byBiZSBjcmVhdGVkIG1hbnVhbGx5IGR1cmluZyBmaXJzdCBib290IGFz
IHNldHVwIHN0YWdlLgo+IEV2ZW4gd2l0aCBhbiBlbXB0eSBjb25maWcudG9tbCBmaWxlLCB0aGUg
Z2l0bGFiLXJ1bm5lciBuZWVkcyBnaXRsYWIKPiByZWdpc3RyYXRpb24gdG9rZW4gdG8gcmVnaXN0
ZXIgdG8gYSBnaXRsYWIgc2VydmVyLgo+Cj4gVXNlIHRoZSAxNC41LjEgcmVsZWFzZSBzaW5jZSAx
NC41LjIgYW5kIDE0LjYuMCB0cmlnZ2VycyBhIGJ1aWxkIGVycm9yIFsxXQo+IGR1ZSBhIHBhdGNo
IGZvciBHTyA8IDEuMTcuCj4gKGhlbHBlcnMvcGF0Y2hlcy9pc3N1ZV8yODczMi9zeXNjYWxsLmdv
OjExOjI6IHVuZGVmaW5lZDogc3lzY2FsbC5Jc3N1ZTI4NzMyRml4KQo+Cj4gVGVzdGVkOgo+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzQ0MjYwNDg3Ngo+
Cj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9naXRsYWItb3JnL2dpdGxhYi1ydW5uZXIvLS9pc3N1
ZXMvMjg3NjYKPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmNpbiBOaWVzdHJvaiA8bS5uaWVzdHJvakBn
cmlubi1nbG9iYWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPgo+IENjOiBKw6lyw6lteSBSb3NlbiA8amVyZW15LnJvc2VuQHNtaWxlLmZy
Pgo+IC0tLQo+IE5vdGU6IFdlIHVzZWQgdGhlIGdpdGxhYi1ydW5uZXIgZm9yIHNoZWxsIG9yIHB5
dGhvbiBqb2JzLgo+IEpvYnMgdXNpbmcgZG9ja2VyIGltYWdlcyAoaW1hZ2VzOiBpbiBnaXRsYWIt
Y2kueW1sKSBpcyBub3QgdGVzdGVkLgo+Cj4gdjQ6IHVwZGF0ZSB0byAxNC41LjEKPiAgICAgUmVt
b3ZlIGNvbmZpZy50b21sIGhhbmRsaW5nIGZyb20gLm1rLgo+ICAgICBXZSByZWx5IG9uIGNvbmZp
Zy50b21sIHRvIGJlIGNyZWF0ZWQgZHVyaW5nIGZpcnN0IGJvb3QgYXMgc2V0dXAgc3RhZ2UuCj4g
ICAgIEV2ZW4gd2l0aCBhbiBlbXB0eSBjb25maWcudG9tbCBmaWxlLCB0aGUgZ2l0bGFiLXJ1bm5l
ciBuZWVkcyBnaXRsYWIKPiAgICAgcmVnaXN0cmF0aW9uIHRva2VuIHRvIHJlZ2lzdGVyIHRvIGEg
Z2l0bGFiIHNlcnZlci4gKE1hcmNpbiBOaWVzdHJvaikKPiAgICAgUmVtb3ZlIGFsaWFzIGdpdGxh
Yi1jaS1tdWx0aS1ydW5uZXIuc2VydmljZSAoTWFyY2luIE5pZXN0cm9qKSwKPiAgICAgZ2l0bGFi
LWNpLW11bHRpLXJ1bm5lci5zZXJ2aWNlIGNvbW1lIGZyb20gRGViaWFuIGdpdGxhYi1ydW5uZXIg
c3lzdGVtZAo+ICAgICBzZXJ2aWNlIGZpbGUuCj4KPiB2MzogQ2hhbmdlIGRhZW1vbiBwcm9jZXNz
IHRvIGdpdGxhYi1ydW5uZXIgdXNlci4KPiAgICAgc2VlIGFzIGV4YW1wbGU6IGh0dHBzOi8vZ2l0
LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3RyZWUvcGFja2FnZS90cG0yLWFicm1kL1M4MHRwbTIt
YWJybWQ/aD0yMDIwLjA1LXJjMiNuMzEKPgo+IFtSb21haW46IFRlc3RlZCBvbmx5IHVzaW5nIHN5
c3RlbWQgaW5pdCBvbiBhYXJjaDY0IHRhcmdldCBlbXVsYXRlZCBieSBRZW11XQo+IHYyOiBhZGQg
c2VydmljZSBmaWxlLCBjb25maWcgZmlsZSwgZ2l0bGFiIHVzZXIuCj4gICAgIGFkZCBiYXNoIGFz
IHJ1bnRpbWUgZGVwZW5kZW5jeS4KPiAgICAgQWRkIGdpdCwgY3VybCwgY2EtY2VydGlmaWNhdGUs
IHRhciBydW50aW1lIGRlcGVuZGVuY2llcyBmcm9tIG9uIGRlYmlhbiBjb250cm9sIGZpbGUgZm9y
IGdpdGxhYi1ydW5uZXIgcGFja2FnZS4KPiAgICAgVXNlIGdudSB0YXIgc2luY2Ugd2UgY2FuIGV4
cGVjdCB0YXIgb3B0aW9ucyB0aGF0IGFyZSBub3Qgc3VwcG9ydGVkIGJ5IGJ1c3lib3ggdGFyIGlt
cGxlbWVudGF0aW9uLgo+ICAgICBFbmFibGUgU1NML1RMUyBsaWJyYXJ5IHdpdGggb3BlbnNzbCBu
ZWVkZWQgYXQgcnVudGltZS4KPiAgICAgQWRkIG1lIGFzICJkZXZlbG9wZXIiLgo+Cj4gdGVzdC1w
a2cgY29uZmlnOgo+IEJSMl9QQUNLQUdFX0dJVExBQl9SVU5ORVI9eQo+IC0tLQoKVGhhbmtzIFJv
bWFpbiBmb3IgdXBkYXRpbmcgYW5kIHJlc2VuZGluZyB0aGlzIHBhdGNoISBMb29rcyBmaW5lIHRv
IG1lIGFzIGl0IGlzIQoKLS0KUmVnYXJkcywKTWFyY2luIE5pZXN0csOzagpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
