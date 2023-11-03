Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D75CC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A07782317;
	Fri,  3 Nov 2023 20:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A07782317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6__zmVH7O4p; Fri,  3 Nov 2023 20:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61BD582311;
	Fri,  3 Nov 2023 20:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61BD582311
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B95481BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 920C760B55
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 920C760B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7GhR1bDQPy1 for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:54:41 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27EA560B05
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27EA560B05
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 699B41814B9; Fri,  3 Nov 2023 21:54:36 +0100 (CET)
In-Reply-To: <20231103203142.6390a8ab@windsurf>
Date: Fri, 03 Nov 2023 21:54:36 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <cea90-65455e00-5-5da7b380@110096893>
User-Agent: SOGoMail 5.9.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1699044878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=KFVvittMoQe2r62IKLXqFAquXoWiqF7HB18DeP9Zsuk=;
 b=NTP0aXKstYKgwfuXANKrtGnW3B02i4IsrOJAu+ZyxGlDw7IxVOdHWFamHWO9VSwMUh2ZGV
 2Y3nSQIvTEPOgTH+VyC2Bnv3HPvTTxvYmv7icNiTFmkgj0Y5LZsAaC2T8e/iqK/6JDxgeQ
 cPo/0OeWto9I5AJziJqDh+Vv7FnhAYQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=NTP0aXKs
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/websocketpp=3A__fix_bu?=
 =?utf-8?q?ild_with_C++20?=
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
Cc: Ryan Barnett <ryan.barnett@collins.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Friday, November 03, 2023 20:31 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri,  3 Nov 2023 12:16:12 +0100
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 

> 
> Since there are no autobuilder failures for this, could you provide a
> defconfig that reproduces the build issue?

Since this is a Header Only Lib and we only have one other package
depending on it I don't think there is a defconfig which provokes this.

I stumbled across this issue when I started bumping an internal project
to C++20. This issue triggered quite some bug reports in the project [0] and
there are backports to other package managers like vcpkg [1] and
conan [2].

So, as buildroot is in this case also more or less acting like a package manager
when generating the SDK I thought it makes sense to apply this patch here as well.

Regards,
Michael

[0] https://github.com/zaphoyd/websocketpp/pull/1060
[1] https://github.com/microsoft/vcpkg/pull/23669
[2] https://github.com/conan-io/conan-center-index/pull/15295

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
