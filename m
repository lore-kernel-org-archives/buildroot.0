Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D06C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 865F660AF4;
	Mon,  8 Aug 2022 21:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 865F660AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8J9nTu9Xs6a; Mon,  8 Aug 2022 21:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B567360AEB;
	Mon,  8 Aug 2022 21:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B567360AEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8261BF976
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DB2C81398
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB2C81398
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWuSHRLTJaaQ for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:08:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8764381328
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8764381328
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:08:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C64B81BF203;
 Mon,  8 Aug 2022 21:08:55 +0000 (UTC)
Date: Mon, 8 Aug 2022 23:08:54 +0200
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20220808230854.188c0d00@windsurf>
In-Reply-To: <20220808200548.3622105-1-vfazio@xes-inc.com>
References: <20220808200548.3622105-1-vfazio@xes-inc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659992936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkSBqHIEdRwmqBNXwrIn3xT4pfqkXgZRR3RkI5WAZtY=;
 b=Cg4tJuWmitlxA2mqQMUxeNlHKh58uDETvS0BXwP36OYrnB1m3niMpvo4yLr2GrdplT92Gc
 2+9J/TUdCBx+rFMXoIAh4va2zf+KZdCP7/A4hhubP5lnYMAOffj3kt7I1fTPhrjNwBnBnJ
 OjajKBoaeIRspmcdrY6w7s0q79M7TCrl06zc8KpXzHMRxG0UY+1lS7j2jibpMN+Gslwxma
 LwWwQlXpjFXMu7JF1bhC8gq/U8ASd7b11Qp0Oa9jBDtfOmC8dmE87xsUw0Odw3R2aFWWba
 pjEf5Zz1J+YfvYtG0C/8AT98mA+0IXezxsdWsUa/dwtL2B29Lh5YpVRNz/957A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cg4tJuWm
Subject: Re: [Buildroot] [PATCH 1/1] package/mcelog: bump to version 187
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 15:05:48 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> Drop the patch now that it has been upstreamed.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  ...01-Makefile-add-install-nodoc-target.patch | 65 -------------------
>  package/mcelog/mcelog.hash                    |  2 +-
>  package/mcelog/mcelog.mk                      |  2 +-
>  3 files changed, 2 insertions(+), 67 deletions(-)
>  delete mode 100644 package/mcelog/0001-Makefile-add-install-nodoc-target.patch

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
