Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF807C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC0AC60F7A;
	Tue,  2 Jan 2024 22:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC0AC60F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5ER6KQ-XYb7; Tue,  2 Jan 2024 22:41:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 073E160F58;
	Tue,  2 Jan 2024 22:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 073E160F58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6D4B1BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 635544014B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 635544014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDCRbumgq3J1 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:40:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A7CF400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A7CF400CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9429740003;
 Tue,  2 Jan 2024 22:40:34 +0000 (UTC)
Date: Tue, 2 Jan 2024 23:40:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240102234034.7e3496c6@windsurf>
In-Reply-To: <20231214192439.259156-1-james.hilliard1@gmail.com>
References: <20231214192439.259156-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704235234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ImnfdrlMdMcpTGJNuRqUio3F09Cq8bHPpxsbk90fw0Q=;
 b=FVTjLe5VilAcEVyk5F0+ozaepYZi+LeziDVmcGSwwXNhE9OudeMbBMz7azzefRTKrK8znf
 bx26oLgk+XsD4TZQId8M3tX1acWpdGqfPQIK7hiB+cbpTz6rM/f+fYXaJ71YrfWuMGSQns
 TM7FtbIbefQw6BVvydWqzo+qllolS1b+QaGNBjldWZKhSU2WXyXksZe6BxBgpkxf1tB5Mu
 srn5ar/65IYDMqrIKUaLTG/Fp2d3ujdqLuqB8B1vohVrn5dDkrDn9ry8GSKPsVSsK9+4dj
 TZzx/CyCsh0qTmd2OUKsVov6VZ5g1yGfldw8L2OoMupvLSkrY1QKJRi/o1mIQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FVTjLe5V
Subject: Re: [Buildroot] [PATCH 1/7] package/python-grpcio: new package
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

On Thu, 14 Dec 2023 12:24:33 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-grpcio/Config.in          |  6 ++++++
>  package/python-grpcio/python-grpcio.hash |  5 +++++
>  package/python-grpcio/python-grpcio.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-grpcio/Config.in
>  create mode 100644 package/python-grpcio/python-grpcio.hash
>  create mode 100644 package/python-grpcio/python-grpcio.mk

Thanks for this work, I have applied the entire patch series.

My main suggestion/comment/request is to add runtime tests in
support/testing/ for those packages. The effort to add those tests is
quite low, and they are really relevant for Python modules. Do you
think you could have a look at adding such tests?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
