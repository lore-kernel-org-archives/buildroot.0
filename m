Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ED7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747A341857;
	Thu,  3 Nov 2022 22:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747A341857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xzn0F2PCIcRl; Thu,  3 Nov 2022 22:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3736E4183C;
	Thu,  3 Nov 2022 22:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3736E4183C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 715261BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D0CB61043
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0CB61043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6Eo-6n0TEiy for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:07:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3732961042
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3732961042
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:07:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08EBBE0003;
 Thu,  3 Nov 2022 22:07:18 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:07:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221103230717.22d076b4@windsurf>
In-Reply-To: <20221101225550.249546-1-fontaine.fabrice@gmail.com>
References: <20221101225550.249546-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667513239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4OXO7kDpLpt6UHP5V4haMpJfsXsiGOYuH235fQJv1Y=;
 b=do9wUYYqDlg4XmgK/DnzzhUvK0yFsGWrZis/nbl9EHlW5IqP3VCZ0WcMwJpqezjVrcHgNH
 Sb77KEuH/8FNkwGC96TOEUPPe8bSp0yuW8P2rOdl+vmOqOfD1lhEhck36nVpR6uxTv5sVp
 4DSMgkBRwcKP39pgFooJ5RKAS8NzxdONpHkG+UQa6B2E6XHNcGmT6i8A89Asd+lbbsbVbc
 Swl/loYrtj4Xj8PEbxmT7e+E9Rz4jiD6fICeFEAMJiDTC7UrkM3lO4qtfCKNMY5DLKb2OB
 av51tuL0QMn+bBQWwoKxi33tcPWnjbFAMuGT5uYZqhwWyn/Hy2Dtosmy39dGNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=do9wUYYq
Subject: Re: [Buildroot] [PATCH 1/1] package/quota: bump to version 4.09
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
Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 23:55:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://sourceforge.net/p/linuxquota/code/ci/master/tree/Changelog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-realloc-3-instead-of-reallocarray-3.patch | 34 -------------------
>  package/quota/quota.hash                      |  8 ++---
>  package/quota/quota.mk                        |  2 +-
>  3 files changed, 5 insertions(+), 39 deletions(-)
>  delete mode 100644 package/quota/0001-quota-Use-realloc-3-instead-of-reallocarray-3.patch

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
