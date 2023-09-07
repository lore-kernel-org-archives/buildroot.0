Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758D9EE14D6
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 08:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C547581638;
	Thu,  7 Sep 2023 08:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C547581638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeZKJvPqLIia; Thu,  7 Sep 2023 08:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E4F781467;
	Thu,  7 Sep 2023 08:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E4F781467
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D9901BF2E3
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9BE7408F0
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 08:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9BE7408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljHJ0ZTn2iXa for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 08:54:11 +0000 (UTC)
X-Greylist: delayed 319 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 07 Sep 2023 08:54:10 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AF3408DE
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88AF3408DE
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 08:54:10 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4hex-1pfuWZ0Gm7-011nDv; Thu, 07 Sep 2023 10:48:44 +0200
Message-ID: <8a69122f-e606-e34c-d436-b18c7bd1b178@vivier.eu>
Date: Thu, 7 Sep 2023 10:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: fr
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20230906194609.74080-1-arbab@linux.ibm.com>
 <20230906194609.74080-2-arbab@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230906194609.74080-2-arbab@linux.ibm.com>
X-Provags-ID: V03:K1:KMFLRDW/hdmC9oB8c7KTNeDrqRZbHlrGjT3Ae57blaXYGxzPhAs
 +PUs8d2dLXqxChtHZEA3kg22viCyEN03Hb9NF7m2sLpN6cI6gvGqHa7mvEojo6+7z3nzNM6
 /ErC72LAi0YT58bDjhF49k8KypoAIRzFTVBbC/dPFk1OONC7KI5jA7OVeBuXuNzQAjhVdt1
 uV8k7IabL5U0XFEf10qkw==
UI-OutboundReport: notjunk:1;M01:P0:xtg4t0hdLeY=;kgjyH7mCoCxG6Mm5AVU50YFAxN2
 6hElQ8FgUGyCPPNecXQsiel60Kp0/iIzr8HYzZHXhc5jwEL51oLcdCLWUCAbQrJGNhK6j+Ak8
 V+Yc1tuHhmEspcbtQpVh0C4ltYJt/lp67o+73u9IzbNpgFiRaofFVzCsbuDL5WQKEg/wBMN+e
 ZMVrh3kYntsHpM2Hn5zuzJsYgDG2CBT/FKKL6G4eLq59thBSa3Rl2lbud0qTv1OKyr78/iVK+
 5jNVZw+RiW7Rv3vRs6p2ddnBY+LLQJkw07UfxUGrvGSgHcia+IeLA3f/T58HIyDUfK2+X1Zd2
 h/AfS36vFb5FlYGe7J4PvyGZCdc9mImM1rkol6g+68D2XNHYxZNCAoGaS2zweju/YeJX9Yk+c
 fjkpuS5vAojQ2ZfevUsQfZ8riyYpjWhndnIF6czGMqrRjwC0NyOaFEj68FehYb/AZnXu6wBYY
 cdONWdp1dxlzow1JwFi3ceUHY3nuZIByXxutOsNThiRFCmT7IvDT+q5dpMwpC3Q/PqdQ2/6+i
 DIPbm5VQE20sca2saRJNNDLsfgqp+z2gwHjHhN1BXDZOO4Tm0Ic0/4dSXvRD4s2yVTJrQDuv0
 PRSyD4jq57iAUW/AjaS5QbDAGxz8d0LEAMbVub2nNfOhvrrEYrq2WvQipdEIJcreMw+TO7GN5
 omOopYEIaCZwruCJlZeI966xHzkSTSZY5uekv1haWasEnfkvyZMKDCim4dFgEawMU8YCn9VvY
 CLKnFbu8er8HW2Tk5HP0uz3k63/aTIqmm0wgI0wzNYSIhSBd2ROveaazd/9t7cRvn/LQvrqTw
 zaUj+L+Av28Bco0hvK+euq5LA2P576pmjb+10CgGNmT6g2eoQrSg90jpPnxjAZK99SVMISSn/
 D1ZiC8E7evIataQ==
Subject: Re: [Buildroot] [PATCH 1/5] package/petitboot: fix
 HOST_PROG_SHUTDOWN value
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
Cc: Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDkvMjAyMyDDoCAyMTo0NiwgUmV6YSBBcmJhYiBhIMOpY3JpdMKgOgo+IEhPU1RfUFJP
R19TSFVURE9XTiBjdXJyZW50bHkgcmVmZXJlbmNlcyBhIGZpbGUgdGhhdCBkb2Vzbid0IGV4aXN0
LiBGaXgKPiBieSBzZXR0aW5nIGl0IHRvIC91c3IvbGliZXhlYy9wZXRpdGJvb3QvYmIta2V4ZWMt
cmVib290LCB3aGljaCB0aGlzCj4gcGFja2FnZSBhbHJlYWR5IGluc3RhbGxzIGJ1dCBkb2Vzbid0
IHVzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSZXphIEFyYmFiIDxhcmJhYkBsaW51eC5pYm0uY29t
Pgo+IC0tLQo+ICAgcGFja2FnZS9wZXRpdGJvb3QvcGV0aXRib290Lm1rIHwgMiArLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tayBiL3BhY2thZ2UvcGV0aXRib290L3Bl
dGl0Ym9vdC5tawo+IGluZGV4IDhiNGMxNDIwN2VjNC4uOGQyMjBmODhmNDVhIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcGV0aXRib290L3BldGl0Ym9vdC5tawo+ICsrKyBiL3BhY2thZ2UvcGV0aXRi
b290L3BldGl0Ym9vdC5tawo+IEBAIC0yMSw3ICsyMSw3IEBAIFBFVElUQk9PVF9DT05GX09QVFMg
PSBcCj4gICAJLS13aXRob3V0LXR3aW4teDExIFwKPiAgIAkkKGlmICQoQlIyX1BBQ0tBR0VfQlVT
WUJPWCksLS1lbmFibGUtYnVzeWJveCwtLWRpc2FibGUtYnVzeWJveCkgXAo+ICAgCUhPU1RfUFJP
R19LRVhFQz0vdXNyL3NiaW4va2V4ZWMgXAo+IC0JSE9TVF9QUk9HX1NIVVRET1dOPS91c3Ivc2Jp
bi9rZXhlYy1yZXN0YXJ0Cj4gKwlIT1NUX1BST0dfU0hVVERPV049L3Vzci9saWJleGVjL3BldGl0
Ym9vdC9iYi1rZXhlYy1yZWJvb3QKPiAgIAo+ICAgIyBIUEEgYW5kIEJ1c3lib3ggdGZ0cCBhcmUg
c3VwcG9ydGVkLiBIUEEgdGZ0cCBpcyBwYXJ0IG9mIEJ1aWxkcm9vdCdzIHRmdHBkCj4gICAjIHBh
Y2thZ2UuCgpSZXZpZXdlZC1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJldEB2aXZpZXIuZXU+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
