Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49FC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C9B5408DB;
	Tue,  7 Feb 2023 13:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C9B5408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ef5QqSPFfXIu; Tue,  7 Feb 2023 13:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF9D7408CA;
	Tue,  7 Feb 2023 13:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF9D7408CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B85FB1BF376
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FF58408CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF58408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27ziAT_rnAIm for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FD7F4061D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FD7F4061D
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:31:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B5271BF203;
 Tue,  7 Feb 2023 13:31:17 +0000 (UTC)
Date: Tue, 7 Feb 2023 14:31:16 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230207143116.40b1f42b@windsurf>
In-Reply-To: <20221122203130.184496-1-ju.o@free.fr>
References: <20221122203130.184496-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675776677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYpH2sT54URZP+Sic1l1iMgAQ8ah74UdibYk2TwVFbI=;
 b=FAhA71nLpef+UGbnh92N8XqkWpeHOofHM6mt9J7RvDq/mZM9ENnJoDcFJH80nbZFgG4siU
 XGzDTVKRPz9g++M9ObwnCwV/8WeYewQXpBReHJ9FDd5OUNwejm1UpMUpXrnKilt0MQL01X
 xhQ9pqSb4RgbZRWcizROeQ0gcc1pnFwuq29AX0Y5z3ZFZo1zEprIutrxgcNBz8Ge/MCxM9
 wH2QCtGyTPJzrBu/7/MuVVNKgMGcgQm8t+b+sMMLTgOgUnO7LmYnXAmb07pq3bqgqxShz4
 6mbHGUYPIAhWHkccwC1P80yrD49E/bsojBJQGcKTXm3csqkbTBq2R05DxhMDqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FAhA71nL
Subject: Re: [Buildroot] [PATCH next v2 1/7] package/python-idna: set
 _SETUP_TYPE = flit
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

On Tue, 22 Nov 2022 21:31:24 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Python idna package switched to pyproject.toml in commit:
> https://github.com/kjd/idna/commit/2a00e518efe55d2eeb62cd3f88ace7db41338603
> which is included in idna v3.4.
> 
> When using the old setuptools infra, the package is incorrectly
> installed as v0.0, which is then incorrectly detected by other
> packages when using setuptools pkg_resources.
> 
> The issue can be reproduced with the command:
> 
>     python3 <<EOF
>     __requires__ = ["idna >= 2.5"]
>     import pkg_resources
>     EOF
> 
> which will fail with output:
> 
>     pkg_resources.ContextualVersionConflict: (idna 0.0.0 (/usr/lib/python3.11/site-packages), Requirement.parse('idna>=2.5'), {'hyperlink'})
>     pkg_resources.DistributionNotFound: The 'idna>=2.5' distribution was not found and is required by hyperlink
> 
> This commit changes _SETUP_TYPE to "flit" to fix this issue.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Included James' review comment:
>   - _SETUP_TYPE changed from pep517 to flit
> ---
>  package/python-idna/python-idna.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, entire series applied! There was really not much to fix. In one
commit, the runtime test file was forgotten in DEVELOPERS, and in
another, I've added a reference to the upstream commit for the
open(..., "rU") thing.

Thanks a lot for having added relevant runtime tests for all of this,
this is really good!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
