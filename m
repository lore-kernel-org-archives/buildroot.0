Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E11C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D34560C22;
	Sun,  6 Feb 2022 10:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ku37oIEnzoK7; Sun,  6 Feb 2022 10:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9062860BE4;
	Sun,  6 Feb 2022 10:21:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62C851BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50518817D3
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0W_UOChM4Mj2 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:21:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB909814B6
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:21:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C05BA40004;
 Sun,  6 Feb 2022 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644142900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSbiTHN2A5nELJKItvzoCz6DqRmA4dyKK8CW/Q0Q/pw=;
 b=LgWT9CrBpQLucAQHnzCzzgOUpW/u9/6ZddkZsc00sELQGCuXjYOsK0Q8d78YnN/XdTn4yV
 44k8EmYG1jStMo5zI9q4EW5U9v6P0J4tl/sHJVlxTXcejILrLCtGRFdD7rJp+2lKl+H7o8
 0YnU3H3mpAxbb7XE18MU4FBPTTBm+Nzk4nx1x1YHp9W1KFsa71GBkVUWLVwdiPa/d9HTYM
 UfOuu8pbZlYGDevuEhi9hbF7XxhRCnkFziEWkahg+TjZCOq7sueyyPDZbwyFvOldSo9YXP
 guAdIYQmIkTq5ScreepFmxn9T9x17ckte9N3l5AxGgQuHeIYOEpx15WQpcLrrw==
Date: Sun, 6 Feb 2022 11:21:38 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220206112138.77563a44@windsurf>
In-Reply-To: <20220203223615.729285-1-fontaine.fabrice@gmail.com>
References: <20220203223615.729285-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/trace-cmd: use snapshot tarball
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Feb 2022 23:36:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use snapshot tarball so TRACE_CMD_VERSION will match what is returned by
> https://release-monitoring.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/trace-cmd/trace-cmd.hash | 2 +-
>  package/trace-cmd/trace-cmd.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
