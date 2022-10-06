Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479CCC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD2441A04;
	Thu,  6 Oct 2022 19:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD2441A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ENIlFfL5cB4; Thu,  6 Oct 2022 19:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC406419FD;
	Thu,  6 Oct 2022 19:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC406419FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B05391BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC96419FD
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CC96419FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkD_w_mQ2WLZ for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:51:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35583418B0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35583418B0
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:51:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A786240003;
 Thu,  6 Oct 2022 19:50:59 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:50:57 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221006215057.49eec773@windsurf>
In-Reply-To: <1665044877-79114-1-git-send-email-gwenj@trabucayre.com>
References: <1665044877-79114-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rW1NPecuAIHv93gu7Iq/5px7Ss+dqmvZlf9AuW+stbI=;
 b=fGW/8imIMdm09Npdtxi8Js4V9yOtAtk9bbvwwv53UqewangHzGDQwSM4oGk4PkqLdpq7HY
 /IV4SHac12ayCCDqs/6DJvx1IU6x4vRezJ5P3E4A17PpKpOq5YBG3Ff5vU6lut68XbFg2x
 5EdRcMbKPbezcxTwXBAU/t5OsZrHxeGm2pW+i9GXG5k9kyRu6IiQltl9YSH5edbLxDHb1y
 8HgmluvqUBGsA/oF0BQiMUSK9Q+2nhWHugPRR/xEez6r8c7rY07eg6Rp5LLkjzfRhe8jVW
 oTTOj+OVMdB8rRfTCqmi+Lgw3UxI9zIz8VXcaJbarlCrMCNqEb+Tc3Jyx5vHLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fGW/8imI
Subject: Re: [Buildroot] [PATCH v4] package/gnuradio: bump version to
 3.10.4.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu,  6 Oct 2022 10:27:57 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> - Since gnuradio 3.10 swig was replaced by pybind. Now python libraries,
>   bindings and python wrappers are produces using pybind: this why python-pybind
>   is a buildtime dependency. This one is a stagging only package (nothing
>   installed into target directory -> no select BR2_PACKAGE_PYTHON_PYBIND
>   added to Config.in but GNURADIO_DEPENDENCIES is updated with python-pybind).

I am sorry, but this still doesn't make any sense, and will in fact
cause build failures. A package cannot have a target package in its
<pkg>_DEPENDENCIES variable without selecting it.

If python-pybind is needed at build time on the host, then
GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing
needs to be done in Config.in.

If python-pybind is needed on the target, then two options:

 (1) It's needed only at runtime => it should be selected in Config.in.

 (2) It's needed at build-time => it should be selected in Config.in
 *and* and added as a dependency in GNURADIO_DEPENDENCIES. However, I'd
 like to see a serious justification, because it is really uncommon to
 have target Python packages be build-time dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
