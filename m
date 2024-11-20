Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F31BD44171
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 09:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F051C85336;
	Wed, 20 Nov 2024 09:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhSo4uXvwqQv; Wed, 20 Nov 2024 09:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0519B8534C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0519B8534C;
	Wed, 20 Nov 2024 09:35:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0E01970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 09:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DB8B405CA
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 09:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4x66E__CPtXg for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 09:35:52 +0000 (UTC)
X-Greylist: delayed 482 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Nov 2024 09:35:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EBF640148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EBF640148
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EBF640148
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 09:35:51 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id A2BA2BDE28FF;
 Wed, 20 Nov 2024 10:27:44 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 20 Nov 2024 09:27:44 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Grant Edwards <grant.b.edwards@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.17954.1732090118.1448558.buildroot@buildroot.org>
References: <mailman.17954.1732090118.1448558.buildroot@buildroot.org>
Message-ID: <eb63a9dac0a90b6aa67315f285039615@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1732094864; bh=867bJOOmS1gOBRowqgqdSWNBxQQ2sXo2FZWrf/bO8UM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=0+ES7nCwa7iCgs5h9hdndc0kj5O5De9QpE0iF2RD/h6tW05rnOTIj5YpzJo6st9xj
 SbAPXed9AFF3/dbR723f/l+4eYkV+q/n32Tyn4h1hpG8fk61C6rT+0AtZUXbJ/F1kg
 mgw8Q4hyex+QV5if4xFqfxIpjyUxHlW11vO3eaVQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=0+ES7nCw
Subject: Re: [Buildroot] downloads: removing git repos and offline builds
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

Hi Grant,

On 2024-11-19 16:12, Grant Edwards wrote:
> 
> I've been using buildroot for many years and have always been able to
> archive (previously in SVN, now in Git/LFS) the contents of the
> downloads directory so that production firmware can be built offline
> using nothing but files checked out from SVN/Git.  A question has come
> up with opkg-utils.  It downloads a source tarball and clones a git
> repository:
> 
>     $ ls -l downloads/opkg-utils/
>     total 48
>     drwxr-xr-x 4 grante grante  4096 Nov 19 09:25 git
>     -rw-r--r-- 1 grante grante   512 Nov 19 09:25 git.readme
>     -rw-r--r-- 1 grante grante 36872 Nov 19 09:25 
> opkg-utils-0.6.2-br1.tar.gz
> 
> Actually, I'm not entirely sure whether it downloaded that tarball or
> created it from the git repository -- I now suspect the latter.
> 

The order is git repository -> tarball -> build directory. The git 
repository will be reused or recreated if either the package version 
changes or the tarball is removed. I use this behaviour occasionally to 
'fake' package versions.

> In either case, I can't archive a git repository.
> 
> It _appears_ that removing the git repo and leaving the tar.gz file is
> sufficient for doing a build, and if that tarball is present buildroot
> won't need to access the upstream git repository (thus allowing
> offline builds using the arhcived tarball).
> 
> Requiring offline builds for production firmware can't be that unusual.
> 
> Is just removing the git repo and archiving the tarball how people
> usually deal with this situation?

Any objections to just using a line in .gitignore?

   downloads/*/git

Kind regards,
Andreas

> --
> Grant
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
