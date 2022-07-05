Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6887BC43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 20:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFCF860D80;
	Tue,  5 Jul 2022 20:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFCF860D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ov9k3DTP1QM; Tue,  5 Jul 2022 20:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8A61608B7;
	Tue,  5 Jul 2022 20:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8A61608B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E548B1BF271
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 20:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE9174175F
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 20:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE9174175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1jYGVZysouY for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 20:20:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E23A6416F1
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E23A6416F1
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 20:20:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 74361200009;
 Tue,  5 Jul 2022 20:20:42 +0000 (UTC)
Date: Tue, 5 Jul 2022 22:20:41 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20220705222041.594c31ca@windsurf>
In-Reply-To: <20220704192716.257008-1-marcus.folkesson@gmail.com>
References: <20220704192716.257008-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657052442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUiEMB1MJrj1zjiK/wXvOqHtAIilzzHdHG8PjVuEVgk=;
 b=dI4Qu4b0DensZVWoQVZPzg3r3e8uWcyKaNXtvQ82YxFWVRcky9y2sUhQnCICGEf98WjsBF
 IuRzz8f5s3HWZi5yr6/l2OGqRFHGJClyN772Zyu5DhKb/eC97qYDjwULi+v7H5cEfrhJvZ
 +ttvBskGkuJ05TOZaKpuOgjCSIH68kY29fIeXESbW7swVxRnLo+B+A72WeXd0khqfrZuEu
 luYtVicvU75Qe9/3v9rTgPUxg6sF3l5PlHspcILivKS3dJZOOJpLBjXTg75JCqKuWo5l6D
 2epJ818ArMDvFQPB6nV2ioYq+kcoOvjcAhGYTnlKrFk7JYHJHmF+YVzpcFc6ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dI4Qu4b0
Subject: Re: [Buildroot] [PATCH] package/libostree: bump to version 2022.4
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

On Mon,  4 Jul 2022 21:27:16 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  ...y-add-a-missing-include-for-stdint-h.patch | 24 -------------------
>  package/libostree/libostree.hash              |  2 +-
>  package/libostree/libostree.mk                |  2 +-
>  3 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 package/libostree/0001-lib-ostree-sysroot-deploy-add-a-missing-include-for-stdint-h.patch

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
