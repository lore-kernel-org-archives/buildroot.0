Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFF2C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 03:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27EB3401D8;
	Mon,  7 Nov 2022 03:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27EB3401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mIY-wLpP9Vf3; Mon,  7 Nov 2022 03:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E19A40142;
	Mon,  7 Nov 2022 03:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E19A40142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65D3A1BF863
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 03:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4100C60ADD
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 03:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4100C60ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HictB2Kc0Hfr for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 03:38:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6843260AC6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6843260AC6
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 03:38:51 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2195724E114;
 Mon,  7 Nov 2022 11:38:32 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 7 Nov
 2022 11:38:31 +0800
Received: from [192.168.155.152] (202.188.176.82) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 7 Nov
 2022 11:38:31 +0800
Message-ID: <00d4cf85-6b3f-8ab5-51dc-06d655d940c1@starfivetech.com>
Date: Mon, 7 Nov 2022 11:38:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From: <ende.tan@starfivetech.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, <buildroot@buildroot.org>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221106174500.11118-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20221106174500.11118-1-fontaine.fabrice@gmail.com>
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
Subject: Re: [Buildroot] [PATCH 1/1] package/libkcapi: fix uclibc build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thank you for the quick response/fix!

I have commented on your libkcapi upstream commit, have a check :-)
Let me again summarize my idea below:

On 07/11/2022 1:45 am, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> +-#ifdef __GLIBC__
> ++#if defined(__GLIBC__) && !defined(__UCLIBC__)
Shall we be more specific about the checking, i.e. use the following:
#if defined(__GLIBC__) && !(defined (__UCLIBC__) && __WORDSIZE == 32)

> + #else
> + 	msg.msg_iovlen = (int)iovlen;
I think to be safer, we can use
msg.msg_iovlen = kcapi_downcast_int(iovlen);
instead of relying of typecasting simply.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
