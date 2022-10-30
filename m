Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F28FFA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFE99812E7;
	Sun, 30 Oct 2022 11:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE99812E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1olXyCu1pKr; Sun, 30 Oct 2022 11:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22B978129D;
	Sun, 30 Oct 2022 11:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22B978129D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE0191BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CC78607FE
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CC78607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcueoOxtWoN1 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:07:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5EE606ED
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E5EE606ED
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:07:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FA7F240003;
 Sun, 30 Oct 2022 11:07:13 +0000 (UTC)
Date: Sun, 30 Oct 2022 12:07:12 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030120712.48c6ed24@windsurf>
In-Reply-To: <20221029200108.90174-1-fontaine.fabrice@gmail.com>
References: <20221029200108.90174-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667128038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnyd+Z9R5KiJ4W0EnHeCx2aV6X6WpNx76xSy+uZArk4=;
 b=Q1TXUkSVFh5IFbQSSLiJVZX7a7voxZKmQwffbGkYKJoLfWctUhvRd7HTZM/oQfXHebnrjv
 krUEVjgrf3EKpEuw9GFLFptnkWU+1x5wwPoV/pYCxNX1QxrU0P2Qj4mCvF2rlzwQo+XMGg
 OZe5iD0ogMVxZ0/DdR+Z1XpFh41c7mPxMFJ0BmTLLLMahrVNDAETCxA264MgLduKKH+wAo
 J4jRxCZgfb4NeFaG0CJ5A2M08f6CtYHAEfJ44PjypS04WmIhC/IfyDkC1+eeEpjPq/q2gc
 R2CyNP5QsGkjuIwFIFz5wxvNL2i1m/mtegnwY6OCYSvMARAarJYi7VsIq+HtrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q1TXUkSV
Subject: Re: [Buildroot] [PATCH 1/1] package/libidn2: bump to version 2.3.4
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

On Sat, 29 Oct 2022 22:01:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.com/libidn/libidn2/-/blob/v2.3.4/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libidn2/libidn2.hash | 2 +-
>  package/libidn2/libidn2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
