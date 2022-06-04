Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFC6C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 16:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384C784594;
	Sat,  4 Jun 2022 16:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDlOfh_iS6Bu; Sat,  4 Jun 2022 16:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670B984585;
	Sat,  4 Jun 2022 16:43:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F130F1BF3E9
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB951419C9
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z921l44AgY36 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 16:43:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.85.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3E12419B1
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 16:43:40 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se18.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>) id 1nxWsC-0006ne-GF
 for buildroot@buildroot.org; Sat, 04 Jun 2022 11:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:To:
 From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BopIjy7ihZXtml2yMehqjA9h3/5YXJCubvAmmlDP8YA=; b=OpaXUTWkSPDdyMpdaazPcdZi49
 L4yFSZfFTeyVF0UusVlwrKD6vF6Uz1p2uxfVJk2Oonr+mbt7/GyLll2GyASkCfUY3sbqk5zEWNckx
 ZG1Lb2craWBPnRPI7RmSLHde04GajK8+7XcifinTsmIDg0085IHbyFQMOOi1w38ETwFh62wClNxME
 T1cGtGMkfL9fTaPYT3badRY7sH4wFQABsngSL6mIVKZL39mbvksHMrIqIq42cSE9VnQ5Su773p75s
 rcQnBd0HY+b16AjaBFug/zo07gUYEqHyBqoFgY60qdt8IwwFzz80Q8XC0qf13HdVFgsaV24Z8RIff
 3IXsmFHw==;
Received: from [127.0.0.1] (port=40418 helo=es87.siteground.eu)
 by es87.siteground.eu with esmtpa (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>) id 1nxWsB-000JeQ-76
 for buildroot@buildroot.org; Sat, 04 Jun 2022 16:43:35 +0000
MIME-Version: 1.0
Date: Sat, 04 Jun 2022 19:43:35 +0300
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Message-ID: <cb76d24abec40b2e48d3d1dd2964b720@tpm.dev>
X-Sender: dimi@tpm.dev
Organization: TPM.dev
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.13)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+mNgtl/IyT9LJOuGIcC6JLPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ywC/vhtTzYpdTnrqUvf9dm2pzeffK1U8NMXSNhYBAxY+fH
 zJ6mVE7ewsipSVIfs4axxaA2tvfD6WfhiCoivnWuABHVTw1lV42ob3hDgXVUNXD7IaQbkgsYp7aG
 A7Op5WR1dru2ZdfjlI6+y7XYoXpY43tDNEwuZ1QbVvmaxo2AN65za/a7X4m5rsou9LQtfElQjp8B
 i5W7cj7L5uJzH2rS+gaXrHkgRC7/tI3CjXmVytBLHib4Z1/lgkFzmg23OSOO9Ve6nflu/7vBXzQs
 TjeUvrNSkbDOsykDjW5EhIQMrncw5fJ4eWrN15BUdwKK9QbBPeWxfLTyo52lpUOn40xHoOAmb0xg
 XrrQKITtclJwwjxIPj1UU4msT2Odp9D6f/Om/kpOWQV1ILff1+qZar/CZdONW7YGNNLfGcEBhKT6
 7nlWT90u1CRICtdpoR4wMq8nbPfkLuTB/Bk+c8I7g3gOnUghgAcG/Q/GitkIn+brrd9fxN2oReTD
 HAyOynaY0CkiXx6pFrrvtHXVsv8CdIHkZYtfZltBvdQkqKESagO7CIkKGeIAUDgE5VbflVRdgTHX
 zXmHaN80JC+nfH561Te/6BtpbmdpMLvM58ZB4GVvZfvg7iEFLP+SSY+Av5+AiC4uIBFXUcD6vkLu
 9EcBiX5mcSLBQLm3KIRXvsSTVPHu1Q7AJlXIU1rkUXgfz82sZjhkMjpjzIZ11Ivnpn1JnnXOC9XQ
 BqbN5JAifkz8YGj+aSz3XgtqLDENrnN+u7byfLqgZZAS9m5ZAKg1qGreZOdFo+OraU6vdH8hKZJ9
 cJjCZJ1hBUvSSq5Jd1K9M8mWGu+tOR+gJD/q/js/puGTk153k/YT1wCmN+TgQ8mRsWEWROz2U1El
 0AT2M0f9hMy113qEXu35BXgkcRnhMa+/GDHO4Bf+8xa5YS8FserIJ5tq6/Uf9oDBqtClgM5jH/om
 1Q4+OUQrieFQvBtW7y17/6O22WCfPTXTvUp0jTWpAU9lF5ysDGtPXWyWp+beo6l5Vzou//nzk76l
 ak4ojODbJHHE2yX8zWX9wslqZC5NzlNX8qsoecLZ032isHnFEFmW+q28u8WuA7qvySiMIHSm1Qmp
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] libcurl ignores default buildroot CA bundle
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

Hello Buildroot community,

I have a STM32MP1 target and my buildroot image has both the curl and 
ca-certificates package installed. However, curl fails to authenticate 
any https requests:


# curl https://google.com

curl: (77)  CA signer not available for verification


Do I need to do some extra buildroot configuration for libcurl to use 
the CA bundle in /etc/ssl/certs?

Thanks,

Dimi Tomov
--
Founder of TPM.dev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
