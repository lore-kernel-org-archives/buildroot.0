Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B18C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A95560BD5;
	Sun, 30 Jan 2022 14:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYqeUHhqIXXd; Sun, 30 Jan 2022 14:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABFA1606E6;
	Sun, 30 Jan 2022 14:28:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3AE1BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D92140422
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGe6J_GLADpn for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:28:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 677CE403C1
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:28:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E5F01BF209;
 Sun, 30 Jan 2022 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643552907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGdHFfkdTXhxVWta0LREUFB3RIMCbzjLygXQ0dRZaQM=;
 b=fDW9YV1hTgkfcZyFnyZah/pyWStxoqjLGoG5KGO8otpCPFr4UTiGLKVWtgYGPz7aNZ9+kh
 TrAOPETIZzR/wPMte+NofJ3GaFYVvnR2WD2Z9vTvQp4xiYB8p5lxaPBEQ/65v4hAuOksax
 CAXCcnXaU8pZHKplHBicUUNLy8ZMdmPJ1R5XmlysD3yVlrE8ZCBNGgL6Em3w1c7oIz7Oyj
 qYUOYsDc/GGgKbqz0BdpYVy8xHOSoVeW93eW/hqM7G5r/aQYDMlpjXT23Rh07RlsSKWvRo
 82i8zpaXHnYUCOgZd8qMEthONAw6Eki+Lig6iuM1hid91XQpczH7ae+dVMNZUQ==
Date: Sun, 30 Jan 2022 15:28:26 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130152826.27bed0e4@windsurf>
In-Reply-To: <20220129142352.1197168-1-romain.naour@gmail.com>
References: <20220129142352.1197168-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/poke: install libpoke.so to
 staging
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

On Sat, 29 Jan 2022 15:23:50 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Poke generate a library libpoke.so, so install it to staging.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/poke/poke.mk | 1 +
>  1 file changed, 1 insertion(+)

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
