Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F918C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AD6840E23;
	Wed, 31 Jul 2024 19:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTxS09YdwC3f; Wed, 31 Jul 2024 19:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38DA340E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38DA340E40;
	Wed, 31 Jul 2024 19:52:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6900B1BF32B
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6012D818A2
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0bnjWDuJ3Ek for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 19:51:57 +0000 (UTC)
X-Greylist: delayed 17961 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 31 Jul 2024 19:51:57 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A24081350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A24081350
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::bc0d;
 helo=smtp-bc0d.mail.infomaniak.ch; envelope-from=philip-dylan@gleonec.bzh;
 receiver=<UNKNOWN> 
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::bc0d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A24081350
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 19:51:57 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WZ2mW3C0fzmC0;
 Wed, 31 Jul 2024 21:51:55 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WZ2mW0cp3zncs; Wed, 31 Jul 2024 21:51:55 +0200 (CEST)
Message-ID: <0a5c8a3c-36f7-4921-897d-2c01dacbd809@gleonec.bzh>
Date: Wed, 31 Jul 2024 21:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>
References: <20240731145504.365492-1-philip-dylan@gleonec.bzh>
 <20240731145504.365492-3-philip-dylan@gleonec.bzh>
 <CAOMZO5B4DLidx1KXvyNUd7mic-WB+WQTQHn-_A7hXTprcLWVjA@mail.gmail.com>
Content-Language: en-US
From: Philip-Dylan Gleonec <philip-dylan@gleonec.bzh>
In-Reply-To: <CAOMZO5B4DLidx1KXvyNUd7mic-WB+WQTQHn-_A7hXTprcLWVjA@mail.gmail.com>
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=gleonec.bzh
Subject: Re: [Buildroot] [PATCH 2/2] configs/mx6sx_udoo_neo_defconfig: add
 hashes
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

T24gMzEvMDcvMjAyNCAxOTowMSwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBPbiBXZWQsIEp1bCAz
MSwgMjAyNCBhdCAxMTo1NeKAr0FNIFBoaWxpcC1EeWxhbiBHbGVvbmVjCj4gPHBoaWxpcC1keWxh
bkBnbGVvbmVjLmJ6aD4gd3JvdGU6Cj4gCj4+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+PiArc2hh
MjU2ICA1YzNhM2MwM2MwNTViOGQ2MDFhNmQ3ZjgwZDE0NjVhZGE2YjgzYTEyMjk5ZjZhY2UyMDI3
YjQ3ZjBiYWZmNTM4ICBsaW51eC02LjYuNDAudGFyLnh6Cj4gCj4gNi42LjQwPyBUaGUgcHJldmlv
dXMgcGF0Y2ggdXBkYXRlcyB0byA2LjYuNDMgaW5zdGVhZC4KCllvdSdyZSByaWdodC4gSSBtZXNz
ZWQgdXAgYSByZWJhc2Ugd2hlbiBidW1waW5nIGZyb20gNi42LjQwIHRvIDYuNi40My4KSSdsbCBz
ZW5kIGEgbmV3IHBhdGNoc2V0IHRvIGZpeCB0aGlzLCBpbmNsdWRpbmcgdGhlIHdpZmkgZml4IGlm
IG5lZWRlZC4KClJlZ2FyZHMsClBoaWxpcC1EeWxhbiBHbGVvbmVjCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
