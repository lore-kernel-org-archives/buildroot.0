Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F360E7718B
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 16:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 494E660761;
	Thu,  2 Jan 2025 16:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rg7tDSTFo0D4; Thu,  2 Jan 2025 16:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BCC260765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BCC260765;
	Thu,  2 Jan 2025 16:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26B4AE0F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1506E80D21
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K6t1LCWWfuc for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 16:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4713980D1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4713980D1F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4713980D1F
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:50:13 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3895F78050F;
 Thu,  2 Jan 2025 17:50:08 +0100 (CET)
Date: Thu, 2 Jan 2025 17:50:07 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Robin Jarry <robin@jarry.cc>, buildroot@buildroot.org
Message-ID: <mqcrx7kl3y5nxqicdowkxb5nc2ymsuxb3pab7zfqipbkcsfoyg@tkwq37xzo3r4>
References: <CADwxmT=HZU4=zEneby_NjqVhz6hbBzRHJ8xAqR2O4g0vZsw3Hg@mail.gmail.com>
 <20241206213002.24669-1-vjardin@free.fr>
 <20241206213002.24669-3-vjardin@free.fr>
 <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735836611;
 bh=L21n/58hF4R/MlfWBYLycIxo0mMmUCjCgBwD0emqTmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4n3jF0DsMWexH6DrwPQmIGWaJ1YXOOTGilcOzM464B74TtjRlrodDYx0pPkop6eB
 BWjJYgTbeYGMrLCNn6JxgbywFpGEjM8ljjZPUWG+x1MfuIXSFHWqf5eurLOWOniAxR
 R+mbtCnOmOm0dVqd1OeaiLOQ92IxDXIRqe+F5GVUyAjBZecdQ4xF5X1CKaE42Y2hF2
 GFTeLSuquuB5AGnh9nrKHlCli7PmgQlk2u96THMDdZf14FOzzS03Jr2wO7J1v+6+gM
 eWldoPQ7yPNWW6Zvp+L6bJvtQFbd4C7F4aDH5En2v8NdQYluUS1MqoQy5HTQ7ueFgs
 P4k/vCp0IcUHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H4n3jF0D
Subject: Re: [Buildroot] [PATCH v5 2/2]
 doc/manual/adding-packages-meson.adoc: tags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

Happy new year !

> > -		  $$($$(PKG)_SRCDIR)/build $(if $(filter YES,$($(2)_MESON_INSTALL_TAGS)),--tags=runtime$(comma)devel)
> > +		  $$($$(PKG)_SRCDIR)/build $$(if $$(filter YES,$$($$(PKG)_MESON_INSTALL_TAGS)),--tags=runtime$(comma)devel)
> 
> It looks like these changes accidentally got applied to the
> wrong patch.
> 

Oops, I hope 2025 will be more efficient ! v6 for such a small patch ;)
  LoL

Thanks for your support,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
