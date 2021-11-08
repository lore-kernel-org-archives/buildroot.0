Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ED0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:03:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA4216115A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA4216115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AD7080C56;
	Mon,  8 Nov 2021 15:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8r_YnBqVx8VR; Mon,  8 Nov 2021 15:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B736980C3C;
	Mon,  8 Nov 2021 15:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 557101BF3CC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E4A80C3C
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNvci6YU2Sxk for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 15:03:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F3ED80C12
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 15:03:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 255291C0003;
 Mon,  8 Nov 2021 15:03:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mk6BK-0005R3-Ss; Mon, 08 Nov 2021 16:03:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <20211104184726.1317347-1-aduskett@gmail.com>
Date: Mon, 08 Nov 2021 16:03:34 +0100
In-Reply-To: <20211104184726.1317347-1-aduskett@gmail.com> (Adam Duskett's
 message of "Thu, 4 Nov 2021 11:47:26 -0700")
Message-ID: <878rxy7kqh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openjdk{-bin}: bump version to
 17.0.1+12
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > OpenJDK 17 is a new LTS release, which leaves the Buildroot Config option of
 > "LTS" and "LATEST" as a misnomer because both 11 and 17 are LTS releases.

 > There are two options in this case:

 > 1) Remove "LATEST" and update OpenJDK 11 to 17, and only support 17.
 > 2) Change "LTS" to "11" and "LATEST" to "17" and only support the latest 2 LTS
 > OpenJDK releases.

 > After some discussion with Thomas Petazzoni and Peter Korsgaard, and testing,
 > option 2 is the best course of action for a few reasons:

 >   - OpenJDK 11 and 17 have very long support cycles:
 >   - OpenJDK 11 has two years of Active and five years of security support left.
 >   - OpenJDK 17 has five years of Active and ten years of security support left.
 >   - Both OpenJDK versions build with the same parameters.
 >   - The maintenance cost of both versions is meager.
 >   - Both versions pass tests.package.test_openjdk without issue.

 > Changes:
 >   - Change BR2_OPENJDK_VERSION_LATEST -> BR2_OPENJDK_VERSION_17
 >   - Change BR2_OPENJDK_VERSION_LTS -> BR2_OPENJDK_VERSION_11
 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed to 2021.02.x and 2021.08.x given that OpenJDK 16.x is EOL and
has known security issues, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
