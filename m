Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1D9C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FCB940386;
	Tue, 23 Jul 2024 13:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K73tDrwU9t4g; Tue, 23 Jul 2024 13:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D31440AD1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D31440AD1;
	Tue, 23 Jul 2024 13:31:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A35CF1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B7B240346
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFcMPGys0zQG for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7172840308
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7172840308
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7172840308
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:31:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 638BB1476;
 Tue, 23 Jul 2024 06:32:17 -0700 (PDT)
Received: from debian (unknown [10.57.12.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8207E3F766;
 Tue, 23 Jul 2024 06:31:51 -0700 (PDT)
Date: Tue, 23 Jul 2024 15:31:48 +0200
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Bryan Brattlof <bb@ti.com>
Message-ID: <Zp-wxDuSSLIA_yz8@debian>
Mail-Followup-To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
References: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722-optee-bump-v1-0-8e25b342634d@ti.com>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: Re: [Buildroot] [PATCH 0/4] bump optee to 4.3.0
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

T24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgMDg6MzI6MDVQTSAtMDUwMCwgQnJ5YW4gQnJhdHRsb2Yg
d3JvdGU6Cj4gSGVsbG8gZXZlcnlvbmUsCj4gCj4gVGhpcyBzbWFsbCBzZXJpZXMgYnVtcHMgYWxs
IG9wdGVlIHBhY2thZ2VzIHRvIDQuMy4wIGFuZCB1cGRhdGVzIHRoZWlyIAo+IGRlZmF1bHQgaGFz
aGVzLgoKSGkgQnJ5YW4sCgpUaGFua3MgZm9yIGJ1bXBpbmc7IHRoaXMgd29ya3MgZmluZSBmb3Ig
bWUgb24gdG9wIG9mIG1hc3RlciwgY29tbWl0IDBkNTgyMDU0ZTEzMQooInBhY2thZ2UvcHl0aG9u
LWNhbi9Db25maWcuaW46IHNvcnQgc2VsZWN0cyIpLgoKLSBUaGUgT1AtVEVFIHVuaXQgdGVzdCBy
dW5zIGZpbmUgKHRlc3RzLmJvb3QudGVzdF9vcHRlZV9vcykuCi0gQWxsIEVCQlIgY29uZmlncyBi
dWlsZCBhbmQgcnVuIGZpbmUgKGFybV9mdnBfZWJicl9kZWZjb25maWcsCiAgcWVtdV9hYXJjaDY0
X2ViYnJfZGVmY29uZmlnLCBxZW11X2FybV9lYmJyX2RlZmNvbmZpZykuCi0gVGhlIHFlbXVfYXJt
X3ZleHByZXNzX3R6X2RlZmNvbmZpZywgYWxzbyB1c2luZyBPUC1URUUsIGJ1aWxkcyBhbmQgcnVu
cyBmaW5lLgoKVGVzdGVkLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5j
b20+CgpJIGNvdWxkIG5vdCB0ZXN0IHRoZSBvdGhlciBjb25maWdzIHVzaW5nIE9QLVRFRSAoYmVh
Z2xlYm9uZWFpNjRfZGVmY29uZmlnLApiZWFnbGVwbGF5X2RlZmNvbmZpZywgdGlfYW02MmF4X3Nr
X2RlZmNvbmZpZywgdGlfYW02Mnhfc2tfZGVmY29uZmlnLAp0aV9hbTY0eF9za19kZWZjb25maWcp
IGFzIHRoZXkgd2lsbCBub3QgYnVpbGQgZm9yIG1lIGV2ZW4gYmVmb3JlIHRoaXMgc2VyaWVzLgoK
QmVzdCByZWdhcmRzLApWaW5jZW50LgoKPiAKPiBIYXBweSByZXZpZXdpbmcKPiB+QnJ5YW4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgo+IC0tLQo+IEJyeWFu
IEJyYXR0bG9mICg0KToKPiAgICAgICBib290L29wdGVlLW9zOiBidW1wIHRvIDQuMy4wCj4gICAg
ICAgcGFja2FnZS9vcHRlZS1jbGllbnQ6IGJ1bXAgdG8gNC4zLjAKPiAgICAgICBwYWNrYWdlL29w
dGVlLWV4YW1wbGVzOiBidW1wIHRvIDQuMy4wCj4gICAgICAgcGFja2FnZS9vcHRlZS10ZXN0OiBi
dW1wIHRvIDQuMy4wCj4gCj4gIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgICB8IDQgKystLQo+ICBib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2ggICAgICAgICAgICAg
ICAgfCA0ICsrLS0KPiAgcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggICAg
IHwgNCArKy0tCj4gIHBhY2thZ2Uvb3B0ZWUtY2xpZW50L29wdGVlLWNsaWVudC5tayAgICAgICB8
IDIgKy0KPiAgcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFtcGxlcy5oYXNoIHwgNCAr
Ky0tCj4gIHBhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMubWsgICB8IDIgKy0K
PiAgcGFja2FnZS9vcHRlZS10ZXN0L29wdGVlLXRlc3QuaGFzaCAgICAgICAgIHwgNCArKy0tCj4g
IHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lm1rICAgICAgICAgICB8IDIgKy0KPiAgOCBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAtLS0KPiBi
YXNlLWNvbW1pdDogNGU0NTU0ZWViNzZlOGI1MTZjNmNiY2Q2NmYxNTg2ODQ5MmFhYzU5NAo+IGNo
YW5nZS1pZDogMjAyNDA3MjItb3B0ZWUtYnVtcC0xYjE3MzQ3NmE0ZjEKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gLS0gCj4gQnJ5YW4gQnJhdHRsb2YgPGJiQHRpLmNvbT4KPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
