Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F23C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03642401DF;
	Mon,  8 Aug 2022 20:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03642401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 93wNKtnOMjC6; Mon,  8 Aug 2022 20:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1021540180;
	Mon,  8 Aug 2022 20:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1021540180
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9CA1BF283
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 569828143D
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 569828143D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9DHCqWyh7sQ for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:49:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CD67812C1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CD67812C1
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:49:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 743E320005;
 Mon,  8 Aug 2022 20:49:21 +0000 (UTC)
Date: Mon, 8 Aug 2022 22:49:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220808224920.3a80a89a@windsurf>
In-Reply-To: <20220808110414.714381-1-fontaine.fabrice@gmail.com>
References: <20220808110414.714381-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659991761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NuYM8O+qJawiHza5OMou4iQiR7AqBo+YqxZY1zpU78k=;
 b=azKVy8oJ6IWAfzN5eATwrF9ts4gqmTX5whYtHxOEwULYE/7LE9aoUfxu1+SAoXwPw7UV0P
 /Rycmijvu2nMFXgzMFeAYc9ZHbHb7uboK3zkUH3/WVUIF3T1yc+oLoj1Csr1jDWV8v4wKs
 iumCkBphpoPXGt3kMkCLJQNVU6yGG2wU6lLeh3knHKdVM86E54tmdlEfqMD4uOriFn6Ibj
 UlymxpIuFd/T+imq9MBtgYq0waexAAgYv4ILPJcliL31BwjXcKYfnFwbYf6fuQqrh2eYQn
 i1y9esAffkHBaZETLNZsjHZwZg3uhjBSthRBkB3LEY7nlUpiTdiLuOI25A2v2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=azKVy8oJ
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add refpolicy
 custom git handling
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

On Mon,  8 Aug 2022 13:04:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add a custom case to make sure that a random configuration with an empty
> git location for refpolicy doesn't fail. It reverts to
> BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION in that case.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/98da07a1f9b88e2e8a028a55c8cf76c6ebc28304
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 7 +++++++
>  1 file changed, 7 insertions(+)

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
