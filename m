Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC415C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 15:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5514156E;
	Sun, 19 Feb 2023 15:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D5514156E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRRdpNeYkKu9; Sun, 19 Feb 2023 15:31:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 294BF41571;
	Sun, 19 Feb 2023 15:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294BF41571
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2ED1BF426
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCD74404A5
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 15:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCD74404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8CLNwuyoo0O for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 15:31:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02759401AE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02759401AE
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 15:31:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 964352003DE;
 Sun, 19 Feb 2023 16:30:59 +0100 (CET)
Received: from 37-174-20-96.coucou-networks.fr ([37.174.20.96])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 19 Feb 2023 16:30:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
References: <20230219140051.80647-1-fontaine.fabrice@gmail.com>
Message-ID: <334eac4665b498754a5615cdec982341@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676820659;
 bh=ZJujfHdre3sIZ0NU2hLoXyxiKtVghhLBPoWmbv+HU9U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r4pm7rpSHiVcVS4baxcxvxRs66fyeO4ZWZEchqUx5VbkioZFfaYzuRu0bdt/xGS1J
 KHUuKp+gUnE8rf3WKTF/HLbI+wtJW3B+mjZRUIDhub4OE8m/0p2YS+xCq3zQtslI4l
 RwQBdleaoxTZ8YzP5CbNYnUhNH1Yq9EEd/kLEgGAevoJCQMcST/+ZvErWsuR7mjQ2d
 XdKTUhzVJiIJa+59/y2wGaube/BUfzv7MAAJvXGwpHbgWchhv4TtqJ+MHAewkg9Yqc
 lU8mS+95X8ZDHdVlI4lNMlYEkAcavsi2cyxc3Isug6rlXcgwAcNpv6gGHpPYQint8h
 c9tzKXWcGB9Dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r4pm7rpS
Subject: Re: [Buildroot] [PATCH 1/3] package/libjxl: fix build with libjpeg
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 19/02/2023 15:00, Fabrice Fontaine wrote:
> Building with libjpeg will raise the following build failure on some
> architectures since the addition of the package in commit
> e648d399d8bd609697e78f13f7fa76be06d91a57:
> 
> /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc: In
> function 'jxl::Status
> jxl::extras::{anonymous}::EncodeWithLibJpeg(const
> jxl::extras::PackedImage&, const JxlBasicInfo&, const
> std::vector<unsigned char>&, std::vector<unsigned char>, size_t, const
> string&, std::vector<unsigned char>*)':
> /tmp/instance-14/output-1/build/libjxl-0.7.0/lib/extras/enc/jpg.cc:126:34:
> error: invalid conversion from 'long unsigned int*' to 'size_t*' {aka
> 'unsigned int*'} [-fpermissive]
>   126 |   jpeg_mem_dest(&cinfo, &buffer, &size);
>       |                                  ^~~~~
>       |                                  |
>       |                                  long unsigned int*
> 
> Upstream advocates to use jpeg-turbo:
> https://github.com/libjxl/libjxl/issues/1802
> 
> Fixes:
>  -
> http://autobuild.buildroot.org/results/9a2a7c6072876f2562609bf98f32a1ce93631a75
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libjxl/libjxl.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> index cc24ba258c..02a93ac5d9 100644
> --- a/package/libjxl/libjxl.mk
> +++ b/package/libjxl/libjxl.mk
> @@ -30,4 +30,11 @@ LIBJXL_CONF_OPTS = \
>  	-DJPEGXL_ENABLE_SJPEG=OFF \
>  	-DJPEGXL_ENABLE_SKCMS=OFF
> 
> +ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
> +LIBJXL_DEPENDENCIES += jpeg-turbo
> +LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=ON
> +else
> +LIBJXL_CONF_OPTS += -DJPEGXL_ENABLE_TOOLS=OFF

Having JPEGXL_ENABLE_TOOLS=ON without any libjpeg is a valid
configuration for libjxl.

Is it possible to disable the tools only if BR2_PACKAGE_LIBJPEG=y?

The configuration with tools and without any libjpeg is the one
used by the package runtime test.

Running the test with command:

     support/testing/run-tests \
         -d dl -o output_folder \
         tests.package.test_libjxl

now fails with output:

     AssertionError: 127 != 0 :
     Failed to run: cjxl /var/tmp/reference.ppm /var/tmp/encoded.jxl
     output was:
       -sh: cjxl: not found

> +endif
> +
>  $(eval $(cmake-package))

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
