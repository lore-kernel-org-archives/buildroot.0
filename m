Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB5C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BDCD40543;
	Sat,  2 Sep 2023 15:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BDCD40543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dR_1kwpJsTnA; Sat,  2 Sep 2023 15:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E7E74057C;
	Sat,  2 Sep 2023 15:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7E74057C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D20911BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E157813C9
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E157813C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5rS2WRCZtaL for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:58:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85E24813A5
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85E24813A5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0505FFF807;
 Sat,  2 Sep 2023 15:58:54 +0000 (UTC)
Date: Sat, 2 Sep 2023 17:58:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230902175853.1c21cf5d@windsurf>
In-Reply-To: <20230827194003.3387773-1-james.hilliard1@gmail.com>
References: <20230827194003.3387773-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693670335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTg856MJ4EvklWmJyYdoRLJ+cF/4PVdlYODGno5QlTw=;
 b=Y3cH3i7KgkGuPJ2sxLzA2ztVz0FW88Jl5YJHXl00YCvHExmbihww6tZo3pVyg9TvK9bFzB
 F8KDWN2ZxaZiyN14e6jaraHmamcz9fbBfgxcq9ynmpnEE5bMjpWhMlezkjsGmty30U3paj
 LOHJGNN+BBj/6qQlN7B9x6EpBeyCAZm6pYxym7ce7KhGRKjXDARog5DBMx/vMa0PTzM5UD
 cPfGtX+P/itKWDgePsQrghgG/S0oK/N0vBvGMqUGPAf3r8225htB4yNgTUYkUILFlMTbK9
 88Vt52NHPA3GymJ95bjS5KRpBURt/3CwBFd8SZ9XKXjBmBAGYRtcT2cncHc3Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y3cH3i7K
Subject: Re: [Buildroot] [PATCH 1/2] package/python-distlib: new host package
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
Cc: Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 27 Aug 2023 13:40:02 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-distlib/python-distlib.hash |  5 +++++
>  package/python-distlib/python-distlib.mk   | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-distlib/python-distlib.hash
>  create mode 100644 package/python-distlib/python-distlib.mk

Applied to next after adding an entry in the DEVELOPERS file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
