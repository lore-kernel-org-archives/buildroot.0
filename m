Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81764C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF3E9408E3;
	Sun, 19 Feb 2023 17:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF3E9408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSiLqkc030Ak; Sun, 19 Feb 2023 17:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E08404F4;
	Sun, 19 Feb 2023 17:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17E08404F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1321BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A1E81D5C
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A1E81D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCpUmUcrIL-m for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:04:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A4481D4D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5A4481D4D
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:04:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 1686C20039C;
 Sun, 19 Feb 2023 18:04:25 +0100 (CET)
Received: from 37-174-20-96.coucou-networks.fr ([37.174.20.96])
 by webmail.free.fr
MIME-Version: 1.0
Date: Sun, 19 Feb 2023 18:04:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
References: <20230219164822.142283-1-fontaine.fabrice@gmail.com>
Message-ID: <6d3f617e396aac69a2d150436eb98741@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676826265;
 bh=9VzCqbASsrmjxPUXvmvFRXCsLOM/LeUK5njoCusdYhs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rXMIw0LON8YD7AsiMPZd3rDVHJrEAocoknSNm/J/YId1R5o952sJoBFbohSGzv5+n
 C0lO+92/F6NoIqYj/o6HigKvqSx1CgDFoLoE6HYP5t1QZqUk35OlkjyvcqtU4M4MnJ
 5xGl5agXnV9829WwcQwEXt+pV54pjTPHZU6nSBg4uBvuStXN25cFhWRLcl9yPyfew8
 XK56lRFAcAzzuTVOimCgM6I4OQZ+trRw1SAbFFwiIRBtB8qk1XDKqS1bN/LzXko9vn
 QLZEQ0JmdseqVf5N/kDxDziI1Z2I56f3IEE1BQ06xpHuPzX0iwmyCPmC1cGaKiwjZH
 PX4TASf0u6gnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rXMIw0LO
Subject: Re: [Buildroot] [PATCH v2,
 1/3] package/libjxl: fix build with libjpeg
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

Thanks for the quick update!

On 19/02/2023 17:48, Fabrice Fontaine wrote:
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

Reviewed-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Julien Olivain:
>  - Keep tools enabled and only disable jpeg subset of tools if
>    jpeg-turbo is not available
> 
>  package/libjxl/libjxl.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
> index cc24ba258c..1257928efd 100644
> --- a/package/libjxl/libjxl.mk
> +++ b/package/libjxl/libjxl.mk
> @@ -30,4 +30,11 @@ LIBJXL_CONF_OPTS = \
>  	-DJPEGXL_ENABLE_SJPEG=OFF \
>  	-DJPEGXL_ENABLE_SKCMS=OFF
> 
> +ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
> +LIBJXL_DEPENDENCIES += jpeg-turbo
> +LIBJXL_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=OFF
> +else
> +LIBJXL_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=ON
> +endif
> +
>  $(eval $(cmake-package))

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
