Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C75CA5531
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 09:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 790E260FFF;
	Wed, 13 Sep 2023 09:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 790E260FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNA8lJqAGPc2; Wed, 13 Sep 2023 09:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCEDE60FC9;
	Wed, 13 Sep 2023 09:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCEDE60FC9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5901BF847
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 09:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6804782215
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 09:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6804782215
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuZwTQdxltoE for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 09:45:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5443C821B3
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 09:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5443C821B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AF1520011;
 Wed, 13 Sep 2023 09:45:48 +0000 (UTC)
Date: Wed, 13 Sep 2023 11:45:48 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230913114548.027eb2a8@windsurf>
In-Reply-To: <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <a55c91fd6ba2fdefaf885d631c6a74eb69fb81a1.1694556946.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694598349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JfDxvfjbEpGWDnZ6u8w0igl7XhNi8kZRUV5byQqx8E=;
 b=CD0BvymAxZTHKBGefD/GMUDDefoE69cqIYXxgXe/auILFfcIdlF2eCJg9ut3wwDQryjYE7
 iflJ/YRDiFgrEVQMnsH1yANJBjm7HueLYRU66gWBomqwQo2td/gmlk+dCuMZslYhvgAyAl
 KnzOmhgEPwCZIXJ19RsoMkTOxwp7UlGOnXGCX3auXZR3OWAALVwMPxOjb3eYkKQUlWRK8C
 8fEdyS4IWeshMRNkFUgnoQFiQQA/NyY5PpzZSDpEiz+U61SG5PCAifFUzk7Cx0GSQnRPbg
 aiLcA4otvtJS1jMxC3a/D2h4UmecYjniZzdjjYHYdyW3W5VbBXxTASriuvFnQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CD0BvymA
Subject: Re: [Buildroot] [PATCH 1/5] package/qt5: fix upstream git trees
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Sep 2023 00:15:48 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since commits 4e8b5f9bee9c [0], 6cfbd51d98d1 [1], and d838a416c4ed [2],
> the repository we clone from is the cgit browser, and it does not serve
> the git tree, only the browser:
> 
>     $ git clone https://code.qt.io/cgit/qt/qtcoap.git
>     Cloning into 'qtcoap'...
>     fatal: repository 'https://code.qt.io/cgit/qt/qtcoap.git/' not found
> 
> Browsing there displays the cgit UI, which gives a proper URI to clone
> from; switch to using that.
> 
> [0] 4e8b5f9bee9c package/qt5/qt5mqtt: bump version to 5.15.2 (and fix download)
> [1] 6cfbd51d98d1 package/qt5/qt5coap: bump version to 5.15.2 (and fix download)
> [2] d838a416c4ed package/qt5/qt5knx: bump version to 5.15.2 (and fix download)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> CC: Julien Corjon <corjon.j@ecagroup.com>

So how does it work today? It falls back to sources.buildroot.org?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
