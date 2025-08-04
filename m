Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7CAC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 17:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 446F2409B1;
	Mon,  4 Aug 2025 17:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSFAoG9nV5H9; Mon,  4 Aug 2025 17:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71551409DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71551409DF;
	Mon,  4 Aug 2025 17:06:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE4DD118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 17:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C49F560B50
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 17:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86xCL6pIYfZz for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 17:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E13E60B04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E13E60B04
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E13E60B04
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 17:06:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1305399976; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Aug 2025 17:06:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uiydZ-00BBP1-2G;
 Mon, 04 Aug 2025 19:06:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>
References: <20250804141631.7089-1-fl@n621.de>
Date: Mon, 04 Aug 2025 19:06:13 +0200
In-Reply-To: <20250804141631.7089-1-fl@n621.de> (Florian Larysch's message of
 "Mon, 4 Aug 2025 16:16:10 +0200")
Message-ID: <8734a7m2yi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=e2yB390JBV4DOWa93Ylt6F9yrM2WRWu/ThzWz4Ehwc1SliuuQSwYpMlUw+icL51e3Gjpl+/nBIfzeCVqMNNTV+EjtjDNXd9kF+/NTfpEYN3byqaxGRxACfbUmoNkRLR/dvLWHyieieKuBsCkk5AVqMrTqa4Med9ayhq2FD0KJey3mrTw6UtUGL7QR5zaFY/tUgPxow1GB5QxCTiL+7+FWm2BSbJ08hPO8SZgdQGbjhpUMpfjGpfSVbzwupobtNbJOXUCUlZGB/BAbOClhFmrap6U+HT/U4Rc5avBZaaCl5n25VTNgsQsdhm0Rk3m12MMScVY5KaH7Qahp4E3fxXc2w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=TOYRvX3AV41CALq8PScxChwr5PduhFEHy63XIR+UnbQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=e2yB390J
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump version to 1.2.8
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

>>>>> "Florian" == Florian Larysch <fl@n621.de> writes:

 > Bugfix release for the 1.2.x series.
 > Release notes:
 > https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/91a1ce183fe8a77843ebe72d62aae51e5ce62737/NEWS

 > Signed-off-by: Florian Larysch <fl@n621.de>

Committed, thanks.

> ---
 >  package/pipewire/pipewire.hash | 2 +-
 >  package/pipewire/pipewire.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
 > index 9ffe95cbea..2e6a9ae3aa 100644
 > --- a/package/pipewire/pipewire.hash
 > +++ b/package/pipewire/pipewire.hash
 > @@ -1,4 +1,4 @@
 >  # Locally calculated
 > -sha256  3c00292f9a419610c9eeb6e45b958d460afb601ecc6894012574a3b9f118616a  pipewire-1.2.7.tar.bz2
 > +sha256  7670f617220cc053948fc8f2c1ff788192479ef5d4f373d878ac8a7cab76a71c  pipewire-1.2.8.tar.bz2
 >  sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 >  sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
 > diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
 > index 9ad92546cc..c1dc2aa0cc 100644
 > --- a/package/pipewire/pipewire.mk
 > +++ b/package/pipewire/pipewire.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -PIPEWIRE_VERSION = 1.2.7
 > +PIPEWIRE_VERSION = 1.2.8
 >  PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 >  PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 >  PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
 > -- 

 > 2.50.1

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
