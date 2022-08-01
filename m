Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905DBC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2708A60BC6;
	Mon,  1 Aug 2022 17:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2708A60BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5y71bSi6_jdc; Mon,  1 Aug 2022 17:02:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2628B60BD7;
	Mon,  1 Aug 2022 17:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2628B60BD7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A58651BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 811BF404F3
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811BF404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eREzXbS0K-VJ for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:02:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5221B4018B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5221B4018B
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:02:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59C1C1BF206;
 Mon,  1 Aug 2022 17:02:28 +0000 (UTC)
Date: Mon, 1 Aug 2022 19:02:27 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220801190227.397f706d@windsurf>
In-Reply-To: <20220728232357.270130-3-sen@phobosdpl.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
 <20220728232357.270130-3-sen@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659373349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nw3H/IAqZU7jMlyd0hDgVK7S+yOvNi+S7ZWjeIz+E6A=;
 b=AxSrQ8hAFKVphmfHs6KuS9Tov62LlCNI9WIonUXAtivcbNuBbkSyxI7ipV0m1kKplHYuFE
 oSnl1e7iInb47nVIctRbN7/wFj3z6aHaP3pnPfrFtceD4voukr8nHvhxgS4stJrUzRF20y
 SomWCuDmxuLh3QR8fD3kuMrMxuNiH9EP2UPY84JksgTCztVgmW0rdZgsIoc/hEBAEpbas3
 cujUx6sAU6Bi6BOjR5ptBduEOq04ixLBgZKgO1DVywygT5dN2gb8i2FD8qLkoAnHxFza5W
 3YYbZo15oIcJeXKYxAWC4s0YwRhT0gL3dS1pZAKB1K8ItHrfSWDvMaGiezFw3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AxSrQ8hA
Subject: Re: [Buildroot] [PATCH 3/3] support/scripts/pkg-stats: re-implement
 the sortable_hint
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

On Thu, 28 Jul 2022 18:23:57 -0500
Sen Hastings <sen@phobosdpl.com> wrote:

> This attempts to re-implement the "sortable_hint" feature without
> relying on words. The column headers and CVE expand/contract buttons
> change color and cursor style on hover.
> 
> If Javascript is enabled:
> 
> Just like [PATCH 1/3] more rules are applied to the
> generated stylesheet before content is loaded.
> 
> If Javascript is disabled:
> 
> The headers stay pearly white. :-)
> 
> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> ---
>  support/scripts/pkg-stats | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)

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
