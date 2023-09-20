Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84117CE79AD
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 07:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F089F41EAA;
	Wed, 20 Sep 2023 07:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F089F41EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaku3QWlg1ky; Wed, 20 Sep 2023 07:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EFF541E1F;
	Wed, 20 Sep 2023 07:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EFF541E1F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC33E1BF38A
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 07:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93DF8612A4
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 07:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93DF8612A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MrYx7XJkwfqH for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 07:12:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64ED160A5B
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 07:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64ED160A5B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B8BC240008;
 Wed, 20 Sep 2023 07:12:09 +0000 (UTC)
Date: Wed, 20 Sep 2023 09:12:08 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230920091208.62a8b2fb@windsurf>
In-Reply-To: <20230920043113.36674-2-dalang@gmx.at>
References: <20230920043113.36674-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695193929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkLz88OiobsN/7D9GxNvIJyl/XADyoNgGtLXpesPctA=;
 b=GeIK3dF0yqUmFJMYyd7CAtnsvi6V6bIz86a7ECPCRAV9KCGSwrecjG+aKkJYgEXXXfAHs8
 huqIwfNdSY1EOcHbxmECsRWzr43C5ucptif0ToN69eT1G4ImimGexOc//7xQ4dOFR4lpbL
 eqIF7I3rLQg7uzOrf4ngZelC6a/KYdHmXWRnnbIg9ocR5WXtZp1i83sRxvEvWe2wNNbL5q
 xaBjSAEgmz+pmz8lxqj5roU2B189nr7jGuHdjlhXYVzQGZpsPXoGuJIhKD7xSdTPzwZkez
 3gfUxbOUOMlQ00w7CQBLtTllqCAHB31lIx55Mp6h0tOvv+rU8nkGClrE6zkdnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GeIK3dF0
Subject: Re: [Buildroot] [PATCH v2] package/bind: drop CVE-2017-3139 from
 IGNORE_CVES
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

Hello Daniel,

On Wed, 20 Sep 2023 06:31:12 +0200
Daniel Lang <dalang@gmx.at> wrote:

> As of 2021-05-14 CVE-2017-3139 is no longer listed as affecting bind, only RHEL.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

This makes me think that the pkg-stats script should detect this: if a
package has CVE-2023-12345 in its ignore list, but CVE-2023-12345 is
not known to affect the package (in its current version) according to
the NVD database, we should flag this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
