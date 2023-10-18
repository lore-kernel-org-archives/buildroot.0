Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F55CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 10:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97FB4405D1;
	Wed, 18 Oct 2023 10:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97FB4405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgAuvEahEWlt; Wed, 18 Oct 2023 10:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1B8D414A3;
	Wed, 18 Oct 2023 10:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B8D414A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CD301BF5F5
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 10:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32710408C4
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 10:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32710408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piUr2Xsy9iC0 for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 10:40:14 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E915840985
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 10:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E915840985
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2DF81BF20B;
 Wed, 18 Oct 2023 10:40:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qt3yC-00BdrO-Rn; Wed, 18 Oct 2023 12:40:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@amd.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
 <20231018091002.2162735-2-neal.frager@amd.com>
 <87h6motghr.fsf@48ers.dk>
 <CH2PR12MB50049ACBED004D0940741439F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <f88a31b0-b6dd-4bfa-921b-1f37b737847f@amd.com>
Date: Wed, 18 Oct 2023 12:40:08 +0200
In-Reply-To: <f88a31b0-b6dd-4bfa-921b-1f37b737847f@amd.com> (Michal Simek's
 message of "Wed, 18 Oct 2023 12:27:39 +0200")
Message-ID: <878r80tdrr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to
 xilinx-v2023.2
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Frager,
 Neal" <neal.frager@amd.com>, "Chaplin, Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michal" == Michal Simek <michal.simek@amd.com> writes:

Hi,

>>> commit 496752408d031f93159fcf1aba2831c807a389a3 (tag:
 >>> xlnx_rebase_v6.1_LTS_2023.1_merge_6.1.50,
 >>> xlnx/xlnx_rebase_v6.1_LTS_2023.1_update)
 >>> Merge: 0f7f048016e0 a2943d2d9a00
 >>> Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 >>> Date:   Wed Sep 20 17:50:18 2023 +0530
 >> 
 >>> Merge tag 'v6.1.50' into xlnx_rebase_v6.1_LTS_2023.1_update
 >> 
 >>> - U-Boot v2023.01 with additional bug fixes
 >> I noticed that and I actually have the same question.
 >> @Simek, Michal, perhaps you can shed some light on this?
 >> In addition to Peter's question, should we be bumping the Linux
 >> kernel release tag we use with buildroot each time we merge with
 >> another set of 10 upstream patches?

 > It is because our internal deadlines and associated work in connection
 > to our releases.
 > When .1 version is tagged we are merging every 10th LTS version on the
 > top of xilinx 2023.1 tag.

 > On .2 version we continue to do new development and we reached the
 > time where there shouldn't be major changes merged to that
 > branch. That's why .2 version stopped at .30 for running all
 > regressions and .1 can move on .40/.50(coming soon).

Coming soon? .1.50 was tagged 4 weeks ago (see above).


 > I see that xlnx_rebase_v6.1_LTS_2023.2 has been created. That means
 > that next step is going to be that we will do merges for both branches
 > to 6.1.60.
 > At that time both branches will be using the same LTS release.

 > And we should be doing merges to both branches till ~ April 2024.

Ok, thanks! So +/- until the (presumably 6.6 based?) 2024.1 release?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
