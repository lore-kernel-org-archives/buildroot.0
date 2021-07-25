Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B0DC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:40:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D253660F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D253660F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4D7140263;
	Sun, 25 Jul 2021 19:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxM6a0FSVrSA; Sun, 25 Jul 2021 19:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0213B40201;
	Sun, 25 Jul 2021 19:40:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03AE91BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E73FB40201
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lvJ7pnsX93n for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 19:40:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FEE3401C9
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 19:40:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4C2C7E0005;
 Sun, 25 Jul 2021 19:40:35 +0000 (UTC)
Date: Sun, 25 Jul 2021 21:40:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210725214033.53587914@windsurf>
In-Reply-To: <20210722181929.24015-1-ps.report@gmx.net>
References: <20210722181929.24015-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mariadb: bump version to
 10.3.30
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Ryan Coe <bluemrp9@gmail.com>, Scott Bartolett <SBartolett@thorlabs.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 22 Jul 2021 20:19:28 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - rebase 001-add-extra-check-for-librt.patch
> - for changelog see [1], [2]
> 
> Fixes:
> 
>   CMake Error at libmariadb/cmake/ConnectorName.cmake:30 (ENDMACRO):
>     Flow control statements are not properly nested.
>   Call Stack (most recent call first):
>     libmariadb/CMakeLists.txt:423 (INCLUDE)
> 
> [1] https://mariadb.com/kb/en/mariadb-10329-changelog/
> [2] https://mariadb.com/kb/en/mariadb-10330-changelog/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/mariadb/0001-add-extra-check-for-librt.patch | 12 +++++++-----
>  package/mariadb/mariadb.hash                         |  6 +++---
>  package/mariadb/mariadb.mk                           |  2 +-
>  3 files changed, 11 insertions(+), 9 deletions(-)

Both applied. In the second patch, I've replaced the hardcoded "gcc" by
$(HOSTCC).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
