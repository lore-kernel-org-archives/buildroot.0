Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC30D65559
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CEE64B058;
	Tue, 26 Nov 2024 21:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJXb4tX2Bca1; Tue, 26 Nov 2024 21:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0474E4EB94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0474E4EB94;
	Tue, 26 Nov 2024 21:08:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 985401DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E5214ECC9
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBYmf76PBosB for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 21:08:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15C484EB94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C484EB94
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15C484EB94
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 21:08:09 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G2n0tTbtCGPpWG2n0tJWzL; Tue, 26 Nov 2024 22:08:06 +0100
Message-ID: <9607f958-4cca-461b-8ff2-08ff7996efd6@benettiengineering.com>
Date: Tue, 26 Nov 2024 22:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
 <193607b65c0.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <193607b65c0.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
X-CMAE-Envelope: MS4xfKrJ83wUSMBkYf5jhpMCAb1wto7X3ZyA9cs4bxtDD1v14/nxkAdaw2L+a8kjj6gHv++Zp0nKT+6/G8vN75RJYOK8qRDvska1RIiMRIvj1h5vJNAhb48z
 iGBd08Po4oRjhiWdWt8ZZNBl64ZdeAh6329gMj0QcheSpUrGWlDgSCbNcoQU1VMDwsllaK9tG5pH/el70WXS1s+Leti4LOjCuKve2U+pwiSpqvOTtgutrku3
 goq80Hc92uIwlHqI8JEyao/Lw1qh55gT7506YypGNGE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1732655286; bh=43EuYilTTYmkXDxRK3qDTQW9MssgmhxOx7V/SqCfajA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MrBg75ApCgwEGLGZte5xVeHraHJCF8l/VRzMzKiSNiqy5Iwffoj5WfEN7vDsZyrH+
 tqyaBn+azEjOuJMbcvJ6+Bydjd4JdMBfl+lwLzkgcO1FKyuY0nMnSXMzceilyFNdkG
 2TJavRg5BIuvwBg7InE7zRWwxJ9vQ6ZCb0lLv4fHlZ2z2RMGRJwXCU+XTW59Jru1FI
 cWImiiYYuVwSjNxZHY/NPXv722NZ1GfqGb6lJSZNB4StCZ4Oq82OFZly2LaCfa2+o2
 dJqD4CV1qHkxtlNPf+6l7iaMg9UFCyrcqUs6xvEC60mSgkUV2htHu3z075E1/Lt7k9
 lBT4Jtwg/qZcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MrBg75Ap
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 2024-11-15
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

