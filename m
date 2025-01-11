Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449C5E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C7A840635;
	Sat, 11 Jan 2025 17:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EULa-qhFa96T; Sat, 11 Jan 2025 17:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0663740636
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0663740636;
	Sat, 11 Jan 2025 17:58:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABBFE940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BA1640636
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id do2PPtqNygiD for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57FB040635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FB040635
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57FB040635
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:58:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 73C0D2003C6;
 Sat, 11 Jan 2025 18:58:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:58:40 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:58:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Kellermann
 <christian.kellermann@solectrix.de>
In-Reply-To: <20250111155308.2859023-1-james.hilliard1@gmail.com>
References: <20250111155308.2859023-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6cd92b6c75fa995f3f7e52030777aa5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618322;
 bh=2l5CsG8J6Pxr7+wUh0oOTLWa9/ZRBv5ZkmCLUIQc6os=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FQhTsAs1BxrGkR7iPRENP+vS5XRt/ylVeU9QANnUXaNubDxVUsvSaDQrCq758Dg75
 jYUvPkaVUKGJMITdycCtxKNzWDhCSySWpb0uLMOvkOeQilPTpNADS5RQWSDILIbrvq
 Q3lf0gGVNHFya8z9DPGdX1P4JWWvfsNoV9hdrjmg3GJAa5HedTW1rBjCPri5cJmufV
 6/7pp31fo9SEQSZuAkJaW1Q9nxT6aCzBKToFeN+CxVLtC1hwHFRBX1jyMNeDNYjqvk
 LJM/G1aPtMf5+TKib0qO3n1ja9sOa3Bl2VLUKd/pfIKESZwyXDHyvGkTUG4+ptgf4s
 EftPUe9EegPcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FQhTsAs1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to
 version 0.23.0
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

On 11/01/2025 16:53, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/codedstructure/pylibftdi/commit/e604c863134200b370a963f6822eebf2b4315992
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
