Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898A5C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 22:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25BD040922;
	Tue, 27 Dec 2022 22:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25BD040922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LneeElr0g95J; Tue, 27 Dec 2022 22:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F66440183;
	Tue, 27 Dec 2022 22:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F66440183
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 332A01BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 22:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0690581437
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 22:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0690581437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06fNPVbOjfAW for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 22:00:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BCB8141E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6BCB8141E
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 22:00:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA5F1C0004;
 Tue, 27 Dec 2022 22:00:32 +0000 (UTC)
Date: Tue, 27 Dec 2022 23:00:31 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221227230031.51c69c8f@windsurf>
In-Reply-To: <20221227213631.1751392-1-bernd.kuhls@t-online.de>
References: <20221227213631.1751392-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672178433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TODUgQvmlfSF32T/TerFmmCZEfL/0GyXlq39kb9C7GE=;
 b=IMF7yhHs1URzNSIzZoir45NBjzx+tkg4z6JHDQlBf8BQzQ34Qv1ZnI6G+YK3RVBWVKqXe8
 OK0qezYFD3jw7umLhLfGyUnEfhxmWwhhCeCzk2lkM0QUH1fOPK2Hd/Vw3rzEd2Jh5HBk7Y
 xOnLXsa5hnNiYmNK2lqcliceeq5zy7YbG83GL9zFor0nhuHqxVpuXfyiPKQ2P5920fdJfc
 iYyYhfjiLk2QxiMLSgyMWYR5PHE47JC3oO51NyrfePWhG0z7ll/E60xq6YRcAqE1E9bXGF
 TkMiy9DYs3gtOa2ujnqEv79Ib+3VFnzpY0Ux5D32WKeHovOOKRyR6fh2Pgyr6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IMF7yhHs
Subject: Re: [Buildroot] [PATCH 1/1] package/collectd: add rrdcached support
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Dec 2022 22:36:31 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The rrdcached plugin has status "supported":
> https://collectd.org/wiki/index.php/Plugin:RRDCacheD
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/collectd/Config.in   | 9 +++++++++
>  package/collectd/collectd.mk | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
