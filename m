Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78408C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330CE42151;
	Mon,  6 Nov 2023 22:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330CE42151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sn4myk8tKgep; Mon,  6 Nov 2023 22:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8942942161;
	Mon,  6 Nov 2023 22:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8942942161
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C08B01BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A709C824D4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A709C824D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16mbu5hO3chn for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A23908234E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A23908234E
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB18960003;
 Mon,  6 Nov 2023 22:25:47 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:11 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232411.57b0ade9@windsurf>
In-Reply-To: <20231105063336.2858782-1-james.hilliard1@gmail.com>
References: <20231105063336.2858782-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mb75Qz8J5W+zWurvJ44RZUR7HnonfsLl6ZjjmRaysns=;
 b=lq7Zbp9iz3SW8sO3n0QK482zZ29A2lJ+vtj1O+4gli4VgcHGtSpjH5I3PuI8wSq3m5CuXw
 BMzxWDhIRwpiqIRVBBQVIC3ZThFbiY3hu1QIwSFXLBtuopiZPpwyYZ4OC0Ne+Xjw9N3zWl
 0OnfY5hHTf5XfByg2PW94e5Wu04nUlz0aQ5YOpQxDkxwXZdbjm/OOnlzC/NvjEM+hyjeO5
 HS28mFSALJ64IX7UVW7OaNLKJKNoUg9SqiY7SG1PZFkmGrIQ4Dx+cNd3ZKQxJDyBKHyJj5
 qM15+2t5fW9HQYD0EIRfANU9A4tm2+PdQqlww4SPcThT6hPdttPpLtysxmOkog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lq7Zbp9i
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-sqlalchemy: bump
 to version 3.1.1
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

On Sun,  5 Nov 2023 00:33:36 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-flask-sqlalchemy/python-flask-sqlalchemy.hash    | 4 ++--
>  package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk  | 6 +++---
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
