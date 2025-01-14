Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F028FE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC19983F36;
	Tue, 14 Jan 2025 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nX7Vy60aAEg; Tue, 14 Jan 2025 20:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C892783F53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C892783F53;
	Tue, 14 Jan 2025 20:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F891B89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FE8640AEC
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZrovEP_ck0i for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DF9F40C00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF9F40C00
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DF9F40C00
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:55:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E2D82601C2;
 Tue, 14 Jan 2025 21:55:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51996])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:55:00 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:55:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>
In-Reply-To: <20250113183909.3014170-1-james.hilliard1@gmail.com>
References: <20250113183909.3014170-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <24202c27cdb11d32ef66b275126ceacd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888103;
 bh=Cx/85hKLaJ+ptN9NkMrTvmVM3e1lYtk+aJ9A4DEZIdg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fJySbcsAzCJJ+Rg9ABLnO9bILiMhuSvq15DCOLB0LS00IksG5Tnp0A9ZLaUnRPxCu
 F9EB3yWk0HtSUoJuzV2B8frP+M8Wt4K8JjW8EUHcOcpWoQb9/shFhJitja7/CMKZDT
 /tKe+geMh62T7D8Lo2JWVwtoKIzWaju5d5bK44PCMn6AnkyO6hHUczxfKPGH+KyDxT
 cDcXZXHFQCxGcfvZ4jq3u6LHoPzhsoiK+IDh7+hW+8T4Y2e+Ug0lm/sszzBB/BmHMY
 BGS2gRqrgp7Dcjm9JLldbDgTKiSlykl3TTNqONl8IzoWSI7JSHGPMcXmV+vDt+Akau
 g/vKqSSIvrq9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fJySbcsA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to
 version 3.25.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/01/2025 19:39, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
