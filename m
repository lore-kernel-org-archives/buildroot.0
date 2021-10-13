Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84802C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 12:35:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF3D7610C8
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 12:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF3D7610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C5D8608EE;
	Wed, 13 Oct 2021 12:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ju8imw6HzpnK; Wed, 13 Oct 2021 12:35:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E70766074F;
	Wed, 13 Oct 2021 12:35:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9C1E1BF3BF
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 12:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A891A606FA
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 12:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BHNoQnl99rD for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 12:35:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7850860594
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:35:00 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 70651FF812;
 Wed, 13 Oct 2021 12:34:58 +0000 (UTC)
Date: Wed, 13 Oct 2021 14:34:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211013143457.635601d9@bootlin.com>
In-Reply-To: <20211013070105.1857677-1-fontaine.fabrice@gmail.com>
References: <20211013070105.1857677-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dtbocfg: depends on kernel
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

SGksCgpPbiBXZWQsIDEzIE9jdCAyMDIxIDA5OjAxOjA1ICswMjAwCkZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKCj4gRml4IHRoZSBmb2xsb3dpbmcg
YnVpbGQgZmFpbHVyZSByYWlzZWQgc2luY2UgdGhlIGFkZGl0aW9uIG9mIHRoZSBwYWNrYWdlCj4g
aW4gY29tbWl0IDlmYzdiNDlhYjE5M2RhNTViMGE3MmQyN2I1ZTBlYTMzMjQ1YjRkZjA6Cj4gCj4g
TWFrZWZpbGU6NTg3OiAqKiogbGludXggaXMgaW4gdGhlIGRlcGVuZGVuY3kgY2hhaW4gb2YgZHRi
b2NmZyB0aGF0IGhhcyBhZGRlZCBpdCB0byBpdHMgX0RFUEVOREVOQ0lFUyB2YXJpYWJsZSB3aXRo
b3V0IHNlbGVjdGluZyBpdCBvciBkZXBlbmRpbmcgb24gaXQgZnJvbSBDb25maWcuaW4uICBTdG9w
Lgo+IAo+IEZpeGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
LzQ0OWE3MzFjMGExMzk0YzI4ZjUxOWUzNDFlYTE0NWNiNDJhZjAxMmQKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0K
PiAgcGFja2FnZS9kdGJvY2ZnL0NvbmZpZy5pbiB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kdGJvY2ZnL0NvbmZpZy5pbiBi
L3BhY2thZ2UvZHRib2NmZy9Db25maWcuaW4KPiBpbmRleCBjMWU4MzE4ZTVjLi44NjJkYzBjY2M1
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZHRib2NmZy9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L2R0Ym9jZmcvQ29uZmlnLmluCj4gQEAgLTEsNSArMSw2IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FH
RV9EVEJPQ0ZHCj4gIAlib29sICJkdGJvY2ZnIgo+ICsJZGVwZW5kcyBvbiBCUjJfTElOVVhfS0VS
TkVMCj4gIAloZWxwCj4gIAkgIGR0Ym9jZmcsIHdoaWNoIHN0YW5kcyBmb3IgRGV2aWNlIFRyZWUg
QmxvYiBPdmVybGF5Cj4gIAkgIENvbmZpZ3VyYXRpb24gRmlsZSBTeXN0ZW0sIHdhcyBkZXZlbG9w
ZWQgdG8gc2VydmUKClllcyBpbmRlZWQuIEkgbWlzc2VkIHRoaXMgb25lLgoKQWNrZWQtYnk6IEhl
cnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPgoKSGVydsOpCgotLSAKSGVydsOp
IENvZGluYSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
