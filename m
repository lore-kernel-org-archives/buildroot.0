Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D49C4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 08:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7508640AF5;
	Wed,  9 Nov 2022 08:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7508640AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swnSfJbKAXUN; Wed,  9 Nov 2022 08:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4E1E40AE2;
	Wed,  9 Nov 2022 08:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4E1E40AE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 760FB1BF301
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 08:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5098541778
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 08:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5098541778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdCHRb_7g9dd for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 08:29:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4A241777
Received: from mailproxy09.manitu.net (mailproxy09.manitu.net [217.11.48.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A4A241777
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 08:29:51 +0000 (UTC)
Received: from [IPV6:2001:a61:3540:8301:b8f2:fc44:4d2b:6e02] (unknown
 [IPv6:2001:a61:3540:8301:b8f2:fc44:4d2b:6e02])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy09.manitu.net (Postfix) with ESMTPSA id 8060D1200086
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 09:29:48 +0100 (CET)
Message-ID: <11be86d8-4ce4-1ec5-41e5-ab8a9b8cacf5@grandegger.com>
Date: Wed, 9 Nov 2022 09:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: buildroot@buildroot.org
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: [Buildroot] Defining package env variables in external.mk
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpJIGRpc2NvdmVyZWQgdGhhdCBpdCdzIHBvc3NpYmxlIHRvIGRlZmluZSBlbnZpcm9u
bWVudCB2YXJpYWJsZSBmb3IgCmNlcnRhaW4gcGFja2FnZXMgaW4gImV4dGVybmFsLG1rIjoKCiDC
oCAkIGNkIGJ1aWxkcm9vdC1teS1leHRlcm5hbC10cmVlCiDCoCAkIGNhdCBleHRlcm5hbC5tawog
wqAgLi4uCiDCoCBVRElTS1NfQ09ORl9PUFRTICs9ICItLWVuYWJsZS1maHMtbWVkaWEiCgpUaGlz
IHdvcmtzIGZvciBVRElTS1MuIElzIGl0IGEgbGVnYWwgc2ltcGxlIHdheSB0byBzZXQgcGFja2Fn
ZSB2YXJpYWJsZXMgCmZvciB0aGUgbWFpbmxpbmUgdHJlZSBpbiB0aGUgZXh0ZXJuYWwgdHJlZT8K
ClNvcnJ5IGZvciBteSBpZ25vcmFuY2UuCgpXb2xmZ2FuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
