Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E7FC43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 06:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9809D40B84;
	Fri,  3 Jun 2022 06:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITKzAQmbmDKS; Fri,  3 Jun 2022 06:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5761401A1;
	Fri,  3 Jun 2022 06:45:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D09D1BF847
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 06:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C8098415E
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 06:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_F0UKUg9K03 for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 06:45:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E1138409A
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 06:45:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC8A040002;
 Fri,  3 Jun 2022 06:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654238752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2pf9laZhVFARUmFtgIS6zvBxY22F/z3DkTxPi2jqLA=;
 b=enNoSOT7meIcGdvoNhUlYfBDHAwJahsbrZGeAsyy2+je2ZekVuP2L9C5so2X3exMgi7coC
 +DsNVGhG8jwKAeh9spoFSo1S5nyvh49V8qW+uLbQApwzT/QidjwSPvr8R9iqXOstrQLHDf
 lIWRoUaev+Q+9oWOMiBGO2ba0RfHPZ764nj4NnO/eFqieeaOt7gsiYPSgTp0JL27Iw6XWu
 fvOLebvRuBmmgvf/RBNirGwckiqdXFkRf2V/VgciIdUyb7YM4M3UorzgXPXRtLs81h+dVd
 2sTbULalwds5KS6VziVSJaoXRqpJiNcI8W6GG+PFWe0QkACvAfR2zb7SErx25Q==
Date: Fri, 3 Jun 2022 08:45:50 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220603084550.558dec39@windsurf>
In-Reply-To: <20220529172235.446567-1-troglobit@gmail.com>
References: <20220529172235.446567-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sysklogd: bump version to v2.4.0
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

On Sun, 29 May 2022 19:22:35 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> NEWS
>   - Support for setting secure mode from the .conf file
>   - Support for running in containers, mainly disables kernel logging
>   - Support for running external scripts on log rotation, incl. SIGUSR2
>     to initiate log rotation
>   - Fixes for 8-bit data logging, use `-8` to allow
>   - Fixes for malformed wall messages
> 
> See ChangeLog[1] for details, or the release notes[2] on GitHub.
> 
> [1]: https://github.com/troglobit/sysklogd/blob/master/ChangeLog.md
> [2]: https://github.com/troglobit/sysklogd/releases/tag/v2.4.0
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/sysklogd/sysklogd.hash | 2 +-
>  package/sysklogd/sysklogd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
