Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCAFC71133
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 15:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E91A1423E4;
	Wed, 11 Jun 2025 15:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S15VedJwWvCU; Wed, 11 Jun 2025 15:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A551423F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A551423F8;
	Wed, 11 Jun 2025 15:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC457237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 15:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE06042428
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 15:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohrZDHzKCA8b for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 15:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6F8E5423E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F8E5423E4
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F8E5423E4
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 15:39:12 +0000 (UTC)
Received: from [192.168.0.181] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mleo0-1v7kic2Hh4-00gRYw; Wed, 11 Jun 2025 17:39:08 +0200
Message-ID: <274904fe-4703-4571-88db-d2f3e1539d4e@green-communications.fr>
Date: Wed, 11 Jun 2025 17:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-5-alex.bennee@linaro.org>
 <CAEyMn7Yu_ZAPhaAOSHO7K+LbbVAGQqe84_UCe4uKqnJ+4UbDsQ@mail.gmail.com>
 <87jz5ijsbw.fsf@draig.linaro.org>
Content-Language: en-US
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <87jz5ijsbw.fsf@draig.linaro.org>
X-Provags-ID: V03:K1:2oM0UjUwAqiByuX1yIDMTFqNxZiPn7B3i9JPbvMrPVAaxtQ2rFi
 qsDyU540qT8mCBYBwP0DAk54pWeqNklCIGaEaXzG4IQwrYIsWUWLQCNoMl0DiaV0KGrABbF
 jsS9ywc70QPSkCN7C/Xa5fyRk0a0B41BtNwECWWhueIN/7qk+jgLGrDgntuHfJQORQoeUA8
 YoMYOjQ7dMxmzDEB7EXDQ==
UI-OutboundReport: notjunk:1;M01:P0:IPRsrw+FPO4=;n+/dRHI27B9jHfwftRj875CRv20
 kF5ypsENlNA0bOTmPVV8li11NNiPmYyHgC8e9/N9F2YXU5bx+Yxx0eRCFCWzpVARiBSlFy8e0
 6m6xJ2Pns3ARVpLGct1y+BHZ55JcS6FDWVoBxBAidkAfzTGMMKb+nYCkeUt+M2d3lbJT2OB9R
 JSKTJ8APinExlF0QD9cqPJvx3lsIAXu9wgnu3flACaqK6xxNn2NWjb8rk6+r2rv7ma0mfDK+a
 Qd4zMqNxuHnLzX2e6jVbKDWg8Ln6YlK95Zsw6eEDqgfHJEK4Vkwrsasw4o0wQTCevlkUmfC3v
 tId31iXCiizV+2GGHLi1O9w3+p+K/Gx6121yrl3XXGi+SitPC4jNdPsWjVDYQeqq2JOq+JCb2
 GlzMtoKXwR0PoPxQZzx4A7D9yjZ7NfNHMtlSWhem2k42T1Poveepuzm3bVSDPq/I45lLCDdPq
 AW5kNeA0Wa/VMT9w/47zcCEKpDeE2EEzhF1eU2LP6EQBHhSd9thYWZ5JcfGqNSW/juG8pI3gm
 w6N9lRf0/aCYaefokiDTAq7+V+oW6bEQHMhvIG5TVK1ISm0IrRJrdiAYlA9flN5GrusIwFqHu
 K+2u61DdziBroL0AEkEQNjUyalNooMk7ZXNpnlEqfWf5RY4OC/0JbgiS050baUAabvi7/4Dod
 mvcFZK58Q68+wsn4pM46Xl+dw3DoKLwyoEjIy+gRJg8biHooeq3BTWIYizfMrdZiHYBXieyMF
 nsGYWxKtjQhk9oJ92lRRoTzWmRRyuIVisQnwXahN23bnyBDrJA3/LwvYcHsx+OAcOv3vuIsuh
 eYxNq06ZjH8ULYmWEVC0pm5TKBa8bXvwR9FfY+S3PQKKqK3an90jAdF2h7kr8r3TyCpQi0Rqx
 CbgF35tH039JNmKAeNP5Ame5TMruImaQzMDUorvwZ0EBoP4Ia+WIJRO3hQTxIC0gzZgQGieLA
 Vfx2V7NPphRg2puts+27398km5r30zuEIgqHxte2N3eGHIHKDUfcA/D25y1HXjOVacOnuQBB3
 JGH3A96WpGOb/ctL9+Q9tF0jVBkC6e7n+erF2B/GB4RzE2PMqRNamHaEVDrtjIDlH6zpCJRyk
 AGMcEm32sS+XOrWfeY0wpYccIaBGHgiDOxgPtLV356anwRMyBrh/Su2y/ki3TdNGRQ5cRoVW9
 C/DGUnzHCj7rWrAWiFCUhil24FPJqE0LvbokIUsWTgGsF9Pv/OEv/JAtNSvc/cDpNtXEGmOfR
 R/uKLpu546kuqSegbWXsCDC0a5D9ii2mk4YI4tZqXs4nZueEe10OpYVGMJX+lfxC6CX9W+mbP
 0ePjMMI8+FpUMKz4IZvpph7exdlJFdfopMMzfNFSjdxs2Nt/+iUcNj/8k4rCdfsOv5cwhhKWq
 PDr0qZKF38V6gUae0AllVXrmhbBr6r4mY4PyjBJ5VynILhQNxZbUTGtBut
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: Re: [Buildroot] [PATCH v6 4/5] package/vkmark: add vkmark
 benchmarking tool
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

