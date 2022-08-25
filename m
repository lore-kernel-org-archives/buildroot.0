Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5155CC04AA5
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 07:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B82940C13;
	Thu, 25 Aug 2022 07:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B82940C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mv1cTv5T0tLF; Thu, 25 Aug 2022 07:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEADB404F6;
	Thu, 25 Aug 2022 07:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEADB404F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DBF01BF83B
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 07:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D01404F6
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 07:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D01404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MtDosQFqPZe for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 07:36:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D103D4017E
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D103D4017E
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 07:36:46 +0000 (UTC)
Received: from [192.168.0.66] ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnpwC-1pFI9a0jvu-00pIIE; Thu, 25 Aug 2022 09:36:40 +0200
Message-ID: <cd82967a-fb72-05ce-34cc-a98835c70ae2@green-communications.fr>
Date: Thu, 25 Aug 2022 09:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
References: <20220822193515.704278-1-pevik@seznam.cz>
From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
In-Reply-To: <20220822193515.704278-1-pevik@seznam.cz>
X-Provags-ID: V03:K1:s9GQWyxRjO1z4Jzy0MjsovzxwZ3LOHL9KzgYBp9H5IFpMMXoyvI
 Zh4vHE0asoHYWXwAZflPmxMQavMSEF3b2IBrKxMURKRiTC2HetDkQwndLfKLp0ssRRjuhiI
 yXmNFdvuYs1qPLCSW3ivA6ic+Pca2TaEVlPt7rhmWxG2or/rLwoRllXBZlHa817gXxw1H0g
 GirtzP1AS4iDxYAa3JdiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OrEQwBAgXDo=:lkqGsJ61tHDfaZuP/UgQq9
 UWPXPRp/TarBblVVV7dSHj7sK1rwnnWv60VtKrPzk3fddg5i9lITlrY2MbMNB9dAzkF50S7d3
 RX3h6WTRB69q9uzRP9jFRDiW+grZs74BFmTHEOlrbrgGTe7qvcZEGRWBJ/R1mxCWbkgVYfn4x
 GXl2xzxl1P+YDX0G89aHtiTvGHEuloKEQiNoj5zP7R7/Vv35A7WovXYV5+lSwhYM+ntn9NsE8
 FRvJztA4mR7/KNCsvleSRZ32t4g0k+Ny/jOTmXYJ1QIoG3J9ca2Uoe6+10HthecnraIwVV89s
 SbUEhlbjAWs1BAsOk3pWEFCQQfHqNo7MoP59N3PgED0VnxfXNcpGqLv9DztSmgrfptEqjyFGN
 apLM9Usr2Q/6+AbK/DJkIKtXLWe2iBZ2zsuI1TP0YZJ4+eek7AiQHytEw4I5KL6FlMY2GSQJd
 FIhm9pbFU6tETHc3qMtZvvhRjrNBxV2shUaKsGnB3QF9UiZnGRyGqBT2uZlNsjK9TtS96zwRt
 LBR+cM+kqusYENEoUhlfehzAimd3oN6CECmJcEw9dKzvpvz6/uKjdsHahkMLLEPpvsFbXt03x
 BhHhEBJoWijMdUzOEB4/o/KQxZoyy54ErWjnXDtP5OJRY+CXC8YJzwh/KA3EubaciB+2SsuTi
 CjeRds/ZTC56864ykbZmZIinhcLkKfSanXrg3ExFfDnz6AssyKGAwXGSZnwBF2UmqykoDQ3q7
 pxlzAugjadA28r7ZU3rFv6faxKRulGRLAJE7tESBgWtGYl9prnp4+jORQvJ2tolOvw9/0wZHl
 TswdV8I
Subject: Re: [Buildroot] [WIP][DO NOT MERGE][PATCH 1/1] package/iproute2:
 bump version to 5.19.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjIvMDgvMjAyMiAyMTozNSwgUGV0ciBWb3JlbCB3cm90ZToKPiBGcm9tOiBQZXRyIFZvcmVs
IDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KPiAKPiBSZW1vdmUgcGF0Y2ggZnJvbSB0aGlzIHJlbGVh
c2UsIGJhY2twb3J0IDMgcGF0Y2hlcyBmaXhpbmcgYnVpbGQgZnJvbQo+IHVwc3RyZWFtLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgo+IC0tLQo+
IEhpIGFsbCwKPiAKPiB2NS4xOS4wIGRvZXMgbm90IGNvbXBpbGUgb24gdWNsaWJjLgo+IAo+IAo+
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpcHN0YXRzLmM6MTU6Cj4gLi4vaW5jbHVkZS91dGlscy5o
OjI3MDoyMzogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9uIHNwZWNpZmllcnMgb3Ig4oCYLi4u
4oCZIGJlZm9yZSDigJgo4oCZIHRva2VuCj4gICAgMjcwIHwgI2RlZmluZSBBUlJBWV9TSVpFKHgp
IChzaXplb2YoeCkgLyBzaXplb2YoKHgpWzBdKSkKPiAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgXgo+IGlwc3RhdHMuYzo3NjoxNTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKA
mEFSUkFZX1NJWkXigJkKPiAgICAgNzYgfCBzdGF0aWNfYXNzZXJ0KEFSUkFZX1NJWkUoaXBzdGF0
c19zdGF0X2lmbGFfbWF4KSA9PSBJRkxBX1NUQVRTX01BWCArIDEsCj4gICAgICAgIHwgICAgICAg
ICAgICAgICBefn5+fn5+fn5+Cj4gaXBzdGF0cy5jOjc3Ojg6IGVycm9yOiBleHBlY3RlZCBkZWNs
YXJhdGlvbiBzcGVjaWZpZXJzIG9yIOKAmC4uLuKAmSBiZWZvcmUgc3RyaW5nIGNvbnN0YW50Cj4g
ICAgIDc3IHwgICAgICAgICJBbiBJRkxBX1NUQVRTIGF0dHJpYnV0ZSBpcyBtaXNzaW5nIGZyb20g
dGhlIGlmbGFfbWF4IHRhYmxlIik7Cj4gICAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSBpcHN0YXRzLmM6MTU6Cj4gLi4vaW5jbHVkZS91dGlscy5oOjI3MDoyMzogZXJy
b3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9uIHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSDi
gJgo4oCZIHRva2VuCj4gICAgMjcwIHwgI2RlZmluZSBBUlJBWV9TSVpFKHgpIChzaXplb2YoeCkg
LyBzaXplb2YoKHgpWzBdKSkKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgXgo+IGlw
c3RhdHMuYzoyNzk6MTU6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhBUlJBWV9TSVpF
4oCZCj4gICAgMjc5IHwgc3RhdGljX2Fzc2VydChBUlJBWV9TSVpFKGlwc3RhdHNfaHdfc19pbmZv
X25hbWUpID09Cj4gICAgICAgIHwgICAgICAgICAgICAgICBefn5+fn5+fn5+Cj4gaXBzdGF0cy5j
OjI4MTo4OiBlcnJvcjogZXhwZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lmaWVycyBvciDigJguLi7i
gJkgYmVmb3JlIHN0cmluZyBjb25zdGFudAo+ICAgIDI4MSB8ICAgICAgICAibWlzbWF0Y2g6IGVu
dW0gaXBzdGF0c19od19zX2luZm9faWR4IHggaXBzdGF0c19od19zX2luZm9fbmFtZSIpOwo+ICAg
ICAgICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBtYWtlWzFdOiAqKiogWy4uL2NvbmZpZy5tazozMzogaXBz
dGF0cy5vXSBFcnJvciAxCj4gbWFrZTogKioqIFtNYWtlZmlsZTo3NzogYWxsXSBFcnJvciAyCj4g
Cj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQgaXQgaXMuIEFsbCB1Y2xpYmMgdG9vbGNoYWlucyBhcmUg
cXVpdGUgb2xkOgo+IExJTlVYX1ZFUlNJT05fQ09ERSAyNjQ3MDMgPT4gNC45LjI1NQo+IAo+IEkn
bSBub3Qgc3VyZSBpZiBpdCdzIGR1ZSBtaXNzaW5nIElGTEFfU1RBVFNfQUZfU1BFQyBtZW1iZXIg
aW4KPiBJRkxBX1NUQVRTX0xJTktfKiBlbnVtIHdoaWNoIHdhcyBhZGRlZCBpbiB2NC4xMS1yYzEg
aW4gYWVmYjRkNGFkODNiCj4gKCJuZXQ6IEFGLXNwZWNpZmljIFJUTV9HRVRTVEFUUyBhdHRyaWJ1
dGVzIikuIExpa2VseSBub3QuCj4gSXQncyBtb3JlIGxpa2VseSBzb21lIHByb2JsZW0gd2l0aCBz
dGF0aWNfYXNzZXJ0KCksIGJlY2F1c2UgdXNpbmcKPiBjb3JyZWN0IG9yIGV2ZW4gYW55IGludCB2
YWx1ZSBpbiBzdGF0aWNfYXNzZXJ0KCkgY2F1c2VzIHNpbWlsYXIgZXJyb3IuCj4gQnV0IGNvbW1l
bnRpbmcgb3V0IHN0YXRpY19hc3NlcnQoKSBhbGxvd3MgY29tcGlsYXRpb24uCj4gCj4gc3RhdGlj
X2Fzc2VydCgpIHdhcyBzdGFuZGFyZGl6ZWQgaW4gQzExLCB3aGljaCBzaG91bGQgYmUgc3VwcG9y
dGVkIGluCj4gZ2NjIDQuNyBbMV0uIGJvb3RsaW4tYXJtdjUtdWNsaWJjIGhhcyBnY2MgMTAuMy4w
Ogo+IAo+IGJyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUtdWNsaWJjL2hvc3QvYmluL2FybS1saW51
eC1nY2MgLS12ZXJzaW9uCj4gYXJtLWxpbnV4LWdjYy5icl9yZWFsIChCdWlsZHJvb3QgdG9vbGNo
YWlucy5ib290bGluLmNvbS0yMDIxLjExLTEpIDEwLjMuMAoKc3RhdGljX2Fzc2VydCBpcyBzdXBw
b3NlZCB0byBiZSBhIG1hY3JvIGRlZmluZWQgaW4gYXNzZXJ0LmgsIGJ1dCB1Y2xpYmMtbmcgaGFz
IAppdCBvbmx5IHNpbmNlIDEuMC40Miwgd2hpY2ggaXMgdHdvIHdlZWtzIG9sZC4gVGhlIG1ham9y
aXR5IG9mIHByZS1idWlsdCAKdG9vbGNoYWlucyBhcmUgbW9yZSB0aGFuIHR3byB3ZWVrcyBvbGQu
CgpBIHdvcmthcm91bmQgaXMgdG8gYWRkIGEgcGF0Y2ggdGhhdCBkb2VzIHMvc3RhdGljX2Fzc2Vy
dC9fU3RhdGljX2Fzc2VydC8sCm9yIHRvIGFkZCBzb21lICNkZWZpbmUgc3RhdGljX2Fzc2VydCBf
U3RhdGljX2Fzc2VydC4KCj4gCj4gY29tcGlsaW5nIGlwcm91dGUyIHdpdGggZXhwb3J0IENGTEFH
Uz0iLXN0ZD1jMTEiIGNhdXNlcyBvdGhlciBlcnJvcnM6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIGxsX21hcC5jOjI0Ogo+IGxsX21hcC5jOiBJbiBmdW5jdGlvbiDigJhsbF9nZXRfYnlfaW5k
ZXjigJk6Cj4gLi4vaW5jbHVkZS9saXN0Lmg6OToxNjogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0
aW9uIHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSDigJgo4oCZIHRva2VuCj4gICAgICA5
IHwgIGNvbnN0IHR5cGVvZiggKCh0eXBlICopMCktPm1lbWJlciApICpfX21wdHIgPSAocHRyKTsg
XAo+ICAgICAgICB8ICAgICAgICAgICAgICAgIF4KPiBsbF9tYXAuYzo0ODo2OiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8g4oCYY29udGFpbmVyX29m4oCZCj4gICAgIDQ4IHwgICAgPSBjb250
YWluZXJfb2Yobiwgc3RydWN0IGxsX2NhY2hlLCBpZHhfaGFzaCk7Cj4gICAgICAgIHwgICAgICBe
fn5+fn5+fn5+fn4KPiAuLi9pbmNsdWRlL2xpc3QuaDoxMDoyMDogZXJyb3I6IOKAmF9fbXB0cuKA
mSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPiAgICAgMTAgfCAgKHR5
cGUgKikoIChjaGFyICopX19tcHRyIC0gb2Zmc2V0b2YodHlwZSxtZW1iZXIpICk7fSkKPiAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+Cj4gbGxfbWFwLmM6NDg6Njogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNvbnRhaW5lcl9vZuKAmQo+ICAgICA0OCB8ICAgID0gY29u
dGFpbmVyX29mKG4sIHN0cnVjdCBsbF9jYWNoZSwgaWR4X2hhc2gpOwo+ICAgICAgICB8ICAgICAg
Xn5+fn5+fn5+fn5+Cj4gLi4vaW5jbHVkZS9saXN0Lmg6MTA6MjA6IG5vdGU6IGVhY2ggdW5kZWNs
YXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBp
dCBhcHBlYXJzIGluCj4gICAgIDEwIHwgICh0eXBlICopKCAoY2hhciAqKV9fbXB0ciAtIG9mZnNl
dG9mKHR5cGUsbWVtYmVyKSApO30pCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgIF5+fn5+
fgo+IGxsX21hcC5jOjQ4OjY6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhjb250YWlu
ZXJfb2bigJkKPiAgICAgNDggfCAgICA9IGNvbnRhaW5lcl9vZihuLCBzdHJ1Y3QgbGxfY2FjaGUs
IGlkeF9oYXNoKTsKPiAgICAgICAgfCAgICAgIF5+fn5+fn5+fn5+fgo+IGxsX21hcC5jOiBJbiBm
dW5jdGlvbiDigJhsbF9nZXRfYnlfbmFtZeKAmToKPiAuLi9pbmNsdWRlL2xpc3QuaDo5OjE2OiBl
cnJvcjogZXhwZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lmaWVycyBvciDigJguLi7igJkgYmVmb3Jl
IOKAmCjigJkgdG9rZW4KPiAgICAgIDkgfCAgY29uc3QgdHlwZW9mKCAoKHR5cGUgKikwKS0+bWVt
YmVyICkgKl9fbXB0ciA9IChwdHIpOyBcCj4gCj4gLi4uCj4gCj4gV2hhdCBjb3VsZCBiZSB3cm9u
Zz8KCnR5cGVvZiBpcyBhIGdjYyBleHRlbnNpb24sIHNvIHRoYXQgc2hvdWxkIHByb2JhYmx5IG5l
ZWQgLXN0ZD1nbnUxMSBpbnN0ZWFkIG9mIAotc3RkPWMxMS4gQnV0IGdjYyAxMCBwcm9iYWJseSBh
bHJlYWR5IGRlZmF1bHRzIHRvIGdudTExLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
