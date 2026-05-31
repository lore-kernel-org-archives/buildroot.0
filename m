Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF69CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FBD8521F;
	Sun, 31 May 2026 06:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGm4vlFuJlQG; Sun, 31 May 2026 06:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DE40851B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780210394;
	bh=ePiwEhtABMR9qkbpiBfuPPLR0mzA9tgTJoH/7ZydmGA=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lyKDO5VkRovsnPb7Zs84xxvtSuoy+IT5ritTHZH4tOsSXuZtGuU8cGRo/RkVPLcJ4
	 LkDpZQ7f6QdjawThrog1r9N2pYN2ofHRMw3e/ZMzHlKijz2yNjlkQlaosGojDRBG6/
	 koYGbNkDkOeV+dPmgrLZzbAmSK2fGXCH+Wanr1fs17lwqR6uFfVaqVNNEIVa2S9NcS
	 J8jbr6WRpBBFyidz2DgNiFAzMjcq+UlqVjFfDN4o+7kMAQXhCqkrS7jKuC7FtPgueh
	 0HH6prS3IQ7PKpqUp+YORhs47ZAfyQpe3ZcJIckAgpzssPgiT1p9A1P+ThgEx5x+LB
	 EXvvdGLxPmHbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DE40851B8;
	Sun, 31 May 2026 06:53:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF6CD389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B55EE851D4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PT8lUia62RCt for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCE3B851B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE3B851B5
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCE3B851B5
 for <buildroot@uclibc.org>; Sun, 31 May 2026 06:53:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wTa2n-0005PT-3c
 for buildroot@uclibc.org; Sun, 31 May 2026 08:53:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 31 May 2026 08:52:57 +0200
Message-ID: <pan$12e7c$23482d86$ef3be04e$7217d75@ID-313208.user.individual.net>
References: <20260501171432.1701736-1-bernd@kuhls.net>
 <ahvTE6qnCu2M6tp3__16489.2169924983$1780208462$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: add upstream patch to
 fix build error with glibc 2.43
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

Hi Thomas,

Am Sun, 31 May 2026 08:20:37 +0200 schrieb Thomas Petazzoni via buildroot:

> Thanks, applied to master. Do you happen to know why glibc upstream
> didn't include this patch in its 2.43 maintenance branch, if it fixes a
> bug? Maybe something to report to them?

no, I do not know why the patch was not backported, sent bug report:
https://sourceware.org/bugzilla/show_bug.cgi?id=34188

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
