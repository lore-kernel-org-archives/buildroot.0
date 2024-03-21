Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402E9C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 20:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C6EC82237;
	Thu, 21 Mar 2024 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUVVxbw6X8a5; Thu, 21 Mar 2024 20:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D6882242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D6882242;
	Thu, 21 Mar 2024 20:44:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DF7F1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5859C82237
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvSmydp_9wUK for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 20:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3247C82242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3247C82242
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3247C82242
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 20:44:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC37A240008;
 Thu, 21 Mar 2024 20:44:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnPGf-005b0F-03;
 Thu, 21 Mar 2024 21:44:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240309164946.166802-1-fontaine.fabrice@gmail.com>
 <87wmq4myyc.fsf@48ers.dk>
Date: Thu, 21 Mar 2024 21:44:04 +0100
In-Reply-To: <87wmq4myyc.fsf@48ers.dk> (Peter Korsgaard's message of "Thu, 14
 Mar 2024 19:48:43 +0100")
Message-ID: <87bk775n8r.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> codesourcery arm/aarch64 toolchains are old (2014) and use glibc
 >> 2.18/2.20 which are not compatible with 64-bit time_t raising the
 >> following build failure with libcgroup since commit
 >> 1c2dbcdcf0bb589d325c379246acaa39bb07b7be:

 >> In file included from ./libcgroup-internal.h:25:0,
 >> from parse.y:21:
 >> /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 >> # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 >> ^

 >> Fixes: 1c2dbcdcf0bb589d325c379246acaa39bb07b7be
 >> - http://autobuild.buildroot.org/results/e28f955f2b360f6e7bb231a5a3800cfbd17a23d7

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/guile/guile.mk                        |  5 -
 >> package/mesa3d/mesa3d.mk                      |  6 --
 >> package/tpm2-totp/Config.in                   |  2 -
 >> .../autobuild/sourcery-arm-armv4t.config      |  4 -
 >> .../autobuild/sourcery-arm-thumb2.config      |  7 --
 >> .../autobuild/sourcery-arm.config             |  3 -
 >> .../autobuild/toolchain-configs.csv           |  5 -
 >> .../testing/tests/toolchain/test_external.py  | 97 -------------------
 >> toolchain/Config.in                           |  1 -

 > I get a conflict here, so this was presumably not generated against
 > master?

 > Committed after fixing that up and adding Config.in.legacy entries,
 > thanks.

Committed to 2024.02.x given how early we are and how old this toolchain
is, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
