Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA56C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 11:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEFF40731;
	Sun, 16 Aug 2026 11:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtLM-NloK3rB; Sun, 16 Aug 2026 11:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4903540707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786880253;
	bh=XRhIpAj0gHCDGn+f9iFk3GNYA8moR19YwwtECOEsM+w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lph+kyIVWH1Wlnz1709s7F2N9iSuqslNkPhd8Agvp7iH1mZ578k4jg3QwW+FU0KSP
	 OmloJjo8HqsrTX6O49BzSBPrCcS8oyP5ACoMkGkfE4GVdreZ2AsaWkyQtUE19ffhq6
	 KFykw8t6fwSTvmbobDXOC3Kqf8IQATbMfpCx3ch5zEr2UMiCNC8EysezX0pUJvn+lq
	 XmdsycQl7pk32ifXvjt0d6+LtZxQf06WPa6vBgN0uTBeAbnLddJaCUvqer1Y66JjHc
	 RQ91NpVLaQ7C85QWERec2tzdzLintrHve0SmH4sWDiAeoOVFWqhdNTjR0AEiKqH2ba
	 NOB3IwjvlXWLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4903540707;
	Sun, 16 Aug 2026 11:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB8DC336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B125B406F9
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnBxEOBLfYI9 for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 11:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 030AA40707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 030AA40707
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 030AA40707
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 769A619F576;
 Sun, 16 Aug 2026 13:37:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 13:37:27 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 13:37:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aoGB2EKYfAEH5N8t@waldemar-brodkorb.de>
References: <aoGB2EKYfAEH5N8t@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <81f480e88e3a314b249cfc8e43ab55ee@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/uclibc: enable FENV support
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

On 16/08/2026 11:24, Waldemar Brodkorb wrote:
> Enable FENV support unconditionally when a hard-float toolchain is in 
> use.
> Useful for packages as quickjs and chawan.
> Adds 24kb to the C library on aarch64.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
