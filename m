Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36707C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 07:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA68B417C3;
	Tue, 18 Oct 2022 07:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA68B417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATxiSbRSV7A0; Tue, 18 Oct 2022 07:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6D6F417B2;
	Tue, 18 Oct 2022 07:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D6F417B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 342431BF25F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 06:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CA5760FD5
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 06:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CA5760FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KApZzOhlbq8X for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 06:59:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EC260FB7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5EC260FB7
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 06:59:56 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8154A240005;
 Tue, 18 Oct 2022 06:59:52 +0000 (UTC)
Date: Tue, 18 Oct 2022 08:59:51 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221018085951.5570b633@booty>
In-Reply-To: <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
References: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
 <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666076393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZcBqoucH+kXLtidnzeN2SxaLHkFU1m1gna2vk5nd+k=;
 b=A2riafGUwc7sKMWTA8zpfZ6LoMpSfOdd2MSQFpGC5J/ON35N1aIzffRiziab4Gf8MBahuw
 W8tQTKrMbQjyT28R6H6nNalgI00eOpxgAsgdyXUYNMrG8kVNTwaonropz8r83JbIjmguUK
 9GN2iWVVjMznesPJMmUdb8GKHYEENEjTk2jLH0rr02c2n2vCu9EEstdOf2y8kFVrVOyen7
 2xQ9LIE1hywc+Xv+E8mycixArHzRMbgP3+d/7Ai+QWh4nLHntxnaQnjXOSffYSJqEGgJZ3
 YtHSXvos8wrNmEbVapb2aU6M9Sj477iVZFrl4x3AEXobF/zqVWjZKRZ1L7oWzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A2riafGU
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Mon, 17 Oct 2022 23:12:39 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * use specific upstream commit SHA1 since the latest is buggy

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
