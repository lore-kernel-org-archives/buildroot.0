Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C37FCD4845
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 20:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543D740BF3;
	Wed, 12 Nov 2025 20:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kd_nc8skDeq; Wed, 12 Nov 2025 20:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBE040BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBE040BE3;
	Wed, 12 Nov 2025 20:44:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E165158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40294606DE
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFfmPlrGJhG8 for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 20:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1261E6067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1261E6067C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1261E6067C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:44:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 200777112; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 20:44:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJHhr-0008Fl-1M;
 Wed, 12 Nov 2025 21:44:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Titouan Christophe <titouan.christophe@mind.be>
References: <20251106204737.3273902-1-bernd@kuhls.net>
Date: Wed, 12 Nov 2025 21:44:43 +0100
In-Reply-To: <20251106204737.3273902-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 6 Nov 2025 21:47:37 +0100")
Message-ID: <87qzu3q8uc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oStBO2kFmNTsDZL4hhpv4wOd94H/ui7UYFmq6rDqF7QYh6FuMt6sVnQ0iMIEhEDa1h1JUZIE4Rne8EC5ZMJm/4lCEA4AoAfHtpO7wtzpkGetxDh8mPF6dzHZqqQEHru+tzOUm4gxTPmsnH1vGCFF11HoNmwca4o/hbjQAA90aqIDLk4jyKyL0vLlIuWyvkRdCUPEiYlI3PtsBbjbn/hcyJQ8T8E0wVJ3/aY2rSNBU/6hMoDxAU8EqKiMxMSTxk/lX2iW7BTD3Nk6cHi1JLtN8Q6+yOmGR1JtSApkgnUJUJQzWuRCl6QEnUYrxQ4EM2fJ1COORZ7uMSWPdOcrPjbnsA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=l9Sw5KGgDYZG8KZ5ts6gZc2XxM/6JOt2EaqI7JKJkzI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=oStBO2kF
Subject: Re: [Buildroot] [PATCH v2 1/1] package/asterisk: security bump
 version to 22.5.2
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes CVE-2025-1131:
 > https://github.com/asterisk/asterisk/security/advisories/GHSA-v9q8-9j8m-5xwp

From the advisories page it looks as if (at least) CVE-2025-57767,
CVE-2025-49832, CVE-2025-47780 and CVE-2025-47779 are also fixed since
22.3.0, so I have updated the commit message and applied - Thanks.


 > Acked-by: Titouan Christophe <titouan.christophe@mind.be>
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: updated subject to reflect that this is a security bump (Titouan)

 >  package/asterisk/asterisk.hash | 2 +-
 >  package/asterisk/asterisk.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
 > index f11ed08ef4..26175667c3 100644
 > --- a/package/asterisk/asterisk.hash
 > +++ b/package/asterisk/asterisk.hash
 > @@ -1,5 +1,5 @@
 >  # Locally computed
 > -sha256  4cc403c8885d4aed3956dfb75d315d3e5bcc129eb9cd47c156d3b12ecceed1ba  asterisk-22.3.0.tar.gz
 > +sha256  8a94650b6f348af1f1c9cce7ed3585d280f3a31b0d3820084a42b03712df95d5  asterisk-22.5.2.tar.gz
 
 >  # Locally computed
 >  sha256  58bb83cec4d431f48d006e455d821668450f8cf6b6c95f090def47062fa3a60c  pjproject-2.15.1.tar.bz2
 > diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
 > index e7e802aa45..9a071fb8e0 100644
 > --- a/package/asterisk/asterisk.mk
 > +++ b/package/asterisk/asterisk.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -ASTERISK_VERSION = 22.3.0
 > +ASTERISK_VERSION = 22.5.2
 >  # Use the github mirror: it's an official mirror maintained by Digium, and
 >  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 >  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
 > -- 

 > 2.47.3

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
