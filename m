Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6453FC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D64C40527;
	Sun, 30 Oct 2022 14:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D64C40527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4upnbJQpfX4; Sun, 30 Oct 2022 14:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36314403AA;
	Sun, 30 Oct 2022 14:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36314403AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C7381BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEEAB81257
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEEAB81257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emGtWxdbP--1 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:06:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D490D80F2C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D490D80F2C
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:06:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D752C240002;
 Sun, 30 Oct 2022 14:06:43 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:06:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030150642.55d8d801@windsurf>
In-Reply-To: <20221029012020.1396608-1-james.hilliard1@gmail.com>
References: <20221029012020.1396608-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xz+9Ai/E/q93ZSPB3ZVO/STHcGvlNDq2fOCgQOU2IvQ=;
 b=P2tpKBmquyv9XeZ+WbBXhmGwnMap7iFSHor9iO5Q6hSZxGA3VgJ3dLyAu1NJHklY5Lesru
 0eti+lzB2ESmk/uuKnZxhvhqy/2A0dSfpft+9gVvceSqOoXsJ7o2/mWPJ43jrRuRaVVm/N
 WnLJIpIWNZVxmyVXIdMBi+tq+m3S5ep4vaGIYGLux13ZPPuAJuB/xsImCwykIdA6LpRkjL
 wN44hypQl5kkY205mxJ7bZ1Vao+eERcwGo/KXyrY4JaDGtg3jGEQ83x7Am8AtwF3jy4Gmy
 kfU3H8tCVb8o+84dzu810Wbg0D3cGbNsEyrwUD8jAE5wrYeWmIF1OBJcTK6WiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P2tpKBmq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version
 22.1.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Oct 2022 19:20:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to ownership clarification:
> https://github.com/python-attrs/attrs/commit/899497f165b3c8291b66c9c3a01b64881b69cf39
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-attrs/python-attrs.hash | 6 +++---
>  package/python-attrs/python-attrs.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
