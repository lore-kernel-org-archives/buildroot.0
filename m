Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A5C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 10:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E390261105;
	Thu,  4 Jan 2024 10:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E390261105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8-gOXwv3EOV; Thu,  4 Jan 2024 10:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3117A61002;
	Thu,  4 Jan 2024 10:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3117A61002
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 046391BF422
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 10:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0D161002
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 10:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0D161002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17FPfJrQmHNo for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 10:44:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5C6060F8B
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 10:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C6060F8B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F34424000C;
 Thu,  4 Jan 2024 10:44:21 +0000 (UTC)
Date: Thu, 4 Jan 2024 11:44:20 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104114420.0a1fb690@windsurf>
In-Reply-To: <CAPi7W83sQsbf-_SVva6QFpRhzg-YJ65UwKf+YeU2HRi_GVkt_w@mail.gmail.com>
References: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
 <20240103173741.850916-2-fontaine.fabrice@gmail.com>
 <20240104105538.36eaf9ef@windsurf>
 <CAPi7W83sQsbf-_SVva6QFpRhzg-YJ65UwKf+YeU2HRi_GVkt_w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704365062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8H5z/xCfIBfmYxvUbjbWgP7dGcDIbuy4GStuLewEAk=;
 b=CXy3/VSgCcMzx6TWpjTPzAlrF5y40xbT1SuauXhMtMPXxatLwr63/oPQgbWCzfd157Oc9Y
 cXZ6NX/d6IqHjzz8MrvANy7io2X7b73XjpMNCPvpiF/EZQ4p0bjZRRE+bMEvoShcEqnUH8
 kKJEuzHUwCsIhe8NNnYMpNl7oWrobOrosdlK75xOgseg1PszddAypOgGIo19SwS+zZ6sAj
 NrTOxxmiFkDG441Zs91BbZr36pjq+Wb6YZQoXuszrduGulCzz9iboFI/sALWtsgB0zPq5B
 KekPg5aMFsl6t4JJG7qLzjNTBN8702pWiwFB+izCGQ+7rLYCdxowCa3NhVu+xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CXy3/VSg
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/python-pysensors: add host-lm-sensors dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu, 4 Jan 2024 11:10:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Should just be moved directly to setup.py, and setup.py should not
> > import sensors. From a quick look, none of those variables are used
> > outside of setup.py. And of course this could be contributed upstream,
> > explaining why "import sensors" at setup time is not good.  
> 
> Indeed, this is a cleaner solution.
> However, it should be noted that upstream is dead: latest version is
> from 2019 and source code repository given on
> https://pypi.org/project/PySensors/ is unreachable.

Hm. Then maybe it wasn't such a good idea to add this package in
Buildroot in the first place? Even lm-sensors is not very well
maintained in fact.

Anyway, as an immediate fix, we can simply carry a patch in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
