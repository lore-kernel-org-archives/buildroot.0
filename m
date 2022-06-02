Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B1DC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF66040B32;
	Thu,  2 Jun 2022 14:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yoqZ7t1tQo_Q; Thu,  2 Jun 2022 14:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A7940162;
	Thu,  2 Jun 2022 14:13:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C75E81BF5EA
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6B7B61003
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9Xt5S6Cj56T for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:13:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B23A460FF0
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:13:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED2DFC0004;
 Thu,  2 Jun 2022 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654179223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NPNJtXZAKncCzpPh8mUBdm1BnJxUie3OFYuI2QnDzgM=;
 b=LmV335bwz+4vdwhord+L5NAZYbkBmIIxDJI2nfqKdfkIQd0Uui+FVlZ4ajkAzctCKKWvUS
 lzGo7os0gYHJ3rmGiLbI6abmecnIwEGAjpHDHBW5gdIlaJ5VwDMWKXLnxRLs5S4poActnt
 LU2gTaxua9FZNH34ou/ru3Uc5nv7m5Xx/GpfbKgIcugPpp5nTUzdvcau24e9eThC72RvKf
 DBOSjI+hy9GwjyL5NnGt1rNK+MenRWTU72GfOwBJcAq3BRt/7df3fSoAoC6gspkk3xtd2o
 0gqNJHv2ibiKzycgvWPqJLkPam8B6eWexC7YSZfdrhjI9mdPp7r8G1L1n0hsAg==
Date: Thu, 2 Jun 2022 16:13:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220602161342.1ebaad41@windsurf>
In-Reply-To: <20220517193139.1827192-1-james.hilliard1@gmail.com>
References: <20220517193139.1827192-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 6.8.0
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

On Tue, 17 May 2022 13:31:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/bpftool/bpftool.hash | 2 +-
>  package/bpftool/bpftool.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks. It would be great to stop using libbpf as a
submodule and use an external libbpf instead (if possible).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
