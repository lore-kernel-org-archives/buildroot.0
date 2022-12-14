Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73528C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2507C8196A;
	Wed, 14 Dec 2022 19:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2507C8196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45MV9RAkxKiZ; Wed, 14 Dec 2022 19:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F021812AC;
	Wed, 14 Dec 2022 19:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F021812AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCBC71BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D308125D
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D308125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syGsdwzI4olI for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:03:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD0FD80BFC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD0FD80BFC
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:03:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 293E9240007;
 Wed, 14 Dec 2022 19:03:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5X2m-000WMg-SI; Wed, 14 Dec 2022 20:03:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20221213-cairo-cves-v1-0-b802b492d112@theobroma-systems.com>
 <20221213-cairo-cves-v1-1-b802b492d112@theobroma-systems.com>
Date: Wed, 14 Dec 2022 20:03:52 +0100
In-Reply-To: <20221213-cairo-cves-v1-1-b802b492d112@theobroma-systems.com>
 (Quentin Schulz's message of "Wed, 14 Dec 2022 12:16:01 +0100")
Message-ID: <87h6xxu7s7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/cairo: fix CVE-2019-6462
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > Add an upstream patch to fix CVE-2019-6462:

 > An issue was discovered in cairo 1.16.0. There is an infinite loop in
 > the function _arc_error_normalized in the file cairo-arc.c, related to
 > _arc_max_angle_for_tolerance_normalized.

 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
