Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4619DC3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 10:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA931605CE;
	Mon,  8 Jul 2024 10:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIfqSh9D8aHx; Mon,  8 Jul 2024 10:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB5CF60707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB5CF60707;
	Mon,  8 Jul 2024 10:38:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 776CE1BF470
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7045B403A8
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCb70rQiIlik for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 10:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=hw234@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FD1240265
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD1240265
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FD1240265
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 10:38:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.3.5] ([85.235.69.60]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McY8d-1rq4Qo3mer-00oUfZ for
 <buildroot@buildroot.org>; Mon, 08 Jul 2024 12:38:11 +0200
Message-ID: <21792856-4631-4b18-9dbc-9f161dd9c4a1@gmx.de>
Date: Mon, 8 Jul 2024 12:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Mailing List <buildroot@buildroot.org>
Content-Language: de-DE
X-Provags-ID: V03:K1:91hSHx5Civk4zAZNLYlO59GNPtS9CFphc6HSW7NdF97USVrR+Ec
 SVeg2xp/iB54zomFy7EURpo/sjEe0He2suigjzgRsVQyNQXnJhKqY6Ml88tC8/SpiqwPMfJ
 mOTZCt8D0SiATTnbOreI44gpR0TXUscoFvNZ58UbOoemgXRT8IWrQ4PatvZDkba5Rx4MM40
 XfD0YHxIZABk0YuS8v2wg==
UI-OutboundReport: notjunk:1;M01:P0:1/6buq8Bx8U=;MaeG2irVZ8nFuib0C9nbbaq2XiT
 F4lcLHsyysGyj2xNAqFfqx2BFIh1fuwBqtAC3LWMCVdaR6JNae0+Pg1wnsDLtF0yUbGYdGt1L
 h+Op9SP546qmSNws78hRJtlMpLUzycx2UXJ38g+9pV2LwQ/22YGEFpbqdxl/cc36KKktcwMKC
 S0xaYymKjhwMJ+qLhQ43mM+hStbTp++b7/ySyvHKsVyEhSjOSMsqRXxrG3dqgSZ24JC3XRVOw
 rAQYKx+h4IWy5/DZCDuECxV7IeZ8Q9nrCG7cPVUKLcAiJKXbNLDCEvmUnAXn8WtyP89BKrnqa
 FzqeKAyLNjgU6QZwhk1kCuR6ylrNl3tBI7m4BqWFDqlEqK6FncuHkHIm/q8hKHKJ02oEjl5jx
 mibpLARdyYaEfLfuTkGI3Q16/kgs0GLe9oqUqRj77eniRt5dQ2dWW9a7HZhy8WyH5A2Xh9AFI
 bZQbbVLDG8KY/5s1DrGm4a7f1voPnAskzHliYGWgut9fZEYpt2MT0ZTSRFclV2fna32b+ESS3
 J6NWoAgBFfJ1Lh6GSGMiknhhATM+ENqHKTexrbiIit+FHKfDDGbsHIsOJwQC3d1SQwc/HtJZX
 5KkWH6K7WXpKggRS0tw5XopA1SvSZvdAhGqTr/4p4NBZJDEoUe3ctASt2t/DMtaljmlxfw8+b
 ei+VJaQMTXXOXi0qo/Lo2pGUE5QCQfFe/Tm+qkmEk82/tzU41My1KtCG+XJ6DNwBup3ztXuQu
 wNU9qujVaprbCJm8RU9aVvntQPDKnquYuSv5vwv68uVlL2HWoD59xIEMNHoNpdUCcl4Ff6xKz
 eSGrnsLrRVc1eK5y4VA1TdWWmfu7lFiv6dHrg2POEBIEo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720435092; x=1721039892; i=hw234@gmx.de;
 bh=F4FrlhiQPItbHFTNMmkg80l0wkEUZLLdtpHEg+0hIJQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JYy3c+Qj1rHbsDY2CuDW1MY0h/eQjogMCQ/nYScF04wwi3kCDzTa0C8HHucMgiQe
 irBoanP5Hs4fLz88bP7Yh1NHZUPdmMx7/bBVv2UjdZz8MRjjx+q3T4oQ8JxDWL7uy
 xx/bRnl6jBMjbQPINvmdOIQgHQBqRjc7ueO+4ieU0OjDJWI9GM+W94PZK3VakQ7zB
 Jp8YjXu2S5teX8DnXjADIquE7x/Fxm8ZmXoPJFjpQFL9zwIcMuBi6vyxnTbc6AUwT
 qD8v3YeaqVt+080oCHIE/dLM7qf0LA82WfB83RNK8jiIDpfT+LEGkjgqY0F0P/Q8s
 2l1l42i5ibL1qhnIPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=hw234@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JYy3c+Qj
Subject: [Buildroot] Dropbear trying to write to /var/log/wtmp
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
From: Harvey via buildroot <buildroot@buildroot.org>
Reply-To: Harvey <hw234@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

although in our .config we state
# BR2_PACKAGE_DROPBEAR_WTMP is not set

dropbear tries to write to /var/log/wtmp

resulting in the following syslog entries:

authpriv.warn dropbear[27939]: wtmpx_write: problem opening
/var/log/wtmp: No such file or directory

Is this a bug in dropbear?

Greetings
Harvey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
