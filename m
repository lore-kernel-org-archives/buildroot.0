Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97834C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 17:49:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C08610E9
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 17:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21C08610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01E260B89;
	Wed, 25 Aug 2021 17:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adY8g4N8G35h; Wed, 25 Aug 2021 17:49:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6962D613AB;
	Wed, 25 Aug 2021 17:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDAA21BF5B3
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 17:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC562400DF
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 17:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZ1gFl_1_Z_d for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 17:49:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1811E406FD
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 17:49:10 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.5.109])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ix1OmW78cqG1wIx1Pmj2PW; Wed, 25 Aug 2021 19:49:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629913748; bh=6pYbiJcZo3jbMG2iHHRBi+eMw1w2hsb65nVWg8aIz00=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=YA5unKB7SU8V4R5/UTwqIm51lEbM4ZKXCPqk4RKs+d0JzEfpro/NlzOZLAOXgUgV2
 fGS094SRzGenfPVceNrlfwZ7zuPVErvtZMFWAzWSS/KKPLj7M57ee4qjqkuLVnyCeP
 1p62fxHWYsIzlHjU00ggI7vD+ket3+sP3eNTufWIqqA/JVmD6b0kM8iRpgMze0ynKI
 SAPGUcdWymxM16BhYyotShm1f617vEsgFo33wuq5fCckPZN/N23j9uGIwDKgGNZffX
 jq9CqoakbtGvgjn5QZ8fmgmlopK30k8xAJ78GoVYOowAaXZ62exmLaawTkLKn7e1CC
 ympGcXMxjEKvg==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Peter Korsgaard <peter@korsgaard.com>
References: <20210825070540.DEE6B80F0D@smtp1.osuosl.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <2209c90e-8f59-1270-fcc4-63b18a258c02@benettiengineering.com>
Date: Wed, 25 Aug 2021 19:49:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825070540.DEE6B80F0D@smtp1.osuosl.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHubt0+4OEzhppAMC2M4P9lWOGFXZUPzg5GrkxEe9dsJsUcrT6BM3KJoHXSILWk+i0rbPeGj0blcwxd0T6xRY0Dq0rH8pESBewKoQnO+7dJy5pxATybY
 s11DmTE3dUQM3qp7JCpd51vrJhCYY6RPbjH/wXfDvt43tesOyTC2dXjFtS1bJtjenDaJ/RnT4s21NxGKRnSpVwKe+zOM/blH5oe05VhOVeapQ8qcgbW0po60
 uYZj2TxnegOk5s75hvPkXzMXNDYKxNSQgjr7xMf6W0s=
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-24
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Peter,

On 8/25/21 9:05 AM, Thomas Petazzoni wrote:
> Classification of failures by reason for 2021.02.x
> --------------------------------------------------
> 
>                   dc3dd-7.2.641 | 2
>          host-sentry-cli-1.57.0 | 2
>                         mongodb | 2
>                 capnproto-0.8.0 | 1
>          glib-networking-2.66.0 | 1
>            libmodsecurity-3.0.5 | 1
> monkey-f54856ce250c4e257354... | 1
>                  rocksdb-6.13.3 | 1
>      trace-cmd-trace-cmd-v2.9.1 | 1
>                    zeromq-4.3.4 | 1
> 
> 
> Detail of failures for 2021.02.x
> --------------------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>    riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7ce6de318b74cf7ada93440cf5976c64d9030b37 |
>      arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/e6f5b4f59923ce93572bd1e67a64d15d908c69ab | ORPH
>      arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/35c514e5b4d68e9ed8b59511baa0f663e7398736 | ORPH
>    riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/50f7d1203236b229fe19c0e03e75271c59f2b60a | ORPH
>    powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/35d16ab2234deb5cd817cfbe5d929c8a4b611227 |
>     xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9d2a2498c0f6e55392f15fdef445f66860fb9740 |
>      m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results

This ^^^ is fixed by this:
https://git.buildroot.net/buildroot/commit/?id=2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
