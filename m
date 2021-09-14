Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B6AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 11:05:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7A7660F23
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 11:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7A7660F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA9D40344;
	Tue, 14 Sep 2021 11:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4eJKQ-QhJwWM; Tue, 14 Sep 2021 11:05:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A25E04033D;
	Tue, 14 Sep 2021 11:05:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBC211BF5AA
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 11:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E26204033D
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 11:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2SFEihJw3zR for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 11:05:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F2DC402DB
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 11:05:31 +0000 (UTC)
Received: from [192.168.0.175] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MjSwu-1nAknd48qI-00kxBG; Tue, 14 Sep 2021 13:05:28 +0200
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20210914094611.1782735-1-jose.pekkarinen@unikie.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <d73d972b-aa6b-fdce-ca2b-2c2f2a68b53f@green-communications.fr>
Date: Tue, 14 Sep 2021 13:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210914094611.1782735-1-jose.pekkarinen@unikie.com>
Content-Language: en-US
X-Provags-ID: V03:K1:XujzrdZm3Yb8DS5LU68Ly48+M0obFTZOtqfyoiOv1rrIXEu5rdb
 rz6mq/EnSfPmAwa0vAyD+05WqXmBym4h7BjUgJhKIx2OzSFhIwSkGZN74dpr6xARCShFbOi
 Uk9S/NiBX60Ldru0ui4SwKNjLxJnujDYHc+riMsU/sh07MxL49xCIkg1TG4pk67wnn3BvUm
 PKLXJQx67UWtwszbGy/eA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4UNEXUu7w1g=:HJVuKIfe2YrZJuMrJViMrz
 qsefabyQfd5WbkgljHq7QECZYw2lMULB3HcbwJaWaVzUvUYss/HWZHM4NvlJE6Y1o6dPFBImm
 x2ZYJwIUPitcAenVYHKM47rsECGWQ9DF2pmmgt6yQDRqBHUqchn0CNyqsK6SFmR1ZcALy1UNQ
 KfcE7oQa+TIzTup9GORO33+fdk3VP6Tsotf5F6+HX1fHWOx7g5wOtIoGE3+nf8qYBPkYmPs7V
 0hZzP6hLHv0s/LExHtHTlr7B3/pe4gBsw7t7Jgczd2Lky8nkN86Nxp6RcTC17CtVOL70LUuhk
 xvctOlSXBIfqFOPu/hLfHOUK+CQiIuY8Fx19WrQUJdRKK7hG5RsgaaryauqCnf7UAOt5p/fFZ
 SjpavDnx+YIu2Zyo37AERL9gD/mq3hNTxvLu/4DQh/yb45EPLzyaqKV/ZVsAXYItaG38CAC9B
 /nZsrAjsAwL96YUG+OSVs7d2FkH0p26jE6/iMYbnJ96zr04GN8rR/IwIM1hipc8oQNEb1WF+9
 7wEtU8xprKurCowwdeW+uQTpjUm7qHHM8CA9z2JcZ1vlFkMDueSRGzmWFCWzNMxMxvxNqm8i8
 Zc2m4P02CNkAZ7dbjpVPun1nxQAhI134QZ8vmJ5uBG+bnz+4P0KzU2MgKDfVb3QGXwlrWEqE5
 DYKMl9OGkBc57ti5kZs+N4wFE/vHIKf4dUP0VYAWDItwts3mwYKTRW+PuvgV8pVB5dfCyT3l+
 8IFoc6JCqBPF+1o2ziTe+383goO4iisMY7bmspVqei2SQBS8IqgOt/CLCofABoTTlitEd1Bh9
 OFJHqaO
Subject: Re: [Buildroot] [PATCH] package/iptables: add init script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

T24gMTQvMDkvMjAyMSAxMTo0NiwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiBUaGlzIHBhdGNo
IHdpbGwgYWRkIGFuIGluaXQgc2NyaXB0IHRoYXQgYWxsb3dzCj4gdG8gc2V0IGEgcnVsZXNldCBp
biAvZXRjL2lwdGFibGVzLmNvbmYgdG8gYmUgbG9hZGVkCj4gb24gYm9vdCwgb3IgZmx1c2hlZCBv
biBzdG9wLCBhcyB3ZWxsIGFzIGEgc2F2aW5nCj4gY29tbWFuZCB0byBnZW5lcmF0ZSBhIG5ldyBm
aWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5l
bkB1bmlraWUuY29tPgo+IC0tLQo+ICAgcGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcyB8IDU4
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgcGFja2FnZS9pcHRhYmxl
cy9pcHRhYmxlcy5tayB8ICA2ICsrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9u
cygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaXB0YWJsZXMvUzQxaXB0YWJsZXMK
PiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pcHRhYmxlcy9TNDFpcHRhYmxlcyBiL3BhY2thZ2Uv
aXB0YWJsZXMvUzQxaXB0YWJsZXMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjkzOTk4Yjc4ZGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9pcHRhYmxl
cy9TNDFpcHRhYmxlcwoKUmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBtYWludGFpbmVycyB3YW50
IHRoaXMgaW4gYnVpbGRyb290IG9yIG5vdCwgaXQgCmRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gc3Rh
cnQgdGhpcyBhZnRlciBTNDBuZXR3b3JrOwpJZGVhbGx5LCB0aGUgZmlyZXdhbGwgc2hvdWxkIGJl
IGVuYWJsZWQgYmVmb3JlIGV2ZW4gZW5hYmxpbmcgYW55IG5ldHdvcmsgCmludGVyZmFjZS4KCkl0
IGlzIGV2ZW4gZGViYXRhYmxlIGlmIHRoZSBmaXJld2FsbCBzaG91bGQgYmUgZGlzYWJsZWQgd2hl
biBzaHV0dGluZyAKZG93biwgb3IganVzdCBsZWZ0IGVuYWJsZWQuCgooYWxzbywgaXB0YWJsZXMg
aXMgZGVwcmVjYXRlZCBpbiBmYXZvciBvZiBuZnRhYmxlcykKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
