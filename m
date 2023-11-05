Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C9FC4167D
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E892541919;
	Sun,  5 Nov 2023 14:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E892541919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKIEPaBHfLZR; Sun,  5 Nov 2023 14:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E7441915;
	Sun,  5 Nov 2023 14:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E7441915
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 702E01BF342
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4936360FF9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 14:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4936360FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82tDL-kt9yDE for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 14:27:15 +0000 (UTC)
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FCCE60FD0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 14:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FCCE60FD0
Received: from [192.168.50.162] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ze5oq3HfydNYOze5oqIiFs; Sun, 05 Nov 2023 15:27:12 +0100
Message-ID: <579363d0-a242-444a-aecf-83f21b4e629b@benettiengineering.com>
Date: Sun, 5 Nov 2023 15:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231031120713.678783-1-giulio.benetti@benettiengineering.com>
 <20231101152114.GE114892@scaer>
 <26fabf07-fc17-421b-9cbb-fb721bf63374@benettiengineering.com>
 <20231103212151.GA2875@scaer>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231103212151.GA2875@scaer>
X-CMAE-Envelope: MS4xfCHYe4S4ByHeZjrOWosk62HvSSZP8ioZHVzf6Fvh0gyeP+T6dusOveQPbYO4z1f3VrbExH/bYV61azy4XQIqehmljttm37Z16W0oZZpaY6o3l6VtfDAm
 dv62h8OJ8Sf/J+FHupYAknXpCpA8Ysh51RtE313T6w1PHpRDMfyxiJqkP+nLPdSbzxNDKc+w+S4DoOF4O8H6NLPH5iFXh/2hHt1w/gjbLIc+42C6D+w573uL
 2B57tuz7nKaZMbC72s5dgTRsrXrrpAseMs9RvQZl6HQGffFlGiYTDWvRMthKcFPATy+R8LgPz0Tz8cjsJ8l+EmeY2wBEKtab8kQLvZd5z9jRaV0EdvBR/5Pp
 J7EGjILu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699194432; bh=R5Cit/KLLmfNjQ96jxPCAMCb5R6o1zMQ2gYgjuDMI8s=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=df76VfHWURl0Xuuif9ehDSPwHhF1qibkcgD8cIih7+uyzFwgUenoAnLYhPIcm/s0b
 4XJGel2aZMoRrIWnvfgaSybow6DlU4qVgaY5VumFGYTA0WqIGMrpUn1qksggrIcuC8
 kVv5kalnjDc7VGxaOF7k8pV8+HI//nFwUpqpkPzAhuwyN3kr+qHlZdVPHU2dvFCRFM
 EZKeQjfsb5nDwT5KVNcudFM41fxuM1qStEYL0wTeySYT+1SiAstC7J6WYgZM2RAh1a
 OvtFe45aMGBwO3gqJK6vmqqYLCvqPva7/1TRP4ine4bJ6HwSYpwcQ2ZqfOYlHJU0kY
 MUlUyy2f3WMiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=df76VfHW
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: remove .node
 files with different architecture
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, All,

On 03/11/23 22:21, Yann E. MORIN wrote:

[ SNIP ]

> 
> Oh, I was just walking the "npm is a mess anyway, just ignore anything
> from it, we don't care" road. If we take this stance, then
> _BIN_ARCH_EXCLUDE is a trivial way to avoid the check-bin-arch issue.
> 
> And I am fine if this is the outcome of your investigations.
> 

Since npm rebuilding is not that easy and fast to deal with I've just 
sent this patch to temporary exclude the /usr/lib/node_modules folder
as you've suggested(forgotten to add "Suggested-by: Yann E. MORIN 
<yann.morin.1998@free.fr>").

Later I hope to find time to deal with npm rebuilding.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
