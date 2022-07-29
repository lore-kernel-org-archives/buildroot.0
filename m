Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F35C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 11:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A01400BE;
	Fri, 29 Jul 2022 11:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16A01400BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVx-ePHkGo3M; Fri, 29 Jul 2022 11:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C807840995;
	Fri, 29 Jul 2022 11:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C807840995
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 133E61BF279
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D57C684013
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 11:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D57C684013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgZVrNJyNWqc for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 11:28:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAD4284012
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAD4284012
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 11:28:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BECFD1BF20A;
 Fri, 29 Jul 2022 11:28:00 +0000 (UTC)
Date: Fri, 29 Jul 2022 13:27:59 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220729132759.66cca402@windsurf>
In-Reply-To: <20220729052809.793581-1-aperez@igalia.com>
References: <20220729052809.793581-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659094081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oW2grdqadSG6CapsslwUj60jXl9rxcL1kKqsEhGmmog=;
 b=VsL1bfCg18O4r3HsjoLmjOrYpdGnjYoblNbPwLRSodj3d1Lc7YUHuzwn7+IoVk5rQ06yVD
 Lf6qMTFnOETlELLXawCndNten2qlEqPhMHVQr50TcDuob2Ou6mqdMFFcHW8GhNn80JHNqG
 kZgR8OBfpAgy78U9slt4DZso/yekmjKdM9csknOk0wS0T0o8ByHNNPo3AbBSMcn1FjB8B1
 5noAYAxFP+CJf0NMvufyX/vFaL3WEmEqVD0dJo8stVBMWcx044U1O7fe5Y0127NRvIg0e0
 nRPRMCXPhcYvTxYy1jOoypOq3ZIvFu0UsoOMIBiIo24p5Y7gR9zsGxoFKg1u+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VsL1bfCg
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.36.5
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

On Fri, 29 Jul 2022 08:28:09 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bugfix release, including the patch that can be now removed, and
> security patches for CVE-2022-32792, CVE-2022-32816, and CVE-2022-2294.
> 
> Release notes:
> 
>   https://webkitgtk.org/2022/07/28/webkitgtk2.36.5-released.html
> 
> Accompanying security advisory:
> 
>   https://webkitgtk.org/security/WSA-2022-0007.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...5034-WebKitTestRunner-shouldn-t-link.patch | 58 -------------------
>  package/webkitgtk/webkitgtk.hash              |  8 +--
>  package/webkitgtk/webkitgtk.mk                |  2 +-
>  3 files changed, 5 insertions(+), 63 deletions(-)
>  delete mode 100644 package/webkitgtk/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch

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
