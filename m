Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44116CA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 06:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C894581589;
	Fri,  5 Sep 2025 06:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0hE2LyJ_GeB; Fri,  5 Sep 2025 06:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C5F815D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C5F815D8;
	Fri,  5 Sep 2025 06:58:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58BBEB69
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB66404B7
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyrvxUlUkai6 for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 06:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67D8B404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67D8B404B6
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67D8B404B6
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 06:57:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 325EE1814B9; Fri,  5 Sep 2025 08:57:55 +0200 (CEST)
In-Reply-To: <20250904195812.3259342-4-buildroot@heine.tech>
References: <20250904195812.3259342-2-buildroot@heine.tech>
 <20250904195812.3259342-4-buildroot@heine.tech>
Date: Fri, 05 Sep 2025 08:57:54 +0200
To: "Michael Nosthoff" <buildroot@heine.tech>
MIME-Version: 1.0
Message-ID: <37fc7-68ba8a00-1-55ead080@39074653>
User-Agent: SOGoMail 5.12.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1757055475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=a0YXaEnxA6qEe30JCE63/kdZtTTgFI1TRDAfvEoPZ24=;
 b=dhuCOhLGgYAVTLwMXPtKoCGw7LKpssGSdeAvrlvErWQyFaGdHzDH8YEIEiAYoXLTovsmlr
 hH5Sn1FQDR0F481Pmd1QghW802RRTLj3Lrw8EZ0HJ0XPuPPnLPm6cwrt4ePveNvoLpfAVv
 7BNr7ca3FGrvgTx9JI9Sa/5LazjPlPc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=dhuCOhLG
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v2_2/2=5D_package/boost=3A_remove?=
 =?utf-8?q?_dependencies_on_Boost=2ESystem?=
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Forgot the Changelog...

> Boost.System is a header only library since Boost 1.69.0 [0].
> 
> A Stub Library remained for backward compatibility. This
> mainly affects CMake Packages that use FindPackage and
> explicitly list 'system'.
> 
> For Boost internal modules this is not the case so remove this
> dependency.
> 
> Buildroot packages should select BR2_PACKAGE_BOOST_SYSTEM explicitly
> if needed and not rely on a proxy dependency from other boost packages.
> 
> [0] https://github.com/boostorg/system/blob/develop/doc/system/changes.adoc#changes-in-boost-169
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
v1 -> v2:
- change wording of Boost.System Helptext to better reflect its current functionality and discourage
   people from selecting it if not really necessary.
- split off patch for libcpprestsdk which is the only package that needed the dependency added
- all other packages contain the dependency on BOOST_SYSTEM or don't need it.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
