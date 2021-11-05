Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC48AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 14:49:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74B1761244
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 14:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74B1761244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 121AE61710;
	Fri,  5 Nov 2021 14:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUUKLQKbNHtA; Fri,  5 Nov 2021 14:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C0B61668;
	Fri,  5 Nov 2021 14:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6231BF2F8
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 14:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06C11401D9
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 14:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xO07nVVbltH for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 14:48:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BF024018B
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 14:48:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4F44D100006;
 Fri,  5 Nov 2021 14:48:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mj0WR-0005TN-Ad; Fri, 05 Nov 2021 15:48:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <aduskett@gmail.com>
References: <20211104184726.1317347-1-aduskett@gmail.com>
Date: Fri, 05 Nov 2021 15:48:51 +0100
In-Reply-To: <20211104184726.1317347-1-aduskett@gmail.com> (Adam Duskett's
 message of "Thu, 4 Nov 2021 11:47:26 -0700")
Message-ID: <878ry2iros.fsf@dell.be.48ers.dk>
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

These should really follow the namespace, so I have renamed them to
BR2_PACKAGE_OPENJDK_VERSION_{11,17}.

You also forgot Config.in.legacy handling for the old symbols, I've
fixed that.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
