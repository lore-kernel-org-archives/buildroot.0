Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA48DC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5880940574;
	Wed, 21 Sep 2022 20:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5880940574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KG0Tem12YNQA; Wed, 21 Sep 2022 20:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83FD240217;
	Wed, 21 Sep 2022 20:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83FD240217
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 322C61BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5DD416D2
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B5DD416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 198D5sOU-9eP for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:20:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DE8415E1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82DE8415E1
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:20:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E31A240004;
 Wed, 21 Sep 2022 20:20:45 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:20:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220921222044.41e81f00@windsurf>
In-Reply-To: <20220918131344.301025-1-fontaine.fabrice@gmail.com>
References: <20220918131344.301025-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663791645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIPPjBAfAg9wBJ0TLqHxjAwn5lqje9PH5Q9/eyR5FZI=;
 b=HqmS4oK7M4/7TjZ90Es0qt2b4/neAFA1fvetDXtN6bHmpX+hgizNjyj4IQZmUjRdwjIZ/g
 3NG5KdBojARBzKGd5ZGtzW2hJHrpG3AarcWBS3yyrlKI5WfOxh9fClT2FQroLyOgosf/3f
 d8BiBSgzcvX+Huabs/Q2alX/IGSghCr7UswKyku30NTpP5S43XAVG7UH0qWWSzlZAAaDDS
 GydKD0k9Ocq0QL3+g6faiua801y1p8qNawC/gmOR1GZsKo0yHySjUNSLZDe5VVrdSpRwbd
 tJ2Nhrj8+hvdNqTlFe8JvqKBCCOnIxZ2b5hsMc9wxUCsjumeOH/iGbn+/asbpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HqmS4oK7
Subject: Re: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.6.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Sep 2022 15:13:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> http://git.haproxy.org/?p=haproxy-2.6.git;a=blob;f=CHANGELOG;h=5e4ca2c913fa117587652a6a08844e3e2e3b62eb;hb=987a4e248bbccf4bffe955b27ccfbcbb626348c2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
