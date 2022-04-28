Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A953C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044B66119C;
	Thu, 28 Apr 2022 21:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mycssyG_Dczy; Thu, 28 Apr 2022 21:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2615061196;
	Thu, 28 Apr 2022 21:11:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDF3F1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8004049A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20LzsUzR_vbF for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:10:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3DF8400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:10:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A9F7E0003;
 Thu, 28 Apr 2022 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651180204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIkiJFICAJgW1pWV4MB1swuor2zpOsuDzlkdMN0PybQ=;
 b=G3rb93Z87JoabHWci7e29o2kSi1UvLGT28jkCbHkQAykGenzv6u6Z5QH8p5puXhx9xfb8X
 Oe9R3kptRlSq56zntLYJtF6gqlZpBxNE7b1zmYEvDBTMequAf7Y1+5IeDWmbmGJUMSRnc/
 BYQx5x9Not3t8VpOd73JU9tAKFDKGkrTfx6UYse2qB2M7ch599VKX0CkQ/EQjmFR7hQddq
 dTGvQ3fdJBH3gO/Np4BCFCajcwPdTWJSkkJmx9TtjzcxR70vuIR2XXcC+3//k6bigtk8Zq
 ugvH3mFnIHmla03qIk53LljgOsD+mJcf/p205aFUqZJ0wWb8i8gOCSmoEQYNvA==
Date: Thu, 28 Apr 2022 23:09:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220428230947.3e5aa576@windsurf>
In-Reply-To: <20220428195248.782790-1-james.hilliard1@gmail.com>
References: <20220428195248.782790-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump
 to version 4.2.0
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 13:52:48 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This package now requires the flit setup type.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-typing-extensions/python-typing-extensions.hash  | 4 ++--
>  .../python-typing-extensions/python-typing-extensions.mk    | 6 +++---
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
