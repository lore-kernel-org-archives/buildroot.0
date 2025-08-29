Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3089ACA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 18:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F37B2843E3;
	Fri, 29 Aug 2025 18:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYQOwlr6L85y; Fri, 29 Aug 2025 18:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1700843F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1700843F1;
	Fri, 29 Aug 2025 18:36:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F3BAD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25A3E40793
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyVL4ZD4bMdv for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 18:35:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02503407AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02503407AB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02503407AB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 18:35:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1657589675; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 18:35:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us3x3-00Cyjs-1B;
 Fri, 29 Aug 2025 20:35:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org,  Floris Bos <bos@je-eigen-domein.nl>,  Heiko
 Thiery <heiko.thiery@gmail.com>
References: <20250828215927.2281857-1-peter@korsgaard.com>
 <7fd3dee0-3950-4dfd-81a5-3d9d6f5d6fb4@rnout.be>
Date: Fri, 29 Aug 2025 20:35:53 +0200
In-Reply-To: <7fd3dee0-3950-4dfd-81a5-3d9d6f5d6fb4@rnout.be> (Arnout
 Vandecappelle's message of "Fri, 29 Aug 2025 19:53:10 +0200")
Message-ID: <87ecsugely.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=cPS/E+L9vvDKr5rRi8TEKeH75w5TpIL1WSCsmCwDdL3uXiCCVyGc847fFO/TRcGnO/A1FXG5jlpH4V3cnykgUJqFN+3mg2KzmDXqH3T3WF9qfJdZMUe2gTl63X5pyBDCzHZxEt3nEmcZ35SqaF628QrMQpb0numHGe2zp3LL17ST96qEU3PFg53CpOxrXvH5Dc2LgkZ743rVmU8B9DtmQyRlwpHwMTYKM6o0rb7oqGtA9VzTEQNEAdSYegPA4s1u1OiSIfqYu3+tZM2aYcTxKDpRRJX8BVjYWhNXncIHdzY+1f7lfhWxZEdV2O460BrSbGNVhBln6wppzxTwu4s9Ag==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Qr4GxKfj7R8Bgem6lRM/fIXAsn3mnr4qmLZQ7R8isSI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=cPS/E+L9
Subject: Re: [Buildroot] [PATCH] package/ipmitool: move to codeberg
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@rnout.be> writes:

 > On 28/08/2025 23:59, Peter Korsgaard wrote:
 >> The github repo was deleted and moved to codeberg, so use that instead:
 >> https://lwn.net/Articles/926101/
 >> It is unclear if the auto generated tarballs from codeberg are
 >> reproducible,
 >> so instead fetch through git.
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/ipmitool/Config.in     | 2 +-
 >> package/ipmitool/ipmitool.hash | 2 +-
 >> package/ipmitool/ipmitool.mk   | 5 +++--
 >> 3 files changed, 5 insertions(+), 4 deletions(-)
 >> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
 >> index dd2b0e6b6d..f759caa08f 100644
 >> --- a/package/ipmitool/Config.in
 >> +++ b/package/ipmitool/Config.in
 >> @@ -10,7 +10,7 @@ config BR2_PACKAGE_IPMITOOL
 >> it can be provided by the iana-assignment package or by a
 >> rootfs overlay.
 >> -	  https://github.com/ipmitool/ipmitool/
 >> +	  https://codeberg.org/IPMITool/ipmitool/
 >> if BR2_PACKAGE_IPMITOOL
 >> diff --git a/package/ipmitool/ipmitool.hash
 >> b/package/ipmitool/ipmitool.hash
 >> index c3b298e3ba..c65fdb0342 100644
 >> --- a/package/ipmitool/ipmitool.hash
 >> +++ b/package/ipmitool/ipmitool.hash
 >> @@ -1,3 +1,3 @@
 >> # Locally computed:
 >> -sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
 >> +sha256  78bc6fdbb0487652a3d0220072b9428d4ab6dfc198de2f28e8493932e6b893af  ipmitool-IPMITOOL_1_8_19-git4.tar.gz
 >> sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
 >> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
 >> index 159bb7c8b6..04c77bcae3 100644
 >> --- a/package/ipmitool/ipmitool.mk
 >> +++ b/package/ipmitool/ipmitool.mk
 >> @@ -4,8 +4,9 @@
 >> #
 >> ################################################################################
 >> -IPMITOOL_VERSION = 1_8_19
 >> -IPMITOOL_SITE = $(call github,ipmitool,ipmitool,IPMITOOL_$(IPMITOOL_VERSION))
 >> +IPMITOOL_VERSION = IPMITOOL_1_8_19

 >  Meh, this breaks release monitoring and CPE. So either we have to
 >  remove CPE_ID_IS_VALID, or we have to set the CPE version.

 >  We really should fix that VERSION/DL_VERSION mess.

 >  Marked as Changes Requested.

I guess the most sensible short term solution is to to just drop
_CPE_ID_VALID then. Do you want me to resend a version doing that?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
