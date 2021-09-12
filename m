Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7AEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 23:55:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3993C61056
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 23:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3993C61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0AAF4040D;
	Sun, 12 Sep 2021 23:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5uTbaYIPwkA; Sun, 12 Sep 2021 23:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D364040A;
	Sun, 12 Sep 2021 23:55:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4A9C1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 23:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0C62817AF
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 23:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oG_ES6ihq-9U for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 23:55:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49A8C8177C
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 23:55:36 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PZJumFFpknyXHPZJvmAjmz; Mon, 13 Sep 2021 01:55:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631490935; bh=hWCmGAXwUCZOo9jVpHpl1/umC8LaCxiW+2ET0NFd44I=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=JN2M+3mSP+jAhAvXS78c4i25IxJnUo8WX3IksikL5PYhFq2gr/vHyCsOMJrO2N/KV
 GapVYFWnWP6z4s1BECgNlHmpHQJ2ulbXfzg7H3SPn3UwUY47/wCHL6BWwtSuVAW9v2
 2R2+BXNZeBfqjcxQTPMU0GFXZ66l6WwW7Tut7A0Kp3NgpC5dCHlr1QNOsMRJOSgJj9
 ZFNArDhrcCn/9qVwYKEBH2lPTxiGrCB2GsY+4/uQ9emzuDN/HKsrqlK5yw81DCfWKh
 mGXe2RsKxxDzUAIVWR72mPoKHNDn3R98tSlcus880+Q7hm5WtbbMJpUY5J9REQaGCB
 KI+NenHH37SfA==
To: buildroot@buildroot.org
References: <20210912230856.1125573-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <9d2597c2-27c8-b4dc-44be-aac94bfb9d5f@benettiengineering.com>
Date: Mon, 13 Sep 2021 01:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912230856.1125573-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfP/P1VbrWDB0LPDEIXl6igYwUc4hZYkoEGz+LGeJ0hSa2pXuanxYYc/mGlqecgLkBGLRrjM+eHgy5xZd7B4F+LytNa3Q4cJoaoLGE5fNPuENWRgKiOqm
 KTwiWeOirEnsZ9nVXEu+bjY0EyBX3e7db5jxBuQnM/rkH4uJk43br0LkuCGfpbhq0gHaFCjpsnCx17p5k2YT7QWX+g04Er3bD1uiarBOH6uxBozOaISVMpbA
 XB7Nc6AUQMUGCqSN58DErQ==
Subject: Re: [Buildroot] [PATCH] package/trace-cmd: fix build for Sparc64
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Pierre Floury <pierre.floury@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 9/13/21 1:08 AM, Giulio Benetti wrote:
> Trace-cmd needs -fPIC for Sparc64 platform otherwise it fails on linking,
> so add -fPIC to CFLAGS when building for such platform.
> 

Fixes:
http://autobuild.buildroot.net/results/c59/c596f6308b7f4d44d9ba009ed0c395396fc72f47/

I've forgotten this ^^^, can you please add/reword it while applying 
patch? Otherwise let me know and I'll send a v2.

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/trace-cmd/trace-cmd.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index cd3fcb9755..bc431e5dd2 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -31,6 +31,11 @@ endif
>   # redefining it on the command line causes build problems.
>   TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
>   
> +# Sparc64 needs -fPIC
> +ifeq ($(BR2_sparc64),y)
> +TRACE_CMD_CFLAGS += -fPIC
> +endif
> +
>   # trace-cmd use CPPFLAGS to add some extra flags.
>   # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
>   # that causes build problems.
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
