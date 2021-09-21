Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985CBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 15:50:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDB361183
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 15:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECDB361183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED658330B;
	Tue, 21 Sep 2021 15:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RE5_JfJFS5F5; Tue, 21 Sep 2021 15:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B845832B3;
	Tue, 21 Sep 2021 15:50:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 278561BF23C
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 15:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EE2B401C4
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 15:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mg_trygySdmm for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 15:50:20 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF068400F4
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 15:50:19 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ShvNmvXqPqG1wShvOmRllD; Tue, 21 Sep 2021 17:43:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632238994; bh=AMp+RIRANr3M0AWxVMHtOvzm+nC6UWAPXC7S/wssGCE=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=mG0qLkGBPK5ZU/8/K/ILI028KGi0IVTA5eZvSETnjGQHW3G2AuOv2ZIiSVQjPd3xs
 in/ov1TRDumQXUMKLJnO1n1mHeRMAtvwGxcVLznF0tD1OiCWPIJsRnMvo7Iv90f+Wf
 rkSZgejb+zLFBF8z8CTm2DtrSn5B5TVHIMWnKQ2xueZU6g801PTMRy6DZ3N152f/6Q
 Rq2FwFhmbb3DuogBEfr9DKSLlGeWy+ppUbaiQ9FB6mDxOVPAFaMSXVoYTxBx46iIk7
 rVwd7YHxJlmRJmrXxNHo1WhWFs8HULyuFyRtQkWfSRsMakpHus4Um6yYL2+Db38oJD
 hPZGz2v8sGgzg==
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
 <20210921130326.3462783-5-kamel.bouhara@bootlin.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <05bb10d6-7ab6-b2cc-dbd1-bc36de763625@benettiengineering.com>
Date: Tue, 21 Sep 2021 17:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921130326.3462783-5-kamel.bouhara@bootlin.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfATXW1Rw/T0MzAlh6wmWTuYWT8lQA5+r3ddAowXbDvG/phWxg59VsYq+gTYBDVV76lBOS9p0Pq8OqqONP7EGw+9vgQCevPYNeIXilBM2f3pZ1J9gzSAe
 4CoVvQpivVbWvBu1XFMUBqu03H0AAeaxm3sfAcPc85Zyoyn8xTh9fLXOsz//VBcOzuQJJLboK3BqSNuknaWh5C+KYGsKTbZJhZCu92o2KUH5gZ96AlbRKL+t
 ah+SASaxFoNvoGbqHLJkui4JWVsANxoUfbYGggqCICbLG7qhEuo76gd1ZwNxmhRh
Subject: Re: [Buildroot] [PATCH 4/8] package/sunxi-mali-mainline: bump
 version
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Kamel,

have you used ./utils/get-developers script to obtain the git send-mail 
command including the maintainers? I'm not in Cc but I'm a developer of 
sunxi-mali-mainline. Can you please use such script next time?

Thank you very much

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 9/21/21 3:03 PM, Kamel Bouhara wrote:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Bumps the sunxi-mali-mainline upstream version to 418f55585e76f375792dbebb3e97532f0c1c556d
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>   package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> index 701a1fbbb4..b46f572311 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
> +SUNXI_MALI_MAINLINE_VERSION = 418f55585e76f375792dbebb3e97532f0c1c556d
>   SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
>   SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
>   SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
