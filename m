Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A6EC02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FEC480874;
	Mon, 13 Jan 2025 21:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNFa0w4Y-HJF; Mon, 13 Jan 2025 21:42:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F7780DF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F7780DF4;
	Mon, 13 Jan 2025 21:42:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E634AF8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EFB0607CF
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1LFGPyzeOk9 for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:42:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4FD9607C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4FD9607C5
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4FD9607C5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:42:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1tBeAN2GZ9-00ZWtF; Mon, 13
 Jan 2025 22:42:00 +0100
Message-ID: <f38083f3-dc23-47a5-92b4-41625623f955@gmx.de>
Date: Mon, 13 Jan 2025 22:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-5-fiona.klute@gmx.de>
 <20250113213115.6e74bfb4@windsurf>
 <932425e2-f575-44e2-965c-5131e1afc9b8@gmx.de>
 <20250113222319.4f0194fc@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250113222319.4f0194fc@windsurf>
X-Provags-ID: V03:K1:OUtvbprfUrzBkQboDkBJbv/SKrQd829CQzHXjDpZsNX3+wlqNEH
 tEWwTubkIJW3698jlWYfyaXTCwSJQVyyL2sk5AS4P59bQYqxv8GavppfQZhlYI5TmFVvaRT
 UulBBzChEyqQ/YcB2jwHjOJldTIMX+Nh6Dkl0EJgHxPPYW/w1LDd1BN98ZVprh00lOGVhYe
 gHAHf8NANKkdB4p/6S0jQ==
UI-OutboundReport: notjunk:1;M01:P0:KYPQZlaJWKQ=;4Yq967wTn3Sght3aH6g5WtNfEfR
 1mAVfVMA4SjcanT1hmwCRruE94OPcKZ0U90kXeMw8QhPnjRCW6hV8N4Ag3/R7wx/GdBN2XSA6
 d15XBBbsnp4XJR4u7xDn+Qcq/hOeP3mVj8GUMjPW718kthgVyf8y+tx0139uwVOHgY8vMwWzc
 WHbFHeYgJU1fzhCNWSAYRwU2LTK+O/3sTWrwybUGR5jb588ZZXpeGr/sEhwflOw3QPb2O5Tr9
 1mePmoatvY0ZIvcnk3RNJPqagPstcPln69P0Iot4ZKh8snMW5PvwsOTcKeIxvncSVsSlfkNti
 pIGnjcJr81vwOQ0TP7nkq6//JmXwFgdygqcPviw/TMSgh6wSBOLa4PNSL4/qvCggwQd5xI3LE
 wDFF2+A3hqj4F/RYpgrzbx21cS2SLfhBCJ8TwRiSQMEN9fN+vHBb82izkGcu2207Q4q5LGzwi
 LetoTCi9OetbFW8qmBQM/nf8KIbNWV8+tm0jtVKBa+MLfy+bex45VXJUEsYW8w+V2SoqBAzPn
 q4iESaoci0XnEnT+qgicd/db/hMpTzkGwdMY2j5K3iTaAYPk27bTwbQ4I8S7dfJ9eSj/ud1HJ
 bkOkK9DfO1VGy921mzMoSxzRWUdOckNTLmQLqMRKp9HaYVXMzbEpQD5YH1Ptm0tPs+CWlzK8D
 zl/OF/hBTNRisb4Vc2lBRwkfs1zqZiz2SjZWnnbNX901JktQB4SwVnSzyRB1tDEbhFZkP/8/5
 vWXMjp350jkfT/60qztDIjm6xuD11R/RAN7EkesockQJMU2rtjur8pDIGCiB9oaQtWjEgEStO
 mGFhM9DdryDYJBkfH0fbb9+hFVrGS1S3SOV/bxzxX6j8QmnwkykmnZ09c6hbOrr3YY5dwZ4sd
 SJL9vjN1GKfiNeQpCzdXNGVRfGyEoEWCTLgs81DCi8TAfW22hx/MWa7R8oqpEr/LKTuQwxt8B
 a7kwD0Srg+g0fTMLgaaWK6X1KJW3fMlxAsqfY0a8YhFWhYGr5VAMVlQOFMk3mHVnXMhO2bcI3
 EBuVescjQKcC7Udgm+FViORQE8TSqJS6oOZEYIPK8jQSj3bn5/HySjy/41okoChRtQbcaQn4T
 bPGIvkBRC49kEYxU9kD4235q1SNydD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736804520; x=1737409320; i=fiona.klute@gmx.de;
 bh=tabiCwmTY0yjEqiAY9Vrx4eFVCzihBF9yTtla2wF11s=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=QEo3XAM0Tr/D58b5j+Y9Nlo4aRkFGwSsbuQVLExV87DyfHWwRSeGWyuSyR6QN6up
 h3LfdL8VPUj0bnPjsbdpebekruU95aUspoTqBypDS0DR/CXPLozvBMnJNYPdnYZYz
 VmG761zspdBKa15mlsesjxlWDKio91lMKzNshfN/tyVXSLqraB4P+j/615+JbdtT5
 Nz2+TgXW1TB3eSIU44jxMGthKWUlEGjD+qqBLjp3Ndgs9w7WxquYAH968GuzvHp5g
 X9ZdCvaQ6NnmI1ZQZ1Ct6HGeIzU9rnsqXF/YTkN8+LmzzVSnubwDTrw9RXCQ1LENO
 ajVQnxoG+FChg5Ne0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QEo3XAM0
Subject: Re: [Buildroot] [PATCH v7 4/5] package/network-manager: optional
 gobject-introspection
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.01.25 um 22:23 schrieb Thomas Petazzoni:
> On Mon, 13 Jan 2025 22:02:59 +0100
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>>> 	package/network-manager: add optional dependency on gobject-introspection
>> That would be incorrect: What the patch does is enable GOI support in NM
>> *if* the GOI package is enabled, when before it was disabled
>> unconditionally.
>
> That's exactly what we call an optional dependency: a dependency that
> gets used if available, otherwise not.
I understand "optional" as something that can be explicitly
enabled/disabled in the config, not as something that's chosen
automatically based on other items. But if that phrasing will get it
merged I'm okay with it.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
