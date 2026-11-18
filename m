Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E949606A32C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Udzzk7bm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A056408F7;
	Wed, 18 Nov 2026 20:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kn5Sz0lsECsp; Wed, 18 Nov 2026 20:22:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3EE9340875
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795033359;
	b=IM7izKoJDtGjdxVBZ6X5afja5WEhWUFKY3Ns54GxhkW9VVYg4YAlUzC7iJV5hKPcu9CH
	 ETob/dZ3nDpeTTvLCnb+oGO0BdWM/zfEHkQQqMa/FL8cM72MlR6gszFDA1v/Ia2aRdFea
	 hMNUBjgP3bYLDjPJgYkyYyDZHbSR2vbBgbc9/BPKq5XT8rcPSa0XxDVMeLfOaFCBmm8bs
	 gaburizSEHJB7/P5X9fIeAfvO0gjNfQ9qyyFYOiEsOzSpEzNE5LGtPbgsPIKmn2uelLz+
	 9u0sY5bYfjGz4cWG6jWJwC3y7T4EnDK4NK8osMKzjB0IJWMIPEExFgefoT1nmNialwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795033359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=TCJwnqCrDUQbYz/PO2eLYeF9NfSWbPjJUJCBF7MdpPM=;
	b=itq6fl3TsCy5n0093hvSD+mGd7Nogc2IuqsWDB/TIUDsa8EydSR5nkXhlKnkOS3twBy3
	 UyxwAkfJ+1vqv40V0b6jsVCoFp06IaXJNG95rvpkY4sMDRhWectR63FcdZVx4ypwP6uOg
	 I23plMPyB6Fw7U9w5aagx7wSDlTbr2kO8dsg7gVIkf7SkS/JaZEyD+uJgNryXbQikL1EF
	 hq0TvZnAUeoFPUTJ1MGIeAKIGB1LDyfelXnHESToyIeqjQ0IVEI6pLezmBFueF8FD2oUV
	 HjwLDrFLXU595/+liXWmKJVjcMwSy1WuaDm0Be7LYhBAvXV8i/Xzv71EprRoaT55Z8g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795033359;
	bh=TCJwnqCrDUQbYz/PO2eLYeF9NfSWbPjJUJCBF7MdpPM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Udzzk7bmdjIS430EsAHC8OP+1HV2r71fNcKcX+fNSPMp5i02BNdgyM0auaAFjDUyE
	 F8/vz3TT5D0qtmMoDDngv/kSQHH51+L0mzTKgIBwDHRMpRVIs9fzWm4p9202Toe84J
	 /dtnmjrg+m2wvOc5ZMc5OuHFHjLSUQXdwKrSN0xerV7oae/FXeRqJxNxaZ1fFLY1xx
	 Oq6NbLLOI1h2B4NR6Egzi/K+0ydIpmgEcTmFh4Xu1VH1iFf1nRlebWbXMIkT2smlzX
	 KeR+cZmWYOxBh5IhyGBuTQRaikWYWAuuB1jmfJMG874DisHJfXaYxest6KmTz/rkcg
	 wMSpZ0BW5VUUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE9340875;
	Wed, 18 Nov 2026 20:22:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5F14798
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BAB881148
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id El7sy5TZ2Gmq for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 20:22:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6DB908111E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DB908111E
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:22:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2360C19F76B;
 Wed, 18 Nov 2026 21:22:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 21:22:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 21:22:32 +0100
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20261118-ubitests-v1-1-7f5c93a6259f@bootlin.com>
References: <20261118-ubitests-v1-1-7f5c93a6259f@bootlin.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <a7ac5773eec7cdeecb19ff55b9b47465@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/mtd: add ubitests installation
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

On 18/11/2026 16:45, Bastien Curutchet via buildroot wrote:
> mtd-utils provides a runubitests.sh that allows running an extensive
> set of tests on UBI devices. This script isn't installed.
> 
> Add a new menuconfig entry to enable the script installation, along
> with the test applications the script uses. Install them in the same
> location as they would be when running a full 'make install'.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
