Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5350C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B3D060BEC;
	Sun, 20 Mar 2022 17:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFyXCMM3eH_z; Sun, 20 Mar 2022 17:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F54960AB0;
	Sun, 20 Mar 2022 17:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0FC61BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE72B81390
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fQE_U2eI2qT for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F258C81308
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B859FF805;
 Sun, 20 Mar 2022 17:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ra7ljjMZCoA9UwUOsIKi1w/DTnoo9f1+7/9zfhx6K8s=;
 b=SIrnQVHMlbZEd7o6mgI04oL0toHUx3ucv4Ycj9eZ83Rx8ApVK/i1/1s3sRTkAzTE7Ri0XA
 ML5bbPRHpvI8XAxazOkX0T3KxKtW2Ua8v2Wq2hLUv9H4Y1EbuBvwQgEUqYoQ0LTAC5nn+s
 yINwzSE5A/Rv3T60uEfJ6FZKS6RvNc05+9Ur+A3nVXP18CEC33IeIBhK1c3xT7q4abddUg
 2RGSWlHQLvhhL18nQlzVT4QBMHypQBvHCFfahhmh56NcB8UKrDP3EsV9BJVMr8TBUXKnEZ
 BVimtrUuZ5wqpdAjpJN+Rhk+fLdLFsmzsaSonHaRp09YgUkVU0weQ76udQH+0A==
Date: Sun, 20 Mar 2022 18:06:44 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220320180644.1946a2e0@windsurf>
In-Reply-To: <20220320165802.1584746-1-fontaine.fabrice@gmail.com>
References: <20220320165802.1584746-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/snmppp: bump to version 3.4.9
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 20 Mar 2022 17:58:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of src/v3.cpp, update in year and "Frank Fock" added:
> 
>  -  _##  SNMP++ v3.3
>  +  _##  SNMP++ v3.4
>  -  _##  Copyright (c) 2001-2013 Jochen Katz, Frank Fock
>  +  _##  Copyright (c) 2001-2021 Jochen Katz, Frank Fock
>  -  _##  Hewlett-Packard and Jochen Katz make no representations about the
>  -  _##  suitability of this software for any purpose. It is provided
>  +  _##  Hewlett-Packard, Frank Fock, and Jochen Katz make no representations
>  +  _##  about the suitability of this software for any purpose. It is provided
> 
> https://www.agentpp.com/download/changes_snmp++v3.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/snmppp/snmppp.hash | 4 ++--
>  package/snmppp/snmppp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
