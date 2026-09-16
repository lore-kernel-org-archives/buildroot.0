Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98916C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 467BF40723;
	Wed, 16 Sep 2026 21:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lm08uhwZS6ug; Wed, 16 Sep 2026 21:47:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 75835404F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789595222;
	b=JFxVAuIr8YEXG0VUVks3qStGJHhQ/hIDf/aqN359MF31DfBi3LGtFXAGP9zyMAmdk71Y
	 E3WZ10cAZ/Cq47u9n7Z6m7eBq41gvkPNJpjkKoOZv0F/ETMaUtkH9YOXJZci/wH2MKgN+
	 Q88ty8qpJD+pu+OZNBxQYkMn/c9nmollISaLcZ9caLbJggbOfdrHIxjEZ8TPEXzziOXpe
	 uTVuNG11gtNzWWAaDGDVWbAzKjeCirUULL2c2S2IoGbXtFtBxR99f9bV7IA6YipDRFsvL
	 ulKWIJ8EYup5kHhlI2HvUjGse/TFhFtYXusToyOGEH1TI9yEPi2Ev7EVOHlxUCN8W2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789595222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xWX5yumEmvbzg1ssulPK0TTBSh/nN6mdGy/Jgat3Owc=;
	b=sleYfd6BVbfat4cV5JpqHfXj1xdVXL3g3QLAlLn+Gd8njiYVFWqhkxP4dOfLCi7CQGpW
	 O4Co5jNsoDZ1j32x0HuMlJvgx2OIJ75nmfGcRCUPIwcAYtxLGSbngxahomegPaVryCPSQ
	 BAmr0PskX3ELuAFYIIzLxdiZz2nGNCft0gXizKS4cZjstYpksrAwzn9W0Xvwg2ZCKq5lh
	 CA/rVaN70gLS1ET3adc/R35sz4YR7s3QayDBQ+dh/ZTnD+WPkL8ubopDlOgTETywsTf3Y
	 a0p3EwpWAuXebxhGRlqt0TEFYyqL8dQmxjF15GDqX21fFcjpgCr0lmaIu6/ag2Kz4gw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789595222;
	bh=xWX5yumEmvbzg1ssulPK0TTBSh/nN6mdGy/Jgat3Owc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aqGsfFgI7P9SG1lTuR0SMtV6rfZrVVmaQZba7eMiuqIrrnRHdvUW7zXRedkE9XhNe
	 Ko62h5RDZOisoJHwhBkUnllKl+u1euFJODrx8II2tNlXacXBaRiZC2nMTveh0WllId
	 xIiDAIuWqu0IebH0c7ExOEYqguI/evVoV6kzxEd8lWIHBqls0hfkgxUEseczB9Emw+
	 BqoN7cTaBiZnAyoGK0QRX1gCz6GneLc+/QGJTGdTVL9SYnk/7cKXshc4AsBYeudz3k
	 UoxYxP6nGzp6XLDvNLKdOqVukHCkJW6WCHOvz5OG2Af/khmmk76ns2BSsRwyS09D2I
	 WkrRLCtKDE10A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75835404F4;
	Wed, 16 Sep 2026 21:47:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CE782EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DFF4404F4
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BuSVc_rGH_TQ for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:47:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7215C403D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789595220;
 b=oF1f1H4dfwtemy92XLSjXCRFE1jPnjfrQP/16P7Rx2SpDIFx12CmaiSpqy/roKpx1fZu
 UAZLDS1Pc5vkMMMn/c4S2PPed0M3bEBfIhsB1MXrSlEco6XpUoVAAeO5nCE4ZgdBMq1yf
 hviumhagqLLiZXlnj0EHqhecGFH+idyVeXca53OtIOyc62tij/dJ9aSmpzVh9qBnqYwsG
 sWZlYWqBYYIxH/Bj5xCHCADsbrMQrKwTnzudQSfI2BuMcnSGAJtB0jQYCqYr+mdIUmYzs
 6oG4sofl1gtP8cGOLIrf7gLeeA7SQkgfWj7dvG03lcsH30ERGXlmAXiK0pc5PpfUhUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789595220;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rNlu9/0V2KrDduRQANZfFkG5c12k1s/hMcTpgsAL4Ls=;
 b=LJnoGsSSJiIF6JNigpjbgFdjC7NZTnlKKuwrSG1OHmz+1m/304ORPR+pi6AZVuYwTE72
 xPkjvjS+WT3I8Qf3QYaosGPCqUWzBc5cO+AnRaeiTfOh+88NYfU0E6PlKqsJGbBq9PPeX
 Z+7YeQMm6kWZYWswdjkLvcyJ3avfy1Aaaq+Rdrnr5ug7yLc2g7kRWXUy9Xd7xe7Zg3hnX
 N4v9EtkaVq9PjC6bLzaV0kmAiOPTmSLovFbu0ziqbpQgi59Rq1kNteYz5xRLFUJONmMxr
 Wbl5aQHEDSmo7DQI/CZAOWC21oHpnW4eRJCaWOVvOFj7WcsPAuz4vYkNNBLR4eQzHXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=VDqYPqlm; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7215C403D3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:46:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 71FF34E40762;
 Wed, 16 Sep 2026 21:46:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 361F260337;
 Wed, 16 Sep 2026 21:46:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A236511C79C1A; 
 Wed, 16 Sep 2026 23:46:50 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:46:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <aqsN2c5Z4hDxTToj@windsurf>
References: <20260620070343.86834-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260620070343.86834-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: depends on
 BR2_TOOLCHAIN_HAS_SYNC_1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jun 20, 2026 at 09:03:43AM +0200, Bernd Kuhls wrote:
> Buildroot commit 8dad17ea06260ef0bd23eebc47c95a8510310bf5 bumped the
> package from 0.27.0 to 0.37.2. This bump includes upstream commit
> https://github.com/yhirose/cpp-httplib/commit/464867a9cedef2b6185e25e3e912d3f796fe58fd
> which added WebSocket support to version 0.33.0 and causes a build error
> detected by the Gitlab pipelines for bootlin-sparc-uclibc:
> 
> /builds/bkuhls/buildroot/br-test-pkg/bootlin-sparc-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  /tmp/cciyXsAR.ltrans6.ltrans.o: in function
>  `httplib::ws::WebSocket::close(httplib::ws::CloseStatus,
>  std::__cxx11::basic_string<char, std::char_traits<char>,
>  std::allocator<char> > const&)':
> <artificial>:(.text+0x6408): undefined reference to `__atomic_exchange_1'

Thanks for the patch. However, I believe you're making a confusion
between __sync builtins
(https://gcc.gnu.org/onlinedocs/gcc/_005f_005fsync-Builtins.html) and
__atomic builtins
(https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html).

__sync builtins are in Buildroot covered by the
BR2_TOOLCHAIN_HAS_SYNC_xyz options.

On the other hand, __atomic built-ins are covered by
BR2_TOOLCHAIN_HAS_ATOMIC and BR2_TOOLCHAIN_HAS_LIBATOMIC.

So what you want to do here is:

1. Add depends on BR2_TOOLCHAIN_HAS_ATOMIC in Config.in

2. Ensure that the code is linked against libatomic if
   BR2_TOOLCHAIN_HAS_LIBATOMIC

Could you have a look into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
