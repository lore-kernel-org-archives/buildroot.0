Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87851C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 07:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12A208124C;
	Mon, 20 Feb 2023 07:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A208124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUMyO2a6h5dQ; Mon, 20 Feb 2023 07:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C4C681099;
	Mon, 20 Feb 2023 07:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C4C681099
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 067751BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 07:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1406102E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 07:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1406102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DH-NC6Hy44CZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 07:48:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 951856103E
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 951856103E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 07:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 939B61814B9; Mon, 20 Feb 2023 08:48:06 +0100 (CET)
In-Reply-To: <20230219220217.6b34a65f@windsurf>
Date: Mon, 20 Feb 2023 08:48:06 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <10dac5-63f32580-3-1c9b7240@22476584>
User-Agent: SOGoMail 5.8.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1676879287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=3ntR9wcKjtgb9o30H/SDLZCOX7UWCBFRwciDxW1xxkM=;
 b=rsSupaP1VpRnjwFcqRVVTTMh7nmKKSuvq172qWivd16hsm1H0Hp9hIFZDX97n3i2SPCJHM
 XMsTYwMJf5fkSAqW5zYjIKRd5JMT+uwibwRM3HH8yf6Tg0/rYrZTJ5UY8pzkf61YbmYLVg
 g6T3c+qwpmEt5jb42/3OuilD3FoxJy4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=rsSupaP1
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_packge/libabseil-cpp=3A_bump_t?=
 =?utf-8?q?o_version_20230125=2E0?=
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
Cc: Robert Rose <robertroyrose@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Sunday, February 19, 2023 22:02 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> On Sat, 18 Feb 2023 12:48:37 +0100
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > libabseil now depends on c++14 and gcc >= 7.3.1 [0][1]
> > 
> > [0] https://github.com/abseil/abseil-cpp/releases/tag/20230125.0
> > [1] https://github.com/google/oss-policies-info/blob/main/foundational-cxx-support-matrix.md
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> > ---
> > 
> > Note:
> > I'm not sure if the BR2_TOOLCHAIN_GCC_AT_LEAST_7 dependency is sufficient.
> > But I don't think we have a more version specific Flag available?
> 
> We don't have more specific blind options than 7.x, 8.x, etc. to
> describe a gcc dependency.
> 
> >  package/grpc/Config.in                   | 6 +++---
> >  package/libabseil-cpp/Config.in          | 6 +++---
> >  package/libabseil-cpp/libabseil-cpp.hash | 2 +-
> >  package/libabseil-cpp/libabseil-cpp.mk   | 6 +++---
> >  4 files changed, 10 insertions(+), 10 deletions(-)
> 
> I'm afraid this is not sufficient. Indeed, you need to look at the
> reverse dependencies of GRPC for example.
> 
> So, package/falcosecurity-libs needs to be adjusted, then
> package/sysdig as well, and also the BR2_PACKAGE_COLLECTD_GRPC option
> from package/collectd.
> 

good point. since grpc now also only has "officially support for gcc 7.3+" I would then first bump grpc with all it dependencies and then resubmit this patch.

https://github.com/grpc/grpc/blob/master/src/cpp/README.md

> Could you have a look into this, and submit an updated version?
> 
> Thanks a lot!
> 
> Thomas

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
