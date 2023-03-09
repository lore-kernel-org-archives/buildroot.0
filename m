Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832B4C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 15:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6FBC82197;
	Thu,  9 Mar 2023 15:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6FBC82197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEdblSL45h64; Thu,  9 Mar 2023 15:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27DAE82194;
	Thu,  9 Mar 2023 15:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27DAE82194
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 277A01BF309
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 15:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0157B61381
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 15:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0157B61381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id va3eMxFJr2pm for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 15:21:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BA661388
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0BA661388
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 15:21:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 067C1C14;
 Thu,  9 Mar 2023 07:22:01 -0800 (PST)
Received: from debian (X72Y076X74.nice.arm.com [10.34.129.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B29863F5A1;
 Thu,  9 Mar 2023 07:21:16 -0800 (PST)
Date: Thu, 9 Mar 2023 16:21:14 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <ZAn5agFZsVTj6Ucq@debian>
Mail-Followup-To: Niklas Cassel <niklas.cassel@wdc.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Dick Olsson <hi@senzilla.io>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
References: <20230307093504.3611941-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230307093504.3611941-1-niklas.cassel@wdc.com>
Subject: Re: [Buildroot] [PATCH v3 0/3] misc aarch64-sbsa cleanups
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBNYXIgMDcsIDIwMjMgYXQgMTA6MzU6MDFBTSArMDEwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToKPiBIZWxsbywKPiAKPiBIZXJlIGNvbWUgc29tZSBzbWFsbCBhYXJjaDY0LXNic2EgY2xl
YW51cHMuCj4gUGxlYXNlIGNvbnNpZGVyIGZvciBpbmNsdXNpb24uCj4gCj4gQ2hhbmdlcyBzaW5j
ZSB2MjoKPiAtS2VlcCB0aGUga2VybmVsIGNvbmZpZyBvbmx5IHVzZWQgYnkgdGVzdF9lZGsyLnB5
LCBidXQgbW92ZSBpdCB0byBhIG5ldwo+ICBzdWJkaXJlY3RvcnkgdG8gbWFrZSBpdCBtb3ZlIG9i
dmlvdXMgdGhhdCBpdCBpcyBvbmx5IHVzZWQgYnkgdGVzdF9lZGsucHkuCgpIaSBOaWtsYXMsCgpU
aGFua3MgZm9yIHdvcmtpbmcgb24gdGhhdCBzZXJpZXMuCgotIFRoZSBkZWZjb25maWcgd29ya3Mg
b24gbXkgc2lkZSwgb24gQXJtIGFuZCB4ODYsIG9uIG1hc3RlciBhbmQgbmV4dC4KLSBUaGUgdW5p
dCB0ZXN0IHdvcmtzIGxvY2FsbHkgKG9uIHg4NikgYW5kIG9uIGdpdGxhYiwgb24gbWFzdGVyIGFu
ZCBuZXh0LgoKRmVlbCBmcmVlIHRvIGFkZCAob3Igbm90KToKCiAgVGVzdGVkLWJ5OiBWaW5jZW50
IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQu
Cgo+IAo+IFRoYW5rcyBhIGxvdCB0byBWaW5jZW50IFN0ZWhsw6kgZm9yIHRlc3RpbmcgdGhlIHBy
ZXZpb3VzIHZlcnNpb25zIGluIGdpdGxhYiBDSS4KPiAKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gTmlr
bGFzCj4gCj4gTmlrbGFzIENhc3NlbCAoMyk6Cj4gICBib2FyZC9xZW11L2FhcmNoNjQtc2JzYTog
dXNlIFBBUlRMQUJFTCB0byBzcGVjaWZ5IHJvb3QKPiAgIGJvYXJkL3FlbXUvYWFyY2g2NC1zYnNh
OiB1c2UgdGhlIGRlZmF1bHQgY29uc29sZSBzcGVjaWZpZWQgYnkgQUNQSQo+ICAgc3VwcG9ydC90
ZXN0aW5nOiBtb3ZlIHRoZSBrZXJuZWwgY29uZmlnIG9ubHkgdXNlZCBieSB0ZXN0X2VkazIucHkK
PiAKPiAgYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvZ3J1Yi5jZmcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2Vk
azIucHkgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIC4uLi90ZXN0aW5nL3Rlc3Rz
L2Jvb3QvdGVzdF9lZGsyfS9saW51eC5jb25maWcgICAgICAgICAgICAgICAgICB8IDAKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIHJlbmFtZSB7
Ym9hcmQvcWVtdS9hYXJjaDY0LXNic2EgPT4gc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVz
dF9lZGsyfS9saW51eC5jb25maWcgKDEwMCUpCj4gCj4gLS0gCj4gMi4zOS4yCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
