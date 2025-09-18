Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECDECA1013
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 22:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F43760D72;
	Thu, 18 Sep 2025 22:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uav3H5IZlJhW; Thu, 18 Sep 2025 22:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD9360D95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD9360D95;
	Thu, 18 Sep 2025 22:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86F80E7
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D61B60D72
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbEynMAgl3mR for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 22:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFE2B60D52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE2B60D52
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFE2B60D52
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:53:25 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9DF1C31E0C45; Fri, 19 Sep 2025 00:53:22 +0200 (CEST)
Date: Fri, 19 Sep 2025 00:53:22 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <aMyNYrfR7yELlhli@waldemar-brodkorb.de>
References: <aMuo808NcwB44GKN@waldemar-brodkorb.de>
 <763cb33343f1478ecd05526f82c46e94@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <763cb33343f1478ecd05526f82c46e94@free.fr>
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758236002; bh=780f70c73f95wwx023x3PsSQ7M7iDHJdGTvMJLnAkK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PW2fRQoooPMmr/yDyMtVQY02HjX55Nx/LL/FlCof0GApOjJ/JlLZRV2KIdn8en2It
 4wSnn6scnF0KM/D/XfXtnRRhGOBsj1i4MhiJvwk67X2ZNpQgyWkJmgv0u9e/GOC1rs
 SXQ2FS+yKaw6ZacDT1iIWFOTPIKgt+zHBg/Ub+cVNFwPODlg8lQ5kQEBEd5fb+9WsD
 rz0ycnIn/Nr5rFBZtZo6caGHulY27oB4smZENPPPr92Mj96/55+lblqnMkzDsCBNIu
 fadNSWdJ0ITmfFKPYDItazjlRubPM7JMr8hOYPDmxh1hlCqD40xQICG4PWzc6DADMr
 aiPSBmg/5EShQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=PW2fRQoo
Subject: Re: [Buildroot] [PATCH] package/x11r7/xapp_xdm: bump to 1.1.17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
Julien Olivain wrote,

> On 18/09/2025 08:38, Waldemar Brodkorb wrote:
> > See here for Changes:
> > https://lists.x.org/archives/xorg/2025-March/061902.html
> > 
> > Fixes a compile error with gcc 14.x.
> > 
> > COPYRIGHT was updated:
> > -Copyright (c) 2002, 2006, 2009, 2010, Oracle and/or its affiliates.
> > -All rights reserved.
> > +Copyright (c) 2002, 2006, 2009, 2010, 2025, Oracle and/or its
> > affiliates.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Applied to master, thanks.
> For info, I fixed the COPYING license hash. See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/c878e088391a180429bb374020db36d097df9070

Damn it. I forgot to commit and rebase after doing make legal-info.

Thanks for fixing it.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
