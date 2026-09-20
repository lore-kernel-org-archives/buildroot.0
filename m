Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319B4C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F3B605EA;
	Sun, 20 Sep 2026 10:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIyTc_QH7jaK; Sun, 20 Sep 2026 10:31:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B933D6063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789900313;
	b=VBLTNrYh27827y2ZX5oK+uNeY7oanl/uvL+n7KyRWXrzZMQpU3TqPhR8s9nSWXbsTBka
	 i2BItG+6iVS0S3IXVkh1DAEFh1loI8JGEbjLZTO/dVWVqsAumL5SvZQTv8CQFPOiOZa+s
	 mMzyoeAE7aKag8K9tQPuI4xojtIiYI5fwx+k12ywcKxeY95VUN9UBHsSerS5FadejckJK
	 mBV9bMoaIP7GLFqSlFsfR6legWHisTxik96M06vCysQI5ohcEKJ9/iSbTvHKDOle5XHXC
	 DLRoGluimqxGOUYxjsRgRjgZE7eR2Lc+GbSEXkAK4Bg3jQoNfXFHrR6CBMmH6ZT3LOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789900313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Nt43zKIp2hcmwWDP5LnNN31GOKGAYPjLLtzjXCKq61E=;
	b=JVl6zcIVNdmwvLnd18ee6TGXWTS4/wgqUTMGMcO25nftf4CaGbgu1fsMEVmadZpnVqOv
	 EO3HBq8GY/bCwDQEWxRYT2VaAjxL5zc1PhDkftcR+SjBpwxE0gnWbynLEwySyv/C7HCvz
	 h43ZTkSDcxHdjMetJ8nUc2zW+1BOVBJcdWWyOOdmCdmu8pUg2FYFg+vPzSSfzbIkBSLK9
	 JHF5tK/pButFJSAh+L9394/DsDknSgUb6mL1oyUzfXKn5HLFruOBF25Qam0UVd0Z4farR
	 S3aGS1+CMQn7eLmmkjAsGWMyne/vHi1GWtuq/83alchXbCCCw2XQd/bg7DHIRYZIF2w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789900313;
	bh=Nt43zKIp2hcmwWDP5LnNN31GOKGAYPjLLtzjXCKq61E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rkGQxjZotN/SwajJTa2l4tpJm5uKrRMGxqYJG4R2rPm951QzTS2SLUUtWyrGUxzZf
	 HOQjrA6dtCwmDJagnSVtuYlneBUb3PFCbCPivEJV8X1fbAMu+oxZax1KdvU7+u4oQd
	 OoOtTdnspxRoL5OH2Xew4/2zEFmzvFnr5383rmj3Yn8exCe8eu30RswKtCnohKY3WZ
	 Z15+ziKserosru46A70KUkJ5ITiAYE5xEG6mZ2sr5ldXOJVMySuY7+hB6wxypbTsQT
	 nRTEDxiXZEWfhLSSVf0VNygvUHQbiiB0dClgUs4MNsusTqByzlQX9AhBrNlp1VWbmg
	 GZmXi9g1GvzWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B933D6063F;
	Sun, 20 Sep 2026 10:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D137A371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7BEC80FF9
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-Tb7pXBWSIt for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:31:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D18EC80FC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789900312;
 b=bWkSNAKXo0wmvPyopnChsSjqiZi4ipZcSqSTJtgGMVKM1VVh5G3D/WeG8YSDCPRaAm1J
 1pe3PIe8hPo1HWHToysYY8in6p3zhBzEaR2FefqXT8SsstSwsNGST9u3xgZUlgL+IXPo6
 E7UXD7xtYKKXJFOOh5EK68bGezM0dxvEiSEHw4XRMdMYuDBXPa6cunBEuAgmXOO9Xqrtk
 quTThMSPLdM/kqbxXx0PmGl9c4vZRMGXULt+J/7kpQLX0vWWpcpMRbHdfccFtOuHrZnkm
 Q8Xk9Kym6kIoS9JJfISVJ1fRz3IPcza3T3vSleSkXpmH8PqCbveTSaoS6AArbCLe8dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789900312;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=LF3ejTsA4LQFFIBsVgpg+tFdVIltX0lrwE7VUMmSuTg=;
 b=W7/N9/TBqoFX3ACfUbAELSvEsLXi7TewvJEIb3wIZIuZe2GLtqx2ApzoMKipTbMW+hDm
 Xu7qetu6HJVCnd37OE4kUD473LwleFX7dY4UXlEOAQR2Z026b2/6yUgBAkWLecvfGDI4F
 4dYeszzu6y/0s+FrNdb7iAHiIsPUc2smhyRed/z4EYGsaTrCsQT9EWko24cmgo4gzRHS7
 7kjdV9YqXfOoj7JP3VKpC2cN0m/17uouRNEXvXK0tlQDP8/jnHhu65mV7VuCT9wesANnb
 yeJFK21tdbispQxitrTmCLntCfWksctNyGp05XecEy9i2z1W7CXCJpLgQwOX//LPcyQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qG2YP+Iq; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D18EC80FC6
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:31:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7A93F13F88F;
 Sun, 20 Sep 2026 12:31:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Sep 2026 12:31:45 +0200
