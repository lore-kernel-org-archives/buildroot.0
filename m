Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F042DC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF79A41BC0;
	Thu, 29 Feb 2024 15:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gedTcU_QGjLv; Thu, 29 Feb 2024 15:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CF741BC1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5CF741BC1;
	Thu, 29 Feb 2024 15:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 431F01BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E86360EF7
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCMhENPz54Xc for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1692860EC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1692860EC8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1692860EC8
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:27:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6B8E1C000C;
 Thu, 29 Feb 2024 15:27:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiJf-004n5g-1S;
 Thu, 29 Feb 2024 16:27:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240115211427.4291-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Feb 2024 16:27:23 +0100
In-Reply-To: <20240115211427.4291-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Jan 2024 22:14:27 +0100")
Message-ID: <877cingujo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/leptonica: affected by gcc bug
 101737
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > leptonica is affected by gcc bug 101737 resulting in the following build
 > failure since at least bump to version 1.82.0 in commit
 > 81a961c545cc9f240841b75d6c21f13b334bc274:

 > sh4eb-buildroot-linux-gnu-gcc.br_real: internal compiler error: Segmentation fault signal terminated program cc1
 > Please submit a full bug report, with preprocessed source (by using -freport-bug).
 > See <http://bugs.buildroot.net/> for instructions.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f18979454399d9c728f9e017e4cc3a1b27458f5b
 >  - http://autobuild.buildroot.org/results/f3c803892175b3bb2ce68e3140c879b4a4d4b302

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
