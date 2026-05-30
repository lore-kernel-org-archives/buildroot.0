Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29492CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B9A852C8;
	Sat, 30 May 2026 10:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytN-sw_KigY4; Sat, 30 May 2026 10:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F4DE852C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137494;
	bh=ZOesnzLHLVs/um7swkWDURnAkigGC7HrMdjbzFu2od4=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IC2WPR3VcvSmUNvRyolWKnwkjT0CCmfiaKwCBs2PwyVIaLwAXJOro0np6HE+jAx3k
	 div80k3j/UUEc20eU0WAQQwfdF7QaCBt7uisKs/26eaVohMREOQ7IVDLojoz80L9yA
	 /dwBW4QSeCXECrhPKrIPp0Ql3lzdIECVPOEbx+C4ZFJYu9iFOjC+ZXLcibL9QUKan/
	 BvB+fh/pjSm3RM1rn1s2H8LZ+54ErAN/4utGzKBYsJCtUPlHP/JhtLyKadGeSNY7vZ
	 ObSKvbz7Bos2awexuK6kB2GoQg6os6Ut0wNKv1OSNmFODSiGGzk4N+Yj9baoHR1RFv
	 tuLz6I2Xt7yNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F4DE852C5;
	Sat, 30 May 2026 10:38:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B128012F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A07834081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMAk8gubPK3W for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C51E4407DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C51E4407DB
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C51E4407DB
 for <buildroot@uclibc.org>; Sat, 30 May 2026 10:38:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wTH4y-0008lB-Pv
 for buildroot@uclibc.org; Sat, 30 May 2026 12:38:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 30 May 2026 12:37:53 +0200
Message-ID: <pan$76800$d9586706$ba37090c$90946cde@ID-313208.user.individual.net>
References: <20260530095901.1219858-1-peter@korsgaard.com>
 <87mrxh6wr8.fsf__44562.9354378738$1780135362$gmane$org@dell.be.48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/libhdhomerun: bump version to
 20260313 to fix download
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

Am Sat, 30 May 2026 12:02:19 +0200 schrieb Peter Korsgaard:

> Alternatively we can drop libhdhomerun and the reverse dependencies, the
> affected hardware is quite old so I do not know how useful it is anymore
> (I do have a device in a box somewhere).

Hi Peter,

agreed, started pipeline:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2563648765

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
