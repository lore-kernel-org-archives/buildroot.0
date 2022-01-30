Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F0BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 303AF409AC;
	Sun, 30 Jan 2022 22:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwAlwx5kzIGu; Sun, 30 Jan 2022 22:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63CA140924;
	Sun, 30 Jan 2022 22:17:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCEA1BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7770183F8F
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tY6h34YCYygj for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:17:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 104DF83F8E
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:17:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89DF9240006;
 Sun, 30 Jan 2022 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643581033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOZ+FkVmjTbK30kMWXVRlau3UEqgFRVNmflPLWK/804=;
 b=RCDXGETIEPs2Yxkb6OA11sSWEfOnK1SAVqfk4j931BTm7nKNVf0/NSRmzuf27Z1S05FCpc
 4K9rlCAtSZLh04cZCKkh5pqVy5eP/TdGHjJQRGfvlun6+jO0llGbc3ddEViMMZdCPUwzS5
 h4+zwXPKqb6angVCOtqvs5xIwis19T+dcnoCn7vKzwm0z2gSxqsLTAc8d8ja7STN9kRWsJ
 5Cidv2H60PVVrahBxFUk765PyVpeI0xXi4quMET+X5txjaLpjKRNB//NukyQfn8urFNL36
 HDGFVkp2WyzL8BpYD3YGl+ynafpj8GU6Qi2BmsM7XHuPRPHpL/3nEbQHjLL7nw==
Date: Sun, 30 Jan 2022 23:17:11 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220130231706.3f6d7a66@windsurf>
In-Reply-To: <20220131000221.GC987440@momiji>
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
 <20220129214235.5133-2-thomas.devoogdt@gmail.com>
 <20220130154908.0ff0f0b6@windsurf> <20220131000221.GC987440@momiji>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup: add choice between
 libsoup2 and libsoup3
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jan 2022 00:02:21 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> > Is it possible to install both libsoup2 and libsoup3 side-by-side in
> > the same system? This requires them having a different library name and
> > a different location for header files.  
> 
> Yes, libsoup2 and libsoup3 are parallel-installable, both can coexist in
> the same system. The only caveat is, as I mentioned in a previous email,
> that having both versions loaded in the same process will result in odd
> crashes and assorted failures due to symbols clashing.

If both libsoup2 and libsoup3 are enabled in the same build, it's going
to be difficult to guarantee that one application doesn't end up
loading both, by the usage of separate shared libraries that
independently use a different version of libsoup.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
