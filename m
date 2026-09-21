Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04244C982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 18:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C86E6074F;
	Mon, 21 Sep 2026 18:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kro9R9_KRgpH; Mon, 21 Sep 2026 18:49:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B157B60730
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790016549;
	b=mtxg92aeJd91S1stX4uMlWIxmHoXvba5Gdy1wIrKd3kUvsBGlgMnG1mAQNV5icJNLG7F
	 ZI10gmFp/ypGmnEFRpvOy6u6w9Y9VIdCyyWOlYOWRuMikT2tNj3MtiR4AdC/kpmsQBWn9
	 wmJKe2Bvu9HAnjBbgu05qdSKqOUaN7FNpxWhBpjX9dCdfOQtjT30+e0lhWaIy5eB9oikO
	 PQptYOvk1rlZbnG0kemUK95ThDBfjZNJ2HnK47Rh+CWtrPvnzQmqbqZ4s0jTo4wjCMVux
	 DROWMgY9imcysp8fllXGDs/sRu4EK0g/RO4+MDzYQXxJ20higreRBgu8ndi/1YBEvxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790016549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aZI3alSPjJjKJYtpnPKMxUI6SGykF1xC8rxx5qhTedc=;
	b=C4sGVuDiqpYLQYDMHpNVXgfNnFEgd+4NVJqqnmiHtwp561DtEJXDRTLpItxFd454tfFw
	 1Rsq8lOq0m60Myb3/j0Kfck4tUPDYuH3GFPzMgYYLVKbQdxLm21PgSk5mclFdAEdfaeS+
	 SQ3P0Zp7kNhzK5Ap+k/Y7cRQZlpnkavOxdCJeVuA5bvYBB901DOVWTl56mjq8V7oY/J1e
	 E2W0GgClqr7n19zt9a5TbuaTP75K+RhDU0fn0UOEURPPf2fVJunbAzMzKY3pOgb4n8If2
	 oTHCYcnrV76GfPdpJY4zNJPFUYSh2IdciubQujGzvnG41dXzmAjYdIxMyl+5Pt1lebA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790016549;
	bh=aZI3alSPjJjKJYtpnPKMxUI6SGykF1xC8rxx5qhTedc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m0oBSgstV/tlRbudH/DdAhCxypib79fP6WV+mNV61FzM0HjSW3LD+o2W5J+7jYEXS
	 fggH7ijbg1uyunkgWNdnbz9PsD3zBxS8QjMCYJAw4RrCUKMrO4AaQuw1eg+lbqPu5p
	 E/NpVgHnx2567JLZSBe6lJaSAOPy8FPLD6A/kivmuqp30VquS/pITKegjYZ91ghdph
	 YD8HX7t6L9YhtqUG3hjs8+XtTKUWhWuk74osY6b34w3q9EH9p/x0wMVuztF6Opq8MW
	 gSXvEoUO+PED6XltK6pXm0ho/w3z43fvjlbb/4pQDOkr1Uua1Oj+DrUKECjwPBbbKJ
	 etp46PPR1O0EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B157B60730;
	Mon, 21 Sep 2026 18:49:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26D0F224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CA9760730
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vZxOoa7dDst for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 18:49:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7D1F26072D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790016547;
 b=Rv2wQa/8weGsixk9SOO6pBJvDZkl0lBky22x2MkknHhr05N2prvMj8vO42ahtABIr157
 ZQ4mfRpwTiU1llrs56+rjUxY4oTBgb0L1vndtA/M2n6rd+bBeUvPZOlk4dLkgcTs05Erf
 oSMigFtBFPy6cK4jin+naKeQbu/Hu8E8nYrVxmlLdNIIGTXtgxSsJACHJJNhMNNjA14Ru
 TjBG4Wrpo0IbM1IcR30Up6QKJ80d+a3POGNQLBUWUExMTrbx6ITLx3JqQt6zEzvi3JFw1
 huFnSYukLIdxJqnatOLtTVg6p4DI9GZVlRxIxPWqOYTLhregQw+wrVH0Ktk0I5dl6OQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790016547;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=YO2nvySyB+6RK441K0IzPckSxRDULuz5pgN0ie8jgmc=;
 b=Z1CNYxk3EVmX+/kaIkJ48VzaXhEJ8HDlVy6m2JR73hAsL1lVm/W+HLGGO0kuDF2w8kgV
 eer88cGcxiYJWsTkFtWx/ZJxivAWi+7qO72M8f1MGkuAO7il/+AMZXF77NuZB/g74aFVW
 mpUhRYCyQz8CFPFHec87nxZ2gP6/OSTDJP9Cfms6dLSCIc8h5NL9ZVj3QlPtJb1+h//D/
 qd3IAyJs8/YZ7ly1blGHzSfsZ/swAWgvEBJ+QoHgy3Ye5BcN/Gm4yjyVO8HWGXDVkYm7d
 umT1CMihqK4ejo9KdxsHTl40DkNcLRLKBbAePCtf8WTx66q963NEyY9xpjTr0EJ8ivg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=i+A6rwBw; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D1F26072D
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:49:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 968A62003DA;
 Mon, 21 Sep 2026 20:49:01 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Sep 2026 20:49:01 +0200
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 20:49:01 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <e08ef449d915444978f2bc784c9fdb7438d11c98.1789971481.git.yann.morin@orange.com>
References: <cover.1789971481.git.yann.morin@orange.com>
 <e08ef449d915444978f2bc784c9fdb7438d11c98.1789971481.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b766f279a156cf2bdb471435dbe621ed@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 3/3] package/skopeo: security bump
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

Hi Yann,

On 21/09/2026 08:18, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> This releases brings in a fix for:
> * CVE-2025-11395
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/skopeo/skopeo.hash | 2 +-
>  package/skopeo/skopeo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
> index 8a9fb22133..e496eb4410 100644
> --- a/package/skopeo/skopeo.hash
> +++ b/package/skopeo/skopeo.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  
> skopeo-1.24.0-go2.tar.gz
> +sha256  
> 6a3f342a327ec7684198eb0e15114940b6101506db48d9a96590f5942cb3b335  
> skopeo-1.24.1-go2.tar.gz
>  sha256  
> 716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  
> LICENSE
> diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
> index 354998b175..5a22658611 100644
> --- a/package/skopeo/skopeo.mk
> +++ b/package/skopeo/skopeo.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SKOPEO_VERSION = 1.24.0
> +SKOPEO_VERSION = 1.24.1
>  SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))

While applying this patch, I noticed that:
https://github.com/containers/skopeo
was redirecting to:
https://github.com/podman-container-tools/skopeo

See also:
https://github.com/podman-container-tools/skopeo/commit/69ae01c7c6759d33fbe364ec7dff63e7c876e44c

Could you send a patch updating _SITE and the homepage
in Config.in please?

> 
>  SKOPEO_LICENSE = Apache-2.0
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
