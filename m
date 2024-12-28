Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37E2E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 17:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F053605E9;
	Sat, 28 Dec 2024 17:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmmpyDhLcsl6; Sat, 28 Dec 2024 17:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81030606EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81030606EA;
	Sat, 28 Dec 2024 17:42:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C04E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B208D606EA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYaMWStYyUlE for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 17:42:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AB2F605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AB2F605E9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AB2F605E9
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:42:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B16C160003
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:42:01 +0000 (UTC)
Message-ID: <61645c4a-77b1-46bd-ac06-cac5ad78380f@korsgaard.com>
Date: Sat, 28 Dec 2024 18:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <FB194E54-666A-488A-8C79-6A3CB933D55B@martb.dev>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <FB194E54-666A-488A-8C79-6A3CB933D55B@martb.dev>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/polkit: fix permissions after
 version bump to 125
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

T24gMTIvMTMvMjQgMDY6MzksIE1hcnRpbiBCw7ZoIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gRnJv
bTogTWFydGluIELDtmggPGNvbnRhY3RAbWFydGIuZGV2Pgo+IAo+IFRoZSBzZXJ2aWNlIGZhaWxl
ZCB0byBzdGFydCBjb3JyZWN0bHkgaWYgYW55IGN1c3RvbSBydWxlcyB3ZXJlIGluc3RhbGxlZC4K
PiBUaGlzIGNvbW1pdCBhbGlnbnMgdGhlIHBlcm1pc3Npb25zIHdpdGggdGhlIHVwc3RyZWFtIG1l
c29uIGJ1aWxkIHN0ZXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIELDtmggPGNvbnRhY3RA
bWFydGIuZGV2PgoKQ29tbWl0dGVkIHRvIDIwMjQuMTEueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0
ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
