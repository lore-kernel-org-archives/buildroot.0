Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67076C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7126A60F4D;
	Mon, 29 Jun 2026 20:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01Z2NiD9wSTH; Mon, 29 Jun 2026 20:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7732A60841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782765914;
	bh=4N4QeBJ9bfhheRH38VDqebYT2G4Y/nliZJS/IYpJqqw=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=L4MGOq06hYZUgC9wMbWShUJdICJb6Ea+SpV/sYOQG4IJY96DSGzwlLmFFjW0Gk6rD
	 A660K3UDn2fmtVByupFxD9x6Fafp7RrACLxcEibxoDB5n375GDV4whMObPYQTwCSG3
	 XXTrF68SSTJh28VX/iC6HGFV4v+jQ1Y5/tne0qpAaMPbO2zujxBE9JX0y1kBAXeu3e
	 M8+NAq+hb3r+BmrPFseL6nsFpLJZUDO3fBwe5f5FG00+byZQj2y7kuv3GixArCLTN0
	 +ecqKVmKvSfrB6Fd6PpQmhDEAvkHqNJWVAaggonj3UDyFMvLET2STE97QhMQkMZg90
	 m6s68wbP8QCIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7732A60841;
	Mon, 29 Jun 2026 20:45:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F5C2F3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8551B60730
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UoG-SSfonKrL for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 20:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D87CC60841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87CC60841
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D87CC60841
 for <buildroot@uclibc.org>; Mon, 29 Jun 2026 20:45:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1weIqp-0003A4-Fj
 for buildroot@uclibc.org; Mon, 29 Jun 2026 22:45:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 29 Jun 2026 22:44:52 +0200
Message-ID: <pan$490ec$abd6358e$72d9a434$58d2a609@ID-313208.user.individual.net>
References: <20260627064155.1938273-1-bernd@kuhls.net>
 <c145e709-580f-447e-99c3-03bab062cf7f__16883.8836414338$1782762233$gmane$org@smile.fr>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/2] package/gcc: bump 15.x series to 15.3.0
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

Am Mon, 29 Jun 2026 21:43:13 +0200 schrieb Romain Naour via buildroot:

>> Removed patches which are included in this release,
>> renumbered patch 0003.
>> 
>> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
> Series applied to master. Thanks.
> 
> Best regards,
> Romain

Hi Romain,

https://patchwork.ozlabs.org/project/buildroot/patch/
20260627064155.1938273-1-bernd@kuhls.net/

contains two renames:

 rename package/gcc/{15.2.0 => 15.3.0}/0001-disable-split-stack-for-non-
thread-builds.patch (100%)

 rename package/gcc/{15.2.0/0003-gcc-config-microblaze-fix-ira-for-
GCC15.patch => 15.3.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch} 
(100%)

Both of them were not applied with your commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/
f8f6bcec0f523510a22882e4391999be81dc0e94

The directory package/gcc/15.3.0/ does not even exist and the buildroot 
pipelines are failing:
https://gitlab.com/buildroot.org/buildroot/-/jobs/15090816570

.checkpackageignore:353: ignored file package/gcc/15.3.0/0001-disable-
split-stack-for-non-thread-builds.patch is missing

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
