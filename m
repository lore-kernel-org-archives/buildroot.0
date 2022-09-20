Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E80CC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C479410C3;
	Tue, 20 Sep 2022 06:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C479410C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gi9hrUZatjqB; Tue, 20 Sep 2022 06:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F4DD410B1;
	Tue, 20 Sep 2022 06:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F4DD410B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7331BF33A
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 265A160BFC
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 265A160BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWWzCNJayUNS for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:50:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F153660590
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F153660590
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:50:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D082B1BF204;
 Tue, 20 Sep 2022 06:50:27 +0000 (UTC)
Date: Tue, 20 Sep 2022 08:50:27 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220920085027.65df5740@windsurf>
In-Reply-To: <20220919213210.56377-1-jesse.vangavere@scioteq.com>
References: <20220919213210.56377-1-jesse.vangavere@scioteq.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663656628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8VS5SdG7G0KWKNXfw3myOfs2J983G/yQFXaaMD1YIA=;
 b=kSAJFZXyuq2yn7AdSYWNcuOi20sctV39cA1anBFVvv8oI4dUm5yOGjC7OvTbRJfsWO/GdC
 fTMmB3j3JEJjOhJKOlMHvJnLpdLLrKfYfj3KlVv3ZkP91zeCM3TXc5ihT5JwSjmDT36OwT
 VC32hCpbtK1YVFLlNvIptj6H7N82/u90Fy55xj/X5OTvW+6bCX47TwMH8+dUsBvvJVrmTR
 HHmzFSANHYxNkR1I5gzbQlFt6maoRlzuRarmnmmWzaiOcKXJvOn5vVtpCzh0loy10KQT2i
 3Utq95g+o5r0S5Zim5ztl3oCjJguAzJIkw53qtOsiwdLuzf0SHj77dpDWZSUqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kSAJFZXy
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6: bump to version 6.3.2
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
Cc: Jesse Van Gavere <jesse.vangavere@scioteq.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Sep 2022 23:32:10 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>
> ---
>  package/qt6/qt6.mk                           | 2 +-
>  package/qt6/qt6base/qt6base.hash             | 7 ++++---
>  package/qt6/qt6serialport/qt6serialport.hash | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)

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
