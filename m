Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C96EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Nov 2022 22:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31E1402DD;
	Wed,  9 Nov 2022 22:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31E1402DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SHJbsP80xEy; Wed,  9 Nov 2022 22:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D53401CA;
	Wed,  9 Nov 2022 22:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4D53401CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C041F1BF308
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BE9860750
 for <buildroot@lists.busybox.net>; Wed,  9 Nov 2022 22:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE9860750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0XuPD_eNj4dU for <buildroot@lists.busybox.net>;
 Wed,  9 Nov 2022 22:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 662AA605AE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 662AA605AE
 for <buildroot@buildroot.org>; Wed,  9 Nov 2022 22:05:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0383F60008;
 Wed,  9 Nov 2022 22:05:31 +0000 (UTC)
Date: Wed, 9 Nov 2022 23:05:31 +0100
To: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Message-ID: <20221109230531.45172f4b@windsurf>
In-Reply-To: <J_17FFgukFHAJ3py1djEDl5_QUB5a7N6s8WiRvCebcD5k26wrppZ-MwXCL0fbyL7wjVDKiEm68QnEAHQqxwJFTxzCro-8iX0xwMCrheVP5I=@protonmail.com>
References: <J_17FFgukFHAJ3py1djEDl5_QUB5a7N6s8WiRvCebcD5k26wrppZ-MwXCL0fbyL7wjVDKiEm68QnEAHQqxwJFTxzCro-8iX0xwMCrheVP5I=@protonmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668031532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTaPXMezLoDgELLpNMOLa8T1rLHI435v7lwRDrhT6qI=;
 b=I8Dr5gHqHfuecYLXWUw5qd2L6ZS4AqWuq8d1YG3JktuJeZpsq8xTSRqhqSoBmINA6RV4uj
 lYkg7gwMKhFUbKIJVxvIpWqkiOmHwdqtjiWF1jV7bu53ip7VeNagpRpmC+bG4n5y2u4Is4
 fS2zb94rwD2XDQIRBtB2wOKLleDZzEM3ofcYyhX/kaTFsP6iiQwupd6teu7fk9r2+onvXu
 M4T9YcW78kZ+sn4WovFOkhc/5Nqyvv44Dsypy6d/KYLhqz41AV0/WU+qL2gxLVcx4dKDe6
 fppzErLqDZn5aqI7NcAum5E4VOb/8ylRiUMq5obetORMrWjqTlXHKqNqb240jA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I8Dr5gHq
Subject: Re: [Buildroot] [PATCH] package/tpm2-pkcs11: bump version to 1.8.0
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 09 Nov 2022 06:38:21 +0000
Yair Ben-Avraham via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
>  package/tpm2-pkcs11/tpm2-pkcs11.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
