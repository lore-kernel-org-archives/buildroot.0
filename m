Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A607C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 18:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E5E86087F;
	Fri,  3 Jul 2026 18:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrciCRbj9wvq; Fri,  3 Jul 2026 18:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A1A60828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783104557;
	bh=dwg3Mku7OyS/iGxTR5lJOPyZ9F5OtSLE4TZdI2oowNs=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GmtWwuxB0rPjbbBW0TX9ef644bef32lFDJ9qCi4pIgkPnH1dWA+urVhyvRew3b0Nc
	 3eWoeAcNJNxnMFiemgtEWNXiuTvk0FDPYbFnAk3syNACgnOgQbGROPpWBWCgyY5uVp
	 pgYok55z/D9H4iIkC5jT2mF0rs1NSst5fiBWzTbMSNBh2KYsSSW0j4Vh8pu5cHGMRa
	 GrubaY7xgBD+62Ddw/ljDKv6c8UFQEz5RcJxI7kcXq92L3NmXpldeYcRp82lfOCsH8
	 57V3jvguby1YltGM9EWcul55apDmKBl967xod22dBL5oALnRmU27NlljVscrPIQfrl
	 TPA5O/wDJa0ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A1A60828;
	Fri,  3 Jul 2026 18:49:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 417E2316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3379881EEC
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAxWPi8DTEs5 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 18:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2C4A81EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C4A81EC8
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C4A81EC8
 for <buildroot@uclibc.org>; Fri,  3 Jul 2026 18:49:14 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wfiwn-0003wU-DE
 for buildroot@uclibc.org; Fri, 03 Jul 2026 20:49:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 03 Jul 2026 20:49:00 +0200
Message-ID: <pan$e3369$4de7e227$2d6fda29$7b302be8@ID-313208.user.individual.net>
References: <20260703180354.600761-1-fiona.klute__3867.25891601003$1783101875$gmane$org@gmx.de>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/apr: fix build failure with GCC
 >= 14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri,  3 Jul 2026 20:03:54 +0200 schrieb Fiona Klute via buildroot:

> The workaround in 3d06661fc1bf0f88356981a44cb93b7b0c76a669 for the
> broken C23 check was incorrect: When overriding ac_cv_prog_cc_c23 the
> value must either be "no" (to indicate that C23 is not supported) or
> contain the command line parameters to enable C23 with the C compiler in
> use (e.g. "-std=gnu23", may be an empty string if appropriate). The
> workaround set it to "yes" for host GCC >= 14, making builds fail.
> 
> However, the original issue was that apr may try to enable C23 in host
> CC calls if the target CC supports it. So instead of figuring out the
> correct arguments for GCC >= 14, we can set ac_cv_prog_cc_c23=no only
> for host GCC <= 13 and leave it unset otherwise, as in that case
> enabling C23 will do no harm.
> 
> Fixes: 3d06661fc1bf0f88356981a44cb93b7b0c76a669 Fixes:
> -
> https://autobuild.buildroot.net/results/77c/
77cd5456169e04c2f92dc328c4b6828513d1195f/
> -
> https://autobuild.buildroot.net/results/
7a4/7a4fb2b21027f98df607871d9fe0dd234d44aebb/
> -
> https://autobuild.buildroot.net/results/a6c/
a6cef4c5965fdeb40d3b39cbd40941329f4fc1c8/
> (and more)
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Tested-by: Bernd Kuhls <bernd@kuhls.net>
[build-tested, previous build error seen here is now fixed]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
