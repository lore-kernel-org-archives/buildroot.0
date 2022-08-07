Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40E4C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A0284056A;
	Sun,  7 Aug 2022 17:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0284056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id so9jx53fqZot; Sun,  7 Aug 2022 17:55:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF6AB40377;
	Sun,  7 Aug 2022 17:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF6AB40377
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB561BF3D6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 198F960B38
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 198F960B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2J0ku_qdBSk for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:55:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B69D260B2E
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B69D260B2E
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:55:12 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id A823A240026
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 19:55:09 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4M16Rw2ZDrz9rxW;
 Sun,  7 Aug 2022 19:55:08 +0200 (CEST)
From: Dominik Michael Rauh <dmrauh@posteo.de>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 17:55:02 +0000
Message-Id: <20220807175502.4678-1-dmrauh@posteo.de>
In-Reply-To: <20220807143936.3f3e0898@windsurf>
References: <20220807143936.3f3e0898@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1659894909; bh=bkX+Qr7b3D3OeGkiBn2RkznKjGvMEoYaHlZag8wGtPo=;
 h=From:To:Cc:Subject:Date:From;
 b=pyKXbOq4vcgJ2HxZEPH7g+hdbWcKFECZotzMSa45nLrwHGFk4jjhksB+yq0+tui3Q
 2jZ94lj619nY5ieNryr9FOWHPX6HbS5q7+kBD8cO31MkWZB6o0+ZRMpudH6DHNgWJG
 ZlVXGPKrHyIbQqNlaCTe6alBKAcZQ2mT2bsaFT+fUvVZXZRD1rs9MMh19celT7oUsL
 Raq38IPrhJRW7UJBIyUS11XYfTsIddncwmdJY25xbmHt4kn7GnbBOfErbGNNWxWe/C
 mNJKvV3V5dLGyrbnBFEsDUmzDGCmx8vdOYdLpTqapyOkhD4WKOr8bJU5/vI5msbivT
 gQeFFBumlfdPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.a=rsa-sha256 header.s=2017 header.b=pyKXbOq4
Subject: Re: [Buildroot] [PATCH v3] package/ccache: bump version to 4.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: anders.f.bjorklund@gmail.com, andrew.smirnov@gmail.com,
 s.martin49@gmail.com, dmrauh@posteo.de, thomas.petazzoni@bootlin.com,
 fontaine.fabrice@gmail.com, thomas.de_schampheleire@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> A possible alternative we could explore is to no longer build ccache
> ourselves and rely on ccache being provided by the host distribution.
> Of course, raises the question of which ccache version is available on
> the host, and how to tweak its configuration to match the needs of
> Buildroot.

Another option that comes to mind, is to detect whether ccache is already
installed on the host and use that until Buildroot's ccache can take over.

Best regards,
Dominik
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
