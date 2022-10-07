Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4FEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3229B802CC;
	Fri,  7 Oct 2022 16:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3229B802CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okkxiQKh0izC; Fri,  7 Oct 2022 16:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C633B83F20;
	Fri,  7 Oct 2022 16:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C633B83F20
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC521BF470
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 16:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5441E83F20
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 16:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5441E83F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03aaGXiDlRn7 for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 16:28:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 276BF83F1E
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTP id 276BF83F1E
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 16:28:20 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gqCvowiBtMbobgqCwoZRYl; Fri, 07 Oct 2022 18:28:19 +0200
Message-ID: <ec8a2818-be12-1fe9-bfb3-3041ff2e08f8@benettiengineering.com>
Date: Fri, 7 Oct 2022 18:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Wolfgang Grandegger <wg@grandegger.com>, buildroot@buildroot.org
References: <44ae3630-5f21-54d4-8d77-9cb9fa137289@grandegger.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <44ae3630-5f21-54d4-8d77-9cb9fa137289@grandegger.com>
X-CMAE-Envelope: MS4xfMqRcEorqI7TkDU5wrhtXY2UsqVsC2SLZndLu6jBzVmvb8MqN6yO8KN2ACSvIsi5GNRtHUqrepWwoDI+41hiOb77xe8G63THacnXIaVSNBVkKzFNaSTw
 eFnOQGf+OpklMidXIch/Fs/blUptLvaFKV+BIGbmASjpA1wuRORJOHF/8w4T0o6hUoX4DbqKOuBX3WYxG8lQJDHGfAioHGE4d2z48j6CsmosqM86cIoM2Fp7
 e+OMR8FpSd+QnJCPVxdGnsZwLggmbQTSx2CFkAdcg+Q9vDM2kZS89BrQvJpMi2aj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665160099; bh=lLKbg09ZwVpVMUd0Z7KG7PASnt9okkkaMZRBkn2AhuQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=IvwAYwuyFmTjyM9FJuEHmgOVO1ttW0e8uxKptJEIIwO38wdzgQeOhAsWCZudK7XL5
 HFz7GvRBT6TcpP/4mtKgWkDgKic5c2uoXGxk4iEjwl+BQUHpXV5DR+7Ua2rcpwGNaE
 gjEopAyUX2rTjNvwpkbfDfib99N6NKPp5sGByXgmnOwvWSDnme5kqgme/W2IU6mKqy
 dmMEF37l9LQCxKPZHM0Yw86JVds4srkTU2UsCnt7Fr+I3aTzoWSMgkvqUAcnFFZkIY
 hjRcZTOiTYOcsPvkGgz9XIbF7GOV8KWxUhij7HHqPL8NxHO1L4WWUvsw/PeUmUAsue
 uAihF9KkKmTyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IvwAYwuy
Subject: Re: [Buildroot] [PATCH v2] package/udisks: install to staging
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgV29sZmdhbmcsCgpPbiAwNy8xMC8yMiAwOToyNywgV29sZmdhbmcgR3JhbmRlZ2dlciB3cm90
ZToKPiBVRGlza3MyIHByb3ZpZGVzIGEgTGlicmFyeSBBUEkgWzFdIGZvciBhY2Nlc3NpbmcgdGhl
IFVEaXNrczIgc2VydmljZQo+IHZpYSAibGlidWRpc2tzMi5zbyIuIEZvciBkZXZlbG9wbWVudCBv
ZiBVRGlza3MyIGNsaWVudHMsIGluc3RhbGwgdG8KPiBzdGFnaW5nIGFzIHdlbGwhCj4gCj4gWzFd
IGh0dHA6Ly9zdG9yYWdlZC5vcmcvZG9jL3VkaXNrczItYXBpLzIuOS40L3JlZi1saWJyYXJ5Lmh0
bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBXb2xmZ2FuZyBHcmFuZGVnZ2VyIDx3Z0BncmFuZGVnZ2Vy
LmNvbT4KCkp1c3QgY2hlY2tlZCB3aXRoIGJ1aWxkcm9vdC90ZXN0LXBrZyBhbmQgaXQgd29ya3Mg
Y29ycmVjdGx5LiBDb21taXQgbG9nCmxvb2tzIG9rIHRvIG1lIHNvOgpSZXZpZXdlZC1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CgpCZXN0
IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTy9DVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBz
YXMKCj4gLS0tCj4gCj4gLUNoYW5nZXMgc2luY2UgdjE6Cj4gIMKgUmVtb3ZlIG5vdGUgYWJvdXQg
dGhlIHJlcG9ydGVkIGJ1ZyBhbmQgYWRkIGF1dGhvcnMgbGlzdGVkIGJ5Cj4gIMKgInV0aWxzL2dl
dC1kZXZlbG9wZXJzIi4KPiAKPiAgwqBwYWNrYWdlL3VkaXNrcy91ZGlza3MubWsgfCAxICsKPiAg
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS91ZGlza3MvdWRpc2tzLm1rIGIvcGFja2FnZS91ZGlza3MvdWRpc2tzLm1rCj4gaW5kZXggMmJm
NTE5YTJjYy4uOTU5MzMzZDAxZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3VkaXNrcy91ZGlza3Mu
bWsKPiArKysgYi9wYWNrYWdlL3VkaXNrcy91ZGlza3MubWsKPiBAQCAtMTAsNiArMTAsNyBAQCBV
RElTS1NfU0lURSA9IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9zdG9yYWdlZC1wcm9qZWN0L3VkaXNr
cy9yZWxlYXNlcy9kb3dubG9hZC91ZGlzawo+ICDCoFVESVNLU19MSUNFTlNFID0gR1BMLTIuMCsK
PiAgwqBVRElTS1NfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiAgwqBVRElTS1NfQ1BFX0lEX1ZF
TkRPUiA9IGZyZWVkZXNrdG9wCj4gK1VESVNLU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAKPiAg
wqBVRElTS1NfREVQRU5ERU5DSUVTID0gXAo+ICDCoMKgwqDCoCBob3N0LXBrZ2NvbmYgXAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
