Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C901C4320A
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 07:31:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9CE60EFE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 07:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC9CE60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tudorholton.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ED01406DC;
	Wed, 25 Aug 2021 07:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZ3L4g152QPG; Wed, 25 Aug 2021 07:30:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C905A406DE;
	Wed, 25 Aug 2021 07:30:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 530E31BF5D7
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 07:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41EAA406DE
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 07:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUtmSXy7Yta0 for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 07:30:48 +0000 (UTC)
X-Greylist: delayed 00:22:24 by SQLgrey-1.8.0
Received: from webhost.tudorholton.net (webhost.tudorholton.net [27.50.73.94])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88700406DC
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=tudorholton.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2U7TreGJH3UTvV9IeC0ZAaEX6+MthgW9I4rzO06/Smg=; b=rmWP8R6mdV3agLQZvO6kn1MFLp
 6f28jRRCYJKQioTNv0QVwe7xFc/bdWQCTHyqOpLTjZgGBhCjpabJesNgdtI4PCyEHcbAeLnN8pMOR
 Mef82KtCmKYBEVwIL7wLf0dWiuZwcn8ZULsYzpaVPb3bahsxkmqTuujXnDOipg83ohqjreAuqL9Gh
 cyNXB9XKkz/jYyiCmuPCYRKKmYNcJZ4P6i48sEUypyW/keyptn1SICOGSjx3n9Z9k33HCTMQKhOUD
 GpKWGZqX9Vz4tOHeQwBHOwWtnEbZT2OHHvi/PEX46CqDV1GEnJD88/4gIrbp9yRiB0NbRSk7EDE3f
 k+oFYtcQ==;
Received: from [::1] (port=33708 helo=webhost.tudorholton.net)
 by webhost.tudorholton.net with esmtpa (Exim 4.94.2)
 (envelope-from <tudor@tudorholton.com>) id 1mIn1I-0008VN-Om
 for buildroot@buildroot.org; Wed, 25 Aug 2021 17:08:21 +1000
MIME-Version: 1.0
Date: Wed, 25 Aug 2021 17:08:16 +1000
From: Tudor Holton <tudor@tudorholton.com>
To: buildroot@buildroot.org
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f2ac08f597a5b80bb2b2aa9ea554b952@tudorholton.com>
X-Sender: tudor@tudorholton.com
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - webhost.tudorholton.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tudorholton.com
X-Get-Message-Sender-Via: webhost.tudorholton.net: authenticated_id:
 tudor@tudorholton.com
X-Authenticated-Sender: webhost.tudorholton.net: tudor@tudorholton.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [Buildroot] Package to manage multiple buildroot filesystem
 "versions"?
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi all,

I understand that buildroot is for building root filesystems and not 
really outside that, but...

Is there a package that can manage the partition layout, and buildroot 
filesystem "versions", for upgrade and fallback?

For example, something like:

1) During build, allocate space for 2 or more partitions, the first 
partition is the running buildroot filesystem
2) When the buildroot filesystem is running, download a newer version of 
the filesystem, verify it, and dd it to the second partition
3) Tell grub/EFI to boot the newer partition and reboot
BUT
4a) It doesn't complete the startup for some reason (like there's a 
kernel panic, or something doesn't start properly triggering the 
watchdog)
SO
5a) It reboots again, calling the previous version (e.g. using grub 
fallback or fallback.efi)
OR
4b) It does complete the startup, but some important service doesn't 
work (like it can't connect to the internet) so we presume we need to 
roll back
5B) It rolls back to the previous version with some kind of failure flag 
to tell the server that it failed the upgrade

I can see that this could be fairly easily written, but I was wondering 
if there was a buildroot package or environment that does this kind of 
behaviour already?

Cheers,
Tudor.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
