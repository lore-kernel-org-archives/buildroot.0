Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2467C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 10:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B2AC40018;
	Wed, 19 Jun 2024 10:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PppG-k4zpFWc; Wed, 19 Jun 2024 10:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE8F4010F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE8F4010F;
	Wed, 19 Jun 2024 10:34:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECBCC1BF2B5
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 10:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D992581F42
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 10:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FR5Jl0t9qanE for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 10:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7383181E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7383181E91
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7383181E91
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 10:34:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 0D4D11814B9; Wed, 19 Jun 2024 12:34:09 +0200 (CEST)
Date: Wed, 19 Jun 2024 12:34:09 +0200
To: "Peter Korsgaard" <peter@korsgaard.com>,
 "Adrian Perez de Castro" <aperez@igalia.com>
MIME-Version: 1.0
Message-ID: <1582f-6672b400-7-af99240@116839531>
User-Agent: SOGoMail 5.10.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1718793250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=tKKWZE71xaPNeGZQWWEelNQyCB55VFYiCwotmwljhoo=;
 b=VwUL/zQIpsxiAWktsmBJgMZVKBKD1cnTWUG6+onVG0W4s+aIlWfe46fwWWs0zKPZ72GhYC
 9spbyGYuCY0obBkSbB1fX2MNCDx8CGUAgFUZig3qzCY2A7lRDwchUDgrMI4WgDVDef1ZKw
 KGErZh3/5xztuY9nLogZh+sW24jlLh0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=VwUL/zQI
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_2/4=5D_package/wpewebkit=3A_secur?=
 =?utf-8?q?ity_bump_to_version_2=2E44=2E2?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Saturday, June 08, 2024 18:47 CEST, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
>  > Update to the most recent stable release of WPE WebKit. As this is a
>  > change to a newer release series, there are a few changes in the CMake
>  > build options. Dependencies mostly remain the same. The main changes
>  > are:
> 
...
> 
>  > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Committed to 2024.02.x, thanks.

this bump broke the build on ARM NEON (again). Since the gitlab issue tracker doesn't seem to notify the ML 
here is the link: https://gitlab.com/buildroot.org/buildroot/-/issues/3 

Regards,
Michael

> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
