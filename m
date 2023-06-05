Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C03C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C35381D9F;
	Mon,  5 Jun 2023 20:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C35381D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPdlIpgw45QZ; Mon,  5 Jun 2023 20:37:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C33A81B60;
	Mon,  5 Jun 2023 20:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C33A81B60
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53B6C1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AAD381B60
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AAD381B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFw3rZnzcJNg for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:37:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9F481A65
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B9F481A65
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:37:46 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F1C9E0006;
 Mon,  5 Jun 2023 20:37:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q6GxS-00DseJ-5J; Mon, 05 Jun 2023 22:37:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Knight <james.d.knight@live.com>
References: <SN4P221MB0682F08F5BA15071DDED63A7A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Date: Mon, 05 Jun 2023 22:37:42 +0200
In-Reply-To: <SN4P221MB0682F08F5BA15071DDED63A7A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 (James Knight's message of "Thu, 4 May 2023 23:43:17 -0400")
Message-ID: <875y8163xl.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-utils.mk: suppress kconfig
 set/disable operations
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Knight <james.d.knight@live.com> writes:

 > In a previous commit [1], the use of `KCONFIG_ENABLE_OPT` was tweaked in
 > a way which no longer generates a default output unless the quiet flag
 > is unset (`Q=`). The use of `KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT`
 > does not apply a quiet operation. In order to make all these kernel
 > configuration defines operate in a consistent way, adjusting both
 > `KCONFIG_SET_OPT` and `KCONFIG_DISABLE_OPT` to be default-quiet as well.

 > [1]: 66d2ff25bad813659ed4541b3f4c6c2a09455bd7

 > Signed-off-by: James Knight <james.d.knight@live.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
