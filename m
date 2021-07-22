Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF14C6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 15:41:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39CC5610D2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 15:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39CC5610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0094C4028A;
	Thu, 22 Jul 2021 15:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGTTBmqgn7VK; Thu, 22 Jul 2021 15:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF830404BE;
	Thu, 22 Jul 2021 15:41:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A891B1BF3F4
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 15:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E3340118
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 15:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1GSs1C4aSjC for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 15:41:08 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E6B34010C
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 15:41:07 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6ahymuNj4GRi46ai0m9PMQ; Thu, 22 Jul 2021 17:34:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1626968043; bh=dfCNjSRgM00+M3WP1jF2il9O31FITUq5Rz5cJqlBhr0=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=hOzVwXITYNs4O8bmPYsdFgJbLL1MGnFVUeQc024BRCgrFIUa+ipeK2UzqK7puY5ad
 PXdrx1Rk5X3q22c62WnuErLa7VIJoLZ+BOLcBrX4eYkUkFaaO31yVm63x9ZQVzauAP
 +qgEsmsyJd9eIueNS9o5i3tFv1NhI8rgXHjk6nmCLTRDx4QDnloO/djBg1UNRF+L1j
 eSoDwuNYQ4VYpZ5RjgGghxSBY0UGilfyF/i+GzFFlV2W26BQbPxtBEJew9J+pI/YfE
 NXjsDsE0HweeXgDJZYuKL+/bAVHItQ1YaOuyXxtMQLGS8FBhP1h5FLyHDl6DR49tjq
 2c7uM3+L9Y19A==
To: buildroot@buildroot.org
References: <20210722153252.1157045-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <dd7ac7f1-924b-7e12-d55f-f217853cb041@benettiengineering.com>
Date: Thu, 22 Jul 2021 17:33:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722153252.1157045-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfI3FPyvINYZyf5tfIIqTAT3/x/ZmUHRPWYRg7jUySWI9/1TcHb3d6hGNxAJ/q3HqVhH9tWmt3yCEIM/maBlI9yez8LQPs6H1lgOlHSDlfGeAqNblEEQz
 11Xq0x7NrY9MlWfWD9MWbXZwsaF/NroE0/1M7c/2USQhYvcGsjEzWltvtmRkr6oCQM3SAHYaIbKJgNETCyw8s27DLYfWyeBNPnIJjSh7yJcPtN0Y8AhIGb+e
 TvXwzWS8dvqTinALkZRbN4qhrR/R+w+0ApWbIgeWR8s=
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix time_t on 64-bits
 platforms build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gNy8yMi8yMSA1OjMyIFBNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBBZGQgcGF0Y2ggdG8g
