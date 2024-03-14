Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8A5C54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 18:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7494083A;
	Thu, 14 Mar 2024 18:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dp607lJB2Kbu; Thu, 14 Mar 2024 18:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C4C40849
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C4C40849;
	Thu, 14 Mar 2024 18:48:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFB2E1BF422
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD41C4029B
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLynSqwrs7D6 for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 18:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7F75401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F75401F6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7F75401F6
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 18:48:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBB8BE0004;
 Thu, 14 Mar 2024 18:48:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rkq8B-00AjW4-1P;
 Thu, 14 Mar 2024 19:48:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240309164946.166802-1-fontaine.fabrice@gmail.com>
Date: Thu, 14 Mar 2024 19:48:43 +0100
In-Reply-To: <20240309164946.166802-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 9 Mar 2024 17:49:46 +0100")
Message-ID: <87wmq4myyc.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] toolchain: drop codesourcery
 arm/aarch64 toolchains
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > codesourcery arm/aarch64 toolchains are old (2014) and use glibc
 > 2.18/2.20 which are not compatible with 64-bit time_t raising the
 > following build failure with libcgroup since commit
 > 1c2dbcdcf0bb589d325c379246acaa39bb07b7be:

 > In file included from ./libcgroup-internal.h:25:0,
 >                  from parse.y:21:
 > /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 >  # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 >    ^

 > Fixes: 1c2dbcdcf0bb589d325c379246acaa39bb07b7be
 >  - http://autobuild.buildroot.org/results/e28f955f2b360f6e7bb231a5a3800cfbd17a23d7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/guile/guile.mk                        |  5 -
 >  package/mesa3d/mesa3d.mk                      |  6 --
 >  package/tpm2-totp/Config.in                   |  2 -
 >  .../autobuild/sourcery-arm-armv4t.config      |  4 -
 >  .../autobuild/sourcery-arm-thumb2.config      |  7 --
 >  .../autobuild/sourcery-arm.config             |  3 -
 >  .../autobuild/toolchain-configs.csv           |  5 -
 >  .../testing/tests/toolchain/test_external.py  | 97 -------------------
 >  toolchain/Config.in                           |  1 -

I get a conflict here, so this was presumably not generated against
master?

Committed after fixing that up and adding Config.in.legacy entries,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
