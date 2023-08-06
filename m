Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0347AC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9CA060F96;
	Sun,  6 Aug 2023 21:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9CA060F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKNji8mtoni5; Sun,  6 Aug 2023 21:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E70CF60EF1;
	Sun,  6 Aug 2023 21:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E70CF60EF1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 089A21BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DFD1404A6
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DFD1404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIhB181ohlIN for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:58:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E28A405CE
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E28A405CE
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0211C0004;
 Sun,  6 Aug 2023 21:58:07 +0000 (UTC)
Date: Sun, 6 Aug 2023 23:58:06 +0200
To: Andreas <andreasembbuild@gmail.com>
Message-ID: <20230806235806.307605e5@windsurf>
In-Reply-To: <CAOLWrZ8O-mF6RnuX80SmS7Mn5Op=o0OJMp6-wbhjUfRBiqfnXg@mail.gmail.com>
References: <CAOLWrZ8O-mF6RnuX80SmS7Mn5Op=o0OJMp6-wbhjUfRBiqfnXg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691359088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAzI4gh7XlwIRP+BaNYEZHk5WqkRXXBoKf0CN6zU8wk=;
 b=i86DT+1ijNB0j5Excarf196RBjqiefIFGLYjvkMwqFkoqFyb2ZeCewPpIy1F2Yt+p9tDlW
 QHt0YkqgR1eg+T+ZEw0EZ8khqmJuQJRMjDOzOXG7nTpaxtf4G1eToxBlbpvexZH4pX9F0l
 fPgRiaGYC48GBju6RZP0f9Pz3mditMHl1PIrp+D+z7InEsxOuU75gIpNsJXyUy3rnnQ9TN
 x77yQW43AA8Y9doJ+4pB7gDY8oHlwYR7eVQaOa/kcyqhOoUbcn5gmGzeMY5TbZqdcPpkgN
 /ipqA/tViNQjeuEMewsux5awC1EGOrbz0uMBzS11i4Xx9qFT8NkPhT9jyZULRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i86DT+1i
Subject: Re: [Buildroot] Support for lapack
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

Hello Andreas,

On Sun, 6 Aug 2023 23:36:34 +0200
Andreas <andreasembbuild@gmail.com> wrote:

> How do I configure Fortran properly for lapack? I need it on host for the
> python-scikit-learn package. I get the following error.

Please look at the patch series at:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=314036

for python-scikit-learn.

Note: this is difficult stuff to package, you're now starting with easy
stuff :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
