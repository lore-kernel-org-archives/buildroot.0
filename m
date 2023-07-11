Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D03C001B0
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 07:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A6460B01;
	Tue, 11 Jul 2023 07:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A6460B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mm2hnRAXiCr; Tue, 11 Jul 2023 07:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A5FC60BEC;
	Tue, 11 Jul 2023 07:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A5FC60BEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48C791BF2C4
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 07:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 194B860BEC
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 07:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 194B860BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ByAlRFOZouWs for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 07:32:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C557F60B01
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C557F60B01
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 07:32:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0718C000D;
 Tue, 11 Jul 2023 07:32:50 +0000 (UTC)
Date: Tue, 11 Jul 2023 09:32:49 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230711093249.73674060@windsurf>
In-Reply-To: <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689060771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wamxAO9AyPqztg1leANt1OiGz71jVVGtRiVbYt/T1iQ=;
 b=coGcnMI5YhDcCBtiIq6M/WepzkjKU8L2GI9qTAVs8JYbClRZ5jE+Yv4JqdZ/nimZKe/3s6
 CjlEqcjrhoJWXE62jnN9V6JRPeP9B24KobYHR7p6fkR6Qbs1k5TINHy2LXuyTIcFYpTe/s
 yOLOVJpztm4XFltdXDeUw44qeIuC/6fIPOVAWR1OKkHofHnWIdsTCj2QxoyughHDcHoPZZ
 c0yIpnMlQIYKxB9534Zvv3zMSXBTTolzwQBOdK4gqTbom3QBw6wd94322Q2aNmnyWi4CP0
 IcNV8FejYm/f62N6BJfTfOkjxY3r4HEpvJqSs6BnRLpt0KVZao+TvZzBz4MwGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=coGcnMI5
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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

On Mon, 10 Jul 2023 13:58:38 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > > We need to migrate python-terminaltables to the pep517 poetry-core
> > > backend as setuptools is not supported.
> > >
> > > Upstream has merged a patch replacing poetry with poetry-core, however
> > > we can not backport this using a patch file due to CRLF line ending
> > > issues so we will have to apply the change in the patch using sed
> > > instead.
> > >
> > > See upstream commit:
> > > https://github.com/matthewdeanmartin/terminaltables/commit/9e3dda0efb54fee6934c744a13a7336d24c6e9e9
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>  
> >
> > What is the motivation to do this, if the current version of
> > python-terminaltables builds fine with setuptools?  
> 
> It doesn't build in combination with pep517 setuptools since the pyproject.toml
> specifies poetry as the build backend and not setuptools.

So is this patch series modifying python-terminaltables a prerequisite
to applying the patch at
https://patchwork.ozlabs.org/project/buildroot/patch/20230626181531.2312002-5-james.hilliard1@gmail.com/ ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