T24gMTEvMDYvMjAyNSAxNTo1NSwgQWxleCBCZW5uw6llIHdyb3RlOgo+IEhlaWtvIFRoaWVyeSA8
aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+PiBIaSBBbGV4LAo+Pgo+PiBBbSBN
aS4sIDExLiBKdW5pIDIwMjUgdW0gMTM6MTYgVWhyIHNjaHJpZWIgQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPjoKPj4KPj4gICBXZSBidWlsZCBmcm9tIGEgcmVjZW50IEhFQUQg
dG8gZW5zdXJlIHdlIGhhdmUgdGhlIGZpeGVzIHRvIGJldHRlcgo+PiAgIGhhbmRsZSB0aGUgbWlz
c2luZyBLSFJfZGlzcGxheSBleHRlbnNpb24uCj4+Cj4+ICAgU2lnbmVkLW9mZi1ieTogQWxleCBC
ZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+Pgo+PiBJIHRyaWVkIHRvIGJ1aWxkIHZr
bWFyayBhZ2FpbnN0LCBub3cgd2l0aCB3YXlsYW5kIGVuYWJsZWQgYW5kIEkgc2VlIHRoaXM6Cj4+
Cj4+IFByb2dyYW0gL3Vzci9iaW4vd2F5bGFuZC1zY2FubmVyIGZvdW5kOiBOTwo+Pgo+PiAuLi9v
dXQtd2VzdG9uL2J1aWxkL3ZrbWFyay0zNmU3ZDliMmVjZjcyM2U4NzZhZGQ2NTUzNGU5NWY1NWVj
MWJjNzlkL3NyYy9tZXNvbi5idWlsZDoxMTY6MjI6IEVSUk9SOiBQcm9ncmFtCj4+ICcvdXNyL2Jp
bi93YXlsYW5kLXNjYW5uZXInIG5vdCBmb3VuZCBvciBub3QgZXhlY3V0YWJsZQo+IAo+IEhtbSB0
aGlzIHNlZW1zIG9kZC4gQXQgbGVhc3Qgd2F5bGFuZC1zY2FubmVyIGhhcyBhIHBrZ2NvbmYgdmFy
aWFibGU6Cj4gCj4gICAg8J+VmTE0OjUxOjIxIGFsZXhAZHJhaWc6YnVpbGRyb290LmdpdC9idWls
ZHMveDg2XzY0ICBvbiDugqAgYWRkLXZpcnRpby12dWxrYW4tdmttYXJrOm1hc3RlciBbJCE/4oeh
XQo+ICAgIOKenCAgcGtnLWNvbmZpZyAtLXZhcmlhYmxlPXdheWxhbmRfc2Nhbm5lciAgd2F5bGFu
ZC1zY2FubmVyCj4gICAgL3Vzci9iaW4vd2F5bGFuZC1zY2FubmVyCj4gICAg8J+VmTE0OjUyOjE2
IGFsZXhAZHJhaWc6YnVpbGRyb290LmdpdC9idWlsZHMveDg2XzY0ICBvbiDugqAgYWRkLXZpcnRp
by12dWxrYW4tdmttYXJrOm1hc3RlciBbJCE/4oehXQo+ICAgIOKenCAgLi9ob3N0L2Jpbi9wa2dj
b25mIC0tdmFyaWFibGU9d2F5bGFuZF9zY2FubmVyICB3YXlsYW5kLXNjYW5uZXIKPiAgICAvaG9t
ZS9hbGV4L2xzcmMvdGVzdHMvYnVpbGRyb290LmdpdC9idWlsZHMveDg2XzY0L2hvc3QvYmluL3dh
eWxhbmQtc2Nhbm5lcgo+ICAgIPCflZkxNDo1MjoyOSBhbGV4QGRyYWlnOmJ1aWxkcm9vdC5naXQv
YnVpbGRzL3g4Nl82NCAgb24g7oKgIGFkZC12aXJ0aW8tdnVsa2FuLXZrbWFyazptYXN0ZXIgWyQh
P+KHoV0KPiAgICDinpwKPiAKPiBBbmQgdGhlIG1lc29uIHNob3VsZCBmaW5kIGl0IHdpdGggdGhl
IG5vcm1hbCBkZXBlbmRlbmN5IGxvZ2ljOgo+IAo+ICAgICAgd2F5bGFuZF9zY2FubmVyID0gZmlu
ZF9wcm9ncmFtKHdheWxhbmRfc2Nhbm5lcl9kZXAuZ2V0X3ZhcmlhYmxlKCd3YXlsYW5kX3NjYW5u
ZXInKSkKCndheWxhbmRfc2Nhbm5lcl9kZXAgaXMgZGVmaW5lZCBhczoKCndheWxhbmRfc2Nhbm5l
cl9kZXAgPSBkZXBlbmRlbmN5KCd3YXlsYW5kLXNjYW5uZXInLCByZXF1aXJlZCA6IApnZXRfb3B0
aW9uKCd3YXlsYW5kJykgPT0gJ3RydWUnKQoKU28gaXQgaXMgc2VhcmNoaW5nIGZvciBhIHdheWxh
bmQtc2Nhbm5lciBjb21waWxlZCBmb3IgdGhlIHRhcmdldCwgbm90IApmb3Igb25lIG9uIHRoZSBo
b3N0LiBJdCBzaG91bGQgcHJvYmFibHkgY2hhbmdlZCB0bwoKd2F5bGFuZF9zY2FubmVyX2RlcCA9
IGRlcGVuZGVuY3koJ3dheWxhbmQtc2Nhbm5lcicsIHJlcXVpcmVkIDogCmdldF9vcHRpb24oJ3dh
eWxhbmQnKSA9PSAndHJ1ZScsIG5hdGl2ZTogdHJ1ZSkKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