SGkgVmluY2VudCwKCnRoYW5rcyBmb3IgcmV2aWV3aW5nIG15IHBhdGNoZXMsCgpPbiAxMS8yNS8y
NCAwMDoyMiwgVmluY2VudCBKYXJkaW4gd3JvdGU6Cj4gSGkgR2l1bGlvLAo+IAo+IExlIDI0IG5v
dmVtYnJlIDIwMjQgMjM6Mjk6MDUgR2l1bGlvIEJlbmV0dGkgCj4gPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20+IGEgw6ljcml0IDoKPiAKPj4gSXQgYnVpbGRzIHVwIHRvIExp
bnV4IDYuMTEuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAtLS0KPj4gwqBwYWNrYWdlL2VzcC1ob3N0
ZWQvZXNwLWhvc3RlZC5oYXNoIHwgMiArLQo+PiDCoHBhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9z
dGVkLm1rIMKgIHwgMiArLQo+PiDCoDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9lc3AtaG9zdGVkL2VzcC1o
b3N0ZWQuaGFzaCBiL3BhY2thZ2UvZXNwLWhvc3RlZC8gCj4+IGVzcC1ob3N0ZWQuaGFzaAo+PiBp
bmRleCBlYTE4YzI0M2QxLi5hYzAxNjRjMzhjIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2VzcC1o
b3N0ZWQvZXNwLWhvc3RlZC5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9z
dGVkLmhhc2gKPj4gQEAgLTEsMyArMSwzIEBACj4+IMKgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPj4g
LXNoYTI1NiAKPj4gwqA3OGFiNGYxMGRkY2U3Njc0OWQzNjUxMTU5MWEwYTdiYjJhOTgyZGI5NmFj
MWVhMWIwMmI1YzM1ZGFiNzI1ZDhjIAo+PiDCoGVzcC1ob3N0ZWQtOTFiMDkzMzY1Y2M1ODIxNDUz
MmI5NzZkZDg3NDlmNjU1MjNkMWU2ZC50YXIuZ3oKPj4gK3NoYTI1NiAKPj4gwqA3ZmQ5NWE5YjQ3
YzIwM2E4YmQwZmRjYWIyMWYxNWM5ZDRjZjFjYWQ5MzZmMDIwNmE5NGRhMGQ5MzJkZDQyMjA2IAo+
PiDCoGVzcC1ob3N0ZWQtOTI3YTM0Zjk5NzI0YmI3NDRlZmFmODY1YTdjNzVjYzE2MTVmNTlhMi50
YXIuZ3oKPj4gwqBzaGEyNTYgCj4+IMKgZWQ1N2Q5NmQyN2JlNzc1YjIyZjk1NzFkMzcyNGVmODRl
MGQwYjhmMjRiODA1ZWM3Zjg3YTMyMTg5ZGUxOWE5YyDCoExJQ0VOU0UKPj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvZXNwLWhvc3RlZC9lc3AtaG9zdGVkLm1rIGIvcGFja2FnZS9lc3AtaG9zdGVkLyAK
Pj4gZXNwLWhvc3RlZC5tawo+PiBpbmRleCA0ZWZlZmMzMDIzLi5mNDM4MmU3ZmVlIDEwMDY0NAo+
PiAtLS0gYS9wYWNrYWdlL2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5tawo+PiArKysgYi9wYWNrYWdl
L2VzcC1ob3N0ZWQvZXNwLWhvc3RlZC5tawo+PiBAQCAtNCw3ICs0LDcgQEAKPj4gwqAjCj4+IMKg
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gLUVTUF9IT1NURURfVkVSU0lPTiA9IDkxYjA5MzM2
NWNjNTgyMTQ1MzJiOTc2ZGQ4NzQ5ZjY1NTIzZDFlNmQKPj4gK0VTUF9IT1NURURfVkVSU0lPTiA9
IDkyN2EzNGY5OTcyNGJiNzQ0ZWZhZjg2NWE3Yzc1Y2MxNjE1ZjU5YTIKPiAKPiBEaWQgeW91IHRy
eSB0byByZXF1ZXN0IHRvIHRoZSBwcm9qZWN0IGZvciBhIHByb3BlciB0YWcvcmVsZWFzZSA/IEl0
IAo+IHNlZW1zIGl0cyBnaXQgcmVwbyBpcyBhY3RpdsOpZSwgYnV0IHdpdGhvdXQgYW55IHRhZ3Mg
Zm9yIGEgd2hpbGUuCgpJJ3ZlIGp1c3Qgb3BlbmVkIGFuIElzc3VlIGhlcmU6Cmh0dHBzOi8vZ2l0
aHViLmNvbS9lc3ByZXNzaWYvZXNwLWhvc3RlZC9pc3N1ZXMvNTUwCgpsZXQncyBzZWUgaWYgdGhl
eSBzdGFydCBwcm92aWRpbmcgUmVsZWFzZXMuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5l
dHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gCj4+IMKgRVNQX0hPU1RFRF9T
SVRFID0gJChjYWxsIGdpdGh1Yixlc3ByZXNzaWYsZXNwLWhvc3RlZCwgCj4+ICQoRVNQX0hPU1RF
RF9WRVJTSU9OKSkKPj4gwqBFU1BfSE9TVEVEX0RFUEVOREVOQ0lFUyA9IGxpbnV4Cj4+IMKgRVNQ
X0hPU1RFRF9MSUNFTlNFID0gR1BMLTIuMAo+IAo+IExHVE0sIGdvb2QgdG8gYmUgbWVyZ2VkCj4g
Cj4gUmV2aWV3ZWQtYnk6IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+Cj4gCj4+IC0t
IAo+PiAyLjM5LjUKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
