Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8CAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 08:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770FB6F477;
	Sat, 28 May 2022 08:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVJzKYd-OrJt; Sat, 28 May 2022 08:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85A4861089;
	Sat, 28 May 2022 08:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 888651BF59E
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76075405BA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 08:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5hUN5K-J7HP for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 08:08:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21B71405A3
 for <buildroot@buildroot.org>; Sat, 28 May 2022 08:08:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 93491240004;
 Sat, 28 May 2022 08:08:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nurUf-002whv-M9; Sat, 28 May 2022 10:08:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220502215342.3485999-1-james.hilliard1@gmail.com>
Date: Sat, 28 May 2022 10:08:17 +0200
In-Reply-To: <20220502215342.3485999-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Mon, 2 May 2022 15:53:42 -0600")
Message-ID: <871qwef5am.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/linux-headers: prevent
 invalid custom headers selection
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > If BR2_KERNEL_HEADERS_AS_KERNEL is selected and the kernel version
 > is known we should not allow potentially incompatible custom headers
 > to be selected.

 > For BR2_LINUX_KERNEL_LATEST_CIP_VERSION and
 > BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION this means we should select
 > BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 and for
 > BR2_LINUX_KERNEL_LATEST_VERSION this means we should select
 > BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/816/816d7a3ad77ba051fff7fba7f2a38fc31549c360
 >  - http://autobuild.buildroot.net/results/3c3/3c3a9fc1a1e0002ae8169fd47b3003ebb86935f6
 >  - http://autobuild.buildroot.net/results/188/18883459577dc0fdc01149110ffb81bf1a28c94a

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - entirely disable Custom kernel headers series when kernel version is known

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
