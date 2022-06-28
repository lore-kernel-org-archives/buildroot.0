Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79A6C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 08:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A44E82B8C;
	Tue, 28 Jun 2022 08:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A44E82B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lElLx_fNIeof; Tue, 28 Jun 2022 08:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F91F82B3E;
	Tue, 28 Jun 2022 08:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F91F82B3E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1581BF84C
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 08:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 643B460B65
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 08:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 643B460B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JP6I9qgk5_zy for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 08:22:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F2360B51
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6F2360B51
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 08:22:44 +0000 (UTC)
Received: from [192.168.0.243] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MYNW8-1o9yJj2LD8-00VPNw; Tue, 28 Jun 2022 10:17:33 +0200
Message-ID: <0357b4f8-97da-6c44-134f-4b5b58b9259a@green-communications.fr>
Date: Tue, 28 Jun 2022 10:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: fr
To: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Andreas Ziegler <br015@umbiko.net>
References: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
 <f68f04d611f75d87d9fae2a0a04a3896@umbiko.net>
 <CA+_SqVbnBaZL6=DorHZTt-zjtGFHVXPz4kQjovQoJhFRjfW27A@mail.gmail.com>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <CA+_SqVbnBaZL6=DorHZTt-zjtGFHVXPz4kQjovQoJhFRjfW27A@mail.gmail.com>
X-Provags-ID: V03:K1:KS4uhLr9689GsUUIECNYnN4l7OluE+jiPIqnz2ZqrBos41Uoehy
 OZCW4SfyVSTwwgoMpkh2D23SWAQqEjeiXkAfYRi77CYeAhm4CoO+QR9J+SAqq21PrC1/ex/
 nkXANNJahT2uFsV+EmiFsp7EGZ5sC/mKNNbtZrF3ijl9TszNPB29R2qiBTvc96JPuZ8sQMM
 OixNrMjVsIcNZF0cynuSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TiqWmR+4Wh0=:c91U8PR4FLaEJG82G4vDqF
 WTSsmZuJG5snBuf8tVSIW4SGLp12iLm2efiK5IRQ0Tf7iFlVLE6hQ1iuEj4NSngvNuaHhHPxw
 9pge0nw9ll7sPIK2inK71TaWF6+5B2PnVG5yIrY75Rj0BHJef69BCGuumdZy6oJudXifQNzby
 kyldZEOxfnBZ+2hcmmSW5lvU1QNXi1LrJYZfNkOFy9yN9NIzGBXS64Q2d8XaG64xiHksBCJNH
 ueThU5iqolMiM8CaAaaSduwMHgPClXwUwH4R13doWhfkONo5Gr145UdERzvTIO8dDdRtecOBy
 N7ClbXCvP9YllPQyO1SsGV4iugYb8DyQ0RByb7g0zaD8hEOc/vr7SS+sCjWNnD65KZbv/lXyo
 FhvzcDe08dbGwxaPAzdNFa63LNv4j5XLrWw+FbKZd81irjVJ06tswBgJWui1lNyRq0c8KtXK5
 qTp5Cryuwlnbjkqz9ZCIY0X+2fn4qNyNzpZfeWc5zEq48Ei58wO8J5+WFRpVLweNrhRsVZAET
 vyg3T9CNmpzu8QURMoGtIXQ4UuYnsO5TgdaqhuWyOvzsi0pPzRtnoyaH7Pe5lAEac2IqjQlZu
 gd5uZE0ksvoLekYp/d7Ch1o326fmdzlZXXQlTrnchMeeba3R5Q+E2G1r22NjZUXtDrf6r6SBb
 PzOaNgQuQkZifUhzcH2M2zgY3JTS1s1x5tDjgG0DIiOO9Ca8klJhCF767yNtQ9fORFTKKHftH
 kW1+cMy/E3k8b9Rm9W/s/MR/p7Vvwk5uBe5v5T1bMk+ijksXytSKMhJ/UurIhvHfbPvzQZmAN
 KpvnWVo
Subject: Re: [Buildroot] [PATCH 4/4] package/busybox: add service to load
 kernel modules at boot
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjgvMDYvMjAyMiAwOTo1NiwgQW5nZWxvIENvbXBhZ251Y2NpIHdyb3RlOgo+ICAgICAgPj4g
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9idXN5Ym94L1MwMm1vZHVsZXMKPiAgICAgYi9wYWNrYWdl
L2J1c3lib3gvUzAybW9kdWxlcwo+IAo+ICAgICBTMDIgaXMgYSBiaXQgZWFybHksIFttdV1kZXYg
dXNlIFMxMC4KPiAKPiAKPiBDYW4geW91IHBvaW50IG1lIHRvIHRoZXNlwqAgW211XWRldiBzY3Jp
cHRzPwoKcGFja2FnZS9ldWRldi9TMTB1ZGV2IGFuZCBwYWNrYWdlL2J1c3lib3gvUzEwbWRldgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
