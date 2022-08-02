Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBFEC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1CC44037C;
	Tue,  2 Aug 2022 22:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1CC44037C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbN8zqaGSiWz; Tue,  2 Aug 2022 22:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1734740134;
	Tue,  2 Aug 2022 22:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1734740134
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26ECD1BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E95360ABF
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E95360ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPyMZuFyHIQb for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:05:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA4F0600C6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA4F0600C6
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:05:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8291160004;
 Tue,  2 Aug 2022 22:05:35 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:05:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220803000534.522901be@windsurf>
In-Reply-To: <20220511211845.2277928-1-james.hilliard1@gmail.com>
References: <20220511211845.2277928-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659477935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IieOc2kUbQtSRql03lL8E4570GbH9cyvHD5G+KdvebA=;
 b=auetTmKp+RnIIyVHtpfxyeErj8FaNxjgpidwE0e9FXrrz/TjoKv3wDhm12cNckH914PFG2
 IC0UIG1oBX4CFdaC3bUEN0rBzmC3ZMv0KzypjSsHj5QxFF4KNT92RmJKklMOaIonhoqtHE
 DeLe78Sn8R7vVvyeC+hk3QEkp507qP0U7hdiFfGZ7oLxaLemzPHPmPthHoodx3lH9tFlvX
 K5tbk+IGWP0rsZm9Gjoc1+67M4FIUm4YB0gMJp5c4aOMRdREUlsIaBVs+o9kPNtDhRsZIj
 jEUNBdDkoXAfqPE7x3PPB8uvulmgdKIMlZ1bKJV6ayWSkytU237hkf/gYTHrag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=auetTmKp
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rtoml: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 May 2022 15:18:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-rtoml/Config.in         |  7 +++++++
>  package/python-rtoml/python-rtoml.hash |  4 ++++
>  package/python-rtoml/python-rtoml.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/python-rtoml/Config.in
>  create mode 100644 package/python-rtoml/python-rtoml.hash
>  create mode 100644 package/python-rtoml/python-rtoml.mk

I have applied, after adding a runtime test, and adding the missing
entry to the DEVELOPERS file.

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
