Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E06C07E9D
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 07:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A2C141010;
	Thu, 29 Sep 2022 07:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2C141010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BzkNjkZnm2ij; Thu, 29 Sep 2022 07:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C5DA40FBF;
	Thu, 29 Sep 2022 07:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C5DA40FBF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B08571BF3E1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 07:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A31F419DA
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 07:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A31F419DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7TuNVcfo_AZ for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 07:01:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07D7419CD
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B07D7419CD
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 07:01:34 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 6DFE1BDE015B;
 Thu, 29 Sep 2022 08:54:40 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 29 Sep 2022 06:54:40 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Debananda Pal <debananda.pal@gmail.com>
In-Reply-To: <mailman.24588.1664375477.204281.buildroot@buildroot.org>
References: <mailman.24588.1664375477.204281.buildroot@buildroot.org>
Message-ID: <2600a9f572a4747ad50603a985e850b6@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] help needed to upgrade libglib2 on Buildroot
 2012.02-rc2-00001
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Debananda,

On 2022-09-28 14:13, Debananda Pal wrote:

> Hi Buildroot Team,
> 
> I am new in buildroot compilation.
> We are trying to upgrade openvmtools to latest version and found there 
> is a
> dependency to update libglib2 and libffi.

You might consider migrating your Buildroot environment. Maybe not to 
the latest version, but to the last that satisfies most of your 
requirements regarding compiler /kernel headers /software package 
versions. 2019.02 might be a starting point.

Stick to the minimum requirements, and do not try to upgrade libglib2 
and libffi to the latest versions.

> I am trying to build openvmtools 12.1.0-20219665 source.
> While upgrading openvmtools, I found that libglib2 version should be 
> more
> than 2.34.0.
>   Now I have changed the version of glib2 to 2.72.4 and libffi to 3.4.3
> version.
> But while compiling, I am getting below error message :
> --------------------------------------------------------------
> make: *** No rule to make target 'host-libffi'
> --------------------------------------------------------------

Keep your existing .mk file(s) and just change the version info 
initially. If the build (or later, the binary) breaks, look at changes 
in dependencies and build flags.

> In libffi.mk, earlier it was used below way to call for compilation :
> $(eval $(call AUTOTARGETS))
> $(eval $(call AUTOTARGETS,host))
> ------------------------------------------------------------------
> 
> Now latest libffi.mk (as mentioned in opensource libffi.mk), it is 
> using
> below way to start configure and compilation :
> -------------------------------------------------------------
> $(eval $(autotools-package))
> $(eval $(host-autotools-package))
> -------------------------------------------------------------

The github repository reports that this change was made late in 2011 [1] 
-- You need to use the logic from your environment, otherwise the build 
will fail.

Kind regards,
Andreas

> Please give your suggestion to go forward.
> 
> Thanks,
> D Pal

[1] 
https://github.com/buildroot/buildroot/commit/76d9b3e8d7ac5bb5e1b6efd30be339e03c144597
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
