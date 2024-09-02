Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796D0CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EAF6400B8;
	Mon,  2 Sep 2024 16:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEnqX40HanoP; Mon,  2 Sep 2024 16:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C14840187
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C14840187;
	Mon,  2 Sep 2024 16:26:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBD101BF3FD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A872B40238
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUykODuuCr-v for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C3C640187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C3C640187
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C3C640187
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:26:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5AF5A13F8A2;
 Mon,  2 Sep 2024 18:26:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 18:26:38 +0200
Date: Mon, 2 Sep 2024 18:26:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZtXnPqjYvzyMJfix@landeda>
References: <20240829131232.2132854-2-thomas@devoogdt.com>
 <20240901121122.3113482-1-thomas@devoogdt.com>
 <ZtXcn-Jkl40CoZ5k@landeda>
 <CACXRmJgZSHFDjdsR8hVF1jE+SU=Ske20F2RLts5zLHjzBY8QVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXRmJgZSHFDjdsR8hVF1jE+SU=Ske20F2RLts5zLHjzBY8QVw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725294401;
 bh=/Z3BLBvZCnfNYQocpthUXSG8r9yI1Z+2ENOZ12TZdAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/dsmKg54ADx4JjAIWBdNgKJf63oPKnyRtzRYffJIVi8XHW1Q90k+5RFSJvO2Ggoj
 IKJq2EahLERQFFfsTUbf5Lo4+DCwn40S5/v0+K4HCY3UpIn5prG5fqMNnsFklKl73p
 9RsqVmrfW0o2UU0Ahwzo/2WvDl6EiFT71p2r3ss74IFkKWIEhFYFRfnYLMW2+XKJ7H
 wC+/CKyH3vTkLRM0Kjzgi+vSH3gq+ybLo2DSwIFXl+3dY3nx1kk++HvZm4b5N4MQwg
 Y1Rk2yAWr661WXQvSDZn+s8z/wBiBIJ1YxXaOTFKfOsv34zQjyiKW0yc8HUgzxmRKq
 MPLiAAlKKuWqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S/dsmKg5
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: restore libsoup
 support
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-09-02 18:06 +0200, Thomas Devoogdt spake thusly:
> Libsoup2 is still supported by webkitgtk, so having support makes sense. But
> given the fact that no complain arose since the bump to libsoup3, I doubt the
> usage of it. So if someone really need it, then that person can reply on this
> patch as well I guess.

Agreed. I'll let the patch pending for a while, and if noone complains,
we'll drop it in a few days.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
