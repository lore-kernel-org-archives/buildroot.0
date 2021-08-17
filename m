Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77958C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D9061038
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12D9061038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D378E40475;
	Tue, 17 Aug 2021 21:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRH596OShbGD; Tue, 17 Aug 2021 21:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDDAA40202;
	Tue, 17 Aug 2021 21:25:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA8C1BF396
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DFBD40112
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5mOp5v5iol2 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:25:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp2.osuosl.org (Postfix) with ESMTP id C972640202
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:25:34 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.10.249])
 by Aruba Outgoing Smtp  with ESMTPSA
 id G6aSm5tUFxC2nG6aSm1HKr; Tue, 17 Aug 2021 23:25:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629235533; bh=iajHEbYz4ELnyFY9cJR2yVkiCbQ8/6MzHrtnjMkcUK4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=FwrFlR2LQjS6XOJO9S81zgiuu8PJE+u/b6vjC9cldTnCpSIKeZS9gTfxjeMR7ofZS
 9skSBEO3L2594TE6hBqUi5Ah/z3UNR5nSCtN2zdkbae98nvdXTB00GRKBHtrx2P6Hu
 dg8KDp+7kC+L/H9NHiCvJs8ELZsYxo4TiiL2dTiIp5e8ZCbHCS9c20uISQlB7io61s
 ZNUb45KquCRC4QJ3x3MP99uhI+MwP7LkHcW0mHLSnmiCBpGSDnXEGrJzImBcGcDg2I
 DC4YT8ABZcaL/Ww17iiSAXMy+cLjnPdQgiMcMfAEQ33s8H/cJ34xHoj7PyduTeVnaY
 0oafBKLuwBTDA==
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 buildroot@buildroot.org
References: <20210817211121.9CAA18D41D@busybox.osuosl.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <6023df3f-f9f2-97bb-710c-18c9ad2efa41@benettiengineering.com>
Date: Tue, 17 Aug 2021 23:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817211121.9CAA18D41D@busybox.osuosl.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJd8PjsZTeksGFVcSocRBZMZ5A5bf98BcNQrsVx6UcAj80iQiw3cvzSkHmyauUoZ3m23NgIxjKG1EJryGd8vImiRfja8WTrv0UDOBwnMzZZfvG+w+Tq6
 QDuA8NaHlfsmNt0TjNes9zPbuIFr5f8+cA9/YK2PkcY/N+xb8i6K+bA0fFs/+OgZIalVEPZw0urc+KJIFE4/57ZqOfMvF10kuvTbi9fWdj9nJ6RtWqLkWdPv
Subject: Re: [Buildroot] [git commit] package/protobuf: fix build failure
 due to missing -mcmodel=large
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



On 8/17/21 11:11 PM, Arnout Vandecappelle (Essensium/Mind) wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=bdbb113cd28e9ab17fe067da50484648b84408b8
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> When building protobuf for or1k -mcmodel=large is needed to link, so let's
> add that gcc option in case we're building for or1k.
> 
> Upstream gcc doesn't have the -mcmodel=large option for or1k, but all
> released Buildroot gcc versions have the patch to add it, so that's
> fine.

That is not true anymore from 2 days:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=da8a9d695b3c4b9397b5d9a27660bfa48af8d707
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=eff8110674ef193481d3657456a262beeb9951ff

But it's ok. In the actual released versions it's not present.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>   package/protobuf/protobuf.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 492917c5e8..75791fade2 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -24,6 +24,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>   PROTOBUF_CXXFLAGS += -O0
>   endif
>   
> +ifeq ($(BR2_or1k),y)
> +PROTOBUF_CXXFLAGS += -mcmodel=large
> +endif
> +
>   PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"
>   
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
