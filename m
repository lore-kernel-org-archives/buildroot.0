Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026B5C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A34F441A5F;
	Mon,  1 Jan 2024 21:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A34F441A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxX6v4JLsQR5; Mon,  1 Jan 2024 21:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FA0340A7E;
	Mon,  1 Jan 2024 21:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FA0340A7E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 073691BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FF6640906
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF6640906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwhWytlB7cbl for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:07:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9793A40912
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9793A40912
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63B35240003;
 Mon,  1 Jan 2024 21:06:57 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:06:56 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101220656.7d7d29ec@windsurf>
In-Reply-To: <20231230182129.1038499-1-fontaine.fabrice@gmail.com>
References: <20231230182129.1038499-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bCPWXx/VucMLv+FHVq4IEIcdkg2KGus+N5+QbDXv/7M=;
 b=H/QKfx6CTv1+pNFnAyjU7Z6TCJJ14/ta4kdVbH3RON4v8KF8n8dzIY9NmvQPzJCBT6mOrw
 l+2qXmkPOmvNeClYR5+V5kSGALypS8xOfzA+4sAj6qtdgedI8kdSprHx64mHNVQ3uvJirL
 q1HZ5qEWdBYMgnhgGIuPzDt/82395nuBwSKa2chD+9Zwrjn0sovATEWHAy2vFU8HUTE+SC
 2XSGTJ8NCFsQdkdroMPgoW4VunPv/2W2ZwiwY/c7PomGOmjMc3jVJpDDuXEbOXsJDQ4tnX
 W+HyUWx+iiKVlPWWI6CXXGWa7X/4mkRcV0lCy6w+ICtLS/VWr+GsPdkDl676pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H/QKfx6C
Subject: Re: [Buildroot] [PATCH 1/1] package/neard: bump to version 0.19
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 19:21:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://git.kernel.org/pub/scm/network/nfc/neard.git/tree/ChangeLog?h=v0.19
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/neard/neard.hash | 2 +-
>  package/neard/neard.mk   | 2 +-
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
