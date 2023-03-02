Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5E9C678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 12:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFB4360FB4;
	Thu,  2 Mar 2023 12:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFB4360FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJ09m9ecFR3M; Thu,  2 Mar 2023 12:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0582E60761;
	Thu,  2 Mar 2023 12:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0582E60761
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45A5E1BF27E
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 12:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EEB160F80
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 12:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EEB160F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFJZUAIzoD-g for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 12:59:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12B7F60761
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B7F60761
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 12:59:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EEE51FB;
 Thu,  2 Mar 2023 04:59:50 -0800 (PST)
Received: from debian (X72Y076X74.nice.arm.com [10.34.129.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 020193F587;
 Thu,  2 Mar 2023 04:59:05 -0800 (PST)
Date: Thu, 2 Mar 2023 13:59:02 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <ZACdlkN56+xQfGnX@debian>
Mail-Followup-To: Niklas Cassel <niklas.cassel@wdc.com>,
 buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Dick Olsson <hi@senzilla.io>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
References: <20230301155810.3222459-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301155810.3222459-1-niklas.cassel@wdc.com>
Subject: Re: [Buildroot] [PATCH 0/3] misc aarch64-sbsa cleanups
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

T24gV2VkLCBNYXIgMDEsIDIwMjMgYXQgMDQ6NTg6MDdQTSArMDEwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToKPiBIZWxsbywKPiAKPiBIZXJlIGNvbWUgc29tZSBzbWFsbCBhYXJjaDY0LXNic2EgY2xl
YW51cHMuCj4gUGxlYXNlIGNvbnNpZGVyIGZvciBpbmNsdXNpb24uCgpIaSBOaWtsYXMsCgpUaGFu
ayB5b3UgZm9yIHRoaXMgcGF0Y2ggc2VyaWVzLiBJdCB3b3JrcyBmaW5lIG9uIG15IHNpZGUgKG9u
IHRvcCBvZiBgbWFzdGVyJwphbmQgYG5leHQnKS4gRmVlbCBmcmVlIHRvIGFkZDoKCiAgVGVzdGVk
LWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CgpCZXN0IHJlZ2Fy
ZHMsClZpbmNlbnQuCgo+IAo+IAo+IEtpbmQgcmVnYXJkcywKPiBOaWtsYXMKPiAKPiAKPiBOaWts
YXMgQ2Fzc2VsICgzKToKPiAgIGJvYXJkL3FlbXUvYWFyY2g2NC1zYnNhOiB1c2UgUEFSVExBQkVM
IHRvIHNwZWNpZnkgcm9vdAo+ICAgYm9hcmQvcWVtdS9hYXJjaDY0LXNic2E6IHVzZSB0aGUgZGVm
YXVsdCBjb25zb2xlIHNwZWNpZmllZCBieSBBQ1BJCj4gICBib2FyZC9xZW11L2FhcmNoNjQtc2Jz
YTogZHJvcCB1bnVzZWQga2VybmVsIGNvbmZpZyBmaWxlCj4gCj4gIGJvYXJkL3FlbXUvYWFyY2g2
NC1zYnNhL2dydWIuY2ZnICAgICB8ICAyICstCj4gIGJvYXJkL3FlbXUvYWFyY2g2NC1zYnNhL2xp
bnV4LmNvbmZpZyB8IDY4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNjkgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEw
MDY0NCBib2FyZC9xZW11L2FhcmNoNjQtc2JzYS9saW51eC5jb25maWcKPiAKPiAtLSAKPiAyLjM5
LjIKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
