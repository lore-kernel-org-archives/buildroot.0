Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BE1C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4783260AF0;
	Thu, 28 Jul 2022 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4783260AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiJDgwiaABAe; Thu, 28 Jul 2022 20:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5892360A9F;
	Thu, 28 Jul 2022 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5892360A9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCA71BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D3B410A2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D3B410A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbuTKpgmOtqB for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:51:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E696409F7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E696409F7
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:51:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 734EF1C0005;
 Thu, 28 Jul 2022 20:51:55 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:51:53 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225153.68950fe3@windsurf>
In-Reply-To: <20220728082438.1697487-1-fontaine.fabrice@gmail.com>
References: <20220728082438.1697487-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tvud/l8M4AWrzKNOG8HOrqTKzm7fxXeOGOjRMhTFZJ0=;
 b=QOtsMl3HKtWH5A9S7cxJk7p7KRPhIVpTxlRRvOGwGudobz490JKWp7CSyXZYBZqaJi0n14
 gxpuiP2H8eDnE63NRbHHK21V5LrHn4DmRZnebE3QOnuLTM1VHwBg6d5mgAfrxnVF33xa1L
 Ce/hJqkOkHKC0SUto7dYG7IOMwr7DTJ24nK44r+HtZTMMouPp0dyADWcsapePsJIULzRyp
 zrqogm7lXRLawZ38gJYKZKfvTnSrw7P92sG5/0KEOHqlmNYh/IkDc+/lNA7Nouk0heEiop
 bfs9GDf1oDSBglvfpiBphuiQoP+K7PMPj2Txjos30NJwO8MdWjO/807U3UrByw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QOtsMl3H
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: requires MD4
 in openssl
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 10:24:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enable MD4 in openssl to avoid the following build failure raised since
> the addition of the package in commit
> 736c4c1655d93652a9a7e79235bbe726b3d46176:
> 
> In file included from src/lib/md4.c:16:
> src/lib/md4.c: In function 'fr_md4_calc':
> src/freeradius-devel/md4.h:76:33: error: unknown type name 'MD4_CTX'; did you mean 'FR_MD4_CTX'?
>    76 | #  define FR_MD4_CTX            MD4_CTX
>       |                                 ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a8aa12a8129056391f975820ea3d1d62241ac051
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeradius-server/Config.in | 1 +
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
