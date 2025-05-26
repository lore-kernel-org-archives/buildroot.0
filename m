Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7421FC5AD49
	for <buildroot@archiver.kernel.org>; Mon, 26 May 2025 20:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7C6406F7;
	Mon, 26 May 2025 20:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5L7phRlJ3iRM; Mon, 26 May 2025 20:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6896A406CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6896A406CF;
	Mon, 26 May 2025 20:28:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D406228B
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B56B560897
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SC5FGxH__Q5M for <buildroot@buildroot.org>;
 Mon, 26 May 2025 20:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D34F96086A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D34F96086A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D34F96086A
 for <buildroot@buildroot.org>; Mon, 26 May 2025 20:28:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E89982003CA;
 Mon, 26 May 2025 22:27:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 May 2025 22:27:58 +0200
MIME-Version: 1.0
Date: Mon, 26 May 2025 22:27:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250526142413.29398-1-titouan.christophe@mind.be>
References: <20250526142413.29398-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <48f59d957ae21692e42c8dd8fecd9037@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748291280;
 bh=G8H0Sto2AE2Xz66afU2IsfY5zxeHo84VxR8oArvpf+M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vtd6uIWjJ9Ei0DDV+jE2vL5Yw3UsElx3XeaPm6t/8HdYEAb8wgdFSHVEVNdiTKK04
 tk+lk1YLJgHjwQ8xprOWxG3V+LDY9FOYon7SZ/gvVair2iCJgxuJ6kpF+sIMAAw+/k
 Qf1hyiqE6uYFB6mut/4CFX0cXHt1hdwe9liCg4wiLu4qoMDy4of0byWth7U+6yhAUc
 QCk18RWQabnTgvePgP3gK7ZF9QZAYJEZoTyY/wY49zQiTgleqznfLfR40e1Z9bB8bf
 Z4OhuJxdYY/E/js1Ud7OiF6oR8xLRgRIJug94TfGHyOp7pnKvq03SE/1oaCNBo6BpS
 HMXyBkIeFrOAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vtd6uIWj
Subject: Re: [Buildroot] [PATCH] package/assimp: apply security patches for
 CVE-2025-3015, 3016
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

On 26/05/2025 16:24, Titouan Christophe via buildroot wrote:
> Fixes the following CVEs:
> - CVE-2025-3015: A vulnerability classified as critical has been found 
> in
>                  Open Asset Import Library Assimp 5.4.3. This affects 
> the
>                  function 
> Assimp::ASEImporter::BuildUniqueRepresentation of
>                  the file code/AssetLib/ASE/ASELoader.cpp of the 
> component
>                  ASE File Handler. The manipulation of the argument 
> mIndices
>                  leads to out-of-bounds read. It is possible to 
> initiate the
>                  attack remotely. The exploit has been disclosed to the
>                  public and may be used.
>     See: https://www.cve.org/CVERecord?id=CVE-2025-3015
> 
> - CVE-2025-3016: A vulnerability classified as problematic was found in
>                  Open Asset Import Library Assimp 5.4.3. This 
> vulnerability
>                  affects the function 
> Assimp::MDLImporter::ParseTextureColorData
>                  of the file code/AssetLib/MDL/MDLMaterialLoader.cpp of 
> the
>                  component MDL File Handler. The manipulation of the 
> argument
>                  mWidth/mHeight leads to resource consumption.
>                  The attack can be initiated remotely
>     See: https://www.cve.org/CVERecord?id=CVE-2025-3016
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
