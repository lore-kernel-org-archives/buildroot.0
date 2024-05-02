Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E849BC25B10
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4DD5400AB;
	Thu,  2 May 2024 20:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sy0IrHp0-3LG; Thu,  2 May 2024 20:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4F3841BA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4F3841BA5;
	Thu,  2 May 2024 20:25:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95C751BF3FF
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8228441775
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 20:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjW_t3zoGeDI for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 20:25:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B4D6A41766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4D6A41766
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4D6A41766
 for <buildroot@buildroot.org>; Thu,  2 May 2024 20:25:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DF89240004;
 Thu,  2 May 2024 20:25:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2czW-00B3uz-2U;
 Thu, 02 May 2024 22:25:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240407131649.1416942-1-fontaine.fabrice@gmail.com>
Date: Thu, 02 May 2024 22:25:18 +0200
In-Reply-To: <20240407131649.1416942-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Apr 2024 15:16:49 +0200")
Message-ID: <87le4s3qs1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/inih: bump to version 58
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure with gcc 5 raised since
 > bump to version 57 in commit 65c8a9b6626de83365865dea6fff1749466a36aa
 > thanks to
 > https://github.com/benhoyt/inih/commit/4e618f77d4bae216865c5abd972d99b1ba5031e2:

 > In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/cstdint:35:0,
 >                  from ../cpp/INIReader.h:17,
 >                  from ../cpp/INIReader.cpp:16:
 > /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 >  #error This file requires compiler and library support for the \
 >   ^

 > https://github.com/benhoyt/inih/releases/tag/r58

 > Fixes: 65c8a9b6626de83365865dea6fff1749466a36aa
 >  - http://autobuild.buildroot.org/results/7a5ba516cde536e103669a0422d336dd8a3b1dbc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>


> ---
 >  package/inih/inih.hash | 2 +-
 >  package/inih/inih.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/inih/inih.hash b/package/inih/inih.hash
 > index 476b544ce6..f20d7ac0b6 100644
 > --- a/package/inih/inih.hash
 > +++ b/package/inih/inih.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  f03f98ca35c3adb56b2358573c8d3eda319ccd5287243d691e724b7eafa970b3  inih-57.tar.gz
 > +sha256  e79216260d5dffe809bda840be48ab0eec7737b2bb9f02d2275c1b46344ea7b7  inih-58.tar.gz
 >  sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
 > diff --git a/package/inih/inih.mk b/package/inih/inih.mk
 > index 93032f1ed5..80cde0942b 100644
 > --- a/package/inih/inih.mk
 > +++ b/package/inih/inih.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -INIH_VERSION = 57
 > +INIH_VERSION = 58
 >  INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 >  INIH_INSTALL_STAGING = YES
 >  INIH_LICENSE = BSD-3-Clause
 > -- 

 > 2.43.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
