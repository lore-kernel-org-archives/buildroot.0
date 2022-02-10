Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B910C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 05:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF09D40917;
	Thu, 10 Feb 2022 05:44:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szh51AR0pqNw; Thu, 10 Feb 2022 05:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E0440911;
	Thu, 10 Feb 2022 05:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F10E61BF40F
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 05:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB9184053B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 05:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0wOcbaqkkeZ for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 05:44:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AAAD4012D
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 05:44:19 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 0738C440636;
 Thu, 10 Feb 2022 07:43:50 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1644471830;
 bh=im6fdzX8EBRuVcqCE/eZHoPbt1fg3MCcJWX+peVUgJI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=VVeKLq6TqmDLga+o/+2tXhg3Kx1MtDCgJApOayfT0+Y/JHMA+8eqHYp3LoWbJIaZA
 7EbDEdXPOLbHT1oIlB1XWgZkVf8O9svrxlUhNwSKgU1oTWNsLMYOMgWs6cwBRpRBqd
 IeQyfoPnYp9m+tjUcprefk0FmLPcwSRrEhERMSsyGu8c+GNdcWu/7I8jlUqs0NSuE+
 OT48R6iJQJOPI332fQ6gh/8PY7UK0S4LsBD08uYhvrMXM72224LAql3gfbMAdxoL4o
 MpThPl9gNbfsc87UYr7DD/G6qlFNnBbl4TdkhBdmNKDZXOh727dYu9H0CVbsJzq9go
 SfMCU4b4ii+DQ==
References: <20220209223551.772606-1-james.hilliard1@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 10 Feb 2022 07:42:19 +0200
In-reply-to: <20220209223551.772606-1-james.hilliard1@gmail.com>
Message-ID: <87wni3b7iq.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-devtools: drop python2
 build dependencies
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Wed, Feb 09 2022, James Hilliard wrote:
> Looks like this was missed in c4bbd6da50488944debba29e195557e5b345f2b1
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gstreamer1/gst1-devtools/gst1-devtools.mk | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
> index 66b509ae2c..390b20de16 100644
> --- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
> +++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
> @@ -17,11 +17,7 @@ GST1_DEVTOOLS_DEPENDENCIES = \
>  	json-glib \
>  	$(if $(BR2_PACKAGE_CAIRO),cairo)
>  
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  GST1_DEVTOOLS_DEPENDENCIES += host-python3 python3

Maybe better add this to the list of unconditional dependencies above?

baruch

> -else
> -GST1_DEVTOOLS_DEPENDENCIES += host-python python
> -endif
>  
>  ifeq ($(BR2_PACKAGE_GST1_RTSP_SERVER),y)
>  GST1_DEVTOOLS_DEPENDENCIES += gst1-rtsp-server


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
