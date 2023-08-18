Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE21C05052
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 06:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D629F40347;
	Fri, 18 Aug 2023 06:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D629F40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpLagvEloxYU; Fri, 18 Aug 2023 06:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FAA340181;
	Fri, 18 Aug 2023 06:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FAA340181
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6AA11BF2B4
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 06:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9088F607FE
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 06:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9088F607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BibZOXzknl4j for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 06:18:44 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B969607F5
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 06:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B969607F5
X-Virus-Scanned: by amavisd-new using ClamAV (24)
Received: from [192.168.10.50] (ip-194.4.61.77.edial.pl [194.4.61.77])
 by server220076.nazwa.pl (Postfix) with ESMTP id 812D41BBE55;
 Fri, 18 Aug 2023 08:18:41 +0200 (CEST)
Message-ID: <c3f58981-f84e-9d02-922c-662f08a7db06@grinn-global.com>
Date: Fri, 18 Aug 2023 08:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230811093421.300794-1-b.bilas@grinn-global.com>
 <20230812125051.4b8b0b84@windsurf>
 <5cd4ca82-696e-037c-2a84-1de6f34cdc7f@grinn-global.com>
 <20230817122702.18d7760f@windsurf>
Content-Language: en-US
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <20230817122702.18d7760f@windsurf>
Subject: Re: [Buildroot] [PATCH] gdb: disable source-highlight
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

it seems you are right. I should have done tests using the docker 
instead of my arch OS. I'll try to send the patch today.

Best
Bartek
On 17.08.2023 12:27, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 14 Aug 2023 08:43:19 +0200
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> host-gdb compiles without any problems so there is no need to do that.
> It compiles fine on your machine, but it picks up a dependency that is
> not controlled by Buildroot, so it's a bad idea. Therefore,
> --disable-source-highlight should also be passed to host-gdb. If
> someone one days needs source highlight, then a host source highlight
> package should be added in Buildroot, and used as a dependency of
> host-gdb. Even though we do rely on a number of system-provided tools
> (native toolchain, basic utilities), we try to limit the scope of this
> dependency on system-provided tools/libraries.
>
> Best regards,
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
