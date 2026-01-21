Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E6DC44508
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 20:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E5FF40C6F;
	Wed, 21 Jan 2026 20:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJ2f8w5ZivQD; Wed, 21 Jan 2026 20:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C722740C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769028323;
	bh=drCfAYtHkaMqQ+IOAsSaMkdTf5N4q9xZSVnIrSoW6Os=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o4HlSh0VLQ0ZzEBYX0X1G4/nBGpLsCaD2DrFQiJI2gl8Zrc7Y0rd/XHQD7+xJkOG0
	 5qxhOtxzpjyJioFNl0bL/6GG96UH1wFTSYT3YJhojL2BgfOHL1S3kRs4DNbUn+PNJS
	 30HM9uhuhnxWuu++VSmXmXDqWKBefV1RZolrAcrH+6d4oa57F7RM+vDYGHPlieoO6U
	 j5CSmQXqukDKv+1q1EHIEjELzC7ch+b9fBkk2rqydCFqF6u98x0DfyCYd5niqfV+zX
	 x8TKq+kRM/BCu8gmwFxS6gTLVrUJDgOkw6mJ0aEm0IuM1SUF57VRDe06M5C1DI6+CN
	 ATmjPXvsEcZ1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C722740C7D;
	Wed, 21 Jan 2026 20:45:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A1B158
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 822AF821ED
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id px-yyQm5ci6W for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 20:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 747ED824F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747ED824F4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 747ED824F4
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 20:45:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 34E5678032A;
 Wed, 21 Jan 2026 21:45:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 Jan 2026 21:45:15 +0100
MIME-Version: 1.0
Date: Wed, 21 Jan 2026 21:45:15 +0100
To: Danomi Manchego <danomimanchego123@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260117180751.465-1-danomimanchego123@gmail.com>
References: <20260117180751.465-1-danomimanchego123@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <0f4b2fce6b935dfd32f82801af9a5ada@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769028318;
 bh=gKXn86CzUUVKP+GBUXeAFkS3GtSPOH5JtdF4cPTGieA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kTj+DylMiXMYsHTst6PlQR1QSsn4JeB2dFk7QyXGo4tTnhohQzXS34agB8eugHVLg
 j/Ey0PCeFzokye2udfhrX/nMpWjphCX1gz3jrlTi5K0E/oLujfYdLcfp4CxMiogb/q
 UwltmzYtnlDpjWzVyePv3NkCXadhapevnfGSex54Wd9Qmh+LNaslAZU6mXpp/nrTeW
 SKFRkRlUcvh4+vFttgoRZTrJwlf9aJ6IOgCgCwRTSHfU80yNYn3EscskeeReoXnJ5A
 fs/2ZKKzu1oN1EM3EZzFocqAb3zIeooGWixlybmbYkBb+ta012LihMXLeE9wvA/gEV
 plgRQDT1SmrIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kTj+DylM
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop unsupported
 system ffi option
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

On 17/01/2026 19:07, Danomi Manchego wrote:
> The --with-system-ffi was removed back in Python-3.12.0.  From the
> release notes:
> 
>   - gh-100540: Removed the ``--with-system-ffi`` ``configure`` option;
>     ``libffi`` must now always be supplied by the system on all 
> non-Windows
>     platforms.  The option has had no effect on non-Darwin platforms 
> for
>     several releases, and in 3.11 only had the non-obvious effect of 
> invoking
>     ``pkg-config`` to find ``libffi`` and never setting
>     ``-DUSING_APPLE_OS_LIBFFI``.  Now on Darwin platforms ``configure`` 
> will
>     first check for the OS ``libffi`` and then fall back to the same
>     processing as other platforms if it is not found.
> 
> The commit drops the now defunct option.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
