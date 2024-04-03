Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67287CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A4D4185F;
	Wed,  3 Apr 2024 19:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gk-k9JbTG_zO; Wed,  3 Apr 2024 19:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A99641748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A99641748;
	Wed,  3 Apr 2024 19:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 280521BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 155A182279
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id skXe0Ev6RL0U for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 839788226A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 839788226A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 839788226A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:52:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD53240004;
 Wed,  3 Apr 2024 19:52:42 +0000 (UTC)
Date: Wed, 3 Apr 2024 21:52:41 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240403215241.6ca91a34@windsurf>
In-Reply-To: <20240328215448.66328-1-fontaine.fabrice@gmail.com>
References: <20240328215448.66328-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712173962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LRSNWujhtL/XecYEfAJ291oA2wjmFzWbz20dAOmYJ4=;
 b=oZFZF/AvyjeRPo49Va010mBG/HjqffD5WkGpT0AsOEt4iWrTfZxhBO38QdP1/5+ZjSrziR
 HcfXbgMgTAdxITwkefdyoi3efYXCWhLxL5ErMxhE5EgAQ9uCsUofS2M1yjTbvpEGYfBxi/
 zpWA43GfCTt7AHGUuH2mBwhzaTai29HmeeG262s0txFFNu3MQnDuWrGj5RmicMoQX3Hr/+
 Ye81U6UoYS3i5f623283o+JA9T/you+v3ExkXzG6UUR1WdOtDjOiI7HV6Dsfz7v9j5JJdH
 Y24KKxmGZ7zWDoPu3Z7nGc6vXT6m79sqyDgctI5b8ghV1w2IdwZ76UcBGrk6GA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oZFZF/Av
Subject: Re: [Buildroot] [PATCH 1/1] package/libidn2: bump to version 2.3.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Mar 2024 22:54:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.com/libidn/libidn2/-/blob/v2.3.7/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libidn2/libidn2.hash | 2 +-
>  package/libidn2/libidn2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
