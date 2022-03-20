Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464F4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F180040593;
	Sun, 20 Mar 2022 17:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 72VP7qdlFWsf; Sun, 20 Mar 2022 17:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2CE0400D9;
	Sun, 20 Mar 2022 17:08:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86F1D1BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81E98400D9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlXEHA354uCR for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F4FF40022
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D8D5FF807;
 Sun, 20 Mar 2022 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98r0XRhNeqVhWX5QzhgBbG3GvBDuCwxvuASTzrt7uCU=;
 b=UxY9QtTSIx96YPwu74Pkfx6mT4YBSiMS549W1uubeKDt8mlpyxJRYg+OctUfRcFB8f7vxP
 9L5/6bn25Yl//5VsAJnPARmgZt4AZyEVFjUV2shcbpIhKzw6WjVkxqaeVqkSVyIaRqEFLD
 vYtd8yuBkaUKGwCJl8noVexfIrJuu+umggzg7WHi6ORiDW2lGQtw4Qoqm4OD2YOHXrFEgQ
 6Fk3vp6y3P625tmm7gxEf2xhngOU7SDlUyXFOlLHmHJI+Ov39Foh8/kVb4eivj+1AAWhA1
 K5vLClCoNjjz7gDT6BBULCVsDox0k7m5HJO/sVK4mI0F4p0k/O97QIA0m4pvWw==
Date: Sun, 20 Mar 2022 18:03:46 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180346.34c2f8a4@windsurf>
In-Reply-To: <20220320121708.3679262-1-bernd.kuhls@t-online.de>
References: <20220320121708.3679262-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.15.6
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

On Sun, 20 Mar 2022 13:17:08 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://www.samba.org/samba/history/samba-4.15.6.html
> 
> Added new answer to samba4-cache.txt needed due to upstream commit:
> https://gitlab.com/samba-team/samba/-/commit/f7e31127e7f8beb12294c5187cca9e191589ddcc
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/samba4-cache.txt | 1 +
>  package/samba4/samba4.hash      | 4 ++--
>  package/samba4/samba4.mk        | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)

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
