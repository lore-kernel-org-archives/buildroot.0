Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4836AC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D01E0417AD;
	Tue,  7 Feb 2023 17:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D01E0417AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mho7_iusaZ8A; Tue,  7 Feb 2023 17:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8802417D5;
	Tue,  7 Feb 2023 17:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8802417D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B252C1BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1CD6100F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1CD6100F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TeA8VV1ZSy6N for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:48:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CD3C60F6E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CD3C60F6E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:48:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C145240005;
 Tue,  7 Feb 2023 17:48:45 +0000 (UTC)
Date: Tue, 7 Feb 2023 18:48:44 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230207184844.7a8dfa82@windsurf>
In-Reply-To: <20220919224740.2365011-1-giulio.benetti@benettiengineering.com>
References: <20220811224752.1a1e53b7@windsurf>
 <20220919224740.2365011-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675792125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItsuOYCGM3rdSMeioxUtJwx7rZUc/6wV6pckMSsQTZg=;
 b=IT1GudR7ZtUlAD//w9//Mc1S6pxw3dfCM4nwV2pHHqZyDKDW9/mHyDPwGA60LrfnJAbY3O
 VQC8QDKzHySmkPePjnOfbSQjtUdukNndT/T8TyKX/qx7bjK4zNvoDj6aYpMT164usgeSbP
 LJD1wBW9PpxlktT0OEtxAclK6oUeTvAJFlf/lplALeATr4x5xfY8V+EGsTYG0l+BMfIUce
 CXUg11N3ImODYQdMWhbT8ZNq+gjG35TiNUkS1CFbFwng4AHI86qTtCGUhneK+ZMXdEFxF7
 KOqGOYCfwwocUhgu2bvu9vEZGqwXpTgvzsI13/hWySphYEFhGQhUzTqqqNrcwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IT1GudR7
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: handle pkg-config in the
 Autotools standard way for nfsrahead
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

On Tue, 20 Sep 2022 00:47:40 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> While using the correct PKG_CHECK_MODULES() approach for libmount we end up
> having host-nfs-utils needing libmount. But libmount is only needed by
> nfsrahead that we don't need in host-nfs-utils. But we need host-nfs-utils
> itself(rpcgen tool specifically) to build nfs-utils. To solve this
> recursive situation:
> 1) Update the first patch with the upstreamed one that handles libmount
> using PKG_CHECK_MODULES().
> 2) Add another patch to allow to disable nfsrahead during building for host
> since this tool is not needed and requires libmount. This way the first
> patch approach can be correctly used.
> 3) Add --disable-nfsrahead to HOST_NFS_UTILS_CONF_OPTS
> 4) Remove en/disable-uuid since now it's required by default:
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=c5528f40f9db5061e06dcf1f9b7fce5185b376c6
> 
> First patch has been committed:
> https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=627c95b2b853161b359095e7fdf05d3b07d51379
> While the second one is pending:
> https://lore.kernel.org/linux-nfs/20220919221832.2234294-1-giulio.benetti@benettiengineering.com/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...ead-fix-linking-while-static-linking.patch | 39 ++++++++---
>  ...e.ac-allow-to-disable-nfsrahead-tool.patch | 68 +++++++++++++++++++
>  package/nfs-utils/nfs-utils.mk                |  7 +-
>  3 files changed, 97 insertions(+), 17 deletions(-)
>  create mode 100644 package/nfs-utils/0002-configure.ac-allow-to-disable-nfsrahead-tool.patch

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
