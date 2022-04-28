Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44957C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 059276119E;
	Thu, 28 Apr 2022 21:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5f8rX_5dEI0; Thu, 28 Apr 2022 21:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BFDA61188;
	Thu, 28 Apr 2022 21:12:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 197F11BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1686A4048A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXZQLgOOxDNc for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BD9E400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:10:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E3466E0005;
 Thu, 28 Apr 2022 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651180214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWem36CBOGtChAJdRK52eN6AIqk0WEU0hfo+mdEjRaM=;
 b=krrXJ+8VvsDN2uZ0/ReHfzJ4S0+lOM8wEDyPbbF2Quc7cPgVg9KyGoIJ+oJpNgEKqwM+QE
 b8KFnP6N1NG68d9RtX/6Asw9lq9OjRX9PR9Z8XrMBub5Vx2wTU3rjtdIT0RY1O9luWPUdH
 Nz+Rya1LFOPBhWsHViTqnJ0o4yZDLgoviJN93qa1uYMpxBhz9ppUawZ0brYFN7s/b7yaIu
 riOQJfKwC/Hlx6Qe/rpjNFmnKx+0mHBdPGmvLjqgRf9a8A8zza9Xc0HUXseN3MXS8ZOdBb
 QtWZlHlaxBFrYGd0jmuFsE7Ojk4HJk/4NPXP1Fp/CSNAmrz7lsN0MEuZaqYgyA==
Date: Thu, 28 Apr 2022 23:09:54 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220428230954.712e0a86@windsurf>
In-Reply-To: <20220428200325.789340-1-james.hilliard1@gmail.com>
References: <20220428200325.789340-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 1.26.9
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

On Thu, 28 Apr 2022 14:03:25 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-urllib3/python-urllib3.hash | 4 ++--
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
