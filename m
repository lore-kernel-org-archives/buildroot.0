Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5697C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 16:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617D6418FD;
	Wed, 11 Jan 2023 16:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 617D6418FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsVXDAj7w0ML; Wed, 11 Jan 2023 16:01:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF77418CE;
	Wed, 11 Jan 2023 16:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF77418CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16BC61BF3C0
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 16:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E59FD60E37
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 16:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E59FD60E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVsLq9xf4wEg for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 16:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C3660A9B
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7C3660A9B
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 16:01:28 +0000 (UTC)
Received: from [192.168.0.203] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MKKlN-1pTa1c2y5v-00LjOL; Wed, 11 Jan 2023 17:01:23 +0100
Message-ID: <2ac975d4-3451-ec20-9987-a56be5ea36e4@green-communications.fr>
Date: Wed, 11 Jan 2023 17:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220728014402.142320-1-james.hilliard1@gmail.com>
 <c01c67cd-b4ce-a054-2b6b-47fbfcbf513a@smile.fr>
Content-Language: fr
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <c01c67cd-b4ce-a054-2b6b-47fbfcbf513a@smile.fr>
X-Provags-ID: V03:K1:q2EZutLInnRMplE6FfkAKHcylH4KLFvaHxXfgdZ8ievdOJGgf16
 X4Os7HK07xXd4xX7n5NuERv645KrzmZ923EnmZRsfIrmNzYaQyTuwcq+6GO5v8WcCwSW/P9
 8mMfe+GKqwAWAxdL+JvC1azCvuPWFK4sO5OgrVMx3emTJQF534A31PaDKVsEHgWftzy7ciY
 FC5INpFPgBuvn4XHAlsBw==
UI-OutboundReport: notjunk:1;M01:P0:Cr+AF3OrXrs=;IGTlExNC6Vdjtl0Zp1Yt4p5CYub
 nJdLUgSYWqX8YMjGiJK7ZWHrWZK5qA8IuHywibhkkegTKoJ4q8lqTGOsEFVRpgT2Iv/IoBrjk
 VeTDkgUOF+H4STJBmlAVDeF405bOAtRLq/dEQ/6DFvxFXMEPh5cfqHn4CtauoCgoYBYNEW3ka
 x662eeZEKMbXv9I1nZ0l81CW/F9fiIlD/Fwd0OTSVLHc9qhz45H/Jj2qXydWN8p0OBrSsUMqu
 iZlmNxHVr1Vaiuc3uFIBfnWnBoOhOj2En1g1ZWog/APjbFfoKnSjnhc6RkEDwCbag5bo8eY05
 EOTlIyGw+z47tEQ6T3nwWCski5AM3sXE4Q1LyS183lUUKKDsTx1ANsxehi6sipb4mzVzG82em
 fY5Z8JCPK033fvM395IXhMse+2aHseE7fCjrl9xoeayby4+HrIqxr1m7IOA5CZOQFHNPkOcGz
 BN8b245TFoa95Ze2wUcgMR0GZl/65kXgtgGUVqK+2A3oK2ftIIzuaetjoIw4Er1nG0GBdwDKf
 7UiphfM+mt8SIH2Coy02mV9ucY6hKtg2f1Z7SbgDFyvMwCwZmC2PpTqmHVdFbXQgwXQvag6J5
 9Lq7y5eR5YXhkEEjoZAAsldmy+8/OcAhQGCQwzugfVz+bCKaESravuAKEcTKIMnqqla8fNQFf
 v286pMOoVTT3Hny6HuEUxcSle8Cb/K13/hZhnJfBpQ==
Subject: Re: [Buildroot] [PATCH 1/2] support/misc/toolchainfile.cmake.in:
 set PKG_CONFIG/CMAKE prefix paths
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTEvMDEvMjAyMyAxNjoxOSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhlbGxvIEphbWVzLAo+
IAo+IExlIDI4LzA3LzIwMjIgw6AgMDM6NDQsIEphbWVzIEhpbGxpYXJkIGEgw6ljcml0wqA6Cj4+
IFRoZXNlIGFwcGVhciB0byBub3QgYmUgZ2V0dGluZyBzZXQgY29ycmVjdGx5IGFuZCBhcmUgbmVl
ZGVkIHdoZW4gdXNpbmcKPj4gbWVzb24ncyByZWxvY2F0YWJsZSBwa2djb25maWcgZm9ybWF0Lgo+
IAo+IEhvdyB0aGlzIGNtYWtlIGZpbGUgKHRvb2xjaGFpbmZpbGUuY21ha2UuaW4pIGlzIHVzZWQg
YnkgYSBtZXNvbiBwYWNrYWdlID8KCkkgdW5kZXJzdGFuZCBpdCBhcyAiYSBjbWFrZSBwYWNrYWdl
IG5lZWRzIHRoaXMgdG8gdXNlIGEgcGtnY29uZmlnIGZpbGUgCmdlbmVyYXRlZCBieSBhIG1lc29u
IHBhY2thZ2Ugd2hlbiBtZXNvbiBpcyBjb25maWd1cmVkIHRvIGdlbmVyYXRlIApyZWxvY2F0YWJs
ZSBwa2djb25maWcgZmlsZXMiLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
