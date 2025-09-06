Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690CECA1012
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 17:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF3D41442;
	Sat,  6 Sep 2025 17:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsr2vmtH2sKY; Sat,  6 Sep 2025 17:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68901413A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68901413A9;
	Sat,  6 Sep 2025 17:03:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD254E0E
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B348A404D1
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCqKoenHtE70 for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 17:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95DAF40099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95DAF40099
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95DAF40099
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:03:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 56FFF2003C3;
 Sat,  6 Sep 2025 19:03:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 06 Sep 2025 19:03:07 +0200
MIME-Version: 1.0
Date: Sat, 06 Sep 2025 19:03:07 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20250906162551.3715975-1-romain.naour@smile.fr>
References: <20250906162551.3715975-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <246ca3355b09740156918edac387b82b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757178188;
 bh=zygtmDiD8Alr64ZgM5YOv+7rDJSE0c0SViMep6XwaPo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DTDk4Rw6eo0E8PLxwXFOcIiQZDfhgDiZMutAiv9dXIqgyok4xXjxmI5imRhu8B/Vu
 twzzuTuWib7h8r5s2Km21yBoTQNFGLfhlebpxqDdwcWXMaavZaC3msZDOgnXEkT3WH
 R8sYeOVjc14jzLjLsl7pENAaiuY/ptnMLTpaNhrVXuUpPWHFKueL0sgweBB9sGCVIe
 uBg3Kpmc86W2Kmr8zuSjNTcF6CYX8CVEg3OQQWroJJjOx+/pQpDfQLJykZpsjv8LOS
 PsFbH5O84D3Sdb5JTg3mxXVGmtmOLqN8GLCR86ysh6My2SmJOb5TQCzWq1+7jTaIU3
 JbLCJxqfhBgbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DTDk4Rw6
Subject: Re: [Buildroot] [PATCH 1/2] package/iozone: bump to version 3.508
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

On 06/09/2025 18:25, Romain Naour via buildroot wrote:
> iozone releases 3.507 and 3.508 seems to be only build fixes releases
> for latest GCC compiler version but since there is no public vcs
> it's not easy to review the history between releases and backport
> any patches.
> 
> Based on the changelog from [1]:
> 
>   Revision 3.507
>   Fix GCC compile warnings.
> 
>   Revision 3.508
>   Put an end to the (&*% stupid GCC breaking builds for no valid 
> reason.
> 
> So bump to the latest 508 release.
> 
> Rebase 0001-Add-new-targets-for-iozone.patch
> Rebase 0002-fix-build-without-aio.patch and convert to git format
> 
> The TestIozone build issue is not yet fixed by the version bump [2].
> 
> [1] https://www.iozone.org/src/current/Changes.txt
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774405
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
