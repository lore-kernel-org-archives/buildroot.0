Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98648C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EEF461512;
	Sat, 13 May 2023 19:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EEF461512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_f8nX_iixPx; Sat, 13 May 2023 19:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B892614A2;
	Sat, 13 May 2023 19:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B892614A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63A671BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CFE640597
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CFE640597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEwxqKOzOjll for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:33:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF6E408B1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFF6E408B1
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:33:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3FC5119F732;
 Sat, 13 May 2023 21:33:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 21:33:40 +0200
Date: Sat, 13 May 2023 21:33:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20230513193340.GD2582048@scaer>
References: <20230418094554.2236758-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418094554.2236758-1-raphael.melotte@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684006423;
 bh=O5XgSSR+TBabnN2j2DNwcGIyDxnX4GwFvCM7BJ5CIN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTUT6tnqMFpNHWtFQhLBzTBW4Z4P1PJDllVI/zttnHRE6kecHPCWu7gax1iAJHI9H
 uG8ru72boST/YLAoovieNUDy8uVA5TugTICaA7IaZ23JSYXkNQbPy9J5LCnpzoydby
 +nZNa3QHx1Z9uoz9vIYjMs35aoa7bokcng1sd20ZwjAvpwkwdwInVeUNPI0sOwdr60
 AEa2M/cAHaxAD4sYYao7NebNvBNdW2oTs8HkwYh6h3SLESWo3X3q1NK3/jJDuAoGrf
 4+fa83trwD6G9cWLWf+cvcWOIqvngZKvOhxCopJYT/kjZWmSR6pPaEDgBF6LkGAqlw
 Usxs4xi8dfBeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RTUT6tnq
Subject: Re: [Buildroot] [PATCH 1/1] package: python-boto3: bump to 1.26.115
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGHDq2wsIEFsLAoKT24gMjAyMy0wNC0xOCAxMTo0NSArMDIwMCwgUmFwaGHDq2wgTcOpbG90
dGUgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJv
dG8zLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLm1r
ICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3Rv
My5oYXNoIGIvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2gKPiBpbmRleCA2
YjM5NDc5NzhlLi5lYWU1MDgxZjM0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJvdG8z
L3B5dGhvbi1ib3RvMy5oYXNoCj4gKysrIGIvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJv
dG8zLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8v
cHlwaS5vcmcvcHlwaS9ib3RvMy9qc29uCj4gLW1kNSAgMDkxM2UyYWQ4ZWIyMDhiY2NiODI2YjEw
YzkyY2NiNWMgIGJvdG8zLTEuMjYuOTYudGFyLmd6Cj4gLXNoYTI1NiAgNzAxNzEwMmM1OGI5OTg0
NzQ5YmVmM2I5ZjQ3Njk0MDU5M2MzMTE1MDQzNTRiOWVlOWRkN2JiMGI0NjU3YTc3ZCAgYm90bzMt
MS4yNi45Ni50YXIuZ3oKPiArbWQ1ICAyMTIzNThmYjhiOWNiZWE0NGE2M2FiOTE4NWM2MjhlOCAg
Ym90bzMtMS4yNi4xMTUudGFyLmd6Cj4gK3NoYTI1NiAgMjI3MmEwNjAwMDViZjgyOTlmNzM0MmNi
ZjEzNDQzMDRlYjQ0YjcwNjBjZGRiYTY3ODRmNjc2ZTNiYzczN2JiOCAgYm90bzMtMS4yNi4xMTUu
dGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1NiAg
MGQ1NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIwMGRhNWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3ZTExYjkz
OGU5NDU5NCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRo
b24tYm90bzMubWsgYi9wYWNrYWdlL3B5dGhvbi1ib3RvMy9weXRob24tYm90bzMubWsKPiBpbmRl
eCA1NzI5NTRlODFhLi43OGU0MTBkODA0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJv
dG8zL3B5dGhvbi1ib3RvMy5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1i
b3RvMy5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gIAo+IC1QWVRIT05fQk9UTzNfVkVSU0lPTiA9IDEuMjYuOTYKPiArUFlUSE9OX0JPVE8zX1ZF
UlNJT04gPSAxLjI2LjExNQo+ICBQWVRIT05fQk9UTzNfU09VUkNFID0gYm90bzMtJChQWVRIT05f
Qk9UTzNfVkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9CT1RPM19TSVRFID0gaHR0cHM6Ly9maWxl
cy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2MyLzliLzhlOTEyNGMzZDAzMDZhYjJlZTg2NWU2
YWRmZmNmY2IwMTI3YmYwYzMyNzM4NmQ2MmQyYzlkYjE5YjZhZQo+ICtQWVRIT05fQk9UTzNfU0lU
RSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy83OC9hOC9iMDc2ODZi
ZDlhNTZlMjU1NjcwOGQ1NjJjNmI4YWRlNDIzZjNjZjRjYjFiN2MzY2JjOWVkNmMyNGQwMjIKPiAg
UFlUSE9OX0JPVE8zX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gIFBZVEhPTl9CT1RPM19MSUNF
TlNFID0gQXBhY2hlLTIuMAo+ICBQWVRIT05fQk9UTzNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UK
PiAtLSAKPiAyLjM3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVh
bC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8
CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAg
ICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
