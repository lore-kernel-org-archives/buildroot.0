Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2B4FF5134
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F2D181569;
	Tue,  7 Apr 2026 19:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87i7dOZK5JJT; Tue,  7 Apr 2026 19:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFFCA8156A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775590767;
	bh=sZwHw2YZ0SL/Mqi4aD5FU17r0BILroWGXix9R/UFmDE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kO+nMBds1CIKmrgt+1O6lRXcmFSM/TKyOgnsqN2V1M/CNVrQDDpRL3+dW0gRvQVYn
	 YHrYByrxlaDd9FCNna7pHl+SuCtd3XpzTtRSALdIgBWMqyTZPoTvyDBsKn+iCJxdbJ
	 Mf831VfCwaQrVnEMx9wGTT1gs9P883MRl0Z5wttv3YygHOlWVD1whbOthai6bLzvct
	 MnNHKVMjXkmu+J1dz9w11lLhxaPoHPc2TE51hPyLuqaBnUqQ0qrDMrUKLayraJ8jlx
	 NZGtQv5qqD6QoQVK9WFVt+BCkrsS8nymTY8AULiZY+soHTMgjkr4qLh/Wwv10/DCDj
	 40wALQOIKfT3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFFCA8156A;
	Tue,  7 Apr 2026 19:39:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B812237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60CF260E07
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O78sMix9UU8r for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 19:39:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70AA860E06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70AA860E06
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70AA860E06
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 19:39:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1786D19F5AF;
 Tue,  7 Apr 2026 21:39:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 07 Apr 2026 21:39:21 +0200
MIME-Version: 1.0
Date: Tue, 07 Apr 2026 21:39:21 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260404100127.75303-1-chakrabortyshubham66@gmail.com>
References: <20260404100127.75303-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <feb48f962690a47352cf75a74f704871@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775590762;
 bh=DujleZ5x9YYgn6TqEMa4PzMC5xxxGvWMnS6dsERmutY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h8nGwH4CAibbdVECKZArTgwmt2gEya8Hq6nVjAoXYQ8AdBWREG7YlMSTOmpE7fFVf
 vVqGuwvDseo8c8YqMklPklj/LabUzIItYKVOvEll4LQ8qkXVMMGFrXdUQyjBSBJxSc
 eQnMDtU6hHYMVoYV/RgHK9+CTNkIXBx8UaSm5Z0bZRUzjIb+Nd7ncQpAmXJ93DD/cS
 xwaEgqBZwueXXrmc8tH/SXLjHF9z+BhCkTzumJnlfZUaR7xqy0sOKwEvKrYUWLhW3r
 vzbVjAXSN7t5R63/EFge5EWtpjhtg/qUkGti+PhSxRXs4QLzTwmQHolVoV0hjavIxI
 AG4IqPf563fiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h8nGwH4C
Subject: Re: [Buildroot] [PATCH] package/eigen: bump to version 5.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Shubham,

Thanks for the patch.

On 04/04/2026 12:01, Shubham Chakraborty wrote:
> Update Eigen from 3.4.0 to 5.0.1.
> 
> Remove the downstream CMake patch because the BLAS, LAPACK and
> CMake package toggles are now provided upstream in 5.0.1.
> 
> Refresh the source and license hashes to match the new release and
> update the package license metadata to reflect the current upstream
> licensing files.
> 
> Add a gcc >= 5 dependency in Config.in because Eigen 5.x requires
> C++14 support.
> 
> Update the project homepage to the current upstream GitLab URL.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  ...ptions-for-controlling-build-compone.patch | 88 -------------------
>  package/eigen/Config.in                       |  7 +-
>  package/eigen/eigen.hash                      | 11 ++-
>  package/eigen/eigen.mk                        |  6 +-
>  4 files changed, 12 insertions(+), 100 deletions(-)
>  delete mode 100644 
> package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
> 
> diff --git 
> a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch 
> b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
> deleted file mode 100644

If you are removing the patch here, you should remove the entry
in ".checkpackageignore". This is detected by the command:
"utils/docker-run make check-package" which report the error:

.checkpackageignore:311: ignored file 
package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch 
is missing

> index 737e7d39b7..0000000000
> --- 
> a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
> +++ /dev/null
[...]
> diff --git a/package/eigen/Config.in b/package/eigen/Config.in
> index ef0a16f2f7..b1746da9e9 100644
> --- a/package/eigen/Config.in
> +++ b/package/eigen/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_EIGEN
>  	bool "eigen"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14

If you add a new dependency on gcc 5 here, it should be propagated
on all packages selecting eigen. You can have the list with the
command:

git grep 'select BR2_PACKAGE_EIGEN'

Which gives gtkiostream, opencv4-contrib and tensorflow-lite.
So this patch should add in the Config.in for those package the
new dependency:

depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # eigen

>  	help
>  	  Eigen is a C++ template library for linear algebra: vectors,
>  	  matrices, and related algorithms. It is versatile, fast,
> @@ -11,7 +12,7 @@ config BR2_PACKAGE_EIGEN
>  	  right away. There is no binary to link to. Eigen is a pure
>  	  template library defined in the headers.
> 
> -	  http://eigen.tuxfamily.org/
> +	  https://gitlab.com/libeigen/eigen
> 
> -comment "eigen needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "eigen needs a toolchain w/ C++, gcc >= 5"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5

Could you send an updated pactch addressing those issue, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
