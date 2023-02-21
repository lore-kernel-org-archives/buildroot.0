Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D7BC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F4E981EE0;
	Tue, 21 Feb 2023 21:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F4E981EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmcsPZybJ0rK; Tue, 21 Feb 2023 21:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C849A81F32;
	Tue, 21 Feb 2023 21:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C849A81F32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B81A91BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DFB241859
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DFB241859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8KjRc0DXbr1 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:25:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F5C8409B2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F5C8409B2
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:25:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7288C240003;
 Tue, 21 Feb 2023 21:25:09 +0000 (UTC)
Date: Tue, 21 Feb 2023 22:25:08 +0100
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20230221222508.6f2ba8f0@windsurf>
In-Reply-To: <1677000436-53977-1-git-send-email-gwenj@trabucayre.com>
References: <1677000436-53977-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677014709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ty2O8LNvpPgYVMY5Ti8DU4Z6veQTSMmm3CfgcLM1GQ=;
 b=UQ2xEBHQN4Z46+QFWEBn/KvyWjotzKb1hJyh5/DBYnVqKnvSBtkYyA/tXY+n8xK3a9P4v8
 0CQyI7ez0TdjfIU3ntNmlDYvHWIcBI41mlRVDdIQ/iEwrniUS+QaP9R/yEUDaz3DK+0Bte
 dnKFkA0s0l25nEodOQSnDmTjeVHRJ/N53hM2kFf71Bn8noKza+L5NUDQEjwGpKe2Cqll3W
 pu9DgL9KidtNZgsu9h1k623/o3e1JBAupS5zuMr3lHe54l3uFNPeIpZJfZSwZu1ILUKAv8
 UMKbyhKSOSu8DbL2NA9oV02sGLBuw7JKu4Xmi23Sn7rn2/h6wPwkAg/cfGlolw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UQ2xEBHQ
Subject: Re: [Buildroot] [PATCH] package/openfpgaloader: bump to version
 0.10.0
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
Cc: Jean Burgat <jeanburgat33@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 18:27:16 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Also adds libgpiod support.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/openfpgaloader/Config.in           | 10 ++++++++++
>  package/openfpgaloader/openfpgaloader.hash |  2 +-
>  package/openfpgaloader/openfpgaloader.mk   |  9 ++++++++-
>  3 files changed, 19 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
