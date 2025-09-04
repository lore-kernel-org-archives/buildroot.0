Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB0CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 19:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BAB66071F;
	Thu,  4 Sep 2025 19:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VweCTtO_IY5q; Thu,  4 Sep 2025 19:52:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2612760722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2612760722;
	Thu,  4 Sep 2025 19:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E648D1E04
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC24D809CB
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nri5iXzgTE6O for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 19:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D00B4809C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00B4809C1
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D00B4809C1
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id C6ABB1814B9; Thu,  4 Sep 2025 21:52:00 +0200 (CEST)
In-Reply-To: <20250903213428.5740c712@windsurf>
References: <20250903133754.1781943-2-buildroot@heine.tech>
 <20250903213428.5740c712@windsurf>
Date: Thu, 04 Sep 2025 21:52:00 +0200
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <35281-68b9ee00-5-70e30080@92065202>
User-Agent: SOGoMail 5.12.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1757015520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=g+arMoWXwcWirnWKcWSSyEL3F4YoCuSzhPch1ZK7VQg=;
 b=TXQPJKx8YREyHfqenzx6EEf3wwU3qS5RxqV26JCmCtVc4gJ0bcfZxAIqL2BIKGZawg/HrR
 b11DndZYHf3MniGHnsyey7E3euLGKIap1xH5/RVF/jYklWUV1zbsnGLDvqe9POpLfKhj2m
 M+K6BO3w4f5SbfWV0Vm14Na9Hls9ppY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=TXQPJKx8
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/boost=3A_remove_depend?=
 =?utf-8?q?encies_on_Boost=2ESystem?=
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
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Wednesday, September 03, 2025 21:34 CEST, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> On Wed,  3 Sep 2025 15:37:52 +0200
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > Boost.System is a header only library since Boost 1.69.0 [0].
> > 
> > A Stub Library remained for backward compatibility. This
> > mainly affects CMake Packages that use FindPackage and
> > explicitly list 'system'.
> > 
> > For Boost internal modules this is not the case so remove this
> > dependency.
> > 
> > Buildroot packages should select BR2_PACKAGE_BOOST_SYSTEM explicitly
> > if needed and not rely on a proxy dependency from other boost packages.
> > 
> > [0] https://github.com/boostorg/system/blob/develop/doc/system/changes.adoc#changes-in-boost-169
> 
> Thanks for the patch. It's great to have someone understanding the
> dependencies between the different Boost modules, because they are not
> obvious, and not easy to maintain, so thanks a lot.
> 

The boost guys are currently working on better modularization support. So at least now each
boost subproject has a dependency list in its build.jam file which helps a lot.
e.g., https://github.com/boostorg/json/blob/develop/build.jam

> Since this has the potential for breaking stuff quite a bit for
> packages that depend on Boost, how much testing did you do (build
> testing) ? I see your patch fixes package/libcpprestsdk, but is it the
> only package affected?

I checked all packages that depend on at least one of the boost modules
where I removed the Boost.System dependency. Only two don't explicitly
select BOOST_SYSTEM. libcpprestsdk nedded it so I fixed it. The other one
is log4cxx which really doesn't depends on it in it's CMakeLists.

> 
> Note that the fix of package/libcpprestsdk and other packages could be
> done as a separate, preliminary patch.

I will split them and resubmit.

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
