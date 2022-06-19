Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D68414E5;
	Sun, 19 Jun 2022 13:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D68414E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V9nOjZii0WNz; Sun, 19 Jun 2022 13:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3474040997;
	Sun, 19 Jun 2022 13:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3474040997
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE2D51BF852
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B58C260B78
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58C260B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H099eVorDDx9 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:29:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B83F260B6E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B83F260B6E
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:29:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8CF7E240007;
 Sun, 19 Jun 2022 13:29:07 +0000 (UTC)
Message-ID: <47aba9d1-a8b5-b5bc-7729-c5d1105ea5fe@korsgaard.com>
Date: Sun, 19 Jun 2022 15:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220612084912.1874307-1-fontaine.fabrice@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220612084912.1874307-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/libabseil-cpp: update
 BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
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

On 12/06/2022 10.49, Fabrice Fontaine wrote:
> m68k is supported since version 20210324.0 and
> https://github.com/abseil/abseil-cpp/commit/f3697b4fedc2d8f2311eaaebed051f6a44182bb2
> 
> s390x is supported since at least version 20180600 and
> https://github.com/abseil/abseil-cpp/commit/a7e522daf1ec9cda69b356472f662142dd0c1215
> 
> sh is supported since version 20210324.0 and
> https://github.com/abseil/abseil-cpp/commit/a2d7f453c635e90b356017dd47049b89407c2d88
> 
> sparc and sparc64 are supported since version 20210324.0 and
> https://github.com/abseil/abseil-cpp/commit/3fcd00d7dddafe65ced638acca560105a414cba5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>   - Drop spurious space

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
