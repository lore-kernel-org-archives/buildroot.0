Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BCEC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F95660D4C;
	Thu, 29 Dec 2022 08:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F95660D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pii-rT4VB2t; Thu, 29 Dec 2022 08:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE3C60C31;
	Thu, 29 Dec 2022 08:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE3C60C31
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAC121BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B21681836
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B21681836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICY5Ws0KHRQM for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:52:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7134381815
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7134381815
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:52:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2037A1BF204;
 Thu, 29 Dec 2022 08:51:59 +0000 (UTC)
Date: Thu, 29 Dec 2022 09:51:58 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221229095158.1508242b@windsurf>
In-Reply-To: <20221212180545.3159689-1-james.hilliard1@gmail.com>
References: <20221212180545.3159689-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672303919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciUQAFHmeZkKFgtuK7VsjqzK7uBXgVPBQJivA/ts0io=;
 b=af3fOHIjWk0JAO9/m1aPlOwjA9DHHCc3de9tngiqRF5li+Kni7JUxfBYq/DnVJw85SjSqo
 sG7n3sxCceG3Ela/pJpxoDzHgPfbtP4c7MOvJChvK0Ly7pJPe9JcBB6pPbzvreGYEbI/th
 wta8M3vE0Bh0IlOCfx+slSahi2SwxouEoGUkArtMfNT7QrZbQDjWHL7Xt0KCgdyTdbjqFF
 vo6SdwuZJ+L222dqGiXSe2oQG8kvE6wFYnTADyqfC6V3fqYHMbVrMs98KZzQYPIh3NlX98
 pVO4L5sGQT2opHvDensHdz4npHCuVFC9YGIEkN/wS1Hnsz5RfXbmOJMZQpMxrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=af3fOHIj
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: fix build with make
 shuffle mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Dec 2022 11:05:45 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The make targets in bearssl are missing the $(OBJDIR) target which
> causes build failures when using make with shuffle mode.
> 
> Add a patch which adds the missing $(OBJDIR) targets.
> 
> Fixes:
> Assembler messages:
> Fatal error: can't create build/obj/x509_minimal_full.o: No such file or directory
> make[2]: *** [mk/Rules.mk:1190: build/obj/x509_minimal_full.o] Error 1 shuffle=reverse
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-Fix-missing-objdir-dependency.patch  | 1252 +++++++++++++++++
>  1 file changed, 1252 insertions(+)
>  create mode 100644 package/bearssl/0001-Fix-missing-objdir-dependency.patch

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