Zml4IHRpbWVfdCBidWlsZCBmYWlsdXJlIG9uIDY0LWJpdHMgcGxhdGZvcm1zLgoKRm9yZ290IHRv
IGFkZDoKYGBgClBhdGNoIGlzIHBlbmRpbmcgdXBzdHJlYW06Cmh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1uZnMvcGF0Y2gvMjAyMTA3MjIxNTI0MTEuMTE1NjI5NS0x
LWdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20vCmBgYAo+IEZpeGVzOgo+IGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzliYzFkNDNhNTg4MzM4YjczOTVh
ZjdiYzk3NTM1ZWUxNmE2ZWEyZDkvCj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gICAuLi5tZV90
LWJ1aWxkLWVycm9yLW9uLTY0LWJpdHMtcGxhdGZvcm0ucGF0Y2ggfCA1MiArKysrKysrKysrKysr
KysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvbmZzLXV0aWxzLzAwMDEtbmZzLXV0aWxzLWZpeC10aW1lX3QtYnVp
bGQtZXJyb3Itb24tNjQtYml0cy1wbGF0Zm9ybS5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL25mcy11dGlscy8wMDAxLW5mcy11dGlscy1maXgtdGltZV90LWJ1aWxkLWVycm9yLW9uLTY0
LWJpdHMtcGxhdGZvcm0ucGF0Y2ggYi9wYWNrYWdlL25mcy11dGlscy8wMDAxLW5mcy11dGlscy1m
aXgtdGltZV90LWJ1aWxkLWVycm9yLW9uLTY0LWJpdHMtcGxhdGZvcm0ucGF0Y2gKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjFkZWM0OTRmMjYKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9uZnMtdXRpbHMvMDAwMS1uZnMtdXRpbHMtZml4LXRpbWVfdC1i
dWlsZC1lcnJvci1vbi02NC1iaXRzLXBsYXRmb3JtLnBhdGNoCj4gQEAgLTAsMCArMSw1MiBAQAo+
ICtGcm9tIDlkMjVmYWFlMTIxNjI1OGI2MTdkZDJkYjEzNGJjMWQ5ZmEwZmQ3M2QgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBi
ZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ICtEYXRlOiBUaHUsIDIyIEp1bCAyMDIxIDE2OjEzOjE0
ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gbmZzLXV0aWxzOiBmaXggdGltZV90IGJ1aWxkIGVy
cm9yIG9uIDY0LWJpdHMgcGxhdGZvcm1zCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQt
VHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOiA4Yml0Cj4gKwo+ICtXaGVuIHBhc3NpbmcgdGltZV90IHR5cGUgdG8gIiVsZCIgb24gNjQt
Yml0cyBwbGF0Zm9ybXMgd2hlcmUgdGltZV90IGlzIGEKPiArJ2xvbmcgbG9uZycgd2UgZW5jb3V0
ZXIgdGhpcyBidWlsZCBmYWlsdXJlOgo+ICtlcnJvcjogZm9ybWF0IOKAmCVsZOKAmSBleHBlY3Rz
IGFyZ3VtZW50IG9mIHR5cGUg4oCYbG9uZyBpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBl
IOKAmHRpbWVfdOKAmSB7YWthIOKAmGxvbmcgbG9uZyBpbnTigJl9IFstV2Vycm9yPWZvcm1hdD1d
Cj4gKwo+ICtTbyBsZXQncyBjaGFuZ2UgIiVsZCIgbWFya2VycyB0byAiJWxsZCIgYXNzdW1pbmcg
aXQgdG8gYmUgYSA2NC1iaXRzIGFuZAo+ICtjYXN0IHZhcmlhYmxlcyB0byAnKGxvbmcgbG9uZykn
IGlmIHRoZSB0eXBlIGlzIGEgdGltZV90Lgo+ICsKPiArU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJl
bmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gKy0tLQo+ICsg
dXRpbHMvbmZzZGNsdHJhY2svbmZzZGNsdHJhY2suYyB8IDIgKy0KPiArIHV0aWxzL25mc2RjbHRy
YWNrL3NxbGl0ZS5jICAgICAgfCA0ICsrLS0KPiArIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3V0aWxzL25mc2RjbHRy
YWNrL25mc2RjbHRyYWNrLmMgYi91dGlscy9uZnNkY2x0cmFjay9uZnNkY2x0cmFjay5jCj4gK2lu
ZGV4IGU5MjZmMWMwLi40Mzc0NzdiYiAxMDA2NDQKPiArLS0tIGEvdXRpbHMvbmZzZGNsdHJhY2sv
bmZzZGNsdHJhY2suYwo+ICsrKysgYi91dGlscy9uZnNkY2x0cmFjay9uZnNkY2x0cmFjay5jCj4g
K0BAIC01MjUsNyArNTI1LDcgQEAgY2x0cmFja19ncmFjZWRvbmUoY29uc3QgY2hhciAqdGltZXN0
cikKPiArIAlpZiAoKnRhaWwpCj4gKyAJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArLQl4bG9nKERf
R0VORVJBTCwgIiVzOiBncmFjZSBkb25lLiBncmFjZXRpbWU9JWxkIiwgX19mdW5jX18sIGdyYWNl
dGltZSk7Cj4gKysJeGxvZyhEX0dFTkVSQUwsICIlczogZ3JhY2UgZG9uZS4gZ3JhY2V0aW1lPSVs
bGQiLCBfX2Z1bmNfXywgKGxvbmcgbG9uZylncmFjZXRpbWUpOwo+ICsKPiArIAlyZXQgPSBzcWxp
dGVfcmVtb3ZlX3VucmVjbGFpbWVkKGdyYWNldGltZSk7Cj4gKwo+ICtkaWZmIC0tZ2l0IGEvdXRp
bHMvbmZzZGNsdHJhY2svc3FsaXRlLmMgYi91dGlscy9uZnNkY2x0cmFjay9zcWxpdGUuYwo+ICtp
bmRleCBmNzlhZWJiMy4uNmU2MDMwODcgMTAwNjQ0Cj4gKy0tLSBhL3V0aWxzL25mc2RjbHRyYWNr
L3NxbGl0ZS5jCj4gKysrKyBiL3V0aWxzL25mc2RjbHRyYWNrL3NxbGl0ZS5jCj4gK0BAIC01NDQs
OCArNTQ0LDggQEAgc3FsaXRlX3JlbW92ZV91bnJlY2xhaW1lZCh0aW1lX3QgZ3JhY2Vfc3RhcnQp
Cj4gKyAJaW50IHJldDsKPiArIAljaGFyICplcnIgPSBOVUxMOwo+ICsKPiArLQlyZXQgPSBzbnBy
aW50ZihidWYsIHNpemVvZihidWYpLCAiREVMRVRFIEZST00gY2xpZW50cyBXSEVSRSB0aW1lIDwg
JWxkIiwKPiArLQkJCWdyYWNlX3N0YXJ0KTsKPiArKwlyZXQgPSBzbnByaW50ZihidWYsIHNpemVv
ZihidWYpLCAiREVMRVRFIEZST00gY2xpZW50cyBXSEVSRSB0aW1lIDwgJWxsZCIsCj4gKysJCQko
bG9uZyBsb25nKWdyYWNlX3N0YXJ0KTsKPiArIAlpZiAocmV0IDwgMCkgewo+ICsgCQlyZXR1cm4g
cmV0Owo+ICsgCX0gZWxzZSBpZiAoKHNpemVfdClyZXQgPj0gc2l6ZW9mKGJ1ZikpIHsKPiArLS0K
PiArMi4yNS4xCj4gKwo+IAoKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcg
c2FzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5
Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
