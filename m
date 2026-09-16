Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BDBC88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4269B80E15;
	Wed, 16 Sep 2026 19:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trORekgOtQqS; Wed, 16 Sep 2026 19:03:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 11AE0809BF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585408;
	b=fiunqgY7BVb7VTyW/tp6JOhBoowg06q+QYEtzbfVZTU2WUdhSON9KlD10x5rH8QgeA4q
	 NfAff1F4bHELsPUqUBSTVG9jkh13rdlCjMS0cgvRrvQRXCyubwlAloMyKG9iHONcUycH6
	 0bmsgq1G6UW/2+CoAUAYIXOjvDcaXg4v633VRzzuK3/Ijpd8GXizloYscbJc/eiUuxCwD
	 5wG25+af3wYyDs1uJwk3g+PUsX1CUM/xasM5BYJ6xn2mu+mECM+R9fbU+wqhKzC71wYnV
	 6Fn6Og5U6D51NNS1fynfO9O9429GvdkO56/XpVVnjiNjZYGComLAcNIPATJs7MouoYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9SMPLibZBlrpw20XLZnCEKuWkK716wfpcCfuhVxJRr0=;
	b=GK+X69CR501OjJrqWBvBp0M/MoVAMHtvFH1s0rm1t+2UY8GfyPyQvbWpF3xgW3nZ+ILA
	 Zy1nsjkilSm6sKAa7jqm6pKg4vbS8Pw+2F/5UtzAMT9aTzafzOKGK24m0Z32TNMxPilBG
	 a4TDnHzt3pNsYvzyAormawKW7SZpwrxgSflGtrUZPP1OjaGxsmRtqBlztf4KSTsirw6QN
	 fonxYiDVluvrKeVvr2i3oXcYK9OQ4YEhN1D9kQ1NN/m1Mz+vAai5cosU1M/7gvgJpnhMD
	 g1K0BxNxI/vyxGgi0k5f+PPZHbO9/0k5VoWIDr1FiO8rVry4mXQKtUt0sSnIYqMc+Bg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585408;
	bh=9SMPLibZBlrpw20XLZnCEKuWkK716wfpcCfuhVxJRr0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cYc2aZysRGgBIYIsMxrXcwAb91wsmDZcWzzexEOwnsNALD6nDehggUiOo1eJTKQVH
	 J5bBShKJHIhBUpjs4G+KSleE8pcEO3qkG7C7qqAtiXVFJzuN/10tglCEGBZ8FoxN+R
	 gWIWToD0vk+gef4CYjrHq13wLGFK/8xTHGagxJuILMcFMUVDHOMgT9ogsGA+imkhng
	 j5GJwWw9KgNKBNtN6GImTLRIjSwNBk1B/GkqD0B759d4TjI5EAoF3SsXWadqQ7kCv+
	 oJBGW//Z1bxJ1zko2KiS6lK+chgIdSlxUzrzaFmmEWGwJSC7SEBn0bpJh3b41P+r3/
	 8aFhtYO8nsIAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11AE0809BF;
	Wed, 16 Sep 2026 19:03:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9885A7AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A249809BF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mH_sbPU238G7 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:03:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 13D26809BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585405;
 b=hSjokjLiBiXZT11p/NPhqlDDSa0iLuPn6dHWcIm0gDfwHarNNasi9ud7T44ozA9PJM6p
 +HoFTh+MKPjWtN+JOCBEpWTYLjXFCp8QWAkIAiElZSe4Kq23kOR3jdUxEPSnPdgIZpS93
 nsI1xp4UkHQUZ+/EFTotzVOZj3qErYveYtmoNvG81/XRQw2fBbUt1UIpG+Uo8XcP2nDQe
 81yrUS7RN25t+3Pb9YvSv6T1BfwJe9ZR/p9cctExEMlx2x/+wX2xJsfAQIsOBhtA9AC8H
 JT03/oYqNERebVOtFmoGhZ5UX6pMveZWC7vLwAvNO2kxMlZmUuODvQKVLuD6kJHPgYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585405;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=RB/ahXXFp/HYMQF40wlYfN/aXVQZb9U5o8jGIM9msgs=;
 b=nqArhhTsihQOO8+VTCIgg5Tfw6tfJScEyDUwDlLUlQ2xEmKGoZpEUpcTV4knR6L45o+Z
 Wc9tB7nfyUfV9qvBgYn5dC7ERlXhC8ZY6ZKPc1J6mATCELGCfXdHTv3JyJAgDWH1/JUNo
 ep2NKqu7+zMfNoLl7myofn254ppNkap3Izz6biQM4r+u6HVMQmCsX4vUbBncT4Q6F2jXi
 ALD1XiBI6uHVF7jaBAwhSl8/r5BRYoq8eKoiFHvUjNI1CBsAJCcHaSJ0nLPaa8TP8fzpc
 8i60BmRsU9qR5A9lmIqY9lDFBQNIQtj2hxS97ojzGt5/faOogH/z3P0UTvsrPInFEVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mi72Zlt2; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13D26809BE
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:03:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 44F56C5CD6A;
 Wed, 16 Sep 2026 19:04:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13DF860337;
 Wed, 16 Sep 2026 19:03:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D71A411C7B00D; 
 Wed, 16 Sep 2026 21:03:14 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:03:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <aqrnYKNuMBnXRAdm@windsurf>
References: <20260908213231.2542239-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908213231.2542239-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/4] package/snort3: needs gcc >= 8
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

Hello,

On Tue, Sep 08, 2026 at 11:32:28PM +0200, Bernd Kuhls wrote:
> Buildroot commit 5e78c6cf3323b4a45f84bcbc504f511dd268e270 bumped the
> package to version 3.11.1.0 which first included upstream commit
> https://github.com/snort3/snort3/commit/a8484408d181aad8e78b0b1e44a5bc05206a44ae
> 
> which makes use of '#include <filesystem>' that requires gcc >= 8.

Did you verify that the build actually works with gcc 8.x ?

Indeed https://en.cppreference.com/cpp/filesystem has the note:

"GNU implementation prior to 9.1 requires linking with -lstdc++fs"

which seems odd.

> Fixes build error found by the Gitlab autobuilders with defconfig
> bootlin-aarch64-glibc-old which occured after removing ' = 0' from
> src/main/snort.h, line 72, which fixed a previous build error:
> 
> output/build/snort3-3.12.2.0/src/flow/dump_flows.cc:26:22:
>  fatal error: filesystem: No such file or directory
>  #include <filesystem>

I'm sorry but I'm lost here. Which error was "hiding" the other one?
Was the "= 0" issue preventing from seeing the <filesystem> issue, or
the other way around? Where is the fix for this "= 0" issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
