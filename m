Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1210CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F9540F6E;
	Tue, 12 May 2026 14:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wUXB-D-Exiv; Tue, 12 May 2026 14:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E10F40E4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778595435;
	bh=8N81OzTG/VRRzlpwgNsa4eO8fcIQLHvZr2GsaSYcHgg=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i8Agcw9bAKmIQZAFs0AsuIfzyxAoDBOk9D/DqUqDwQ3TAFbhuN0IQRx9P9o/mnE8V
	 jARk947559VJXrcmzfEflSTtaY9kjLSmnaS9V2SO/0B4sLVZmcwX1hk2ciTJ0J6/8V
	 lsyXUk9VJS6x8HpImJBt7b034Q4uDUyZ8GZuXfRpZaj6t6El4cxZFcRtTLEYBDBVNV
	 pvnO2sNd9cwRM+rn2TkOP12FMZhR1xG5kJ2VrrlT0iX0W/Wcv90KujlmywZ69xkPUq
	 oHOTbEFQcY5O5WydZRlTI5UKe6YUiSy7g0BGt+syNjzgEUfm5FB7vIkYoyNuvlTui8
	 teHYwxcK9l1cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E10F40E4C;
	Tue, 12 May 2026 14:17:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81ADF223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73B4340E4C
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm3TDBb9GdFS for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45A0740E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45A0740E44
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45A0740E44
 for <buildroot@uclibc.org>; Tue, 12 May 2026 14:17:13 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wMnv3-0001wv-Nd
 for buildroot@uclibc.org; Tue, 12 May 2026 16:17:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 12 May 2026 16:16:59 +0200
Message-ID: <pan$9f6b$206c566b$c7682ce9$c6aec0d3@ID-313208.user.individual.net>
References: <20251214121359.610963-1-preyas17__13571.0177755513$1765715401$gmane$org@zohomail.in>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: bump to 4.5.2
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

Am Sun, 14 Dec 2025 12:13:59 +0000 schrieb Preyas via buildroot:

Hi Preyas,

> -LIBWEBSOCKETS_VERSION = 4.4.1
> +LIBWEBSOCKETS_VERSION = 4.5.2

this patch is superseded by various newer version bumps:
https://gitlab.com/buildroot.org/buildroot/-/commits/master/package/libwebsockets

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
