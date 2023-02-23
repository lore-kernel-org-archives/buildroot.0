Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CEEC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DF7F4059C;
	Thu, 23 Feb 2023 22:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DF7F4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3niW_FUX4IPw; Thu, 23 Feb 2023 22:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E05405B9;
	Thu, 23 Feb 2023 22:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66E05405B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A495C1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EB7D81E30
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EB7D81E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5UwYeK0Be8r for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:45:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D7CB81E2A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D7CB81E2A
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:45:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50596FF805;
 Thu, 23 Feb 2023 22:45:19 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:45:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223234518.032c0b0a@windsurf>
In-Reply-To: <20230223141745.303457-1-fontaine.fabrice@gmail.com>
References: <20230223141745.303457-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677192319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rf29kUyw5O8chOF4LqHA6/jt8cEoSJrekZlT1QNBRiE=;
 b=YxcTeDugVHUS3jVrrXr16iEsP6a/WNSdwyGRW6egml3yt74n428Oj5bRNSLruCVeQ20dkl
 q7APmpDx4/efJVd5mO3b6CX1Ux0ohtywhsk9GFlS3SoWOObITS56nApyTbxrAjgCBBiLML
 ikn2ulekGaI2YcTkCWjOt4I5fPQ9+p4arF6fH8iaRiTXJjr0RP+IzftXJzB1UQjfkLMxhS
 YtCyeJ/50VqdJ8ta4iivI3Yqe3LSfVWBwJNnzLa2lhP635KvOd9Z3dreg/1rDH80uAoRWH
 KfWyD8NR28f8mRrSCp0uW0ZNqPjwvqUsyPzaB/otRppxQ2DzZlVWHGG1DEbqeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YxcTeDug
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: fix build with fmt >=
 9.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Feb 2023 15:17:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with fmt >= 9.0.0 raised since commit
> 5c83dc5451fb59ffa5cd40d30c4c532dd25e8333:
> 
> /tmp/instance-5/output-1/build/gerbera-1.10.0/src/database/sql_database.cc:1688:26:   required from here
> /tmp/instance-5/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/fmt/format.h:3973:36: error: passing 'const fmt::v9::formatter<fmt::v9::join_view<__gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, __gnu_cxx::__normal_iterator<const ColumnUpdate*, std::vector<ColumnUpdate> >, char>, char, void>::formatter_type' {aka 'const fmt::v9::formatter<ColumnUpdate>'} as 'this' argument discards qualifiers [-fpermissive]
>  3973 |       out = value_formatter_.format(map(*it), ctx);
>       |             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/56c46fa7e922360d2c4b4093f8a030cc83726799
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../gerbera/0001-Fix-build-with-fmt-9-0.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/gerbera/0001-Fix-build-with-fmt-9-0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
