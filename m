Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48AAC71135
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 15:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 917A18078E;
	Sun, 15 Jun 2025 15:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sRRqfypy4Ep; Sun, 15 Jun 2025 15:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE051806CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE051806CD;
	Sun, 15 Jun 2025 15:57:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37770151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 15:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E86E400BD
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 15:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzRaeOk5aNz7 for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 15:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 20536400AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20536400AE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20536400AE
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 15:57:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EFFF1780515;
 Sun, 15 Jun 2025 17:57:34 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 15 Jun 2025 17:57:34 +0200
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 17:57:34 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250612165912.3473966-1-bernd@kuhls.net>
References: <20250612165912.3473966-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <17c6fbd08e5d2177fb03101cfaa9b196@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750003056;
 bh=vDuirlr1BDETm/0LIVKV9qKJ9Ai6unR5k5hrTOjixlY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qkAazjw8Dm1j6VVA6Ds0bUa8G5T02Uu3+LhWF1+S6Lrc73nbYPx0dsHn3sWoSkydO
 o7hzmtUXV6ZdyXhYuNw5NFbqRb1kQe65yidT6jULwSpAbTSk7OZvL5Ry2yKv4nloqx
 lJ4WMWLx9dgtZbtSURXNhfYTcYfp9qyCx9KUZq5BAwWIb5orBPKpB/wt/yGakvCXBF
 ND0a5F18fPbDyl6PU3BmtXcL8+5NrRrzs8e0LDVhFBR86etVCSJyl6ixScu23D2L1z
 Ml5xKCoC8TQ2dYwNN6WYoSzjDxU/cq5OSPXgNNqsBOnle72D+NruLsg+kmnH4tdoKi
 VjEHltwiYQMPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qkAazjw8
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.22.2
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

Hi Bernd,

Thanks for the patch!

On 12/06/2025 18:59, Bernd Kuhls wrote:
> Release notes:
> https://www.samba.org/samba/history/samba-4.22.2.html

This 4.22.2 change log mentions it contains a security fix
for CVE-2025-0620.

The commit title should have been marked as a security bump.

This security fix was also released in version 4.21.6. See:
https://www.samba.org/samba/history/samba-4.21.6.html

To help the Buildroot LTS maintenance, could you send an updated
patch series composed of two patches:
- patch 1/2, security bump from 4.21.4 to 4.21.6
   to stay in the 4.21.x series.
   It will be backported to LTS branches
- patch 2/2, bump from 4.21.6 to 4.22.2
   please add a note in the commit log that
   even if the release note mention a CVE fix,
   it was included in the previous 4.21.6 version
   in Buildroot.

> https://www.samba.org/samba/history/samba-4.22.1.html
> https://www.samba.org/samba/history/samba-4.22.0.html
> 
> Rebased patch 0001 due to upstream commit
> https://github.com/samba-team/samba/commit/4dbbfcb00401d7a797154c812587bfe2dda0aea1
> 
> An import of the host-python ssl module was added to wscript with 
> commit
> https://github.com/samba-team/samba/commit/549f67a9e655149b1ede7e2858836cb7811cc78c
> Select BR2_PACKAGE_HOST_PYTHON3_SSL to provide the new dependency.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
