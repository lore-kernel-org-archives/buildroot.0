Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11BFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7354260D6E;
	Sun,  6 Feb 2022 10:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5BXBZVtNxwO; Sun,  6 Feb 2022 10:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A072360B6A;
	Sun,  6 Feb 2022 10:27:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6009F1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F8BD814B6
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9gUdNFgTxRl for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:27:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4439E8142E
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:27:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51556E0003;
 Sun,  6 Feb 2022 10:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644143256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5dvk6JLpIRoY6BtwLeStmqnnvpGxEjJVwyXcfiYiDI=;
 b=LOxnn6jRpNlY8KsCtcmxZWkTxKnkdV3Dw7nsMF4+FIbSn3glc8v92xfm4lWnQejdhwlpoU
 l/Rn2K5jPTl4vqITM5YKeeWvHjLxXxaUbi4y4dnvI7t6E4P0FYD6pKzECLmDtrx+fXhGrq
 LH6/q3cW0ZFZDg5LWpCnD8B0fVcwbzxfcSPaJrcFrU95D/BqxelihwijmrVoqlWIT5gotk
 lEiXW20fl2X/5itxS1Ura2CIfuqYQH1BHssJjjUozBXLtfKpvIqlrZP9iTa8ClQe9JGC9/
 m8Xqu2Ab5Kw364IEkdhMG8sJQKl4fQWxRiaj1RjPR7e9FGx2tMcR1bAmjFhgww==
Date: Sun, 6 Feb 2022 11:27:35 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220206112735.1ed394dc@windsurf>
In-Reply-To: <20220131220841.127708-1-fontaine.fabrice@gmail.com>
References: <20220131220841.127708-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: needs MMU
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jan 2022 23:08:41 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libuhttpd needs MMU since version 3.13.0 and
> https://github.com/zhaojh329/libuhttpd/commit/ffdf7de3a4a1f5a62aa3814ac96e889958a30840
> to avoid the following build failure raised since commit
> 61797c52f5deef2cb67e60cf075ca243078c8855:
> 
> /home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/cgi.c: In function 'create_cgi':
> /home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/cgi.c:321:11: error: implicit declaration of function 'fork' [-Werror=implicit-function-declaration]
>   321 |     pid = fork();
>       |           ^~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d2a79dacf9ac423f7ece51b8c23f3683238312b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuhttpd/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
