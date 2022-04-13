Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EC9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 20:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A40060E2C;
	Wed, 13 Apr 2022 20:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-0mGkP5BCsd; Wed, 13 Apr 2022 20:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67D9260E19;
	Wed, 13 Apr 2022 20:34:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 944761BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8199E40BFA
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VXz4YzSZXfG for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 20:34:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48B6C40BF7
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 20:34:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6169E1C0002;
 Wed, 13 Apr 2022 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649882048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQ+7mT0UpuKedAp1zp+eY2q61ixfe644mLcYrYMEK1U=;
 b=WKnCrtHtyfWiqV5plUg7PUuWrJp57pSaE/2shg7X/ktScTbAAKDaUm34czXIjymjuGVbR+
 i9cS7+ef5lB31Sm+vNaIB5khNiP9H8JCP2Mdykhz/HTsFXlIqIpa1PMl9oZARC7RDl8xHT
 7Ml6Ww5rIjf7nfExhlbsJr/CtpLRDTU37fE+dlEXK56KrrLcmCd6r+uXYd5shecK6tAkHa
 8AahljhczJAbD41iBw1gNCUkCTdjxK8RAxoZIgbSd815NLka/OF5LLZDNzrQXmooSOODw9
 MG2ruaQEQfdxoQH7J+69y/20LjATzpzrwem2zVAfsOKMcMarzvxLyThnx/DfTQ==
Date: Wed, 13 Apr 2022 22:34:07 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220413223407.7e71113f@windsurf>
In-Reply-To: <20220413193216.891178-1-fontaine.fabrice@gmail.com>
References: <20220413193216.891178-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: disable on riscv
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

On Wed, 13 Apr 2022 21:32:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> riscv is not supported since switch to internal bind resulting in the
> following build failure since commit
> 0c8dd6ebd656e06cf99a63eb93343715f4853503:
> 
> Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-buildroot' not recognized

This seems odd. What in dhcp is architecture-specific?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
