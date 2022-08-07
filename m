Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA44C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 14:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CC360B0D;
	Sun,  7 Aug 2022 14:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CC360B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymuGdaD2wD2R; Sun,  7 Aug 2022 14:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C6E60ADF;
	Sun,  7 Aug 2022 14:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C6E60ADF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11F3E1BF307
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AA2E4071B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA2E4071B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPpf_BbBf_Pb for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 14:50:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34CF840492
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34CF840492
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 14:50:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE286240002;
 Sun,  7 Aug 2022 14:50:38 +0000 (UTC)
Date: Sun, 7 Aug 2022 16:50:37 +0200
To: Emile Cormier <emile.cormier.jr@gmail.com>
Message-ID: <20220807165037.04f86f84@windsurf>
In-Reply-To: <20220403221953.1158787-2-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-2-emile.cormier.jr@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659883839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Le3u9gL83ihmFbVFUNIoQJ6KCLC/0TdjRpxX1Lw5U6c=;
 b=YNzW2QWO91GmFRXjoFNWNoCIxZduC0H6idKKUmOl75ngop6CC5Hp7ejAFUWKBUZDBiZ0Rh
 64/0b6rPyKtSif0WJFlaVpU3OtA/eZCI3KaHebeonJK8m1Bv1aYGVcyaD9vuR32NiewcHe
 sjCpL9Kt2Dgk20KzA/gsykW8LrhFE+ama6mkSJyFxa9kfFespn9h5xbsMqH0kghNzrA4HA
 +aR71DYmL3eHwOH+8d6tGYwOY/pAq+qFrlemuB7HNoS/gy7n0Pd1vX+QdZ555hmm2Z/uYB
 PkOvt6PN4cnw8WOl1CgyMQpip2GbniSlzqnmgSjqgjAUV1kH/l1ZsQAxt+pkRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YNzW2QWO
Subject: Re: [Buildroot] [PATCH 2/6] package/python-appdirs: add new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Emile,

On Sun,  3 Apr 2022 19:19:49 -0300
Emile Cormier <emile.cormier.jr@gmail.com> wrote:

> From: ecorm <ecorm@users.noreply.github.com>
> 
> Required by python-twisted[conch], which is required by python-crossbar.
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-appdirs/Config.in           |  7 +++++++
>  package/python-appdirs/python-appdirs.hash |  5 +++++
>  package/python-appdirs/python-appdirs.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-appdirs/Config.in
>  create mode 100644 package/python-appdirs/python-appdirs.hash
>  create mode 100644 package/python-appdirs/python-appdirs.mk

First of all, thanks a lot for your contribution, and sorry for the
slow feedback. I have now merged your patch, after:

 - Fixing the e-mail in the From: field

 - Adding the missing empty newline before the Signed-off-by line

 - Adding the missing entry to the DEVELOPERS file

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
