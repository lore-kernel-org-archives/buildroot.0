Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65610606A338
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KIrisFd8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD0040685;
	Wed, 18 Nov 2026 21:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cXyNDesyVxg; Wed, 18 Nov 2026 21:12:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1DCA54064C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795036360;
	b=c+b0/+AuS2WfUoBpSZeNCH+FulczjVCswOAKD22TndasnAnRlD3Lq0kbCJA0aFXPGu3S
	 ckeYeSN7oJ/WzinbMxxnxyg5xKdTB6L3W5nata5hC62sg5dw5w9HmOkasOCKir4UUPTsu
	 zmku+wY16tk+tvPfw5AV8TkfFuEe92FtYWPzMuQ5XgqTUMye9URfjbQzN6UUY4qhT/7vA
	 yi2eb5zzTBINSOZ67Vy9VuPA1JQdIv2BYSrjWz/9zM61jmr76k1BqNdM2ggchaiNjJ7HN
	 FCAedHVWM69b+UtKtzUFY9D115xj0AnQIeGBm/vq5o9SZtNJsHHFaxYj7yAM3thaN/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795036360;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9BoR3GpYQ/7TOwBuPgYnmXFb58kjZqyNiHi++zqZJ9w=;
	b=FdXr6cDOJc9Sr1xpclvnUbXHt6+7fkv9TPgSkta3IK07+a7wRjkUCFXpwJwXl+gTEw94
	 Avt4l41MqmAE/beQt8EVrXQivK/sXoKTrcVHyrb3bGwrWM6lyEc2hqoOBAIbcfwtxOfIp
	 EURTsHvuTyjwdMqZu/pgQq6Uc4lydHdZtI/EX9+dwhKIgkhRaycApMutim55mJe8vd9YR
	 Npn7F/1D/Tsy7vJo9QE+fhjZZ587m8yPmdNw3l4lgwNT8bwY9Ud7Q4k0MOuLvFzrhDbH4
	 LsF4y/sm/o2RSBAmvtBlK55ZqAqPdLKA0RxL2PV1mFzp8FtT94NIo23HIfazacaAbqQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795036360;
	bh=9BoR3GpYQ/7TOwBuPgYnmXFb58kjZqyNiHi++zqZJ9w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KIrisFd8MD34/2nF9IRo9Qr0myxI+9koh50xbCMRAaP3PY72FbcOTec8DLi3RTx0f
	 tSODdOZVZKfL1g9F/4vta6XGNDdQCfaYYaA//GgYCATkwRogvMiG8Fs8PR9KmKZTYy
	 aZL2vQdHgcSU//1QvB9+WX45sup7pxOmIrHuht/4QZ5UaMI9auJ3keJImterbZwcEN
	 OGgKxZmU2n/+xeTBbeBTipZsNH7D8Gk/1GAIJtxlBk96QHqpc3U+rDH79JPwG/3EiN
	 jYdAiXMlEW3wrSxAzVfFKlKCyXyQgYdMh0NHdsQ11NL5mp160jI0RkXmEkOmMhmu6/
	 QIXKvH2wa7Abg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DCA54064C;
	Wed, 18 Nov 2026 21:12:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F405D798
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA15D6069A
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYZbHvbBH_0c for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 21:12:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E1E2E60689
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1E2E60689
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 21:12:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2D7CF780502;
 Wed, 18 Nov 2026 22:12:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 22:12:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 22:12:33 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20261118204420.332438-1-thomas.perale@mind.be>
References: <20261118204420.332438-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.21
Message-ID: <7d13596db2c11636e4bd3f374d4605c2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: security bump to v1.30.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 21:44, Thomas Perale via buildroot wrote:
> For more information about the release, see:
>  - https://nginx.org/en/CHANGES-1.30
>  - https://lwn.net/Articles/1108362/
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-125283: a buffer overflow might occur in a worker process
>   when using the "try_files" and "alias" directives in certain
>   configurations.
>   https://www.cve.org/CVERecord?id=CVE-2026-125283
> 
> - CVE-2026-123007: a flow control window overflow in HTTP/2 might allow
>   an attacker to cause a segmentation fault in a worker process, or
>   might have potential other impact.
>   https://www.cve.org/CVERecord?id=CVE-2026-123007
> 
> - CVE-2026-123633: use-after-free might occur in a worker process when
>   using HTTP/2 if worker_connections were not enough.
>   https://www.cve.org/CVERecord?id=CVE-2026-123633
> 
> - CVE-2026-121810: use-after-free might occur in a worker process when
>   using HTTP/3 if worker_connections were not enough.
>   https://www.cve.org/CVERecord?id=CVE-2026-121810
> 
> - CVE-2026-123634: use-after-free condition might occur if the
>   "resolver" directive was used and the same name was simultaneously
>   resolved in subrequests, allowing an attacker who is able to trigger
>   name resolution to cause segmentation fault in a worker process, or
>   might have potential other impact.
>   https://www.cve.org/CVERecord?id=CVE-2026-123634
> 
> - CVE-2026-113425: use-after-free might occur in a worker process in 
> the
>   mail proxy server.
>   https://www.cve.org/CVERecord?id=CVE-2026-113425
> 
> - CVE-2026-120967: in the stream module, an attacker who is able to
>   complete the SSL handshake synchronously might cause client SSL
>   certificates to be verified using the configuration of the default
>   server rather than the virtual server selected by SNI.
>   https://www.cve.org/CVERecord?id=CVE-2026-120967
> 
> - CVE-2026-123640: the ngx_stream_ssl_preread_module might interpret
>   malformed ClientHello messages differently than other TLS
>   implementations, which might result in bypassing security 
> restrictions
>   https://www.cve.org/CVERecord?id=CVE-2026-123640
> 
> - CVE-2026-118899: worker processes might get caught in an endless loop
>   while reading the request body over SSL.
>   https://www.cve.org/CVERecord?id=CVE-2026-118899
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
