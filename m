Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DB0E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 10:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15FB083C1C;
	Sat, 11 Jan 2025 10:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxospJUTYJ_F; Sat, 11 Jan 2025 10:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F3D083C1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F3D083C1D;
	Sat, 11 Jan 2025 10:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E8A942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BA9383C1C
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpbVBO5j42PI for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 10:48:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3942D83C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3942D83C1D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3942D83C1D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:48:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B0F8A19F73B;
 Sat, 11 Jan 2025 11:48:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33656])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 11:48:54 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 11:48:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109011520.27360-1-nemaakhilesh@gmail.com>
References: <20250109011520.27360-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f5262d1182de5413116ddaeed66157a9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736592535;
 bh=1mdx81zohjuCGy5RnG3KCi9JKi4ePa+L7IrSNLGzFss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sh+dQ0voZEfnI3tvSB5qWL6zn7Sv8JrNPQXM/xnuPvY+PrYUGwCKC4DAlEfGl8sWL
 LhuBCOTuoUS6CcqVMy6maeM4byink/VwCriQqSPQZKIWurN2UHEPDWRnCthZIVjogk
 AVt6Je3aaoqBT92UAKFAWhNgBmORr1muzTrFDZRFev88iUGnPqsPNsGeX9KEopRS6X
 vbIMs3eYeBpD5lzr7DkjdkpjnQQkG/1GCq2OB2eUjU+EzK/gQaMW10eHVPerhTLGUy
 k478fN75EtvTh8mB/1pf6tDmTumvS/SgZEH9Xk75F3mrMfLH0qSt0qrD6KYBTdGXTn
 VPpNIG1Ujn4hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sh+dQ0vo
Subject: Re: [Buildroot] [PATCH 1/1] package/libgsasl: bump version to 2.2.1
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

Hi Akhilesh,

On 09/01/2025 02:15, Akhilesh Nema wrote:
> Release notes:
> https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html
> 
> Updates:
> - COPYING.LIB renamed to COPYING.LESSER.
>   
> https://gitlab.com/gsasl/gsasl/-/commit/2492403b4e6d65a3c2d6dd7eee9ddedbc733275b
> - Upstream tarball no longer includes the lib prefix.
> - COPYING hash changed due to copyright URL update.
>   
> https://gitlab.com/gsasl/gsasl/-/commit/89c4c35d7b0204dc3d6ecbccadab47d76640f0be
> - README hash changed due to multiple revisions.
>   
> https://gitlab.com/gsasl/gsasl/-/commits/master/README.md?ref_type=heads
> - Tarball's sha256sum mentioned in the release notes was 
> base64-encoded. It was decoded with the following command:
>   echo "1FtWLhO9E7n8ILNy9LUyaXQM9iefg28JzhG50yvO4HU=" | base64 -d | xxd 
> -c 32 -p
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

I applied this patch to master. Thanks.

I added comments that it fixes the recent msmtp build failures.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
