Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD37EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 210BB81FA9;
	Mon, 10 Jul 2023 18:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 210BB81FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dj7JfXT1g1Ca; Mon, 10 Jul 2023 18:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6169581ED2;
	Mon, 10 Jul 2023 18:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6169581ED2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 246811BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AC9181ED2
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 18:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AC9181ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUYDqTouLSFc for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 18:01:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0433F81EB5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0433F81EB5
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 18:01:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E784A60009;
 Mon, 10 Jul 2023 18:01:47 +0000 (UTC)
Date: Mon, 10 Jul 2023 20:01:46 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230710200146.33aa4362@windsurf>
In-Reply-To: <20230627072640.2437216-2-james.hilliard1@gmail.com>
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689012108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKEb0/jVdjyDWTlzVS8t3+dOjzERpXJPJxpA1ghtmPY=;
 b=Oh9cXiXUgtG9rtGua5hW7vS+zz8mlSq3k+qBnSIB080LBO/Z55DVtMxe2HJHhsf6SJVc00
 EvlDSkOXFCL3vIjywkbnrWNhnnXOKBpBZPe+KMopBJBhZiiOpnVJG3vPLcOqysHF0GYoHP
 +P7Hg/RXH69YwmC4l88Y6x3uRevGKOenQjIE+OY91E2hGLb93l80fstrPGXGKSJcbAy+kn
 OorMIqtEax1dgycelyEjV32VYLQSlA38ME5iicIgOVt/ThiOEUxFJAPMx5CesaDRTQR6XQ
 HLvB41rhzSd5lKmFc6TRpXUQHpiqOyG0OKU09l2NDahfwbnLhO8P1Y+uC3oOKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oh9cXiXU
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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

Hello James,

On Tue, 27 Jun 2023 01:26:40 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to migrate python-terminaltables to the pep517 poetry-core
> backend as setuptools is not supported.
> 
> Upstream has merged a patch replacing poetry with poetry-core, however
> we can not backport this using a patch file due to CRLF line ending
> issues so we will have to apply the change in the patch using sed
> instead.
> 
> See upstream commit:
> https://github.com/matthewdeanmartin/terminaltables/commit/9e3dda0efb54fee6934c744a13a7336d24c6e9e9
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

What is the motivation to do this, if the current version of
python-terminaltables builds fine with setuptools?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
