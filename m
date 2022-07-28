Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE69C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D8183337;
	Thu, 28 Jul 2022 07:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D8183337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yr1EztGcqhzf; Thu, 28 Jul 2022 07:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 956FF8332A;
	Thu, 28 Jul 2022 07:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956FF8332A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 773C51BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51B1660AFB
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B1660AFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U13oR5fsEDoh for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:34:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C62660671
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C62660671
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:34:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0366060005;
 Thu, 28 Jul 2022 07:34:40 +0000 (UTC)
Date: Thu, 28 Jul 2022 09:34:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728093439.340992b4@windsurf>
In-Reply-To: <20220727223714.1452262-1-fontaine.fabrice@gmail.com>
References: <20220727223714.1452262-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658993681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGmeIBOozIW231GI2slshZKUqiywG0IektpmDv7FXyk=;
 b=VfdvxVjKdDZTEcHCBZ9KP7w/lsL/yVLoH35otTzBB24cO+IMsdXwuIViU/Zlz4I73BaMkr
 NBO/Fq2gwU02L4SMp7qTKk2MRS8OoQVLAzZBbSrISNco+iwVzk3rpAx/8tj6mNPsbGqmMb
 rCDymbu2pUwqsHiD95RIHtyb/AaMPZ2qry3k4Crt3sEjQ0zZ0WODlUlwXNL+6C7bsmHQg2
 6axepE+WUUDM3SSocqNrxV+Pq1HKWxNXs1NyFTYLhbsBOJd+Y2ZAtmt8PaP7BgX9ZrnEib
 IV1Ue1+09oW59I1eNMN0dEAqISjlabj9vhtqjZD8p2LJg5t+HQcZajgZ5PMm2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VfdvxVjK
Subject: Re: [Buildroot] [PATCH 1/1] package/gdal: fix license hash
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 00:37:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> license hash is wrong since the addition of the package in commit
> 1e64fa2956171cdc9d6e6c8896b4b589ce573513:
> 
> ERROR: LICENSE.TXT has wrong sha256 hash:
> ERROR: expected: b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c
> ERROR: got     : fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e443db6d7ff3ae867035d169853b880b5e13d181
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gdal/gdal.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
