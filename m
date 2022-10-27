Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103CFC67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BE3940918;
	Thu, 27 Oct 2022 06:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BE3940918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gXr5pgnVcMZ; Thu, 27 Oct 2022 06:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE204090B;
	Thu, 27 Oct 2022 06:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE204090B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7801BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72B7E81358
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72B7E81358
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zbj3BJBB4gbD for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE62281347
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE62281347
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:46:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E773110000F;
 Thu, 27 Oct 2022 06:46:20 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:46:19 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221027084619.67b393b2@windsurf>
In-Reply-To: <20221020141412.346992-2-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-2-tobias@waldekranz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0R6bE6KqkMlKS9n1hcmoJH2ZkbtHhW2vwsRg83ggZ5k=;
 b=SiLMA/B1NJ4Xj5Twv25yGGiuHp4z2eVN3LrzZTx30ghRAmHOnv8aGUw5Gk27lBW3LqqH4U
 DkZNmImW3rHYgOBWARCPXYD6jTB93E2lxxLIBaeORzRiu3vvE1d5Bbe4Ij8PwlLF2Q9rqr
 XqoS4rXTJ+TjE8ofr47p+yehga+sKKEqVm615t6JJLOLArIgnkUWNJXnx90rwzHfqOjRIc
 IlzO35UJh/zkgJMDct1ijC2fcec+oLJtH8aZlBV9v2BDpTVX554vR2Nolb5yF7pCE7YO3m
 AHA5TLKPpcGr3HFkOpOqJjj04PiSRavqXGo282i2nGMuYWXJncNe5ZcRXrVyDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SiLMA/B1
Subject: Re: [Buildroot] [PATCH 1/4] package/libbpf: fix cross compilation
 for 32-bit targets
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Oct 2022 16:14:09 +0200
Tobias Waldekranz <tobias@waldekranz.com> wrote:

> Add upstream patch that sources the library path (lib vs. lib64) from
> the compiler rather than from uname(1).
> 
> Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
> ---
>  ...cross-compilation-for-32-bit-targets.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch

Thanks, applied with a rework commit log:

    package/libbpf: install in the correct lib directory
    
    The libbpf build system currently uses the output of "uname -m" to
    determine if the library should be installed in "lib" or
    "lib64". However, uname -m returns the architecture of the build
    machine, which often has nothing to do with the target CPU
    architecture.
    
    A patch has been submitted and accepted upstream to address this
    issue, by using the $(CC) -dumpmachine output instead. This ensures
    libbpf is installed in either "lib" or "lib64" depending on the
    bitness of the target CPU architecture.
    
    Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The patch was also moved away from the version-specific directory, and
the upstream status of the patch was added in the patch itself.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
