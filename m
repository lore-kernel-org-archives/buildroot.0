Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BDCC25B47
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 19:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABA584C8E;
	Tue, 24 Oct 2023 19:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ABA584C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ip3tnXuSdLGT; Tue, 24 Oct 2023 19:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A733F84C84;
	Tue, 24 Oct 2023 19:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A733F84C84
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F24A51BF377
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9FBB4EC90
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 19:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9FBB4EC90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVL_ms_dhifu for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 19:58:10 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CD7F4853D
 for <buildroot@uclibc.org>; Tue, 24 Oct 2023 19:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD7F4853D
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qvNXT-0009wI-Qp
 for buildroot@uclibc.org; Tue, 24 Oct 2023 21:58:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 24 Oct 2023 21:57:53 +0200
Message-ID: <pan$bd914$68481ed4$7471af7$2ff683d3@ID-313208.user.individual.net>
References: <20231024181412.3198951-1-bernd@kuhls.net>
 <ZTgVKtuCBV708jzY__8992.36735874496$1698174287$gmane$org@fdugast-desk.home>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v5 1/1] package/igt-gpu-tools: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Tue, 24 Oct 2023 21:04:10 +0200 schrieb Francois Dugast:

> This is a workaround for igt_stats only but the issue affects more, if
> not almost all IGT binaries. A few more random examples:
[...]
> Instead I would add a package dependency:
[...]
> +       depends on BR2_RELRO_NONE # prevent segfault in IGT binaries

The tool I am interested in, intel_gpu_top, works fine with my private config BR2_RELRO_FULL=y so depending on BR2_RELRO_NONE is too much imho.
Are the chances that the bug causing segfaults can be fixed?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
