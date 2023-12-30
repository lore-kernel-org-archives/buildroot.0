Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B00DC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C633360AAC;
	Sat, 30 Dec 2023 18:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C633360AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VeX26AfiwQn4; Sat, 30 Dec 2023 18:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D57260A7D;
	Sat, 30 Dec 2023 18:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D57260A7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD761BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 091E0414C9
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091E0414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JosVxHC_xyOg for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:00:23 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1EF94149D
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1EF94149D
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2EAF40002;
 Sat, 30 Dec 2023 18:00:20 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:00:19 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231230190019.434e1b4b@windsurf>
In-Reply-To: <ZY9Ej76T9DYHuLe3@landeda>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
 <20231228152657.488457-2-antoine.coutant@smile.fr>
 <ZY9Ej76T9DYHuLe3@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfbp725cq9WazJe7lW6EGISLpfa2ItY7Kbf8bG1gd14=;
 b=hZBs7e79j8332srjpQH7Nout+qrgnUcUXArqbYstmk5J6c51kIBDKk30xLhNdM62xbjVim
 GEfhrys0oX8RU9/12HvAETFKBkVSQ37jhluvAagFlmTOxq80j2MqjVj9sljTUzFeXdiQBn
 Uu6dEfIQ5z1i8dNrVt8ceEWJ+psuHKVXE83R/aFjrDggtJ2LF5G54fMHIXZmNt70oCjTFF
 o0AvTUZCyL6K7vTwhv8rS5snoVqeVU2IqrNJXMUyogAKJg3PCtC2JjsJW030N4eDJ5acLr
 gqS+wln8IoIe17Bf2wQYwckfUEEkjneW9l/Ia8SAeyDAJ0MzBuQG/qEgholZfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hZBs7e79
Subject: Re: [Buildroot] [PATCH v2 2/3] package/ripgrep: bump to version
 14.0.3
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 sebastian.weyer@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Dec 2023 23:13:35 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> If that's so, then we have a big problem: the hashes for all the
> cargo-based packages will change, and thus it means we will have to
> name the generated archive based on the cargo version used to do the
> vendoring. That would apply to:

Note that I also encountered some hash mismatch on some Rust/Cargo
package recently, and BR was falling back to sources.buildroot.net. I
did not have the time to investigate at the time (I was looking into
another issue, and didn't want to enter an infinite recursion of
problem solving quest). And now, I don't remember with which package I
encountered this. But yes, it seems like we have a reproducibility
issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
