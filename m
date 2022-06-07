Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8CFC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 13:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BE91424A1;
	Tue,  7 Jun 2022 13:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUt--wo1LRc2; Tue,  7 Jun 2022 13:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422D6404F9;
	Tue,  7 Jun 2022 13:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C51E51BF279
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 13:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C6183FF9
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 13:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6-HymkGnFtI for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 13:59:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 702A283FEE
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 13:59:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12984FF805;
 Tue,  7 Jun 2022 13:59:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyZkB-0007cC-3b; Tue, 07 Jun 2022 15:59:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220601181047.89675-1-christian@paral.in>
 <20220601231448.0a0109c0@windsurf>
Date: Tue, 07 Jun 2022 15:59:39 +0200
In-Reply-To: <20220601231448.0a0109c0@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 1 Jun 2022 23:14:48 +0200")
Message-ID: <878rq87ewk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: security bump to v1.1.2
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed,  1 Jun 2022 11:10:47 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> Fixes CVE-2022-29162
 >> 
 >> Minor security issue (which appears to not be exploitable) related to process
 >> capabilities.
 >> 
 >> A bug was found in runc where runc exec --cap executed processes with ble Linux
 >> process capabilities, creating an atypical Linux environment. For more
 >> information, see GHSA-f3fp-gc8g-vw66 and CVE-2022-29162.
 >> 
 >> runc spec no longer sets any inheritable capabilities in the created example OCI
 >> spec (config.json) file.
 >> 
 >> https://github.com/opencontainers/runc/releases/tag/v1.1.2
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> ---
 >> package/runc/runc.hash | 2 +-
 >> package/runc/runc.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
