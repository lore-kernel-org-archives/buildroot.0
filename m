Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25D8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92CAB4016C;
	Wed,  1 Nov 2023 11:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CAB4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsrNFjaxSVT9; Wed,  1 Nov 2023 11:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28B99430DE;
	Wed,  1 Nov 2023 11:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28B99430DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6578C1BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DBAD430DE
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DBAD430DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYUEpbxLmsDp for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:51:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CF164016C
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CF164016C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14F784000A;
 Wed,  1 Nov 2023 11:51:39 +0000 (UTC)
Date: Wed, 1 Nov 2023 12:51:38 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101125138.44e4a734@windsurf>
In-Reply-To: <20231029193044.672993-1-fontaine.fabrice@gmail.com>
References: <20231029193044.672993-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698839500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0GHGuyAAV4zoBt/08pZZttajfaHJsVg8WwY0vA6OJc=;
 b=EmDPvt4ngvvbVjHy+LGPGJjbeBYj2YYt5Z/Uah0Qq1Dxn1ynQWXcXTxcmfWKfSJ9ZBk1Is
 wRZDTVPNSF7Jds/Xj/+qa7SBmZVOe+HG1JjRplc9CF8pPLm1/LNMbiLENUgyPLFk7Xly0u
 wRBnd5wXVzj0qFZeLK49lFsPvkQTZN3qoughOyWOOR+1jRxePIpD7N2aOEwj5yfOWLNwpT
 u00RFdi4980VNkRnxRjCntrV0c05noMAUVsbcVZPtNMtD27olhP3dEpIXgN7Dk/OLjhbd0
 101ksJycfIuxkXqv/Cpg9hTc5X6XjVHH6aOhsC4vXD30j08toACkAR+zOM4JGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EmDPvt4n
Subject: Re: [Buildroot] [PATCH 1/1] package/ace: bump to version 7.1.1
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

On Sun, 29 Oct 2023 20:30:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - C++14 is mandatory since version 7.1.0
> 
> https://github.com/DOCGroup/ACE_TAO/blob/ACE%2BTAO-7_1_1/ACE/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  2 -
>  ...Asynch_BIO.cpp-fix-build-with-libres.patch | 52 -----------------
>  ...Asynch_BIO.cpp-fix-build-with-libres.patch | 56 -------------------
>  package/ace/Config.in                         |  6 +-
>  package/ace/ace.hash                          |  6 +-
>  package/ace/ace.mk                            |  4 +-
>  6 files changed, 8 insertions(+), 118 deletions(-)
>  delete mode 100644 package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
>  delete mode 100644 package/ace/0002-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch

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
