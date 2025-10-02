Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4049CCAC5B0
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC3F360775;
	Thu,  2 Oct 2025 20:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTSh_P8i8_3V; Thu,  2 Oct 2025 20:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79853605F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79853605F9;
	Thu,  2 Oct 2025 20:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC25313D
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B31404008E
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 20:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IF1tG5FiIDHt for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 20:03:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4C2D40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C2D40027
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4C2D40027
 for <buildroot@uclibc.org>; Thu,  2 Oct 2025 20:03:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1v4PW9-0004yb-J7
 for buildroot@uclibc.org; Thu, 02 Oct 2025 22:03:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 02 Oct 2025 22:02:40 +0200
Message-ID: <pan$1e7f2$c3655136$95871487$1ddb6788@ID-313208.user.individual.net>
References: <20250907133721.3416326-1-thomas.petazzoni@bootlin.com>
 <20250907133721.3416326-2-thomas.petazzoni__47588.6778601975$1757252265$gmane$org@bootlin.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/6] package/linphone: remove package
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

Am Sun,  7 Sep 2025 15:37:12 +0200 schrieb Thomas Petazzoni via buildroot:

> This package is no longer maintained in Buildroot: no maintainer in
> DEVELOPERS file, and doesn't build since we bumped mbedtls to version
> 3.x in commit 3481a9643fc7223e400ed877f08ade34d44e6b78, which first
> appeared in 2025.05.
> 
> Also, upstream linphone has changed their strategy, and now their
> specific dependencies (bctoolbox, belle-sip, etc.) are bundled in
> linphone, so anyway the packaging needs to be adapted significantly.
> 
> Signed-off-by: Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>

Reviewed-by: Bernd Kuhls <bernd@kuhls.net>
(the linphone chain would also block the ffmpeg 8.0 bump)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
