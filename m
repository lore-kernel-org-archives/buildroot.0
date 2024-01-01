Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B162EC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5868060E2F;
	Mon,  1 Jan 2024 20:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5868060E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c39XQXTdwZa6; Mon,  1 Jan 2024 20:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C33F60DCA;
	Mon,  1 Jan 2024 20:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C33F60DCA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 450981BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D81040273
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D81040273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guNsJHN5CzDI for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:34:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C6BB401CA
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6BB401CA
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCC381C0003;
 Mon,  1 Jan 2024 20:34:36 +0000 (UTC)
Date: Mon, 1 Jan 2024 21:34:36 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101213436.6253da78@windsurf>
In-Reply-To: <20231229215401.24620-1-fontaine.fabrice@gmail.com>
References: <20231229215401.24620-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704141277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7iL+UKCBLKCVbX0icIH1ZOc/QejgHvgfs71MNYj58Q=;
 b=SM6nZhBW3n0m1TeEwivCCMII7NFIODiL+gB0LuKYt6DZ7A1KZJY+OK0BPAl9skup5i2Vi2
 0mpIu94QghSl3/mrRJ5ZyQJ9YmIjAg/i6a+DJvi1NQQaO7E5w03rCLc+ORfrkCddSNyCzI
 etBCjzwjhCBvynQ8OQuiRGK3gd9k8vMyAqpTcvPA0WeAQQzGHxRZv32O7qHkQzm9I2h94F
 Zqhu8KlEk8wxSXKT6+Kx3CDfEe3QzCS42AVsXYi9KnJuULECf/2qCFxknCFnM17kpnYSIE
 5fIaZc6x2S9CsXydZ58rooOnj/mNkZ8M8eKWS8P9+IMijDcwdIiwCM2UFTMYYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SM6nZhBW
Subject: Re: [Buildroot] [PATCH 1/1] package/ncdu: bump to version 1.19
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Dec 2023 22:54:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of COPYING (update in year:
> https://code.blicky.net/yorhel/ncdu/commit/c08340ee08120244834adb59fcee2abfeb8456a6)
> 
> https://dev.yorhel.nl/ncdu/changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ncdu/ncdu.hash | 8 ++++----
>  package/ncdu/ncdu.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
