Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEA2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAFC241302;
	Thu,  6 Jan 2022 15:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsp266askK5O; Thu,  6 Jan 2022 15:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F16D40A70;
	Thu,  6 Jan 2022 15:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B33A41BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A12E5828F2
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eguW5J5aRafq for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:14:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17C1D83267
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 15:14:06 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 01BB922247;
 Thu,  6 Jan 2022 16:14:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1641482042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWv0mcoSNSCSRZlkcXtSojYxCjrWIEk6cjebHs8xga4=;
 b=irgcOQ7NzCo5zYASl/fNRwGsjMUvIEOfZxO/XryrVCgBpOIB4SkWpqUZGDds5qDD9wJdu5
 3LiBPu9bqnAZ74oNBcAtTuJ1yAY+JKrrG9msl49UP/WiDF99inwik3ydzyuVBosNMO9tLS
 JfoMMKuwzSr4A6jrgClxNyYsevatWJ0=
MIME-Version: 1.0
Date: Thu, 06 Jan 2022 16:14:01 +0100
From: Michael Walle <michael@walle.cc>
To: Changming Huang <jerry.huang@nxp.com>
In-Reply-To: <20200207083857.28058-6-jerry.huang@nxp.com>
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <20200207083857.28058-6-jerry.huang@nxp.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <8c5bab4b73c9feeca842eef7c51f9b12@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH v5 6/9] package/qoriq-cadence-dp-firmware:
 new package
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
Cc: buildroot@busybox.net, heiko.thiery@gmail.com, geomatsi@gmail.com,
 thomas.petazzoni@bootlin.com, matthew.weber@collins.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 2020-02-07 09:38, schrieb Changming Huang:
> From: Jerry Huang <jerry.huang@nxp.com>
> 
> This package provides the firmware for LS1028ARDB DP (display port).
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>

Arnout, please note that upstream uboot and linux won't use
this firmware. So this can be dropped.

Proper support for the cadence phy will likely be using
the request_firmware() method in linux (and i guess binaries
will then end up in the linux-firmware package).

-michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
