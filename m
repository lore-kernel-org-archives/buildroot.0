Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FE2606A31E
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cLWWxBRd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A72608AA;
	Thu, 22 Oct 2026 22:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUDwk7SV1zSn; Thu, 22 Oct 2026 22:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9BB08606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792708464;
	b=bw4Oyna2VPqUF/9YdLCsb/wPm3W4Kjs/KXy3dAlqcq6sA67vdPD40zmaRGZGJt+rrRBH
	 4X8PtdEGCJ4qu0nsLF5vfh3Vu0jdxTgkL3V+aITPWZgGfWG9j5m3EcjD1UYj6EhF+jijA
	 LZHpgKhEkZMMkNkSR6PClzxPy/306KBtEUap8oc/B8UTid0ikYHww6PvMn/cVfTHsqI/u
	 /KgigxcR391Ooz275YmNjhNNaG5O5sfiFNOp5JMvDSyOLLpyaH9dKT2TNMheYAKw0PyaW
	 z6eetWKx6pzImEHWogyc7MmARY8Jkwoct9CZ3JCpTvUoEBq1jUdX5s/3TlSAfo4Y6pw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792708464;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5OugBwMx3cwGVSh9HLj8F+xt/ZlXUWNoR71XMMOGGMg=;
	b=IWKy4Oup3dEslQDibz025FHgocpX4GArG7gmxG3oIH3t7o6nmcqqLa8hd8x+yAn44+Ln
	 qIJrMolgNXyC+p1mQD++VbCdlrVBy0VuYMFjCQaZrERjTSWSn5H/8HacTlpVu5KXvJI79
	 90orlYL682IMkOfDWdaELx4ruaLkpXWFGxvuoKBaMaojDWWvdU7IH5gUEHmoGj1GdShDv
	 /dsgYEHjHMcqW1SnccaQwgRBC+N2AFiKjCagIgvx2m2DiKkTBbDBerQefpgB+TmzPIKxa
	 df7rykUjbNzI7Wz2mmFbIiFQ/7+i/VeFB/6fdmCyoRqKh5b8wJXD4UtppjMiRJsa9eQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792708464;
	bh=5OugBwMx3cwGVSh9HLj8F+xt/ZlXUWNoR71XMMOGGMg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cLWWxBRdf3BIuKMjeNTD1Mu4trpjvvu6zZ/g+i+DvJ8aNSLJUzNfynJih6fWSyzBy
	 FWoHOTv9vhLyd7mrzzcRZEt4juoaYO+Tn9NfEdZrlBrNTEhWQ6Jdk49yDTD75fR9Yj
	 Hv5U1UWaDfrSZY1MrNR7BpFAsr7AxqfDTsk4Eelho3McWURPStL9R6hXOxfhc4/FsK
	 4wSheUSnPwbkGLTn2nvL1Q7puEFVYx+3A3/4eJvcCTFnQYK9Jh7XMzG93YhD2hgWpm
	 HhbHEwEJhwAetk3HWoxedVv0ii0BfaFgogwVxuGbdyv79NaovRNIBrTadhUKAtwy1N
	 9wGrh2obEUJ8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB08606C4;
	Thu, 22 Oct 2026 22:34:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACB4E3A7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA26E4096D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X46h2QCxqM7W for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:34:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3BCAB4095B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792708461;
 b=B8t7JJXrOVelbV96omVr4kuMOIqS/CVeew6QeKMk2LIJVfbTDGFpCrVNIhZxF7ud/HTI
 rpLkr1niY9xAcmGDPXshl61AhuojEiOSMsyJNXDw26mi6ssMeQayGzHibOR7KQrKgTdvY
 Lt2HqFnnrvwJt0qQh4HertavfAU8rwlY0QwgZXgbTzafTUTyku/yuOzajarfc52ijVdT1
 3FmXi3JFEAdpSoe3r6JvAydx37Ccox/1LqeBUv0mZPTrRirTFt2bq7h8cDlFKnKf5M664
 5gEq3cG7F1jdKAA8mBe9HADoInd7Dwl/19PuBwhd0zoUUT7MGATw/1N+r2STtgwS2Aw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792708461;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YiBH1gugpeEh95sxFBkzUd+HJSx/7OUvikH2jDW0J30=;
 b=BTw6x2PsjH1E6qyzz7wqPStSfcvxmGuLyTNiQJVt7R2Z6++bYc/y1DNp2hwXyoaXDgpe
 XYSDO2t4xKHeqstjYew/Z3HsydPt0xaER7bWxgjuOcAe/xHG2laFXMsx8uHK0IM+r6mzp
 yoHn4KCty+IO0qKvycRHh9wxCF7S2cAswjxV85VaWcpFWiuxKfs67Q1O/ap9zN89XwQyR
 ctcXPTP9LF2CaXHsFPViNfgggNOqt1TrJdLG/xOiGcItnhr/epq0UGWMxMqpBednPfl/c
 tMI06jKPJGJ9iYA/tF+9yTGTVgMETFsbpB4iyP/ACqAvcCSULnkTXZ1Ksp0fFNVIqAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IZAYQ3uJ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BCAB4095B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:34:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DF4141A12E1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:34:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9CECB60763;
 Thu, 22 Oct 2026 22:34:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBAEE10328501; 
 Fri, 23 Oct 2026 00:34:11 +0200 (CEST)
Date: Fri, 23 Oct 2026 00:34:10 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
Message-ID: <atqPFjF1gQYX_Qf4@windsurf>
References: <20260219221253.2217784-1-thomas@devoogdt.com>
 <20260308081212.777547-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260308081212.777547-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/3] package/librdkafka: add new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On Sun, Mar 08, 2026 at 09:12:10AM +0100, Thomas Devoogdt wrote:
> diff --git a/package/librdkafka/Config.in b/package/librdkafka/Config.in
> new file mode 100644
> index 00000000000..54380e2d6e0
> --- /dev/null
> +++ b/package/librdkafka/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_LIBRDKAFKA
> +	bool "librdkafka"
> +	depends on !BR2_m68k_cf # assembler "out of range" error

Minor nit: this architecture dependency...

> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LZ4
> +	help
> +	  librdkafka is a C library implementation of the
> +	  Apache Kafka protocol, providing Producer, Consumer
> +	  and Admin clients.
> +
> +	  https://github.com/confluentinc/librdkafka
> +
> +comment "librdkafka needs a toolchain w/ threads"

... should have been replicated here.

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Other than that, the series looked good to me, so: whole series
applied to master. Thanks, and sorry for the delay!

Perhaps one concerning issue though is that none of your patches
submitted upstream have been reviewed/merged. But oh well, maybe they
are as slow as we are in Buildroot :/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
