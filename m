Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574DEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19BD5408A5;
	Thu,  2 Jun 2022 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hk0eKUMf0QZE; Thu,  2 Jun 2022 16:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29465405A3;
	Thu,  2 Jun 2022 16:53:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AA291BF44A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 787C2415AB
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 16:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FWG_SNbl7bdV for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 16:52:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53652415A7
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 16:52:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3CA36100002;
 Thu,  2 Jun 2022 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654188767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKFlNMxGcCb83a6WW+8Ol7LYuK9XqbhHY/g1m5OlLGo=;
 b=bMZpOu6GNc3rPcL/St49VDV7uXFdpgpmiC0duYWnE1rNyMi5bIqHQDNt/ySzoEK55wLNGY
 MIVQvaiqvK3ICHHr/1DLPjmQ4DyfvvDf//QAw1hLKFAC3J0kG1y0OXSDLEPVTnQdNbb9qn
 Aj+rGLjl5CBJP6bRWhpufm73eGhW0DoPNrvibdz/JSp7FYwFg3xEGwfrZ0EwLXBbGKOgry
 Czz4vfR+U4jz3aL+9UojdW97yjOIi2JvOjZlAlq4HiwQCx+gf3KGp2MDm9AjF7HXQOQ17K
 zJXzcwLcrTAOSAC7YPTG0Kpd2cl4kLGJG+TefNS6xyfWDrk9/5dNvgIpFDQfQA==
Date: Thu, 2 Jun 2022 18:52:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220602185246.642a41ec@windsurf>
In-Reply-To: <20220517202805.1524501-1-james.hilliard1@gmail.com>
References: <20220517202805.1524501-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-sqlalchemy: bump
 to version 2.5.1
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

On Tue, 17 May 2022 14:28:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-flask-sqlalchemy/python-flask-sqlalchemy.hash    | 6 +++---
>  package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk  | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
