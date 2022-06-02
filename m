Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E569C43334
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD20983E05;
	Thu,  2 Jun 2022 16:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XLynAeV8IW_R; Thu,  2 Jun 2022 16:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19CC483DFB;
	Thu,  2 Jun 2022 16:53:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 774BF1BF44A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 665D640570
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7tblEaJuEso for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 16:53:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08ED6400D8
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 16:52:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 332A02000C;
 Thu,  2 Jun 2022 16:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654188778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VXSWxmmwgCvAPj2mHgIR+iHDsmvoP4wtzXizZ7IQw4=;
 b=j1tSgf0cyLz+URFXC+EFeKU0bbi14x1GsIr5FGm8uM8R6GsoOYvw8mGlMY6N6HrE2bGTsK
 jVWLh3ynC0qMzY3B9+0KsI21xrrmMy2XQLfJhUjN6CA6i533Nf86ytAtic4wq48OZp609P
 tdRfV00fl5hc8bLYxDDha0lEHy/j2W4iZ1SO71t/wdpVdzJYj8WaIflpQAiW+c6QFbr0VU
 b5NMrJZzATaww5hC5T7rMB6TIIBcPLY8RXOs73IIieeGXRQJQoPLrydyivFFw/kJn96Uei
 wYjDE/UQ9FEr8qMeQaf252mm1uEi7IZo+WTH5EJxDe0F/rGsWLk6/LUZOD93Lw==
Date: Thu, 2 Jun 2022 18:52:57 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220602185257.101ccf7a@windsurf>
In-Reply-To: <20220517220253.1554088-1-james.hilliard1@gmail.com>
References: <20220517220253.1554088-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-expects-json: bump
 to version 1.7.0
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

On Tue, 17 May 2022 16:02:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-flask-expects-json/python-flask-expects-json.hash  | 4 ++--
>  .../python-flask-expects-json/python-flask-expects-json.mk    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
