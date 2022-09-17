Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B195ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CEF60B19;
	Sat, 17 Sep 2022 19:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05CEF60B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YzP55hYuuYj; Sat, 17 Sep 2022 19:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31ED460AC0;
	Sat, 17 Sep 2022 19:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31ED460AC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9ECF1BF267
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 781B1843F0
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 19:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 781B1843F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cju37AxPXNol for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 19:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9DB843EF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C9DB843EF
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 19:51:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2F8AE0006;
 Sat, 17 Sep 2022 19:51:14 +0000 (UTC)
Date: Sat, 17 Sep 2022 21:51:13 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917215113.76952338@windsurf>
In-Reply-To: <20220917161650.15857-1-fontaine.fabrice@gmail.com>
References: <20220917161650.15857-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663444275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ju+XwyiZwau+dNe/VQcNU6nuBeEr3hDWQ2wqFru3epc=;
 b=R/zW+5zE2DNrs2tuyCHQg1dKjg4pdR7yeLkZH5HNcF1coNssCoGU4H+kLxX0c+IEdVTu+Z
 IY/Zv7GHWGkGrXq1j3/HG5wCdxjbtoqRsblovgfON/yHU1HCb8i4/zrhfzTziaSBlHuPS2
 XkOH9VqwMXKhecKTED+fOfVoZu35Dln/zT6PIzZZ2QYrBD58EnTIEKmFNJc1PCbDao2UyL
 sjzNC+UMZSPtyEHVCKj7blzKXkdGZx6BH07bxdACSipHYxW7jHRHmCuqpT7xpeavxhY98W
 Bs0dlVnA9+SZrQeB1E6dIOa3cz1mbuyzN5vn2p6fBMAsN05xkw85LWZ2BhLqEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R/zW+5zE
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: fix build with sh4{a, eb,
 aeb}
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 18:16:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with sh4{a,eb,aeb} probably raised since
> the addition of the package in commit
> e43da7bb32285bbd41b38a379aef77132d149df7:
> 
>   ERROR: Unknown or unidentifiable processor "sh4a"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fb6885a8a299f20ed77e4c10b330d2a2a7853931
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-Add-superh-alias-needed-by-Debian.patch | 22 ++++++++++++++
>  ...-data-arch-superh.txt-add-sh4-eb-aeb.patch | 30 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 package/botan/0001-Add-superh-alias-needed-by-Debian.patch
>  create mode 100644 package/botan/0002-src-build-data-arch-superh.txt-add-sh4-eb-aeb.patch

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
