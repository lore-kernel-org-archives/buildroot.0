Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAD1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9001D8431B;
	Sun,  5 Jun 2022 20:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKXPQDzkU5qQ; Sun,  5 Jun 2022 20:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0080B84184;
	Sun,  5 Jun 2022 20:58:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6632C1BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 552296128F
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bA-qkB6UDCkX for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:58:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EC0C6128C
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:58:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04ADD240002;
 Sun,  5 Jun 2022 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654462700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dIRW7aUJ/QjD2j42Bj/qE1+GO4in4pq15a7xJjngM7Y=;
 b=HGi0lJROhoNtDw0RoCNPA/HsqyytXse+ga4Z5kxYe68+54ko1ZXrl+JDw8TY2AlrHgQ9KH
 5yLc+R5xOFVmfqdIpQ2nB4bcE2uZdqaMBI5EuiDYC4HunQMP+kPqcS7dHqcMolB6MXaZBg
 RjCxCTkUyiK2i/kkxKvS6FhphakvSwyk3gMff/lSN1RqIznqZbRStavbRGmhqDUCZcr5H+
 PS47D1wxInKOhpADbhlUH/YUQYBcH3TzLadeCSYLmoVijvn30YPViwUe548PeYjMvBKQDN
 n07CYag4ha2MLc4EgYWFbO5WKyditUzkvK4iZhpleF1m0Lf48ZKxXL0aRWzL3w==
Date: Sun, 5 Jun 2022 22:58:19 +0200
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20220605225819.1f803ff6@windsurf>
In-Reply-To: <20220531125557.450076-1-kory.maincent@bootlin.com>
References: <20220531125557.450076-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package: gcnano-binaries: bump version to
 969d115185
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
Cc: kory.maincent@bootlin.com, scooby22@web.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 14:55:57 +0200
Kory Maincent via buildroot <buildroot@buildroot.org> wrote:

> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Update to last version of gcnano-binaries compatible with kernel
> from StMicroelectronics version 5.10
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Commit title prefix should always be "package/<pkg>:" and not "package:
<pkg>:".


>  # Locally calculated
> -sha256 afec2ba2f524821452d561b56afd2fc241293ea4a6e8598d1663f58e5d16800f  gcnano-binaries-1534c3eaabb5ae545a8f97e95f853531365a13fc.tar.gz
> +sha256 32d91d6ce6e6551cb7ad0eee4698041fdeb10a4f216e6564adb06408476edc38  gcnano-binaries-969d11518529bb70a132909b02ddcc5736c92d91.tar.gz

The expected separator in the hash file now is two spaces, not one.
This is reported by check-package.

Applied to next with those issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
