Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD879C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34BA560AAC;
	Tue, 25 Apr 2023 17:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BA560AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4boyKNe4YOzE; Tue, 25 Apr 2023 17:12:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E2B61458;
	Tue, 25 Apr 2023 17:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E2B61458
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF8FD1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8228041175
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8228041175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4m3s0HQ62Qh for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:12:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7BD5400D8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7BD5400D8
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:12:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.164.136]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1poBK720pg-00VwVI; Tue, 25
 Apr 2023 19:12:31 +0200
Message-ID: <45d342b8-d098-11ad-07ee-5702205c10b7@gmx.at>
Date: Tue, 25 Apr 2023 19:12:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20230405200445.50475-1-dalang@gmx.at>
 <87mt2z8yyf.fsf@dell.be.48ers.dk>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <87mt2z8yyf.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:OV+F20yRE4gg4z/j48okz48D/obgWmu9YvZr0D3554wAuIBW5d9
 7ESl2UwGCFX22Q3FyUL1vhgr77yYp/Qk5KRKNq7Em6c0BPv2GsR8CN+5xiQVrjMv3MipIXg
 4JQ7lFrVMkrhPdGdLsYZO5sd76P4yszY0lgzuQk+LaqecZDBaWq+yxfN7XUeMXywVwHV4hM
 tkl3bZLKNrqIMXi5i3afw==
UI-OutboundReport: notjunk:1;M01:P0:kvheOEZlbSw=;9A52BFsucs+aEKTVhsrxwipLccQ
 Ixzj2VXvUP1Vm2Si/xfBxQgfKBLiT5fN+7NXLdkp1aEoSQDVSg1eKSm+pNH3TXzrBwytCed7k
 HLDKS7UhI733euLr/afwX8iwzEwqocYTU7y5SZup5SzD//7wSYkZrQ1RaiMwuhom1/eQQXVPm
 I5BeQunIo6laNMZa4wDYerNNUjmZ74uIm2H+bUSOHrHfKpLmS9+ll79qMnQLl43vl7+YWVdbc
 DN5vYxyttaRIC0BwW0N3E0d+M1Q9HMpna8EsCRo22mowbdpzOpbME4tLFuhykHAb2F7pyQSdc
 3TlEDxkfZL0DIDtI8dIAyD6H004OcVgL/MnWp/iMy9M+YO5Z96JhSHCmYGnyVrRDlETaePpZr
 Q5wZxuU5iCMmaLYQKPi/kj8J5qZAYV1lij1qRe+r4vTBOUOL9udldj0cL34IiFjNozgk+o8yH
 asvqmPBKfMDOYSLnx8H0yjQWbPSUgKMettN50QD1IFFXl2082OetWoQO3odsdVDoatX8zWfe2
 gc9TCAkzEqnSatkEZDPbImjALVEXD/HX/q6RnZW5ddwQLrko05JReYUryB0xlxOqoYndO7zNB
 n+L3G69/jE74HeEWCanuyqhvCEvKk01RN9pCBv2fwN6OZxE6Ciav9M3TDjBZdBsAaaTIccMoW
 vjTtvT9jBafkGm+YjSbrvVUAO/1KIngU6mP3/Ng7XP+u65bWdAL6pIoi3CSY6B0s1/SEWivql
 0cBOQ3WBz59RDqSo0WtDRBrkO7a78Pd1ZV7PEn9gQEQdu/NTHZU/0cLtlA17ztpcoR8b1SyYu
 9osmLKJW2vlrT4NDe+2EQMGbeWEzGAtBNnoPD9wK4SAnVwlSPj1I4qar3m8y9GxzUlJzdAPnY
 hFnmTWKeIIq7bs6ax9Gkxdr/5Rg8QLlu1O7W3Cid8dfYuWTjkobHdlnX+1bHzms20A2wgPlK6
 B5ev36/kv+5jKW1pqvv/wWqOzQ8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1682442751; i=dalang@gmx.at;
 bh=iijNdDoSrEh/HniLHs8f9NcoDq4mfoFNrnVIj4Un+bw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=q+ELEkBGQqOIzoWo4dg4PxAG+PuSykO82fvABK3OUn5WjN8k6c6wOHjN8NwCNXwg4
 U4IvfzkQ7c4MH11e6A0BcRlPeUvV3blC3e3x4eaeFzlYIlnZmLPYb03Xh8dcNJnj6a
 uyw7i1nB/DanlOsFAeNghder8fQUmhzWaWXFBYvQvX6FHUBPOphorY+AHDvDu0jNMM
 rIaEY9AbH0nu4s6PJUz9Zt5QzzeciXAG2Dc8PYvfAVtkA9b1COXfxBO6RhHxHNFm2c
 DjyRyGXa9V6qbuDQUl1LGDcKbyVhCoMqT+6YJqgw7w0fXcPRMBCIUx9v2oaVq1tArL
 qhFeZ+g8JS+xQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=q+ELEkBG
Subject: Re: [Buildroot] [PATCH] package/libmodbus: bump to version 3.1.10
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22.04.23 22:05, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Lang <dalang@gmx.at> writes:
>
>  > https://github.com/stephane/libmodbus/releases/tag/v3.1.10
>
> The regression fix this talks about is presumably about a regression
> introduced in 3.1.9, so not in Buildroot, correct?
>

Correct, regression was introduced in 3.1.9, which was never featured
in Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
