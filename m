Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00964C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 08:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C23260B69;
	Tue,  2 Aug 2022 08:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C23260B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3ZPr8CliyHe; Tue,  2 Aug 2022 08:40:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A91E60B5A;
	Tue,  2 Aug 2022 08:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A91E60B5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAD951BF37E
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90C5D4037A
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C5D4037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYKpSqp-46io for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 08:40:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE595402D4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE595402D4
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 08:40:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 119F760009;
 Tue,  2 Aug 2022 08:40:50 +0000 (UTC)
Date: Tue, 2 Aug 2022 10:40:49 +0200
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220802104049.560f9001@windsurf>
In-Reply-To: <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
 <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659429651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZjTa23RXlttxqMuR6n1qSdwMhx1A4N2Fo5Ai/qwM7o=;
 b=GGzdn875PdayUCz/oE5H/JCXSv48CA/WFWPuG8goTHH+m8XUWuVcC2fJtkSwucydOC1Cs1
 M4M96rnRuPSxH8Eycg8HoyhN3LzqvUr7hz56popiufWzZFmpffifIYxe+nuFMz3HyI5Uit
 6tESw9zKAMh4RF+CbFO53sVVduG38DlNsCESGWjBXc6XsRCUNWzV7whbflplACoJC4KalW
 ylMKapGILiMF1waO3OJK1fBlvndod5x9qm6uxwhBKdZVFve7B6rM1J5HLlO2RgBhTSvS0U
 BXsB68HOT8Bopvik+Xy96G+pGf8NRK3PJ9Qjz2dSiW6nFidbee0/O5WOzogd6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GGzdn875
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 2 Aug 2022 09:55:33 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> > So I believe we will have to revert this patch, and pass --runstatedir
> > individually to those packages that understand this option.  
> 
> Sorry for raising autohell, "runstatedir=/run" was somehow supposed to
> set the default.
> Arguably the package is at fault, but thats not helping much.

If "wipe" is the only misbehaving package because it does something
particularly incorrect, I am fine with fixing that particular package
and keep the runstatedir=/run.

> So far this solution seems to cover all problems:
> 
> --localstatedir=/var \
> `grep -q -e '--runstatedir\b' configure && echo --runstatedir=/run` \
> --program-prefix="" \

Meh, I see the idea, but it doesn't look like a great solution :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
