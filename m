Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7B2ED7B82
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 08:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4304484C67;
	Tue, 14 Apr 2026 08:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hF0DOziJ1gYB; Tue, 14 Apr 2026 08:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7868C84C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776154393;
	bh=8FsNoszG0I6stdkJhw1DfnAwSS2MK3h/NBVEMc4B7lg=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CCdoi7D0V+Zhv4b216HL2hgVsVf8aKC85IKbaL16bzauFE3l7L1zyca16A5jgCwXt
	 NVcasuzbt4zVNh3lRwtBiAbydTRerlpRMsFxQ5I2oepkqasHtYPAkWccBRG7P0WAjU
	 9b1u4GcO5xEylqA4/z7WYJTCjpTRANYo1STItoD4cGN+wFbaQ0tkkp1pJXHKyErur8
	 SKK5BJuQT+B6NvYeyYdupVi51IMkjZTe10QiqEL7g6+UDIKYLPx6gzsWGfR6+MV49E
	 dAWAavM/7uwPewj+OI1AfDWAXtQ+YBtLWvWx2bkcZIggJUfolVN/yzb9+ySVj1KS87
	 zZFbDiNpQZM/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7868C84C63;
	Tue, 14 Apr 2026 08:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD40375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD8584C63
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAY7FK4cVa9v for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 08:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E80A684C62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E80A684C62
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E80A684C62
 for <buildroot@uclibc.org>; Tue, 14 Apr 2026 08:13:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wCYtP-00038c-RL
 for buildroot@uclibc.org; Tue, 14 Apr 2026 10:13:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 14 Apr 2026 10:12:46 +0200
Message-ID: <pan$3d2ad$30902945$59cc908e$391ab514@ID-313208.user.individual.net>
References: <69c9ed82.050a0220.14ca51.9da2__31186.3839671545$1775035586$gmane$org@mx.google.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: [Buildroot] Outdated list of outdated packages,
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

Am Mon, 30 Mar 2026 03:26:58 -0000 schrieb Buildroot Notifications:

Hi,

quoting the automated mail from March, 30th, newer mails did not make it 
through to the mailinglist yet.

It seems that outdated version numbers are used to check for updated 
packages:

> Packages having a newer version
> ===============================
> 
>              name              | found by |        link to release-
monitoring.org         |   version    |   upstream   | orph?
> -------------------------------+----------
+-----------------------------------------------+--------------
+--------------+-------
[...]
>                         clamav |  DISTRO  | https://release-
monitoring.org/project/000291 | 1.5.1        | 1.5.2        |     

The package was bumped to 1.5.2 on March, 4th:
https://gitlab.com/buildroot.org/buildroot/-/commit/
d225a6ffad8d1b1a40976f9c49a04d5db33e0c47

>                   intel-gmmlib |  DISTRO  | https://release-
monitoring.org/project/020342 | 22.9.0       | 22.10.0      |     

The package was bumped to 22.10.0 on March, 27th:
https://gitlab.com/buildroot.org/buildroot/-/commit/
ee1e0573435b4165f5ace58fa417d4a1a0ff5a12

>                intel-microcode |  DISTRO  | https://release-
monitoring.org/project/020614 | 20260210-... | 20260227     |     

The package was bumped to 1.5.2 on March, 6th:
https://gitlab.com/buildroot.org/buildroot/-/commit/
f489b40190e47ad13f2d7566abefffee8214cea0

>               intel-vpl-gpu-rt |  DISTRO  | https://release-
monitoring.org/project/372126 | 26.1.2       | 26.1.5       |     

The package was bumped to 22.10.0 on March, 27th:
https://gitlab.com/buildroot.org/buildroot/-/commit/
cf77be26be856adb340596081992168565580cf3

>                         mesa3d |  DISTRO  | https://release-
monitoring.org/project/001970 | 26.0.0       | 26.0.3       |     
>                 mesa3d-headers |  DISTRO  | https://release-
monitoring.org/project/001970 | 26.0.0       | 26.0.3       | ORPH

The packages were bumped to 22.10.0 on March, 18th:
https://gitlab.com/buildroot.org/buildroot/-/commit/
67e982e782d069cdfc3fc25c412c68f78054c760

These packages are just an example, it looks like the update check as a 
whole uses an older git tree.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
