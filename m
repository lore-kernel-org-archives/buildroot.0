Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F35BC001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DD91400DC;
	Thu, 10 Aug 2023 22:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DD91400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwRTFOD4Zdel; Thu, 10 Aug 2023 22:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58A24414D5;
	Thu, 10 Aug 2023 22:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A24414D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 602101BF83B
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0689440B6D
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 22:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0689440B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PN4aga-C7LlH for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 22:09:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69A46414D5
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69A46414D5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CC69C0006;
 Thu, 10 Aug 2023 22:09:41 +0000 (UTC)
Date: Fri, 11 Aug 2023 00:09:40 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230811000940.1560477f@windsurf>
In-Reply-To: <20230101233653.487175-2-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-2-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691705381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yb4hNOgFcib99PCaNsMVC7s2KqxXY2bWvcUY0ide6pI=;
 b=Tsk+FHs5e5BAhY6RsY0+DrXWFmDqfIrNfvz5x4ASzKKtQdgDEZ2aUiqBmiyAnSHnMb2teZ
 0bFJO1QiyNuD42QCAnDeu+NgzwEbp+XEgVEST2FNlTTnBpv/+3RBNujdW8GgcMSo9sJPNQ
 FcMTl7td2gEwyag7fXMF5rxQSUw2jD5q6howAs+3QqMZtEdBPbSNPz/+CxHuvyl1CZru/1
 DNL7iftN1S9886hFyiUDtkjWoClOmX1JnH6d9Ow+Ac4SuHHuJxioTiVfkjXczvPVEREPHS
 pv/yF7PtlOq9lbriSrTDCoJR9v2lSTlIPDgvzFT3OzMj98mUUNmNEXzxLbUGYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tsk+FHs5
Subject: Re: [Buildroot] [PATCH 01/29] package/pkg-generic: add check for
 deprecated _INSTALL_HOST_OPTS
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

On Sun,  1 Jan 2023 20:36:25 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Commit "f6fe8932df pkg-generic: add checks on deprecated variables
> FOO_BAR_OPT" introduced checks for deprecated variables, and warns the
> user to use _INSTALL_HOST_OPTS instead of _INSTALL_HOST_OPT.
> 
> Commit "6a25cec33d package/pkg-cmake.mk: rename _INSTALL_HOST_OPTS ->
> _INSTALL_OPTS" removed the usage of _INSTALL_HOST_OPTS but didn't add a
> check for the deprecated variable.
> 
> Add a warning to change _INSTALL_HOST_OPTS to _INSTALL_OPTS.
> And change the warning for _INSTALL_HOST_OPT to also suggest
> _INSTALL_OPTS.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/pkg-generic.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Not sure why we didn't apply this earlier: applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
