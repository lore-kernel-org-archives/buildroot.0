Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CB2C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 07:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A13F420AE;
	Thu, 26 Oct 2023 07:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A13F420AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zybPBf84-VNB; Thu, 26 Oct 2023 07:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE79420B0;
	Thu, 26 Oct 2023 07:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE79420B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B85AC1BF476
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 07:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9349E83312
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 07:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9349E83312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4fiMMSPHEtD for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 07:48:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35DD88330B
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 07:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35DD88330B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35DAE1C0007;
 Thu, 26 Oct 2023 07:48:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qvv5z-0069oF-8F; Thu, 26 Oct 2023 09:47:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20221227154300.10556-1-brandon.maier@collins.com>
 <5f76c7de-bdaf-d208-9cca-c3d7ac9635a2@mind.be>
Date: Thu, 26 Oct 2023 09:47:59 +0200
In-Reply-To: <5f76c7de-bdaf-d208-9cca-c3d7ac9635a2@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 15 Oct 2023 20:20:30
 +0200")
Message-ID: <871qdhq0y8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] Makefile: fix SDK relocation for
 per-package-dirs
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 27/12/2022 16:43, Brandon Maier wrote:
 >> The relocate-sdk.sh script does not work correctly when
 >> BR2_PER_PACKAGE_DIRECTORIES is enabled. relocate-sdk.sh expects
 >> everything to point at $HOST_DIR, but each package will be pointing at
 >> its $(O)/per-package/*/host.
 >> Use the same command for scrubing host paths during the build, to
 >> scrub
 >> to the final host directory location.
 >> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

 >  Applied to master, thanks.

 >  And thank you Charles for the review.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
