Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BF7C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC858186E;
	Tue,  9 Jul 2024 20:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJitG-pxUunP; Tue,  9 Jul 2024 20:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA95981846
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA95981846;
	Tue,  9 Jul 2024 20:55:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DEA71BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7816F817C0
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHAqTlb8ZcgD for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:55:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDEC7817AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDEC7817AB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDEC7817AB
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:55:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.252]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7sDq-1sWFg81i5q-00DmBI; Tue, 09
 Jul 2024 22:54:58 +0200
Message-ID: <ed44be99-8d5f-4ef6-ab2f-03b13d83d3b6@gmx.de>
Date: Tue, 9 Jul 2024 22:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
 <20240419213216.518041-2-angelo.compagnucci@gmail.com>
 <20240709222834.25c0009a@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240709222834.25c0009a@windsurf>
X-Provags-ID: V03:K1:IzFUDMVGlruFJNy3zsz/KkbGI0pzdG+dajQ52SuqHpBaz1rUvsh
 /wa5LyINPBelVQuVYfc+IqX6j+y9pYi2e6GW9SESzR4thBsr94adNsTY8F2A+TLphAMS+Co
 4yoBLiYa6nj4NxJRvearWNWrnG6rhK8l8Mlf/8Re48PGxyoGynkQ6oNujHrbVlHusoyYm6X
 8CKA4kD2CFvO6kbdL1l6A==
UI-OutboundReport: notjunk:1;M01:P0:Z2AkdQJ4RB0=;qe7DSVR2jlTalCllbBUV7yVYEro
 QzkJglAoq07U83pV7ut5PSQ++6TiCUY+ZvfMRTJJaWNTmRgBCqGXaN3WVoqoY+q9iWQCTBtjp
 tes0b5sZLmFhN9B+gKlw0mz4hJg6Yvfme5yv1wOlBPBMlQM1LXfRlyi6BRFs4gTqeBkBASGrU
 Lu1RW5t3lpQfOkWJZYXcmdHWSka9l3IQIDE1pTjoCgxMTahj+P28Y/HdlYVBsGUbfWKbkmy0n
 jxV1hctEo0YT5vAG8AGxfth/HzfLHLAB4x9raPWLwHCGybRD82AJwcGUee4xS/TgkJJ4JkuBG
 2n9i2JafIRL1S6FmewWFL9q7OXpNcs31BWqlrwFWqTix0VmjQvdfS+SlOGrcwbfQ0hvtXYsjm
 XV7cFyTJbRIqU7x/irpv6f2NQxEBl6rtJAyCaQy8MGccznVRlnw6NpZLV0Y8/8mbdQjbvzdjL
 +D7dscGNBqcZ2pPUJKqonTD7TtIfmdudRPD60X46fXbQrv+yhbgLagLTBwWPhtlN50iFaORMw
 3HDIJVmvAW8ZgvMfFuQ7vrdwYkjo6E5WLuEcjgjednSfLP1Hj3aaYf+dFpx2FeUhoHZIh8IfR
 f2KUNYXo45L87w4GYc5C1RCSnWCcD6RCSnAl2WJXFLgNoqS3GNvMvRcY18gdUz1A282AcSRsm
 HO4sm19ah7vBdPVoAcivbQYDQ1jRLSQtCeO7ZgcrzlzrNyzM0EhYOsRsIzkdKodnhm4tDuCLF
 YSgXLiROI8yGhoI01t/TskMbzaVyIn8LNfPvxG3d5QqKWyA0REgMA7jdHCOOEaU0dLoO6oHAo
 yYErtUUfOYmu5dL5ZeYO8yZWW42LJNQ9sYgP48JrVnbls=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720558498; x=1721163298; i=fiona.klute@gmx.de;
 bh=qS62p9hubhB4giKbR7VKvsbpJb11FG8BbMVTWNuBJUE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FiBuyB+YAIZBSleFO7iEgRAZXfpJhk1smL50Gx7Ho/vmJtBiVIeopP+23GfHqsoK
 ObvtPg6wEKsUEKUsTrU7xgQUeNrTWofcF4j7JW6I951LzUTUlBESOKNLF601lPe0N
 vQ0AGk1lGb93vwd/gpX6u0Hqc98pwCEsOU8tdYxCggiZBwVWqBtWyhL/5ii2l4Y8T
 wfw7boia/k19sgPortg0xyla02cwuPH8G0dXJ6NQgDEUI5BiGd0Hx0TCmvAlEfkii
 tVNNpKzDSVJalVFGq5XR02CsPYiGIu4dvewtR+r/20FYe3z8wg1ut+i8sB9iDBdpr
 oaSlkeG85C1yZH+ZcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=FiBuyB+Y