MIME-Version: 1.0
Date: Sun, 20 Sep 2026 12:31:45 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, Daniel Lang
 <dalang@gmx.at>
In-Reply-To: <cfffc374b447ed2c0711fe41e23197d6@free.fr>
References: <20260907155344.3755749-1-bernd@kuhls.net>
 <20260907155344.3755749-3-bernd@kuhls.net>
 <cfffc374b447ed2c0711fe41e23197d6@free.fr>
User-Agent: Webmail Free/1.6.19
Message-ID: <a3ad0b144429ee0abc2fca46875929bc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 3/3] package/llvm-project: bump version to
 23.1.0
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

Hi Bernd,

On 09/09/2026 23:05, Julien Olivain via buildroot wrote:
> HiBernd,
> 
> Thanks for the patch.
> 
> On 07/09/2026 17:53, Bernd Kuhls wrote:
>> https://discourse.llvm.org/t/llvm-23-1-0-released/91654
>> 
>> Removed compiler-rt patch which is included in this release.
>> 
>> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>> ---
> [...]
>> diff --git a/package/llvm-project/llvm-project.mk 
>> b/package/llvm-project/llvm-project.mk
>> index 5cbbda6e06..31b2a4dae7 100644
>> --- a/package/llvm-project/llvm-project.mk
>> +++ b/package/llvm-project/llvm-project.mk
>> @@ -4,8 +4,8 @@
>>  #
>>  
>> ################################################################################
>> 
>> -LLVM_PROJECT_VERSION_MAJOR = 22
>> -LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
>> +LLVM_PROJECT_VERSION_MAJOR = 23
>> +LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0
> 
> With LLVM 23, bcc is failing to build when I tested with bpftrace.
> I tested with command:
> 
> utils/docker-run support/testing/run-tests \
>     -d dl -o output_folder \
>     tests.package.test_bpftrace
> 
> It fails with error:
> 
> /buildroot/output_folder/TestBpftrace/build/bcc-v0.36.1/src/cc/bcc_debug.cc:151:68: 
> error: no matching function for call to 
> 'llvm::MCContext::MCContext(llvm::Triple&, 
> std::unique_ptr<llvm::MCAsmInfo>::pointer, 
> std::unique_ptr<llvm::MCRegisterInfo>::pointer, 
> std::unique_ptr<llvm::MCSubtargetInfo>::pointer, std::nullptr_t)'
> 
> So could you send a v2 of the series, adding before
> the llvm bump, a bcc bump to 0.37:
> https://github.com/iovisor/bcc/releases/tag/v0.37.0
> which also includes a backport of:
> https://github.com/iovisor/bcc/commit/dad0db93fd0f443b2a4f43bc2f23c621c9202516
> 
> Could you make sure the bcc or bpftrace runtime test works with that, 
> please?

I bumped bcc and added a fix for llvm 23 in:
https://gitlab.com/buildroot.org/buildroot/-/commit/f8bf8d928cc8d8f667d14926416f1d2afbba5a91

So I applied this patch as is.

> 
>>  LLVM_PROJECT_SITE = 
>> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
>>  LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
>> 
>> --
>> 2.47.3
> 
> Best regards,
> 
> Julien.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
