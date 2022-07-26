Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C481C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A60754173F;
	Tue, 26 Jul 2022 15:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A60754173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZET3iD-SCS_o; Tue, 26 Jul 2022 15:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA17A4049D;
	Tue, 26 Jul 2022 15:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA17A4049D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 514281BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3349D41BB9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3349D41BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFVYNgZct7ze for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:15:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA65A421FD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA65A421FD
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:15:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 27D821BF209;
 Tue, 26 Jul 2022 15:15:26 +0000 (UTC)
Date: Tue, 26 Jul 2022 17:15:26 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220726171526.4abf4052@windsurf>
In-Reply-To: <20220114105511.1010113-1-giulio.benetti@benettiengineering.com>
References: <20220114105511.1010113-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658848528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iT/W/dNYDA2JRHZo1JsBVa5pnD3ScNJoVafzLoFwEL4=;
 b=Cv3MFmKpriRDgZHhwbWR2u2gr4kU9qsSo3Z8z4UfPUdHOwti8aZEXPw6L5BkNgvnYeFiKx
 qtAyxDQspiYkK++XiJj1N6upWE5/1hPR4nJvCw7V1n/nZD0RjtRTHDqm1Z7AshBtjrknA8
 vhUQUPcHlZV72OvcVaC38qd3xmNTw/cjkeKAbJCNrVje1Fk/u//CJEReRYFG1bWL/AIiEO
 iG1EHvTNjyvCdt0z4fd9CkIWlJVpWw4SYoAE1USMoqmmgFXz58LxDsGPGZ3uAPWkFmO755
 1WVCBO8hbsgTVwJ6PCNUtjEfbzNQd0XXxiyKaN9fHjAW3Q26HaVNw7wW2PrWYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cv3MFmKp
Subject: Re: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_104028
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Jan 2022 11:55:10 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> sg3_utils package fails to build for the M68K architecture with optimization
> enabled with gcc = 10.3.0 and it's still present in gcc = 11.1.0:
> http://autobuild.buildroot.net/results/c49300d12a209b18f41d389f092324592b881277/
> 
> It's been reported upstream:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
