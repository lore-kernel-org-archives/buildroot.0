Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68107C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 23:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB09561227;
	Wed, 22 Feb 2023 23:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB09561227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5vCdq4vzdiq; Wed, 22 Feb 2023 23:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C4360A8A;
	Wed, 22 Feb 2023 23:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C4360A8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35CA31BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 23:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04B89401B1
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 23:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04B89401B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fR69DzQiJLW4 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 23:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5301340123
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5301340123
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 23:01:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2CB5E0005;
 Wed, 22 Feb 2023 23:01:25 +0000 (UTC)
Date: Thu, 23 Feb 2023 00:01:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223000124.587fcdfa@windsurf>
In-Reply-To: <20230222212235.16202-1-fontaine.fabrice@gmail.com>
References: <20230222212235.16202-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677106886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFI6dIFhDhhQyfh12HBCb/8Ebm9meUYIFBj6oEPINkE=;
 b=TQBD35yLB7YlSFsSlTR6lAVX38CJJMeGTTcOua8VxSvUqmjcjbD2ABnhgtUtiixMOEVr0k
 i0IaMqwhrIujcCo8XO8Ds3S1frffiO0sxp7qPQv1Y8ky8lWyMkCzE2V/ZhTe6jDgxByNkP
 CfniXafw9g8h+eP9zo/rEefokkLbnNcq65IkmMVl3ViwbJMQp7N5JSaDN0T0cfGBJYmWMq
 Xom2oQZUGRcAEfN+qFfmQNY2W/WrI78cgUfOlsORz0wdvFiirr1yBduuVZnata3pMhSUX4
 Xy1hSYB5AEVelQB1a16LXckNvPWFuhq5oVfmNrc5gVfREG8sEyanv+rd4EoiQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TQBD35yL
Subject: Re: [Buildroot] [PATCH 1/1] package/netsurf: force libopenssl
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

On Wed, 22 Feb 2023 22:22:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> netsurf raises the following build failure since bump of libressl to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> content/fetchers/about.c: In function 'ns_X509_get_signature_nid':
> content/fetchers/about.c:548:25: error: dereferencing pointer to incomplete type 'X509 {aka struct x509_st}'
>   return OBJ_obj2nid(cert->cert_info->key->algor->algorithm);
>                          ^~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c225aaac31398ba495921bd4b85e588199822561
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/netsurf/Config.in | 1 +
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
