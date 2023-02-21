Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B32C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FAE841046;
	Tue, 21 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FAE841046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPHiOZY9NTnP; Tue, 21 Feb 2023 20:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D33941050;
	Tue, 21 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D33941050
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9BA41BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4516410C9
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4516410C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M52ZqYfAd2TW for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:50:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 927A4410BC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 927A4410BC
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:50:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32A9E20003;
 Tue, 21 Feb 2023 20:50:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUZaS-007oI1-Tc; Tue, 21 Feb 2023 21:50:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Casey Reeves <casey@xogium.me>
References: <20230119121004.3416962-1-casey@xogium.me>
 <20230119121004.3416962-3-casey@xogium.me>
Date: Tue, 21 Feb 2023 21:50:08 +0100
In-Reply-To: <20230119121004.3416962-3-casey@xogium.me> (Casey Reeves's
 message of "Thu, 19 Jan 2023 13:10:04 +0100")
Message-ID: <87sfeywxof.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] boot/barebox: pass required environment
 variables for reproducible build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Casey" == Casey Reeves <casey@xogium.me> writes:

 > Barebox makes use of the same variables as the linux kernel does for
 > handling reproducible build -- KBUILD_BUILD_HOST,
 > KBUILD_BUILD_TIMESTAMP, KBUILD_BUILD_USER. This patch sets the proper
 > variables based on linux/linux.mk, and passes them to the make
 > invocation when building, to ensure a reproducible build is possible
 > when BR2_REPRODUCIBLE is enabled.

 > Signed-off-by: Casey Reeves <casey@xogium.me>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
