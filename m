Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C9BC4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 22:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E8A81971;
	Fri, 11 Nov 2022 22:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E8A81971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6zmv0CrPfit; Fri, 11 Nov 2022 22:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BEB8191E;
	Fri, 11 Nov 2022 22:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BEB8191E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5C61BF290
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 483F38191E
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 22:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 483F38191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OSdflkwbhAb for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 22:52:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1459880D47
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1459880D47
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 22:52:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04CD6E0004;
 Fri, 11 Nov 2022 22:52:52 +0000 (UTC)
Date: Fri, 11 Nov 2022 23:52:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221111235252.5f74b31b@windsurf>
In-Reply-To: <20221110220620.89736-1-fontaine.fabrice@gmail.com>
References: <20221110220620.89736-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668207173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qr/O3yYf1aqHecdmGZdp6vHwOrkBMFGDO6BBgXCL9T8=;
 b=XE1fp3z1kZdQ9OyI0gPZWvelrecYzAy8TfBLQmPukWoLM/pAHWWBYvfsjgYzXckuSCvlRT
 ODN6YIYE334Jxr2KkmBOuWlVpWdxPcQ4in+H+GKyYbY8Ujf1vzKxPTupVJy2WqZcYA0BV6
 AXATh6yykca4xVaZpifp28f48yCBP5slmmGDX0hcZmbvdRCEJyqjraOTunbt9O+h1VMoWe
 8TQA7mJ6IGwJRNN9drkC6PXjD3zlELeAtCST8vdBfW8eGNrrPC4Lfl8Mr0jqkDeoxqiEqT
 x7gzP+/Iz0b4065lbXmPftwnEFVfYzc/eosA8XAeUW9wTcznBiJPuc66rYlzkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XE1fp3z1
Subject: Re: [Buildroot] [PATCH 1/1] package/wavemon: fix kernel header
 collision
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

On Thu, 10 Nov 2022 23:06:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 0.9.4 in
> commit 5cae1a0d675eca41125b6430157d3d0d78d1220c:
> 
> In file included from iw_if.h:26:0,
>                  from conf.c:19:
> /home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/linux/if.h:71:2: error: redeclaration of enumerator 'IFF_UP'
>   IFF_UP    = 1<<0,  /* sysfs */
>   ^
> /home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/net/if.h:44:5: note: previous definition of 'IFF_UP' was here
>      IFF_UP = 0x1,  /* Interface is up.  */
>      ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cbdf3e0cf0bee8f1b076581768c24155afc320d9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-iw_if.h-don-t-include-linux-if.h.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch

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
