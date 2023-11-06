Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947AAC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52D8B41571;
	Mon,  6 Nov 2023 22:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52D8B41571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZIRLpwuNwaE; Mon,  6 Nov 2023 22:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8650A421D5;
	Mon,  6 Nov 2023 22:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8650A421D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C261BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BDDE4012C
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDDE4012C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UzFyobsMbZw1 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 664E24215B
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664E24215B
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDAD560008;
 Mon,  6 Nov 2023 22:25:53 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232324.47f0bf5c@windsurf>
In-Reply-To: <20231105081048.2899248-1-james.hilliard1@gmail.com>
References: <20231105081048.2899248-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HgRb5dl1Nf/aH93ewD6WkJ5i05ZkWU/PYaDs8nCUl1s=;
 b=HPW5Y5ACO8dFiqeHO8y+9yEISAlqvyr5yNWCjZjOHogm55VEiW+MUXwUFuqpFkAit5JhW+
 UQ9i+ZK88nGKRKWkPf9TfE0VuTcpIvgULs6xaTygaNNEkhfF+AafDCd0CV9mE6jPY7se7C
 tdVvfY/QHGrF5NrMoxZ/wZ8h3/eIuX4ndTWvdoewuZVO2uvQBkfq6XycS++PeGYgt7pUdw
 /fnj4/wYktEojwsIgMOJDDFU9HhK0O2MMQtAe1+GlJAkLuJ85IUaf76hpD8slNLni/gLCx
 Tf2SyolTFnqH3rTAAemP9doVPJU8NBt9wydWaiBIEHL46kPELzKIq0S8W7AXrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HPW5Y5AC
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump
 to version 4.0.0
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

On Sun,  5 Nov 2023 01:10:48 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to copyright notice removal:
> https://github.com/jaraco/jaraco.functools/commit/5957d58266e479f124b31f30e4322e798fdf386b
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-jaraco-functools/python-jaraco-functools.hash    | 6 +++---
>  package/python-jaraco-functools/python-jaraco-functools.mk  | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
