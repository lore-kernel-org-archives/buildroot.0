Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC7CFA466
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1915780743;
	Mon, 24 Nov 2025 14:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5f-RDn-YJqzH; Mon, 24 Nov 2025 14:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C5A58070B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C5A58070B;
	Mon, 24 Nov 2025 14:47:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D11B4359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7A57806E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Yd59DcDYdOE for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7D53806D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D53806D1
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7D53806D1
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:47:37 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 6845CE00305; Mon, 24 Nov 2025 15:47:35 +0100 (CET)
Date: Mon, 24 Nov 2025 15:47:35 +0100
From: Florian Larysch <fl@n621.de>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20251124144735.4ej4gqhrc3omx66o@n621.de>
References: <20251124140704.15108-1-fl@n621.de> <aSRpRtlFVZFHLDsd@yd-6wlzhs3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSRpRtlFVZFHLDsd@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1763995655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=llQhsLVOQ9RmZK6vGdrQkItK0ZTgXJ2bIjjxz+owP4U=;
 b=HnfFTHIWvxFxij4xwsu2spsFLptLWOv/dIB1281q0rKyUK9Aa2zXVtkRF/R6+3KBoj43Zr
 FH/P30aed1zYU7usIbg1QdRY//TzF/fCcTe1m7tUuKxlrI9q2gRYa6b+oP1YUPnxOJcWDZ
 q5qModLWcNr5iw0T255v/FecFPUHOoA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=HnfFTHIW
Subject: Re: [Buildroot] [PATCH 1/1] package/libconfig: refresh tarball hash
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Mon, Nov 24, 2025 at 03:18:46PM +0100, yann.morin@orange.com wrote:
> People using older versions of Buildroot will ahve the old hash, while
> those using a newer version will have the new hash.
> 
> So, if we update the archive on s.b.o, older Buildroot versions are
> broken: libconfig is no longer downloadable, because no archive match
> the old hash.

This is not much different from any other build issue that can get fixed
by moving to a bugfix release, but I agree that introducing a regression
ourselves sucks.

I've added a comment[1] upstream asking for another point release.
Maybe we'll just sit it out - as far as I can tell in practice this
should only causes issues when you disable the backup site.

[1] https://github.com/hyperrealm/libconfig/issues/256#issuecomment-3571056511

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
