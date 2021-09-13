Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14D7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:12:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBC360FC0
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADBC360FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8416180DDE;
	Tue, 14 Sep 2021 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKTFm5YJEIHT; Tue, 14 Sep 2021 18:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E230B80DBE;
	Tue, 14 Sep 2021 18:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EAF01BF59A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B303340210
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TetDkAPnNAqO for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB39040288
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:53 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D2DD0240005
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQCsQ-0007Rt-BJ
 for buildroot@buildroot.org; Tue, 14 Sep 2021 20:09:50 +0200
Resent-To: buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 14 Sep 2021 20:09:50 +0200
Resent-Message-ID: <87lf3zyqoh.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Sep 13 19:36:43 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210904113632.1623223-1-fontaine.fabrice@gmail.com>
Date: Mon, 13 Sep 2021 19:36:43 +0200
In-Reply-To: <20210904113632.1623223-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 4 Sep 2021 13:36:32 +0200")
Message-ID: <87sfy8xtqs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx-dav-ext: needs libxslt
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build is broken since bump to version 3.0.0 in commit
 > 45524f10cd84855868c9be3901c2bd6ea1c9f079 because libxslt is needed
 > instead of expat since
 > https://github.com/arut/nginx-dav-ext-module/commit/37772c545314aa4a250066f4e7cbc8806d406fa8:

 > adding module in /tmp/instance-0/output-1/build/nginx-dav-ext-3.0.0
 >  + ngx_http_dav_ext_module was configured
 > checking for PCRE library ... found
 > checking for PCRE JIT support ... found
 > Package libxslt was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `libxslt.pc'
 > to the PKG_CONFIG_PATH environment variable
 > Package 'libxslt', required by 'virtual:world', not found
 > Package libxslt was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `libxslt.pc'
 > to the PKG_CONFIG_PATH environment variable
 > Package 'libxslt', required by 'virtual:world', not found
 > checking for libxslt ... not found
 > checking for libxslt in /usr/local/ ... not found
 > checking for libxslt in /usr/pkg/ ... not found
 > checking for libxslt in /opt/local/ ... not found

 > ./configure: error: the HTTP XSLT module requires the libxml2/libxslt
 > libraries. You can either do not enable the module or install the libraries.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8735d20ca7ccf4eda2f79f9400bed70474855b40

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
