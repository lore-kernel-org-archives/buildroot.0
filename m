Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45711107761B
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1062B6120C;
	Wed, 18 Mar 2026 21:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSk6ksLTyk6G; Wed, 18 Mar 2026 21:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF7760DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773867954;
	bh=dHNr3aHOQIKnn6w3Lgr3ib2bQWSBVV2CdTFGC1MPX/o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XZjuiIWAA7hEY0Qh9ZXqzNN0h9XVda7uo3gYL82iP4VCBTjdentUTTG5+Y1Qo4cLJ
	 LTiCKCvY6MXLVRBoGm1XFOuPll2naPX8aTZ1TNVF8QFrxgO6129XPMpu8eb9gEmUjY
	 1nwc0BA1SNyQk/AvNjO9OZBDZccaAf1vo3AZo4CPUqB3ApL/ZLDdHcjfT7sNEQ5YuW
	 pkv3QqtBm7Xa0wnV84AhAZClnQufe0+u8Fj7428Hb54KxNVbLZnuVGqccpy16vOXyt
	 wwjfvdS9XB8gIAD9/+a0/wfEGzsNOOr6wFLDV58pDrICfSzw1GTENXSM1tx+wLBFmA
	 rHQJqH0giMKCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF7760DD5;
	Wed, 18 Mar 2026 21:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAC121B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9048140573
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlBl-sOulFvr for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 21:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F00C40062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F00C40062
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F00C40062
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:05:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 01CC75FFAA;
 Wed, 18 Mar 2026 22:05:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 22:05:47 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 22:05:47 +0100
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260223-llama-cpp-b8117-v2-1-9a2ef7e47bb1@gmail.com>
References: <20260223-llama-cpp-b8117-v2-1-9a2ef7e47bb1@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <6133d19540377b19c224b03ebf5159bd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773867949;
 bh=FR1UQrybvIuUEb/bjp/BzHYr1DaHhbAw2mSSIwsZJVk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a7XgRqTCke+C7GvwqnsVYNjaFHwrTQJZ72Hy7PZlfW0W/OBxcs4+Q466dx00cXM4Z
 QItxiPVC1TqtRs/xRI7KkntU8b661EuAk2T3aEmFC/uqxTzBcpggNIdJLHUkVLP57y
 33Q2LDPBHUTAAPYWQZ78yVXHuiFHblPBd+sh7BHMCAgQ0eOvq5Myho7XmNpg0S9w4H
 uXNiWvaXVJtmwGLhtIbDFtex8J7qB/qhjOO+tFyr+g26pJsa6gSwZz84LkViPgHkP5
 j+/jyCupWUWZ2vE/JpEN0CCoKsKrd/CXvVJKeoCTsJ2iLSDqXZTppy5A6lqlzjeTkf
 VnvAOHK0E1luw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a7XgRqTC
Subject: Re: [Buildroot] [PATCH v2] package/llama.cpp: bump to version b8117
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

On 24/02/2026 02:23, Joseph Kogut wrote:
> Release notes: https://github.com/ggml-org/llama.cpp/releases
> 
> Merge BR2_PACKAGE_LLAMA_CPP_SERVER into BR2_PACKAGE_LLAMA_CPP_TOOLS, as
> both of these options must be enabled to build tools like llama-cli and
> llama-server.
> 
> https://github.com/ggml-org/llama.cpp/commit/a180ba78c710f52af7c7edee562fbe98c36d6ddd
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to master, thanks. For info, I did few minor changes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/05c36d5d875713521f99b7bad48be316dcde2510

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
