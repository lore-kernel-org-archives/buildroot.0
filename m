Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4461C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D48040629;
	Sat, 14 Jan 2023 21:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D48040629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlUpQG8Dij4K; Sat, 14 Jan 2023 21:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8C08405BD;
	Sat, 14 Jan 2023 21:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8C08405BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33D81BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E87981ADE
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E87981ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEKDrdAWeYxG for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:20:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F571819B4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F571819B4
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:20:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9873040003;
 Sat, 14 Jan 2023 21:20:30 +0000 (UTC)
Date: Sat, 14 Jan 2023 22:20:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230114222029.63abe064@windsurf>
In-Reply-To: <20230110015658.3249549-1-james.hilliard1@gmail.com>
References: <20230110015658.3249549-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673731230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAnUbgkoGZfu+SRqcwbaH4TRENKvCTMc1EQRejpAVQA=;
 b=OOgivB+7c2eq0oN+nADY8pybX5bODm1WPrOhjjhAEE7k+TCDj2fu9W/Y144TROJG63JiYT
 Yv+u+X4LRLOgqwatCdwHG7d7A1kensrAiCU2XsgG5QZVlzmJmidNLPtP83uW21JpDv7zxL
 vTI3QSWMhdcpYzuDcelDkZa1Mu9CJuF0I7I8Zpncs2dPrsS8iI4/v7rIwAs9MgZ0Nmf0Sm
 5btHqd3ovtv3fHQ+GVWNQmq3skUjLg+rgeD2uOo6GnJWA1mjNcJqQd6EryGlPZs7VYmzCA
 ljLMbH/Xv/HEf/CZLyBjeR+q5dtZS8ushfdNH2Yw7cmo7UoDLFUiJypGP05k9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OOgivB+7
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 7.1.0
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

On Mon,  9 Jan 2023 18:56:58 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use install-bin for installation instead of install as we don't
> want bash-completion files to be installed.
> 
> Set empty host installation prefix so that we install to:
> $(HOST_DIR)/sbin/bpftool
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/bpftool/bpftool.hash | 2 +-
>  package/bpftool/bpftool.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
