Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C225C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1294160F22;
	Wed,  1 Jun 2022 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_k0qvq-P6Kd; Wed,  1 Jun 2022 21:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 396CA60C0B;
	Wed,  1 Jun 2022 21:54:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C91F71BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4A3C409DE
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gf_ktE8U2fyG for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:54:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD893400E7
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:54:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A84FE40004;
 Wed,  1 Jun 2022 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654120490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96PThY7NLM3P4MzoTMD8rnmc7CwN5n0u+Z1GP3Dc2+A=;
 b=PdY8xw2beY7+uODR7VmN7bqL3rT57P6SxJOZ7Ymfn6dMNClQbldIw8zdWxI9LT5C+a4AWq
 df0LMArqj1eun8fUIg5iZEjaSNyeQ6MS0qe5Ez7ZzHO6HdYQzW7tDpBafAMVYBlu03yxBH
 6xBRsJKQ4B1epk4U22hg+vHFts0tk2KJzlQN0gV36CkjH+Tb0X6Lyxq+zQ5yqwovJd/njr
 ombi6nccB775x3ql5OOM+5HAdSnLv8BNk4aZWdtaDtdzeR65a0ueQog2GkOcBIx8oIhQZP
 WnyfvFsiWNk6W4AaO6XADs+mdyOg6hi0F8nipAoN2RHIsZrW8Lbq/Z3MZMPCOA==
Date: Wed, 1 Jun 2022 23:54:48 +0200
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220601235448.59de7f7e@windsurf>
In-Reply-To: <9e9f78237f6f8ab0ee9e235b5b1c4b47ac1ea560.1652945312.git.stefan@agner.ch>
References: <9e9f78237f6f8ab0ee9e235b5b1c4b47ac1ea560.1652945312.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/openvmtools: bump version to
 11.3.5
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
Cc: kaszak@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Thu, 19 May 2022 09:29:06 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Rebase patches as necessary and bump version to 11.3.5. This allows
> to build openvmtools for aarch64.

If this version bump allows to build openvmtools for aarch64, then any
reason to not enable openvmtools on aarch64 as part of this commit?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
