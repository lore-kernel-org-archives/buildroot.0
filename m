Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BFFC636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 18:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA06400CC;
	Fri, 10 Feb 2023 18:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA06400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zkA_gGXxF6OV; Fri, 10 Feb 2023 18:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 246744018B;
	Fri, 10 Feb 2023 18:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 246744018B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E5051BF2C5
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 18:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9C93822E7
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 18:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C93822E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tiax2viJonyG for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 18:47:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E86C822C4
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E86C822C4
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 18:47:03 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pQYQF-0005p0-Ek;
 Fri, 10 Feb 2023 18:46:59 +0000
Date: Fri, 10 Feb 2023 18:46:58 +0000
From: John Keeping <john@metanate.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Y+aRIvtdL1ROUUQE@donbot>
References: <20230209170707.4066903-1-peter@korsgaard.com>
 <Y+YnzeeSbedxW3eK@donbot> <87fsbdg2wb.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fsbdg2wb.fsf@dell.be.48ers.dk>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=7Vi2Aeqf0fP5dOmVuz25elahG3SLdFWuxVem2UA0gS0=; b=hltIT
 YPQjHHTDFGQqByR5X1E4xAO+kltUGI8D03rG4/bPCOk/7Jg5+tFoi3nx4ToO5RC3apTIIiZpUagTE
 8HivXpZUc+lJjFoKuyTaEeql3DyvnrpNg3RtTpv+WGPESGt+AsGYEXugMLAXmT0qNnGDPPpjJz60C
 XuscIVD4A/BRg+U8NJRjBOnGZPatEjaazws7w6DbTDXY4TCErvoNONC2CnzaiKqFa5BXwVdWwMQM/
 mr/jrDSerzN7gGq7QRWIFx4ZH6VlU3ZtoW51SHqiZeuY/mAdMwC/wWYldte9HxaBf5wuxrS4RZx5w
 fbrYBYF2qf+sXa83P8pRFJjZswy1w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=hltITYPQ
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: Build with ninja
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Feb 10, 2023 at 12:45:24PM +0100, Peter Korsgaard wrote:
> >>>>> "John" == John Keeping <john@metanate.com> writes:
> 
>  > Hi Peter,
>  > On Thu, Feb 09, 2023 at 06:07:05PM +0100, Peter Korsgaard wrote:
>  >> +define WEBKITGTK_BUILD_CMDS
>  >> +	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
>  >> +endef
>  >> +
>  >> +define WEBKITGTK_INSTALL_STAGING_CMDS
>  >> +	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
>  >> +endef
>  >> +
>  >> +define WEBKITGTK_INSTALL_TARGET_CMDS
>  >> +	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
>  >> +endef
>  >> +
> 
>  > Would it make sense to apply these changes in pkg-cmake.mk?
> 
>  > Using `cmake --build` and `cmake --install` works with all generators
>  > and it would avoid needing to repeat this block for both of the packages
>  > in this series.
> 
> Longer term that is indeed the direction we want to move to (and
> generally build cmake packages with the ninja backend).
> 
> This is meant as a minimal patch that is easy to backport to the stable
> branches.

Makes sense.

> We have a number of cmake packages that use custom FOO_MAKE_OPTS, how
> are those passed to make when using cmake --build / --install?

For building, we have:

	cmake --build <dir> [<options>] [-- <build-tool-options>]

so it should be easy to pass _MAKE_OPTS through.

But I can't see anything similar for --install, although I wonder if
anything actually needs to pass _MAKE_OPTS for installation.

From a quick look only 3 CMake packages use _MAKE_OPTS at all:

	$ git grep -l cmake-package package/ | grep -vF pkg-cmake.mk | xargs grep MAKE_OPTS
	package/gdal/gdal.mk:GDAL_MAKE_OPTS += -f Makefile
	package/mariadb/mariadb.mk:HOST_MARIADB_MAKE_OPTS = import_executables
	package/zeek/zeek.mk:HOST_ZEEK_MAKE_OPTS = binpac bifcl

Of those, gdal's use is probably unnecessary when using `cmake --build`
and the other two could us a more specific option to set targets and use
the --targets option (but should also be okay with passing options after
`--`).


Regards,
John
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
