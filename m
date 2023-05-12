Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D90C77B75
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97C4D7024D;
	Fri, 12 May 2023 19:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97C4D7024D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjrNVcngqrU8; Fri, 12 May 2023 19:18:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF46613BD;
	Fri, 12 May 2023 19:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF46613BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11DC61BF831
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 19:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF331613BD
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 19:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF331613BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyqElEU836dW for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 19:18:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63ADA60C16
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63ADA60C16
 for <buildroot@buildroot.org>; Fri, 12 May 2023 19:18:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4BE1C20002;
 Fri, 12 May 2023 19:18:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pxYHc-00GGrA-5A; Fri, 12 May 2023 21:18:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <20230412222602.1975782-1-aduskett@gmail.com>
 <20230412222602.1975782-2-aduskett@gmail.com>
Date: Fri, 12 May 2023 21:18:28 +0200
In-Reply-To: <20230412222602.1975782-2-aduskett@gmail.com> (Adam Duskett's
 message of "Wed, 12 Apr 2023 15:26:01 -0700")
Message-ID: <874joh2waj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/nftables: bump to version 1.0.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Other changes:
 >   - Switch to tar.xz as the package is not distributed as a .bz2 any longer.
 >   - Update the sha256sum of the license file, as it has been updated to
 >     include the following text:
 >     "Original author of nftables distributed the code under the terms of the
 >      GPL version 2 *only*. New code though is moving to GPL version 2 or any
 >      later which is the preferred license for this project these days."
 >     The author has also changed from Patrick McHardy <kaber@trash.net> to
 >     Pablo Neira Ayuso <pablo@netfilter.org>

But the combination is presumably still GPL-v2-only for now?

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
