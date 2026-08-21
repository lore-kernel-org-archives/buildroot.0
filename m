Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2538C5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 19:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1722C40C1B;
	Fri, 21 Aug 2026 19:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9T6feDrbo6ly; Fri, 21 Aug 2026 19:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787339315;
	bh=HCmgcSUAScnC0DiI4WBJyxgBA2YV6wnORnCtquWpIq4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UyeqARDTy68NNeYDLJqLWVOoFeY7WWu6yZJ3ee7Yi2mc6M+0uHUNHzwrZWa3fsax1
	 IdXboROpvfsRgcs/XeGmYcho8siuVkv1kOkHnFyl2UR0OeAILnGnBh2UBEO0jxKe3l
	 sEdsjRQbPFsC2tBCMIYlMvEE3gO6T3G/frp21eZzWljAJZ3Rp12oOGyU7yh1Y4PrhG
	 8jEwqzrH+H3OtOmz42++R2Yx40K8xvp2i2cNfcYBUJ1bMK8H0DxZ6rmcuAtc+Ll1Tr
	 W1gd+I/VgZvHC14xZrQOaDN2GxQwzFL/jZQgKMPo47G4g3vNl06tqmWlG9GZG+n2fq
	 Q8gtunQ3VLuLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C1E40C11;
	Fri, 21 Aug 2026 19:08:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28BBA93F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E75260644
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:08:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuZTZPLZf99V for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 19:08:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F32AF606BD
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:08:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2BF7F13F8A2;
 Fri, 21 Aug 2026 21:08:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 21:08:29 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 21:08:29 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260821093457.1384807-1-dario.binacchi@amarulasolutions.com>
References: <20260821093457.1384807-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <c266257525a850410eb2ec9181be865d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/drogon: fix build with examples
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

On 21/08/2026 11:34, Dario Binacchi wrote:
> Some examples embed CSP views, whose C++ sources are generated at build
> time by drogon_ctl. When cross-compiling, CMake looks the tool up in
> PATH, so the build fails with:
> 
>   [ 77%] Generating HelloView.h, HelloView.cc
>   /bin/sh: 1: drogon_ctl: not found
>   make[3]: *** [examples/CMakeFiles/helloworld.dir/build.make:74: 
> examples/HelloView.h] Error 127
> 
> Add host-drogon to the dependencies, as it installs drogon_ctl in
> $(HOST_DIR)/bin.
> 
> Fixes:
> - 
> https://autobuild.buildroot.org/results/b8f38b0645932cb5506515d6d313b64d824c8ce0
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
