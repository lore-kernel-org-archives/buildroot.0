Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D34FC79F89
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 06:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16EAA80AF9;
	Mon,  7 Sep 2026 06:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpDRx8Vg1pFK; Mon,  7 Sep 2026 06:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6761580B9D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788764083;
	b=SP/Wb78FDXfaySnI/KvuYe0euCt+R+1yLNRGpl/KNShVU7gaMMy0i/uSHHEjYRpT5hc0
	 NuxFYi4pn7e23cm7VNqkzklHLT3T/W5RYGD/nG9y3p+jUR+aKkhkSmorZASE4bfANFLUs
	 UrgJDWXpD6px7sUJGo8Vt7FiZLlA4x7b8HS8GlwaL6BAL+KTmWWp2qfE3cbvyvFTYcbtn
	 Qw7wCuoIla7KJbtWY/K0gJoDUDIeqhJsMU8EJIBpcGO1S2wUnsIrQm9HW5Ju/ZfEwRUyV
	 nvdAQZSbM4i1tKTSdPFljOq8iRYh+Ea1swwpERV0d7IKeDyMpLRyTkkGahplLZweAaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788764083;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:Cc:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=k0MLkcSlYJh0GqaAlFn3zzhs/eJWaeCFJrHqJi4/Iso=;
	b=mR+lIJb/Bi+gysr73iWHS6S10NpzriPg3ylhKR2vU1nNDKdg7NsqYc9+L90RYTGpBPgF
	 5LY+FZ9QWZ3QgsD1bFgM1Co2EoOPbzhQDgLgzBlnc1bNpxvRxvCjFtCq9zqAwtOLkKEq1
	 LEZQ55GA2yuze6Hximc4oAm1UxrJbik2AA75Y59Z0Jfz4M3q3ybh3TrLSHlmQBi0i4deH
	 7pLKrx7lzFi1IY81WtfAAVys2S94Z23Wn1PcpFeNzJxq/MAA+LmAZdEQPDZfS7Ib+swjy
	 fxpEauChw07poOCtxlfHiT8tSoogtOA4FEHeS+9Zzd6LAWwuUpIysYRcfm9Ejm5H/dQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788764083;
	bh=k0MLkcSlYJh0GqaAlFn3zzhs/eJWaeCFJrHqJi4/Iso=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VrUfL5DgAG4OW5Xo9gT86oZKPOoM7TrNcnHxorqw/Q+akCqrum7479TzU44RU2suf
	 0kDDgbPioblJVTkkrn3mYUGPAt2Q+WSs7NpMd39YUikDYGz1oDo92GdShhz4WdBXkV
	 GIBZ4Jd5mKBZ6mZLC58Vake5BKHT7keI54k5SftzUNMgwXfya8CWXdYtY7VduMOju+
	 uIMjtIJi6rgknrdnkJYv5YpjEq0wWpE8CqDCtlvB52y40o92pUmyOU5z9xeBh7AG7r
	 SYHcqaaFih+sqZwNoD9XcKummOvFLFzkgvKCkwQW+vroEqMWk/06+3wp9nSMjVGS4Q
	 pj27LwRtWgsnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6761580B9D;
	Mon,  7 Sep 2026 06:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2724D990
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CFB2400AC
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZV9UV_pzTA36 for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 06:54:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 187DB40068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788764080;
 b=a1s+uyMfYjGMH1UOk64WG83RoMoKTA1glGIcNMJOOaLbnORRVOWcQLjfdGyQvQakAoQZ
 tJhlxB3W8XT3TiOjmfkhkc35HsWcNqBGmGIQZAmAy0G7Uv+mxKjxwE90y0ESKIwGLOq+i
 8Xsr8GivW1j4Qq0DeTIhTbJ9OhVwQadVMzWfkHmaSYIXT2ed6ozca8zbocudZf3DS2tKo
 WYscmiMEz6RCzLQNFQHr6GvwB/x/5uDSohdGAqvBVBufJ7WOh2TWl+eq6XZFYLAr6Qa2S
 /ZMj5hD6MxMXfZbsr+rFFmEcsMaxk7quBdBZpfqdnZmb+4vRykUJJckN52qlEL8CiFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788764080;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=XVAPkliENjJdNSSi4xpBiMwSoAWiLwa7hjjdltQxKhs=;
 b=HOidtc720lUgHeCGv+rbAu+H/n2YhxRsdn6nb0vtIEBSrGXhBK9ZfNPQmwUiRxURdNcQ
 asvYb1zHb0CKcIi096xz0rRYnhsf8X5/FqfcOlkE8sznPoj5MPo9qEI8KWqYecwIKmAg1
 aKT1N41MS0h4V4T0SCq1TpqHmxNe7I8/ZlqnfjZ+g6AiSfVq+6lFyP070Izvt0NN7b9eC
 AdBa1KV7dDf3FeInEkSXR6V8gx34okcDzBh0MSlGepUTX7TU6mhfcvihCambkc8Lw21vX
 6zRHqMAMGNCOincCnWdyA/SdRyaR8i/69DhHgGaSVNRm02ydq4/co61jXx3AxKAdR0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=E5BgmIfz; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 187DB40068
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:54:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 87AB91A1A19
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:54:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C7C660383
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:54:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C06F11C7A2F3; 
 Mon,  7 Sep 2026 08:54:33 +0200 (CEST)
Message-ID: <dd27b98c-64cc-41ec-8312-60286fdb6c71@bootlin.com>
Date: Mon, 7 Sep 2026 08:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20260905093953.62996-1-maxime.chevallier@bootlin.com>
 <ap5WKkAd5WBJhAsj@windsurf>
Content-Language: en-US
In-Reply-To: <ap5WKkAd5WBJhAsj@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 9/7/26 08:23, Thomas Petazzoni wrote:
> Hello Maxime,
> 
> On Sat, Sep 05, 2026 at 11:39:51AM +0200, Maxime Chevallier via buildroot wrote:
>> Since v6.7 [1], the KHDR_DIR variable isn't used anymore  by the kernel
>> selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
>> is used to specify their location.
> 
> But then doesn't that mean that the build would be broken for people
> who build Linux < 6.7 ? Keep in mind that the Linux kernel version in
> Buildroot is configurable, so not everyone is building the latest and
> greatest.

Looking at the kernel history, the KHDR_DIR only existed between v6.4 and v6.7 :

Added in v6.4 :

9fc96c7c19df ("selftests: error out if kernel header files are not yet built")

Reverted in v6.7 :

43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")

And it looks like even between that v6.4 and v6.7 window, KHDR_DIR is just used to
populate KHDR_INCLUDES :


  tools/testing/selftests/lib.mk

  [...]

  KHDR_INCLUDES := -isystem $(KHDR_DIR)


So I think this should work even on kernels older than v6.7, I haven't
tried though ;(

I can add these details in the commit log in a resend if you want,

Maxime

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
