Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A1C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9AB7400EC;
	Sat, 25 Feb 2023 09:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9AB7400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVO5M9NdvB7X; Sat, 25 Feb 2023 09:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19F2E40C62;
	Sat, 25 Feb 2023 09:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19F2E40C62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 605341BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DD964090E
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DD964090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uk0IiA06kPfg for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:40:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DFBD4070F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DFBD4070F
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:40:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 281B7C0006;
 Sat, 25 Feb 2023 09:40:45 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:40:44 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104044.0c68f497@windsurf>
In-Reply-To: <20230225093527.16587-1-fontaine.fabrice@gmail.com>
References: <20230225093527.16587-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GdqdOTS0+7ZgktLgwTHeiF0gS05LeAzV9eQHNofnwM=;
 b=IJ7UT+aaSyC8eaOYmuCxE8S9irUkDVXyQN+N7sj22L6uyYkQ4wp7FkeyXgFtzdxzHxwK0F
 Eu3alAyJopjAIEe2+nqykwUnkV9hBI9MB5e2OIj8/jn0OQYZL+WZGKqPMT/9bTfJ7E84H7
 ihBn6e7i7RZ9J/shomEpKtxhwxodS/I2TKMC+LwGOngJwj/gAtJiLfjp+ePV0fI408OEl6
 kyHmen2Vt40BJbWCDhWimkG5yy0xN8WdR27Ody+oFFGNWhyAQ3b7b7laTGKIJRMPpMwUFW
 6zcibRafjIqJa4/did00hFmACjOlfOXfx5TDD0RYw95J6nVBNHb6y9CCQMv90w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IJ7UT+aa
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: add host-pkgconf
 dependency
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Feb 2023 10:35:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-pkgconf is mandatory to find lz4 and zstd resulting in the
> following build failure since commit
> 9cd2e6e090449f9d2f371d24152580c038892f3d:
> 
> configure: error: in `/home/autobuild/autobuild/instance-5/output-1/build/postgresql-15.2':
> configure: error: The pkg-config script could not be found or is too old.  Make sure it
> is in your PATH or set the PKG_CONFIG environment variable to the full
> path to pkg-config.
> 
> Alternatively, you may set the environment variables LZ4_CFLAGS
> and LZ4_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8744277ebe9910635ef8fe290c8ba4eee420b538
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/postgresql/postgresql.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
