Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70882C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B45D403AA;
	Tue, 21 Feb 2023 14:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B45D403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHAtmk3eLnFC; Tue, 21 Feb 2023 14:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46E2740339;
	Tue, 21 Feb 2023 14:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46E2740339
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C76D21BF2F0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A525142D1E
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A525142D1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uh0aB8UNBYX2 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:21:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175F742D1B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 175F742D1B
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:21:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA7F124000A;
 Tue, 21 Feb 2023 14:21:01 +0000 (UTC)
Date: Tue, 21 Feb 2023 15:21:00 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230221152100.27549e20@windsurf>
In-Reply-To: <CAPi7W80vMSG032z4F_R94DkaKZ1YoD+z5UG8-7U6-kqi3_Nkqg@mail.gmail.com>
References: <20230221112911.177963-1-fontaine.fabrice@gmail.com>
 <20230221150122.63e353f7@windsurf>
 <CAPi7W80vMSG032z4F_R94DkaKZ1YoD+z5UG8-7U6-kqi3_Nkqg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676989263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZOahBZWCuzWRRvMlpgFliFIWw75BO00Xk3k8/6cFXys=;
 b=JvLON2Jk9gif0RDLlHrR6XlOV1UhnMkF1QGGVXdxTjo5haMthnIsTl/AP7aWuYoMME9JkC
 f5tFHajTddmqIGKfVDeTWFYEU3xwxBXCZulk0FcUgqpAsp0uW/TRwoj4PJelOseBy1YOV2
 u0jDEqm7IC6IQuJFjCcwdfSyKnSnZ7bE7cW8uan/9C/5U+eSJZxIR0+vaa7UKkT+PY3WaE
 4c2rgcI1yYFS70SfgCv43SVAeXYofdB9VjOepRnspvEzYuDWEEyZjUvgxWj07z9LXNixZ4
 eMw7Sabj9VK7CoJlA6i8jcoEm9h4v9nHX0wWdfXrdmoSNE34Jrs4pHGfBi8zBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JvLON2Jk
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: drop locale
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 15:09:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> I think the issue is that __UCLIBC_HAS_XLOCALE__ is disabled.
> To my understanding, locale_t is defined in xlocale.h:
> https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/include/xlocale.h#L46

Possible indeed. There are newer versions of the ARC toolchain
available at
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases,
but I checked the latest and it still has xlocale disabled.

One option is to ask the ARC/Synopsys people to enable XLOCALE in their
uClibc configuration.

Another option is to drop the ARC/Synopsys toolchain entirely.

A third option is to change the check done by Buildroot to verify
__UCLIBC_HAS_XLOCALE__ instead of __UCLIBC_HAS_LOCALE__. This way it
will be valid to say that the ARC toolchain does not have locale
support.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
