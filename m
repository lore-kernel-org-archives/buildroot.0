Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9BDF9D0E2
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A0B42B54;
	Tue, 14 Apr 2026 16:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_7xWblwAhpW; Tue, 14 Apr 2026 16:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3AA42B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776183431;
	bh=99tdggHmifiosUXaBJZO/GzPkQ47SlNTOL5bjJaKn6M=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SaRB+pHkrwlg0Br5Cud44NT66Ri7uXO8ffKEi3awZKJDn7HjwhIkSE4qYRobrjssv
	 s8IPKaCPQ9dE+tXclEY8QO4INVDcSvjDgx6dQYuY4CkSh5QxZiVXUB2VkN+Cvl/FhX
	 YgRb1WWB34pa1CAlJgPOJc38VFfYuSe9J7J3aAsys1NV4YdlzAVdSE5gqFIKB/l2lY
	 3/um2x2FA5Ha6XWIzq+Vlm5hsz5/N1I1E/64mJ0j09+LXYPw+doqBD2Tto8WVvDqeo
	 TypKg6azKkzGgpfRMPka9+p6beieZQdyPTSYXIaI7EmG5UywjyzBgSC05/cyIg2vrz
	 lhQBn7Sqr3SiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B3AA42B50;
	Tue, 14 Apr 2026 16:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2759D283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1910984D5C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeP948uUPfUK for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5675384D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5675384D5B
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5675384D5B
 for <buildroot@busybox.net>; Tue, 14 Apr 2026 16:17:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1wCgRn-0009VP-19
 for buildroot@busybox.net; Tue, 14 Apr 2026 18:17:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 14 Apr 2026 18:16:44 +0200
Message-ID: <pan$275b4$483c5d79$dc295f53$1052da1f@ID-313208.user.individual.net>
References: <69c9ed82.050a0220.14ca51.9da2__31186.3839671545$1775035586$gmane$org@mx.google.com>
 <pan$3d2ad$30902945$59cc908e$391ab514@ID-313208.user.individual.net>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] Outdated list of outdated packages,
 was: Re: [autobuild.buildroot.org] Daily results for 2026-03-29
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

Hi,

quoted some version number wrong, sorry, but the commit URLs are correct.

Am Tue, 14 Apr 2026 10:12:46 +0200 schrieb Bernd Kuhls:

> Am Mon, 30 Mar 2026 03:26:58 -0000 schrieb Buildroot Notifications:
> 
> Hi,
> 
> quoting the automated mail from March, 30th, newer mails did not make it
> through to the mailinglist yet.
> 
> It seems that outdated version numbers are used to check for updated
> packages:
> 
>> Packages having a newer version ===============================
>> 
>>              name              | found by |        link to release-
> monitoring.org         |   version    |   upstream   | orph?
>> -------------------------------+----------
> +-----------------------------------------------+--------------
> +--------------+-------
> [...]
>>                         clamav |  DISTRO  | https://release-
> monitoring.org/project/000291 | 1.5.1        | 1.5.2        |
> 
> The package was bumped to 1.5.2 on March, 4th:
> https://gitlab.com/buildroot.org/buildroot/-/commit/
> d225a6ffad8d1b1a40976f9c49a04d5db33e0c47
> 
>>                   intel-gmmlib |  DISTRO  | https://release-
> monitoring.org/project/020342 | 22.9.0       | 22.10.0      |
> 
> The package was bumped to 22.10.0 on March, 27th:
> https://gitlab.com/buildroot.org/buildroot/-/commit/
> ee1e0573435b4165f5ace58fa417d4a1a0ff5a12
> 
>>                intel-microcode |  DISTRO  | https://release-
> monitoring.org/project/020614 | 20260210-... | 20260227     |
> 
> The package was bumped to 1.5.2 on March, 6th:
> https://gitlab.com/buildroot.org/buildroot/-/commit/
> f489b40190e47ad13f2d7566abefffee8214cea0

This should read "was bumped to 20260227".

>>               intel-vpl-gpu-rt |  DISTRO  | https://release-
> monitoring.org/project/372126 | 26.1.2       | 26.1.5       |
> 
> The package was bumped to 22.10.0 on March, 27th:
> https://gitlab.com/buildroot.org/buildroot/-/commit/
> cf77be26be856adb340596081992168565580cf3

This should read "was bumped to 26.1.5".

>>                         mesa3d |  DISTRO  | https://release-
> monitoring.org/project/001970 | 26.0.0       | 26.0.3       |
>>                 mesa3d-headers |  DISTRO  | https://release-
> monitoring.org/project/001970 | 26.0.0       | 26.0.3       | ORPH
> 
> The packages were bumped to 22.10.0 on March, 18th:
> https://gitlab.com/buildroot.org/buildroot/-/commit/
> 67e982e782d069cdfc3fc25c412c68f78054c760

This should read "were bumped to 26.0.3".

> These packages are just an example, it looks like the update check as a
> whole uses an older git tree.
> 
> Regards, Bernd

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
