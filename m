Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449BCC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B7041DA2;
	Sat, 17 Sep 2022 13:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B7041DA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6pwpzK3zcMN; Sat, 17 Sep 2022 13:05:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A658F41D81;
	Sat, 17 Sep 2022 13:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A658F41D81
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE6FB1BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6AF484316
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6AF484316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3syTJF3_GB1 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:05:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A588426C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72A588426C
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:05:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C7252100002;
 Sat, 17 Sep 2022 13:05:23 +0000 (UTC)
Date: Sat, 17 Sep 2022 15:05:22 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220917150522.74595529@windsurf>
In-Reply-To: <20220915204831.1547363-1-ju.o@free.fr>
References: <20220915204831.1547363-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663419924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hGiltwSvM3mANnRcaohiuM52q6ouYkNtC1Msz3fIp8s=;
 b=fh/XTgi1hmF8zzSw4pADsoJVZNmzv+xTKO7nYgOT29gwx5Wkf3MZ4HyLCkThH6Mg/+LA4S
 Wh1bNmGdWwpof2AqVIXsMyPh+q9Un4pk0wCCZZDi8R4k4uMFBPd0byy7IVNzpS1YUX5NKk
 VLZbKiBbgBD17zSwt/Nus7gKYn+kIBStO9L4ByksshwF7/EwZKyAyNOaU2vVjUXwkLG8Xe
 7LPCP1uOcoH2CcwD6VDxgt7FTRAx2wbIl23gCaot3bJp9GA/qCwSBdX1BJuHzxOxwPzbwq
 UXQg1TnmHSxrta/+wBKAPOssjeYBl7upThEv074Le78Ky6VynOepWzkiJ44/Wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fh/XTgi1
Subject: Re: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 2.8.0
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
Cc: Steven Noonan <steven@uplinklabs.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 15 Sep 2022 22:48:31 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This commit also adds the md5 and sha1 hashes published on the project
> download page.
> 
> For change log, see:
> - https://github.com/open-mpi/hwloc/blob/hwloc-2.8.0/NEWS#L20
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/hwloc/hwloc.hash | 6 ++++--
>  package/hwloc/hwloc.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

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
