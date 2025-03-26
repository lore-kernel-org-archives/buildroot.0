Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74826C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 11:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3262C61292;
	Wed, 26 Mar 2025 11:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cwLnuhheX37; Wed, 26 Mar 2025 11:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7DD611C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7DD611C7;
	Wed, 26 Mar 2025 11:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C9A5E4
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD2140676
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6uBLx11Ufwk for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 11:21:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A24F04064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A24F04064A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A24F04064A
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 11:21:35 +0000 (UTC)
Received: from L25025.local (unknown [213.36.9.119])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34FE7B005B3;
 Wed, 26 Mar 2025 12:21:28 +0100 (CET)
Date: Wed, 26 Mar 2025 12:21:27 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Robin Jarry <robin@jarry.cc>, 
 Julien Olivain <ju.o@free.fr>
Message-ID: <2m7o2qrgpft34lzguftbb77iwannj4m2ifaeehtfds6nskqsk5@e2mqclswaeg4>
References: <20250326111651.23707-1-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326111651.23707-1-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742988092;
 bh=cbNHDF8Y8iQPhD1ILoMyQnNbEESlIFK8ygJhvllmJhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFM+6eVegnrrjmHpVObNUefQTRQ+K8e0AEfpdFNuJfevYJ6SiaFCEZwvDVVapiDSl
 eDaaluBBzlrjP/wnEB6xLXG3jqBiyk1cwtNU2wjgAKkWSfkodLaB3vwlbPNStgK1e4
 UB4YQWoNqCmS4gTfSjZNX4rbo74ef+d/joAu3R21vQtjx4SJmm2Q2sfV8bi3q2tGxu
 FkS3sDjYpeNgL2lVub+QyPmkBUrms+UeK1PxxM9cXEgA5BFMUdYwxl2E0etXc9Wk8o
 7KCGp5mmbkKr1iC65SLvnNQK98GBFGrEvhJ4RcyM/n/Z4TbmMF4T6O9fO5E/g/uLry
 eGTH3NuB/30qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MFM+6eVe
Subject: Re: [Buildroot] [PATCH 1/2] package/libecoli: bump version to 0.5.0
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

On Wed, Mar 26, 2025 at 12:16:50PM +0100, Maxime Leroy wrote:
> This new version is required to compile grout v8.4.0.

LGTM, you welcome Maxime for your first contribution. Looking to get
more from you.

> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>

> ---
>  package/libecoli/libecoli.hash | 2 +-
>  package/libecoli/libecoli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
