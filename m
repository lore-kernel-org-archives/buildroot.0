Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E8AC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 05:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC5660608;
	Sun, 18 Aug 2024 05:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NU8h3jqNvJ6; Sun, 18 Aug 2024 05:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46EE96061A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46EE96061A;
	Sun, 18 Aug 2024 05:19:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF4D1BF47E
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 05:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A2BF80EB1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 05:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aifo_tTE7jsq for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 05:19:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E71080E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E71080E05
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E71080E05
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 05:19:11 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EBE7A35211BC; Sun, 18 Aug 2024 07:19:09 +0200 (CEST)
Date: Sun, 18 Aug 2024 07:19:09 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsGETYxOQP+cp6yp@waldemar-brodkorb.de>
References: <ZsGD4xW/yBXU6AKG@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsGD4xW/yBXU6AKG@waldemar-brodkorb.de>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723958349; bh=Wc1iSTz5a3HRxc8i4XCrJsERZoCRo7I9fi+dXJhnX3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cKL3Reb13118Khl1Y9TneL+1gZ/ZZUKr+rzjWfG7AV3M1ZHJF6Zd5n6Wq2gcOk1w5
 1n0H1vqUM+hoXUaJAMHD3WpQ9MdGJBJnyyB98KbRfp/a9UP7eOQMWVuxT401BLnsfn
 BvoSSp01suk7kFfbaPa4BAlZ5DZS3ZPh2KUnyro38AzbMBYhzH6UsJjN0Zw3YqSQYS
 kkoqCcV3a/MBcAUN9LdmtDMshgmqZqH3Z1O+7CSn0+XNCsauHYi418iIZl47d9QvKR
 yFEIoq1Eb7otdOXxyyMBcuXr1Vn+BwrxZ3f51neILfxTEc++wZUqOSFbfUDDQTRqxW
 MyXMJYDla4OfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=cKL3Reb1
Subject: Re: [Buildroot] [PATCH] package/libnftnl: update to 1.2.7
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

Hi,

this was meant for next.

best regards
 Waldemar

Waldemar Brodkorb wrote,

> There is no changelog available, but you can browse the git log
> here:
> https://git.netfilter.org/libnftnl/log/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libnftnl/libnftnl.hash | 4 ++--
>  package/libnftnl/libnftnl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
> index 5d1aad15d1..bd29e76bc3 100644
> --- a/package/libnftnl/libnftnl.hash
> +++ b/package/libnftnl/libnftnl.hash
> @@ -1,8 +1,8 @@
>  # From http://www.netfilter.org/projects/libnftnl/downloads.html
>  # Checked pgp signature:
> -# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.6.tar.xz.sig
> +# https://www.netfilter.org/projects/libnftnl/files/libnftnl-1.2.7.tar.xz.sig
>  # with key:
>  # https://www.netfilter.org/files/coreteam-gpg-key-0xD55D978A8A1420E4.txt
> -sha256  ceeaea2cd92147da19f13a35a7f1a4bc2767ff897e838e4b479cf54b59c777f4  libnftnl-1.2.6.tar.xz
> +sha256  9122774f968093d5c0bacddd67de480f31fa4073405a7fc058a34b0f387aecb3  libnftnl-1.2.7.tar.xz
>  # Locally computed:
>  sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
> diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
> index 18be55a17d..65a1431e94 100644
> --- a/package/libnftnl/libnftnl.mk
> +++ b/package/libnftnl/libnftnl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNFTNL_VERSION = 1.2.6
> +LIBNFTNL_VERSION = 1.2.7
>  LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
>  LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
>  LIBNFTNL_LICENSE = GPL-2.0+
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
