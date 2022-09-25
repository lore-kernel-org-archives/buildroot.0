Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BC7C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E5D81AAD;
	Sun, 25 Sep 2022 08:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E5D81AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mY_l1qDcQKd; Sun, 25 Sep 2022 08:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116D381A1C;
	Sun, 25 Sep 2022 08:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 116D381A1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 562AE1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23DD381A1C
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23DD381A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MczPELOn1JLP for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:10:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4D181A15
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B4D181A15
 for <buildroot@busybox.net>; Sun, 25 Sep 2022 08:10:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B1F2E0009;
 Sun, 25 Sep 2022 08:10:07 +0000 (UTC)
Date: Sun, 25 Sep 2022 10:10:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220925101007.450eb1fa@windsurf>
In-Reply-To: <20220923234616.7045112d@windsurf>
References: <20220921222934.07100d0c@windsurf>
 <20220922124010.26034-1-mf@go-sys.de>
 <20220923234616.7045112d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664093408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8R1QYrsXTuO4bTzrbvzxw2BtOzspWGQD3GNHI05M6c=;
 b=SjCrdqmAu5Xn00tlWdemU90mdOgjN4u/n6sI4+uHpKT0uabmy/7Lzw+SqkEVFhcVjVlUIa
 m7LbNDhBWncjSKcxrxemjJX2CTUEYm9zeAUn7yhuLfPKLdFPTna3DbxBt078tpprs/6H2q
 hb3EoGGfEN1Uf2IvwwAO6Qn8HaV/3xPJeeUK1sP9wohxaIlF3FfCBywoyMpr6lXCuA4k+A
 o3GJqhNoKdPVry7h5byoFQXL7mOngTUj0wMSOAjsPHs+K0bV6NweD6yu8S6E9RKrrfZe+B
 BhLeSzofj8AF1cBi1PNDmvPXQX3Qw4O7FlHSfvKtmg+lHAuJdV5RIablitO1FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SjCrdqmA
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{glibc,
 localedef}: bump to version
 glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
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
Cc: buildroot@busybox.net, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Sep 2022 23:46:16 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Applied to master, thanks. Let's see what the autobuilders have to say
> about this!

Another issue is the <linux/mount.h> and <sys/mount.h> header conflict.
According to
https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
it is fixed in the glibc 2.36 branch, and we are currently using the
latest commit in this branch. And I indeed see the commits related to
that.

But still, it breaks many packages. For example:

  http://autobuild.buildroot.net/results/545/5456d9b97dc21ab57666579f62e0ecf910f2cc9c/build-end.log
  http://autobuild.buildroot.net/results/9a9/9a9a6743397060b16acbb2fc07dd82aca7f50532/build-end.log
  http://autobuild.buildroot.net/results/950/95037ab0580768687aeb5f1e1b5128ddb1d06c91/build-end.log

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
