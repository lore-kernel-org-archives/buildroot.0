Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D49EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6497F41F12;
	Wed, 12 Jul 2023 19:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6497F41F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhAZsdG-iwJh; Wed, 12 Jul 2023 19:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DBE141C3F;
	Wed, 12 Jul 2023 19:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DBE141C3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0D331BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A355404AE
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A355404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZJgoDHew_mH for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 675704015A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 675704015A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:51:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BCC760004;
 Wed, 12 Jul 2023 19:51:01 +0000 (UTC)
Date: Wed, 12 Jul 2023 21:51:00 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230712215100.4f35aa53@windsurf>
In-Reply-To: <20230711221456.1703814-1-christian@aperture.us>
References: <20230711221456.1703814-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689191462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+rF1RAB8P2uHSYrOIpuJqqjk/H0ZlDtEDuLuBoldr8c=;
 b=aknPTD1Ie/Zciip/yZjPR9HztAC9N8+X/MUJ/we2D+p5w2ILcHAiwGHDLt5MysHxbP/q6q
 fsE4I5hH9YKVN34kwOdsF47t2CKUpF8KKihJGm9OoYGl/nI9iV5nR8QmeZu3zvy2xsE3Uk
 1QJUt54P5VfMzTOEKDZZ1FMCZdgOj8J9tEoyQ9+ki0dOriAtT5XGLrjZM7Tkp2vCH9aP6k
 RrIXurb3U1CwyOxiXE/czxmwv77OVMxLl0RLLrAOcy4TZtmiX1ocztzNoB/HW+ulbeNk7j
 PeT5JJR3WCFdNTnTFjk78iUHbJqKY5/xzb8rEeXXQXfJd7hUfemtg16J2KkUHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aknPTD1I
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to version
 1.19.11
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 15:14:56 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> go1.19.11 (released 2023-07-11) includes a security fix to the net/http package,
> as well as bug fixes to cgo, the cover tool, the go command, the runtime, and
> the go/printer package.
> 
> CVE-2023-29406 and Go issue https://go.dev/issue/60374
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
