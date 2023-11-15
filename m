Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3712C47074
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 12:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FCD782865;
	Wed, 15 Nov 2023 12:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FCD782865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypd13i6sKuBP; Wed, 15 Nov 2023 12:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8D282893;
	Wed, 15 Nov 2023 12:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8D282893
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04E2F1BF85D
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 12:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D54CF4052C
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 12:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D54CF4052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L8OLxI3kz-n9 for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 12:13:57 +0000 (UTC)
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B76284176E
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 12:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76284176E
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 98049C37AF;
 Wed, 15 Nov 2023 13:13:53 +0100 (CET)
Message-ID: <7affda22-14f6-4bdd-be82-719476b9b993@grenoble.cnrs.fr>
Date: Wed, 15 Nov 2023 13:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
References: <20231115100222.29685-1-bstruempfel@ultratronik.de>
 <8950d51a-3b99-4aea-bd2f-473fd32d8f78@grenoble.cnrs.fr>
 <CAEktqcuLCaKbRZpPQDTRCK-3QYxA-s=mHcRyFW6Az7civD41Vw@mail.gmail.com>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAEktqcuLCaKbRZpPQDTRCK-3QYxA-s=mHcRyFW6Az7civD41Vw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1700050433;
 bh=MdLiuBkqM9wJJvoOkQVK//ImXayiyC5OuG2V2ByF1JQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i8Zk7Iq5nEuzUZKap2/E0wkLBV1UQPy9WyPYL/PTxbhUU86cD3jUKGt+tWIuo7hyd
 Igmlaq8/VS+0lX+toCBmvckqwMyLxx7YBO/bs0j4Xot3Im0ffv2TREPbF7pPQ51rUE
 defWW/1n12K0XeuhmVcCvdEW0/Zj6s1r06z9RpwF4TMsUfy6s4xKjiLDFkt1dTIx9o
 uEhMLKHdXS5Dstrt7YVPiIepfOUOT0QUjco1Owa56z1S135NlHHovjebufTQMOCqkO
 AY0IvTJjCyMedqKLyyCocxZghFfvgOO16JxP8GIljmWOHLtSgR6B4fu+Ggk+RGYXk2
 Ix9IAl9J3FnLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=i8Zk7Iq5
Subject: Re: [Buildroot] [PATCH 0/2] Adding support for gpiod v2.0 and higher
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
Cc: bstruempfel@ultratronik.de, vfazio@xes-inc.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWJvdXQgdGhlIG5hbWUgImxpYmdwaW9kMiIsIELDtnJnZSBTdHLDvG1wZmVsIHdyb3RlOgo+IERv
IHlvdSBoYXZlIGFuIGlkZWEgZm9yIGEgYmV0dGVyIG5hbWU/IE1heWJlIGxpYmdwaW9kdjIgaW4g
b3JkZXIgdG8KPiBtYWtlIGEgZGlzdGluY3Rpb24gdG8gdGhlIGRlYmlhbiBwYWNrYWdlPwoKT3Ig
ImxpYmdwaW9kLXYyIj8gVG8gYmUgaG9uZXN0LCBJIGRvbid0IGxpa2UgZWl0aGVyLiAibGliZ3Bp
b2QyIiBzZWVtcwp0aGUgbW9zdCBjb25zaXN0ZW50IHdpdGggY3VycmVudCBwcmFjdGljZS4gSSBm
ZWVsIGEgYml0IHNvcnJ5IGFzIEkganVzdAp3YW50ZWQgdG8gcG9pbnQgb3V0IGEgcG90ZW50aWFs
IGlzc3VlLCBhbmQgSSBoYXZlIG5vIHNvbHV0aW9uIHRvCnByb3Bvc2UuIDotKAoKUmVnYXJkcywK
CkVkZ2FyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
