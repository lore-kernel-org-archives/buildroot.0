Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188B1EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 06:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 996D860E1B;
	Mon, 26 Jun 2023 06:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 996D860E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufmSfGpfM0lb; Mon, 26 Jun 2023 06:46:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA04260BC7;
	Mon, 26 Jun 2023 06:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA04260BC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 003EA1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 06:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE2E082031
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 06:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE2E082031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uLGQUHxyUZdn for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 06:46:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C9B881E41
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C9B881E41
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 06:46:37 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfpKZ-1pXjbV3Zo9-00gFrq; Mon, 26 Jun 2023 08:46:33 +0200
Message-ID: <1efc9e92-3264-02d8-4963-17339080a1ce@vivier.eu>
Date: Mon, 26 Jun 2023 08:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: fr
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230626054652.661940-1-bernd@kuhls.net>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230626054652.661940-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:gvatDwijrPvvB+VIIQ3EaHNCH+VHZBAF0U6iEv+qo23rOvrvhji
 00zciDNnSs5/BNW3iXs6y3m3DLM2EPy+89eRwiD8DRvI5pZnNJLQLHXI/idJQPXBV99uaqw
 qORdxMcCNfBU8EMuhSCAScXmTHAQT3j1b7vyIOBfv1bbWPj+K7faBm1mU06WK6ngh4EdNdj
 3IeodgbqUKkWzOL2lXbWA==
UI-OutboundReport: notjunk:1;M01:P0:MpqV7dTV9ik=;NuOw0MHR6Ovp23tS6tQLJpYQr71
 KSGldof+4mBhIS6lIMevxGz22Z6//USib+RMY/WYW3D7qMhWI0jJjjAFGjld9PRsbH9mt1FuT
 M+ND/ZhhOUkFWbc7PJHDr+rGm0MXi0RMwtbOAWfLgGQ6/D2rmHYr57/6txh8me3kFnVmQtLfQ
 TVDmVLjACNzILgkzLxjKC+GmJJHfnqttbqHgqDyUmy3Nyfrohg1s6JG719Ye3jAa5ZFT24/S6
 il2chKhPxnbBe6OhmnKiy9fLkJAaZquzIZX52J5K/mWnWILiwBia7FIDvLKWWGfbMPjqnB1Qd
 M/+LpU4Vyb2+DKHYOSWECVH/1StnBjbg9Z5yo4zUFdmEKhrLiMxxG/sk4QSqUZs4ju1CKV9zx
 7EueRSgmVW1wJjs11zl5No7e4frmE9NUhq9neSkR3O4vaeyMvX+WhRcJobgaaTpd1GePzgRyL
 cijg/Y2JeIMpBuzNxmijJT+VOMAKRYcbX8Zye62VcAGGohaq4yFMQxJncmpl0oGcYnlc6OS1K
 Z6ey/b+UTYwkBdFlwFuJqIAmZaXhyYZdXSm68Jfy2hRjX9QriWGJC7ixNTrUI/d0or6SyBQyu
 K3howr3f0ZFNL0a9xSbTztOSo6JR1r4r8xwKuDfqzgpmXh/l8ZoIziOplcKtHL6Fb4HL0vvbu
 QS9E1sp0hi94V/y3NSAk+eZcExNzerJ21eFl6WGweA==
Subject: Re: [Buildroot] [PATCH 1/1] package/petitboot: fix install
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjYvMDYvMjAyMyDDoCAwNzo0NiwgQmVybmQgS3VobHMgYSDDqWNyaXTCoDoKPiBidWlsZHJv
b3QgY29tbWl0IDRjOGFiMTNiOTYwZWRjZDI5MGVhNWNhN2E3ZTczOWNiOTkzZmI4NjMgYWRkZWQg
YSBsaW5rCj4gb2YgL3Vzci9zYmluL3BiLXVkaGNwYyBpbgo+ICQoVEFSR0VUX0RJUikvdXNyL3No
YXJlL3VkaGNwYy9kZWZhdWx0LnNjcmlwdC5kLyB3aXRob3V0IGNyZWF0aW5nIHRoYXQKPiBkaXJl
Y3RvcnkgZmlyc3QuCj4gCj4gRml4ZXM6Cj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvNzc4Lzc3ODAyMDk4MzU1ZGQ5OWE5ZTdlNmQ5MTc4ZjkwMGE5YThmZTcyYTMvCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiAtLS0KPiAg
IHBhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tayB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGV0aXRib290L3BldGl0
Ym9vdC5tayBiL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tawo+IGluZGV4IDRkNTZiNzM5
MzguLjhiNGMxNDIwN2UgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290
Lm1rCj4gKysrIGIvcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rCj4gQEAgLTU1LDYgKzU1
LDcgQEAgZGVmaW5lIFBFVElUQk9PVF9QT1NUX0lOU1RBTEwKPiAgIAkJJChUQVJHRVRfRElSKS9l
dGMvcGV0aXRib290L2Jvb3QuZC85MC1zb3J0LWR0Ygo+ICAgCSQoSU5TVEFMTCkgLW0gMDc1NSAt
RCAkKFBFVElUQk9PVF9QS0dESVIpL1MxNXBiLWRpc2NvdmVyIFwKPiAgIAkJJChUQVJHRVRfRElS
KS9ldGMvaW5pdC5kL1MxNXBiLWRpc2NvdmVyCj4gKwlta2RpciAtcCAkKFRBUkdFVF9ESVIpL3Vz
ci9zaGFyZS91ZGhjcGMvZGVmYXVsdC5zY3JpcHQuZC8KPiAgIAlsbiAtc2YgL3Vzci9zYmluL3Bi
LXVkaGNwYyBcCj4gICAJCSQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL3VkaGNwYy9kZWZhdWx0LnNj
cmlwdC5kLwo+ICAgZW5kZWYKClJldmlld2VkLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2
aXZpZXIuZXU+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
