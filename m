Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDCFC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EAC60B5F;
	Wed, 27 Jul 2022 10:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EAC60B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Guho7je98x_I; Wed, 27 Jul 2022 10:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D77760B52;
	Wed, 27 Jul 2022 10:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D77760B52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 396F61BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E71604014D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71604014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rp5fozYfDyxx for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:12:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8DEA4028D
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8DEA4028D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:12:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BB8A720000A;
 Wed, 27 Jul 2022 10:12:35 +0000 (UTC)
Date: Wed, 27 Jul 2022 12:12:34 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727121234.2c576f1c@windsurf>
In-Reply-To: <20220727091607.979180-1-fontaine.fabrice@gmail.com>
References: <20220727091607.979180-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658916755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AdflgqYMmSvd/yLYRKNpg+HmwuFVcJaYy5RKZt8dy+s=;
 b=NbSm5oU6R+2WnJdcIKwj3GTMe0b9XHdh0ewxejuR8nnj3QhmC3Bol/EaiCzWLCjLSE2N4H
 jE0ESLNsZCIh2vSlknX61KkWzVGr5RpgVw7o9yg4al7bZKGHChsyfZR9QT6T9mgFaalxgq
 QR/aVZOLj7mOg+uLoShyi4+jtQJg1Zfzmld671gj+Xt55q1mwVHrPFpX3fD9ceei6QR47x
 voUpqW4B2wevylfghzHHqHgcQDScsPDI/NIU4WmAlXH9kaWpCTiytQnXs1pJaxNdE7n++i
 ncOtz0MQcdfLmQ0ql9iWY8muqlJf1XxlZFrXYKFpK0HMOQyllHNSjFG4vvVtpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NbSm5oU6
Subject: Re: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: bump to version
 2.42.8
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

On Wed, 27 Jul 2022 11:16:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/blob/2.42.8/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.hash |  4 ++--
>  package/gdk-pixbuf/gdk-pixbuf.mk   | 22 +++++++++++-----------
>  2 files changed, 13 insertions(+), 13 deletions(-)

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
