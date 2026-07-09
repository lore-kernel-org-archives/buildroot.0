Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B37C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 14:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C96410EF;
	Thu,  9 Jul 2026 14:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBvARTnu0awY; Thu,  9 Jul 2026 14:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56567410A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783608916;
	bh=j+7YIk6XWYIK19s+tPU2qBXZt7+Qp3c/8CPPL7gcB0A=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Zlm7gbKMS5Eg+HdqW7Y9vkr4+G/MIEgtCWw0QR++rJqPDBJ3n/0wOwVVhzEOYeiIh
	 qssaI6G/gO3Fab7wlpp0m53rLb+TwEMgGjwwpUdZsac4N9dAwik0DFC7ec8GcbQfL3
	 CdtM9OAAhoo5AVgulmKzfF7r9KVTuqjSOysfhVuZ20UgSgiw3Wpx/amBifB8WjQqec
	 ti0uSurBSDMod5+H0albZ6M/RLxebvB7G87O3C8r2QPRrbhYpLJN41hGfla2YREwu0
	 T8+E7j2dCLchzxist1juPweCUBh7qNJA/QzTnw+gFYGniA4Dl6GVGwf3AqSgTWzdV6
	 8yEXJL2RNxiew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56567410A2;
	Thu,  9 Jul 2026 14:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B94CD315
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 14:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F3E040CA7
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 14:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfCLC-Pt6uFi for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 14:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F1E5400BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F1E5400BC
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F1E5400BC
 for <buildroot@uclibc.org>; Thu,  9 Jul 2026 14:55:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1whq9c-0008ru-V6
 for buildroot@uclibc.org; Thu, 09 Jul 2026 16:55:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 09 Jul 2026 16:55:01 +0200
Message-ID: <pan$c5e67$ff02e404$98c8e8a6$5a2cf667@ID-313208.user.individual.net>
References: <20260709140143.449145-1-br025__10977.6866667502$1783605750$gmane$org@umbiko.net>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd fix build failure with fmt
 12.2.0
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

Am Thu,  9 Jul 2026 16:01:42 +0200 schrieb Andreas Ziegler:

> Building mpd with fmt 12.2.0 fails with:
> 
> ../src/net/ToString.cxx: In function 'std::string
> ToString(SocketAddress)': ../src/net/ToString.cxx:80:37: error: 'format'
> is not a member of 'fmt'
>    80 |                         return fmt::format("[{}]:{}", host,
>    serv);
>       |                                     ^~~~~~
> ../src/net/ToString.cxx:84:29: error: 'format' is not a member of 'fmt'
>    84 |                 return fmt::format("{}:{}", host, serv);
>       |                             ^~~~~~
> 

Hi Andreas,

what about backporting
https://github.com/MusicPlayerDaemon/MPD/commit/
88d5b5248d71862815da336cfd1c6f66626bb4d4

The patch applies cleanly to mpd-0.24.12.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
