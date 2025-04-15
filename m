Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE28C369B4
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 09:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24F740E0A;
	Tue, 15 Apr 2025 09:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcLS5pKR3rB7; Tue, 15 Apr 2025 09:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175EE40DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 175EE40DBF;
	Tue, 15 Apr 2025 09:56:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A7B108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F251140CB1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsigHPmmcg1J for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 09:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A09B40D12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A09B40D12
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A09B40D12
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 09:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id CF2751814B9; Tue, 15 Apr 2025 11:56:43 +0200 (CEST)
In-Reply-To: <7fec02abce143ebc20b3656c6cdcdf803c7dd760.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <7fec02abce143ebc20b3656c6cdcdf803c7dd760.1744229017.git.yann.morin.1998@free.fr>
Date: Tue, 15 Apr 2025 11:56:43 +0200
Cc: buildroot@buildroot.org
To: =?utf-8?q?Yann_E=2E_MORIN?= <yann.morin.1998@free.fr>
MIME-Version: 1.0
Message-ID: <56bc8-67fe2d80-1-26168cc0@111660538>
User-Agent: SOGoMail 5.11.2
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1744711003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TUGjlPleJ8ngzZWhP0SlPRqXqRcc5VRQ6/V+A5409ig=;
 b=PjiRO5WjBuyArWlJwKrX/WccOOedXqHcXMKwXXbbQ1ekbo2GeMASvzsur4N9ma2RaotA24
 zHmna1Ik15pEqzuwj3TfM2lIXAKOlSfxmGswQ08LpYP9rxe/7pcsA7sZ2DuGcqEhKqQ30+
 qirDlaEgeleaoS6jm+SBGNAZm1W+d58=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=PjiRO5Wj
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_23/29_v2=5D_package/boost=3A_bump?=
 =?utf-8?q?_to_version_1=2E87=2E0?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Wednesday, April 09, 2025 22:03 CEST, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

Great that you took the time to clean up the boost package and bump it.

I had the bumping on my list for some time now but didn't manage to finish it due to the many C++03 deprecations in the last releases.
I discovered some issues with some boost internal dependencies. Especially troublesome was using a gcc < 6.0 where C++11 is not
set as default mode and the package pulling in the header dependency that required C++11 wasn't setting C++11 mode.

As I don't see any new BR2_TOOLCHAIN_GCC_AT_LEAST_* lines in the patch I assume you didn't look at this?

Here my list of packages that now require a newer C++ version (taken from the release notes):

now requiring C++11:
- asio
- atomic
- bind
- chrono
- crc
- filesystem
- format
- function
- log
- optional
- random
- ratio
- smartptr
- stacktrace
- system
- test
- thread
- typeindex
- typeof
- uuid
- variant

now requiring C++14:
- graph
- heap
- lockfree

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
