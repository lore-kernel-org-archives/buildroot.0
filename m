Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F6C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 15:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53817820BD;
	Wed, 10 Jul 2024 15:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BO6HDHmjl9pg; Wed, 10 Jul 2024 15:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 579428209C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 579428209C;
	Wed, 10 Jul 2024 15:42:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9351BF5A7
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0881C4156D
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 15:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saP2H6gLWwZD for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 15:42:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D92544156C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92544156C
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D92544156C
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 15:42:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 6F9171814B9; Wed, 10 Jul 2024 17:42:28 +0200 (CEST)
In-Reply-To: <20240710163928.4fd390b1@windsurf>
References: <20240710081348.60978-1-buildroot@heine.tech>
 <20240710104842.16dbf85c@windsurf>
 <25518-668e5180-5-147108a0@236288521> <20240710163928.4fd390b1@windsurf>
Date: Wed, 10 Jul 2024 17:42:28 +0200
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <27bb6-668eac00-5-6e811900@44543821>
User-Agent: SOGoMail 5.10.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720626149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LfFs2cSmL7hVg36dSaMpX6UyPJ/F2R175xQUycZWjUQ=;
 b=A29hHZcAv6dRHu7Lsikn0fPpI+KtNvBjiGGY749q9xqUhVmxMI4yas4KfT3WXolDEVVhkS
 SH57SOuwfqo4Cr1U4/bw0bSdYE+D82qgC+9+WcDQEblkbPs2ltYHIsluh8MUJFsPrgEVT1
 InKKqS79cyngaDCzuLORJ9/iKsUuxsc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=A29hHZcA
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/sqlitecpp=3A_new_packa?=
 =?utf-8?q?ge?=
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all,

On Wednesday, July 10, 2024 16:39 CEST, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> On Wed, 10 Jul 2024 11:16:24 +0200
> "Michael Nosthoff" <buildroot@heine.tech> wrote:
> 
> > One additional thing: This library requires C++11, I think all compilers we have currently in buildroot should
> > be recent enough to support it. Or do we need a gcc version check here as well?
> 
> We need a gcc version check. Which version depends on which C++11
> features are used. Some packages need gcc 4.7, some gcc 4.8, some gcc
> 4.9:

then I will prepare a patch for this package.
> 
> package/cli11/Config.in:        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> package/clpeak/Config.in:       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> package/cutelyst/Config.in:     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> package/docopt-cpp/Config.in:   depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> package/edid-decode/Config.in:  depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> package/efl/Config.in:  depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
> etc.
> 
> some even need gcc 5.x:
> 
> package/qt5/Config.in:  depends on BR2_HOST_GCC_AT_LEAST_5 # Full C++11
> 
> > Related: I'm currently looking at bumping boost. And in the last versions many libs dropped their support for C++98.
> > So if we could just rely on the availability of C++11 this would make this much easier.
> 
> If that also requires a gcc version dependency, then we would have to
> add it to Boost, and then to all its reverse dependencies:
> 

that's what I feared. Do you have some advice on how to test with gcc 4.7/4.7/4.9? The oldest toolchain on bootlin I can find is gcc 5.4. 
Is there any other toolchain located somewhere with an older gcc?

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