Subject: Re: [Buildroot] [PATCH 1/2] package/fail2ban: fix data_files
 installation path
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDkuMDcuMjQgdW0gMjI6Mjggc2NocmllYiBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJv
b3Q6Cj4gSGVsbG8gQW5nZWxvLAo+Cj4gT24gRnJpLCAxOSBBcHIgMjAyNCAyMzozMjoxNSArMDIw
MAo+IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxvLmNvbXBhZ251Y2NpQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4KPgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mYWlsMmJhbi8wMDAxLXNldHVwLnB5LWZp
eC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoIGIvcGFja2FnZS9mYWlsMmJhbi8wMDAxLXNldHVw
LnB5LWZpeC1kYXRhLXJlbGF0aXZlLXBhdGhzLnBhdGNoCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmUxYjViYzQ5MGIKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysg
Yi9wYWNrYWdlL2ZhaWwyYmFuLzAwMDEtc2V0dXAucHktZml4LWRhdGEtcmVsYXRpdmUtcGF0aHMu
cGF0Y2gKPj4gQEAgLTAsMCArMSw3MyBAQAo+PiArRnJvbSA3YjdmYTNjMDJkNDU3NWMwOTM2MjMz
NmJjMzEwODM1YzM3ODU5ZjFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogQW5n
ZWxvIENvbXBhZ251Y2NpIDxhbmdlbG8uY29tcGFnbnVjY2lAZ21haWwuY29tPgo+PiArRGF0ZTog
RnJpLCAxOSBBcHIgMjAyNCAyMjo0NzoyMCArMDIwMAo+PiArU3ViamVjdDogW1BBVENIXSBzZXR1
cC5weTogZml4IGRhdGEgcmVsYXRpdmUgcGF0aHMKPj4gK01JTUUtVmVyc2lvbjogMS4wCj4+ICtD
b250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPj4gK0NvbnRlbnQtVHJhbnNm
ZXItRW5jb2Rpbmc6IDhiaXQKPj4gKwo+PiArQXMgcGVyIGRpc3R1dGlscyBkb2N1bWVudGF0aW9u
Ogo+PiArCj4+ICtUaGUgZGlyZWN0b3J5IHNob3VsZCBiZSBhIHJlbGF0aXZlIHBhdGguIEl0IGlz
IGludGVycHJldGVkIHJlbGF0aXZlIHRvIHRoZQo+PiAraW5zdGFsbGF0aW9uIHByZWZpeCAoUHl0
aG9u4oCZcyBzeXMucHJlZml4IGZvciBzeXN0ZW0gaW5zdGFsbGF0aW9uczsKPj4gK3NpdGUuVVNF
Ul9CQVNFIGZvciB1c2VyIGluc3RhbGxhdGlvbnMpLiBEaXN0dXRpbHMgYWxsb3dzIGRpcmVjdG9y
eSB0byBiZSBhbgo+PiArYWJzb2x1dGUgaW5zdGFsbGF0aW9uIHBhdGgsIGJ1dCB0aGlzIGlzIGRp
c2NvdXJhZ2VkIHNpbmNlIGl0IGlzIGluY29tcGF0aWJsZQo+PiArd2l0aCB0aGUgd2hlZWwgcGFj
a2FnaW5nIGZvcm1hdCBbMV0uCj4+ICsKPj4gK1doZW4gcGFja2FnaW5nIHRvIGEgYmRpc3Rfd2hl
ZWwgaW5kZWVkLCB0aGUgZmlsZXMgaW4gdGhlICJkYXRhX2ZpbGVzIiBkaWN0aW9uYXJ5Cj4+ICth
cmUgbm90IHBpY2tlZCBhdCBhbGwgYXMgZGF0YSBmaWxlcyBpZiB0aGV5IGhhdmUgYW4gYWJzb2x1
dGUgcGF0aCwKPj4gK2J1dCB0aGV5IGFyZSBpbnN0ZWFkIGFkZGVkIHRvIHRoZSB3aGVlbCBhcyBw
eXRob24gZmlsZXMuCj4+ICtUaGlzIGhhcyB0aGUgZWZmZWN0IG9mIGluc3RhbGxpbmcgdGhlbSBh
cyBwYXJ0IG9mIHB5dGhvbiBmaWxlcyBpbiB0aGUKPj4gK3NpdGUtcGFja2FnZXMgZm9sZGVyIHdo
ZW4gdGhlIHdoZWVsIGlzIGluc3RhbGxlZC4KPj4gKwo+PiArVGhpcyBwYXRjaCBjYW5ub3QgYmUg
c2VudCB1cHN0cmVhbSBiZWNhdXNlIGl0IGJyZWFrcyB0aGUgbGVnYWN5IHdheSBvZgo+PiAraW5z
dGFsbGluZyB0aGUgcGFja2FnZSB3aXRoICpweXRob24gc2V0dXAucHkgaW5zdGFsbCogYW5kIGl0
IGlzIG5lZWRlZCBvbmx5IHRvCj4+ICtjb21wbHkgd2l0aCB0aGUgcGVwNTE3IGJ1aWxkcm9vdCBj
b21wYXRpYmlsaXR5IGxheWVyLgo+PiArCj4+ICtbMV0gaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcv
My4xMC9kaXN0dXRpbHMvc2V0dXBzY3JpcHQuaHRtbCNpbnN0YWxsaW5nLWFkZGl0aW9uYWwtZmls
ZXMKPj4gK1NpZ25lZC1vZmYtYnk6IEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxvLmNvbXBhZ251
Y2NpQGdtYWlsLmNvbT4KPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIQo+Cj4gSG93ZXZlciwgdGhp
cyBwYXRjaCBoYXMgbm8gVXBzdHJlYW06IHRhZywgY2F1c2luZyBhIGNoZWNrLXBhY2thZ2UKPiB3
YXJuaW5nIHdoZW4gYmVpbmcgYXBwbGllZDoKPgo+IFdBUk5JTkc6IHBhY2thZ2UvZmFpbDJiYW4v
MDAwMS1zZXR1cC5weS1maXgtZGF0YS1yZWxhdGl2ZS1wYXRocy5wYXRjaDowOiBtaXNzaW5nIFVw
c3RyZWFtIGluIHRoZSBoZWFkZXIgKGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfYWRk
aXRpb25hbF9wYXRjaF9kb2N1bWVudGF0aW9uKQo+Cj4gV2hhdCBpcyB0aGUgdXBzdHJlYW0gc3Rh
dHVzIG9mIHRoaXMgcGF0Y2g/CgpJIGJlbGlldmUgdGhlIGxhc3QgcGFyYWdyYXBoIG9mIHRoZSBw
YXRjaCBkZXNjcmlwdGlvbiBhbnN3ZXJzIHRoZQpxdWVzdGlvbiwgbWF5YmUgeW91IGNvdWxkIGFk
ZCBhIHNob3J0ZW5lZCB2ZXJzaW9uIGFzIHRoZSBVcHN0cmVhbSB0YWc/IEUuZy46ClVwc3RyZWFt
OiBOL0EgKGJyZWFrcyB1cHN0cmVhbSBpbnN0YWxsLCBvbmx5IGZvciBCdWlsZHJvb3QgY29tcGF0
aWJpbGl0eSkKCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
